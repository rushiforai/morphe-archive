package android.view;
public class View {
    private ViewGroup.LayoutParams params = new ViewGroup.LayoutParams(640, 360);
    public int getWidth() { return params.width; }
    public int getHeight() { return params.height; }
    public ViewGroup.LayoutParams getLayoutParams() { return params; }
    public void setLayoutParams(ViewGroup.LayoutParams next) { params = next; }
    public android.content.res.Resources getResources() { return new android.content.res.Resources(); }
}
