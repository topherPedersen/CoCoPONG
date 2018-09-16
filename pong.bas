1 REM PS=PLAYER'S SCORE, CS=COMPUTER'S SCORE
2 PS=0
3 CS=0
10 REM DRAW BACKGROUND
20 CLS
30 FOR X = 0 TO 63
40 FOR Y = 0 TO 31
50 SET(X,Y,1)
60 NEXT Y
70 NEXT X
100 REM DRAW PLAYER PADDLE
105 SET(4,15,5)
110 SET(4,17,5)
120 SET(4,19,5)
121 REM VARIABLES P1, P2, AND P3, KEEP TRACK OF PLAYER'S PADDLE POSITION
122 P1=15
123 P2=17
124 P3=19
130 REM DRAW OPPONENTS PADDLE
135 SET(58,15,5)
140 SET(58,17,5)
150 SET(58,19,5)
151 REM VARIABLES C1, C2, AND C3, KEEP TRACK OF COMPUTER'S PADDLE POSITION
152 C1=15
153 C2=17
154 C3=19
160 REM DRAW SCOREBOARD
170 PRINT @ 2, 0;"     CTRL: W + S     ";0
500 REM CREATE AND DRAW BALL
501 REM VARIABLES: RN=RUN, RS=RISE, BX=BALL-X-COORDINATE, BY=BALL-Y-COORDINATE...
502 REM C=COLOR, VB=VERTICAL-BOUNDARY-STRIKE, HB=HORIZONTAL-BOUNDARY-STRIKE
510 RS=2
515 RN=-2
520 BX=32
530 BY=15
531 C=2
532 VB=0
533 HB=0
534 SET(32,15,C)
535 REM SET BALL IN MOTION
540 REM FILL PREVIOUS POSITION OF BALL
550 SET(BX,BY,1)
551 REM PLAYER CONTROLS 
552 REM UI=USER INPUT (USER INPUT SHOULD EITHER BE...
553 REM A "W" FOR UP OR AN "S" FOR DOWN. THESE KEYS
554 REM CONTROL THE PLAYERS PADDLE
555 UI$=INKEY$
556 IF UI$="W" OR UI$="S" THEN 558
557 GOTO 630
558 IF UI$="S" THEN 565
559 REM IF 'W' PRESSED, ERASE PREVIOUS POSITION OF PADDLE
560 REM THEN REDRAW PADDLE IN NEW POSITION
561 SET(4, P1, 1): SET(4, P2, 1): SET(4, P3, 1)
562 P1=P1-6: P2=P2-6: P3=P3-6
563 SET(4, P1, 5): SET(4, P2, 5): SET(4, P3, 5)
564 GOTO 630
565 REM IF 'W' PRESSED, ERASE PREVIOUS POSITION OF PADDLE
566 REM THEN REDRAW PADDLE IN NEW POSITION
567 SET(4, P1, 1): SET(4, P2, 1): SET(4, P3, 1)
568 P1=P1+6: P2=P2+6: P3=P3+6
569 SET(4, P1, 5): SET(4, P2, 5): SET(4, P3, 5)
570 GOTO 630
630 REM DETECT HORIZONTAL BOUNDARY STRIKE (SCORE OR PADDLE STRIKE)
631 IF BX <= 6 OR BX >= 56 THEN HB=1
632 IF HB=1 THEN RN=RN*(-1)
633 IF HB=0 THEN 650
634 IF HB=1 AND (BY<P1 OR BY>P3) AND BX<=6 THEN 640
635 IF HB=1 AND (BY<C1 OR BY>C3) AND BX>=56 THEN 643
636 GOTO 650
640 CS=CS+1
641 GOSUB 900
642 GOTO 650
643 PS=PS+1
644 GOSUB 900
650 REM DETECT VERTICAL BOUNDARY STRIKE
651 IF BY<=4 OR BY>=30 THEN VB=1
652 IF VB=1 THEN RS=RS*(-1)
670 HB=0
671 VB=0
680 REM SET COORDINATES FOR THE BALL'S NEW POSITION
690 BX=BX+RN
700 BY=BY+RS
750 REM DRAW BALL IN NEW POSITION
760 SET(BX,BY,C)
765 REM FOR-LOOP ON 770 CAUSES SHORT DELAY FOR SMOOTHER GRAPHICS
770 FOR X = 0 TO 7
775 ZZ=X
780 NEXT X
800 REM CHANGE BALL COLOR
810 IF C=7 THEN 840
820 C=7
830 GOTO 550
840 C=2
850 GOTO 550
900 PRINT @ 2, PS;"     CTRL: W + S     ";CS
920 RETURN
5000 END
