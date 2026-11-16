"""Platform-only UI doubles: layout ownership and posted delivery remain production decisions."""
from test_async import EXTRA
from host_java import STUBS
VOD = EXTRA | {
 'android/os/Handler.java': '''package android.os;public class Handler {
  static final java.util.Queue<Runnable> tasks=new java.util.concurrent.ConcurrentLinkedQueue<>();
  public Handler(Looper l){}public boolean post(Runnable r){tasks.add(r);return true;}
  public static void drain(){for(Runnable r;(r=tasks.poll())!=null;)r.run();} }''',
 'android/os/SystemClock.java': '''package android.os;public class SystemClock {public static volatile long offset;
  public static long elapsedRealtime(){return java.lang.System.nanoTime()/1000000+offset;}}''',
 'android/content/Context.java': STUBS['android/content/Context.java'].replace('public Object getSystemService','public String getPackageName(){return "app";} public Object getSystemService'),
 'android/app/Activity.java': STUBS['android/app/Activity.java'].replace('public boolean isInPictureInPictureMode','public boolean isFinishing(){return false;} public boolean isDestroyed(){return false;} public boolean isInPictureInPictureMode'),
 'android/app/AlertDialog.java': '''package android.app;public class AlertDialog {public static Click click;public static final java.util.List<Activity> shown=new java.util.ArrayList<>();
  public interface Click{void click(Object dialog,int which);}public static class Builder {Activity a;
  public Builder(Activity a){this.a=a;}public Builder setTitle(String s){return this;}public Builder setItems(CharSequence[] a,Click c){click=c;return this;}
  public AlertDialog show(){shown.add(a);return new AlertDialog();}} }''',
 'android/graphics/PorterDuff.java': 'package android.graphics; public class PorterDuff {public enum Mode{SRC_IN}}',
 'android/graphics/drawable/Drawable.java': '''package android.graphics.drawable; public class Drawable {
  public Drawable mutate(){return this;}public ConstantState getConstantState(){return null;}
  public static class ConstantState{public Drawable newDrawable(){return new Drawable();}}}''',
 'android/view/View.java': '''package android.view;public class View implements ViewParent {
  public static final int VISIBLE=0,GONE=8;public android.content.Context context=new android.app.Activity();
  private final Thread ui=Thread.currentThread();private void main(){if(Thread.currentThread()!=ui)throw new AssertionError("worker inspected View");}
  public View root=this; public ViewParent parent; public boolean shown=true,attached=true;public int visibility;
  public android.content.Context getContext(){return context;}public int getWidth(){main();return 100;}public int getHeight(){main();return 100;}
  public View getRootView(){main();return root;}public ViewParent getParent(){return parent;}public void getLocationOnScreen(int[] a){main();a[0]=a[1]=0;}
  public boolean isShown(){main();return shown;}public boolean isAttachedToWindow(){main();return attached;}public Object getWindowToken(){return attached?root:null;}
  public void setVisibility(int v){visibility=v;}public int getVisibility(){return visibility;}public View findViewById(int i){return null;}
  public static int generateViewId(){return 1;}public void setId(int i){}public void setContentDescription(String s){}
  public Object getLayoutParams(){return null;}public void setLayoutParams(Object o){}public void setPadding(int a,int b,int c,int d){}
  public int getPaddingLeft(){return 0;}public int getPaddingTop(){return 0;}public int getPaddingRight(){return 0;}public int getPaddingBottom(){return 0;}
  public android.graphics.drawable.Drawable getBackground(){return null;}public void setBackground(Object o){}
  public interface Click{void click(View v);}public void setOnClickListener(Click c){}
  public interface OnAttachStateChangeListener{void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}
  public final java.util.List<OnAttachStateChangeListener> listeners=new java.util.ArrayList<>();
  public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.add(l);}
  public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.remove(l);}
  public void detach(){attached=false;shown=false;for(OnAttachStateChangeListener l:new java.util.ArrayList<>(listeners))l.onViewDetachedFromWindow(this);}
  public void attach(){attached=true;shown=true;for(OnAttachStateChangeListener l:new java.util.ArrayList<>(listeners))l.onViewAttachedToWindow(this);} }''',
 'android/widget/ImageView.java': '''package android.widget;public class ImageView extends android.view.View {
  public ImageView(android.content.Context c){context=c;}public enum ScaleType{FIT_CENTER}
  public void setImageResource(int r){}public void setColorFilter(int c,android.graphics.PorterDuff.Mode m){}public void setScaleType(ScaleType t){} }''',
 'android/widget/LinearLayout.java': '''package android.widget;public class LinearLayout extends android.view.View {
  public void addView(android.view.View v,int i){}public int indexOfChild(android.view.View v){return 0;}
  public static class LayoutParams {public LayoutParams(Object o){}} }''',
}
