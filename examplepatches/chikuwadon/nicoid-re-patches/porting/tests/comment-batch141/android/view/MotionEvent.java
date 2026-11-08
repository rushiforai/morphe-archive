package android.view; public class MotionEvent {
 public static final int ACTION_DOWN=0,ACTION_MOVE=2; private final int action;
 public MotionEvent(int action){this.action=action;} public int getActionMasked(){return action;}
}
