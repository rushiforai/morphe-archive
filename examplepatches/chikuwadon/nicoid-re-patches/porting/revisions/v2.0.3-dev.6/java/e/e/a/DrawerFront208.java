package e.e.a;
import android.app.Activity;
import android.graphics.Rect;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Never let the decor-owned floating tab bar cover an open native drawer. */
public final class DrawerFront208 {
 private static final WeakHashMap<Activity,Watcher> ACTIVE=new WeakHashMap<>();
 private DrawerFront208(){}
 static void attach(Activity activity,View content,View floatingTabs){
  if(activity==null||content==null||floatingTabs==null)return;
  Watcher current=ACTIVE.get(activity);
  if(current!=null){current.update(content,floatingTabs);return;}
  View decor=activity.getWindow().getDecorView();
  if(decor==null)return;
  Watcher watcher=new Watcher(decor,content,floatingTabs);
  ACTIVE.put(activity,watcher);
  decor.getViewTreeObserver().addOnPreDrawListener(watcher);
 }
 static final class Watcher implements ViewTreeObserver.OnPreDrawListener {
  final WeakReference<View> decor;
  WeakReference<View> content,tabs;
  View changed;
  int initial=View.VISIBLE;
  Boolean last;
  Watcher(View d,View c,View t){decor=new WeakReference<>(d);update(c,t);}
  void update(View c,View t){
   content=new WeakReference<>(c);tabs=new WeakReference<>(t);
   if(changed!=null&&changed!=t&&last!=null&&last){
    changed.setVisibility(initial);
   }
   if(changed!=t){changed=t;initial=t.getVisibility();last=null;}
  }
  @Override public boolean onPreDraw(){
   View root=decor.get(),c=content.get(),t=tabs.get();
   if(root==null||c==null||t==null||!c.isAttachedToWindow()||!t.isAttachedToWindow()){
    if(t!=null&&Boolean.TRUE.equals(last))t.setVisibility(initial);
    if(root!=null&&root.getViewTreeObserver().isAlive())
     root.getViewTreeObserver().removeOnPreDrawListener(this);
    return true;
   }
   boolean open=hasVisibleDrawer(root,0);
   if(last==null||open!=last){
    if(open){initial=t.getVisibility();t.setVisibility(View.INVISIBLE);}
    else if(Boolean.TRUE.equals(last))t.setVisibility(initial);
    last=open;
    Log.i("nicoid-drawer","Drawer visible="+open+" floatingTab="+t.getVisibility());
    ModernDebug.record("native-drawer visible="+open+" floating-tab-visibility="+t.getVisibility());
   }
   return true;
  }
 }
 private static boolean hasVisibleDrawer(View v,int depth){
  if(depth>20||!(v instanceof ViewGroup))return false;
  ViewGroup g=(ViewGroup)v;
  boolean named=v.getClass().getName().endsWith("DrawerLayout");
  if(named){
   try{
    Object result=v.getClass().getMethod("isDrawerVisible",int.class).invoke(v,Gravity.START);
    if(Boolean.TRUE.equals(result))return true;
   }catch(ReflectiveOperationException ignored){}
   try{
    Object result=v.getClass().getMethod("isDrawerOpen",int.class).invoke(v,Gravity.START);
    if(Boolean.TRUE.equals(result))return true;
   }catch(ReflectiveOperationException ignored){}
  }
  int w=g.getWidth(),h=g.getHeight();
  if(named&&w>0&&h>0){
   for(int i=0;i<g.getChildCount();i++){
    View child=g.getChildAt(i);
    if(child.getVisibility()!=View.VISIBLE)continue;
    int cw=child.getWidth(),ch=child.getHeight();
    if(cw<w*.24f||cw>w*.94f||ch<h*.55f)continue;
    float l=child.getLeft()+child.getTranslationX();
    float r=l+cw;
    if(l<w*.40f&&r>1f)return true;
   }
  }
  for(int i=0;i<g.getChildCount();i++){
   View child=g.getChildAt(i);
   if(child instanceof ViewGroup&&hasVisibleDrawer(child,depth+1))return true;
  }
  return false;
 }
}
