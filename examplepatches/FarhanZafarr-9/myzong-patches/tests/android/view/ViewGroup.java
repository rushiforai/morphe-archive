package android.view;
public class ViewGroup extends View {
    public static class LayoutParams {
        public int width,height;
        public LayoutParams(int w,int h) { width=w;height=h; }
    }
    public static class MarginLayoutParams extends LayoutParams {
        public int topMargin,bottomMargin;
        public MarginLayoutParams(int w,int h) { super(w,h); }
    }
}
