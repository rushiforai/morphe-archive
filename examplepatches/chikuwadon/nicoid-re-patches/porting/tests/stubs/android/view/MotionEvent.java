package android.view;
public class MotionEvent {
    public static final int ACTION_DOWN=0, ACTION_UP=1, ACTION_MOVE=2, ACTION_CANCEL=3,
            ACTION_POINTER_DOWN=5, ACTION_POINTER_UP=6;
    private int action, actionIndex;
    private final int[] ids;
    private final float[] xs, ys;
    public MotionEvent(int action, int index, int[] ids, float[] xs, float[] ys) {
        this.action=action; actionIndex=index; this.ids=ids; this.xs=xs; this.ys=ys;
    }
    public static MotionEvent obtain(MotionEvent e) {
        return new MotionEvent(e.action,e.actionIndex,e.ids,e.xs,e.ys);
    }
    public void setAction(int next) { action=next; }
    public void recycle() { }
    public int getActionMasked() { return action; }
    public int getActionIndex() { return actionIndex; }
    public int getPointerCount() { return ids.length; }
    public int getPointerId(int index) { return ids[index]; }
    public int findPointerIndex(int id) {
        for (int i=0;i<ids.length;i++) if (ids[i]==id) return i;
        return -1;
    }
    public float getX(int index) { return xs[index]; }
    public float getY(int index) { return ys[index]; }
}
