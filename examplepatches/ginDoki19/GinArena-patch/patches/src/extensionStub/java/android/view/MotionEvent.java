package android.view;
public final class MotionEvent {
    public static final int ACTION_DOWN = 0;
    public static final int ACTION_UP = 1;
    public static final int ACTION_MOVE = 2;
    public static final int ACTION_CANCEL = 3;
    /** real values from android.view.MotionEvent */
    public static final int ACTION_POINTER_DOWN = 5;
    public static final int ACTION_POINTER_UP = 6;
    public int getActionMasked() { throw new RuntimeException(); }
    public float getX() { throw new RuntimeException(); }
    public float getY() { throw new RuntimeException(); }
}
