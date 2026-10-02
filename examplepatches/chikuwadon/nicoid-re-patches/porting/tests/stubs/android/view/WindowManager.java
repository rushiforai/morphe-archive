package android.view;
public interface WindowManager {
    void updateViewLayout(View root, ViewGroup.LayoutParams params);
    class LayoutParams extends ViewGroup.LayoutParams {
        public int x = 200, y = 300;
        public LayoutParams() { super(-2, -2); }
    }
}
