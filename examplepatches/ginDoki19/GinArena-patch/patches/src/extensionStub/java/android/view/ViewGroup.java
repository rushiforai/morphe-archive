package android.view;
public abstract class ViewGroup extends View {
    public int getChildCount() { throw new RuntimeException(); }
    public View getChildAt(int index) { throw new RuntimeException(); }
}
