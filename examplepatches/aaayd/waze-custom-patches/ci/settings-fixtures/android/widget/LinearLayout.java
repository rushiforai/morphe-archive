package android.widget;
import android.content.Context;
import android.view.ViewGroup;
public class LinearLayout extends ViewGroup {
 public static final int VERTICAL=1;
 public static class LayoutParams extends ViewGroup.LayoutParams{public LayoutParams(int w,int h){super(w,h);}}
 public LinearLayout(Context c){super(c);} public void setOrientation(int v){}
}