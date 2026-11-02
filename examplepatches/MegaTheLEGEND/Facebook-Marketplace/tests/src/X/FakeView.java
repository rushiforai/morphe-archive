package X;
import java.util.*;
/** Minimal stand-in for android.view.View/ViewGroup: just the methods the extension calls by reflection. */
public class FakeView extends C2GO.FakeBar {
  public static class Lp { public int height = -2; public int bottomMargin = 0; }
  public FakeView parent; public final List<FakeView> kids = new ArrayList<>();
  public int l, t, r, b, padB, id; public Lp lp = new Lp(); public int layouts;
  public FakeView(int l,int t,int r,int b){ this.l=l;this.t=t;this.r=r;this.b=b; }
  public FakeView add(FakeView k){ k.parent=this; kids.add(k); return this; }
  public Object getParent(){ return parent; }
  public int getChildCount(){ return kids.size(); }
  public Object getChildAt(int i){ return kids.get(i); }
  public int getLeft(){return l;} public int getTop(){return t;} public int getRight(){return r;} public int getBottom(){return b;}
  public int getWidth(){return r-l;} public int getHeight(){return b-t;}
  public int getVisibility(){ return vis; }
  public int getPaddingBottom(){ return padB; } public int getPaddingLeft(){return 0;} public int getPaddingTop(){return 0;} public int getPaddingRight(){return 0;}
  public void setPadding(int a,int bb,int c,int d){ padB=d; }
  public int getId(){ return id; }
  public Object getLayoutParams(){ return lp; }
  public void requestLayout(){ layouts++; }
  public Object getRootWindowInsets(){ return null; }
  public boolean postDelayed(Runnable r,long ms){ r.run(); return true; }
}
