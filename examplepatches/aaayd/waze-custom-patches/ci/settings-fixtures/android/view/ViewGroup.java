package android.view;
import android.content.Context;
import java.util.*;
public class ViewGroup extends View {
 public static class LayoutParams { public LayoutParams(int w,int h){} }
 protected final List<View> children=new ArrayList<>();
 public ViewGroup(Context c){super(c);}
 public void addView(View v,LayoutParams p){addView(v,children.size(),p);}
 public void addView(View v,int i,LayoutParams p){if(v.parent!=null)throw new AssertionError("Already attached"); children.add(i,v);v.parent=this;}
 public int getChildCount(){return children.size();} public View getChildAt(int i){return children.get(i);}
 public <T extends View> T findViewWithTag(Object wanted){T self=super.findViewWithTag(wanted);if(self!=null)return self;for(View v:children){T found=v.findViewWithTag(wanted);if(found!=null)return found;}return null;}
}