package android.widget;
public class LinearLayout extends android.view.ViewGroup {
    public final java.util.List<Integer> forwarded = new java.util.ArrayList<>();
    public LinearLayout(android.content.Context context, android.util.AttributeSet attrs) { }
    public boolean dispatchTouchEvent(android.view.MotionEvent event) {
        forwarded.add(event.getActionMasked()); return true;
    }
    public static class LayoutParams extends android.view.ViewGroup.LayoutParams {
        public LayoutParams(int w, int h) { super(w, h); }
    }
}
