package android.view;
import android.content.res.Resources;
import java.util.ArrayList;
import java.util.HashMap;
public class View {
    public static final int GONE=8, INVISIBLE=4, VISIBLE=0;
    public interface OnAttachStateChangeListener {
        void onViewAttachedToWindow(View v);
        void onViewDetachedFromWindow(View v);
    }
    private int visibility=VISIBLE;
    private boolean attached;
    private final Resources resources = new Resources();
    private final ViewTreeObserver observer = new ViewTreeObserver();
    private final HashMap<Integer,View> children = new HashMap<>();
    private final ArrayList<OnAttachStateChangeListener> listeners=new ArrayList<>();
    private ViewGroup.LayoutParams params;
    private android.graphics.drawable.Drawable background;
    private int left,top,right,bottom,minimumHeight;
    private int paddingTop,paddingBottom;
    public int getPaddingTop() { return paddingTop; }
    public int getPaddingBottom() { return paddingBottom; }
    public void setPadding(int left,int top,int right,int bottom) { paddingTop=top; paddingBottom=bottom; }
    public int getMinimumHeight() { return minimumHeight; }
    public void setMinimumHeight(int value) { minimumHeight=value; }
    public View add(String name,int id) { View v=new View(); resources.register(name,id); children.put(id,v); return v; }
    public void addView(String name,int id,View view) { resources.register(name,id); children.put(id,view); }
    public ViewGroup.LayoutParams getLayoutParams() { return params; }
    public void setLayoutParams(ViewGroup.LayoutParams value) { params=value; }
    public android.graphics.drawable.Drawable getBackground() { return background; }
    public void setBackground(android.graphics.drawable.Drawable value) { background=value; }
    public ViewParent getParent() { return null; }
    public int getWidth() { return right-left; }
    public int getHeight() { return bottom-top; }
    public int getLeft() { return left; }
    public int getTop() { return top; }
    public int getRight() { return right; }
    public int getBottom() { return bottom; }
    public void layout(int l,int t,int r,int b) {left=l;top=t;right=r;bottom=b;}
    public void measure(int w,int h) {}
    public int getMeasuredWidth() { return getWidth(); }
    public int getMeasuredHeight() { return getHeight(); }
    public static class MeasureSpec {
        public static final int AT_MOST=0x80000000, EXACTLY=0x40000000;
        public static int makeMeasureSpec(int size,int mode) { return size|mode; }
    }
    public Resources getResources() { return resources; }
    public View findViewById(int id) { return children.get(id); }
    public int getVisibility() { return visibility; }
    public void setVisibility(int value) { visibility=value; }
    public boolean isAttachedToWindow() { return attached; }
    public ViewTreeObserver getViewTreeObserver() { return observer; }
    public void addOnAttachStateChangeListener(OnAttachStateChangeListener l) { listeners.add(l); }
    public void attach() { attached=true; for(OnAttachStateChangeListener l:listeners) l.onViewAttachedToWindow(this); }
    public void detach() { attached=false; for(OnAttachStateChangeListener l:listeners) l.onViewDetachedFromWindow(this); }
}
