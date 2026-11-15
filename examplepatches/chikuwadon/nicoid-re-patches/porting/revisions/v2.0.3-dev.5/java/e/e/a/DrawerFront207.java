package e.e.a;
import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/**
 * Drawer is native and must win hit tests/draw order over decor-owned tabs.
 * Do not move or hide the native action bar, content, or drawer itself.
 */
public final class DrawerFront207 {
 private static final WeakHashMap<Activity,Watcher> ACTIVE=new WeakHashMap<>();
 private DrawerFront207(){}
 static void attach(Activity host,View content,View floatingTabs){
  if(host==null||content==null||floatingTabs==null)return;
  Watcher watcher=ACTIVE.get(host);
  if(watcher!=null){watcher.update(content,floatingTabs);return;}
  View root=host.getWindow().getDecorView();
  if(root==null)return;
  watcher=new Watcher(root,content,floatingTabs);
  ACTIVE.put(host,watcher);
  root.getViewTreeObserver().addOnPreDrawListener(watcher);
 }
 private static final class Watcher implements ViewTreeObserver.OnPreDrawListener {
  final WeakReference<View> root;
  WeakReference<View> content,tabs;
  boolean raised;
  float originalZ;
  Watcher(View r,View c,View t){root=new WeakReference<>(r);update(c,t);}
  void update(View c,View t){content=new WeakReference<>(c);tabs=new WeakReference<>(t);}
  @Override public boolean onPreDraw(){
   View r=root.get(),c=content.get(),t=tabs.get();
   if(r==null||c==null||t==null||!c.isAttachedToWindow()){
    if(c!=null&&raised)c.setTranslationZ(originalZ);
    raised=false;
    if(r!=null&&r.getViewTreeObserver().isAlive())
      r.getViewTreeObserver().removeOnPreDrawListener(this);
    return true;
   }
   boolean open=hasVisibleDrawer(r,0);
   if(open&&!raised){
    originalZ=c.getTranslationZ();
    float needed=Math.max(0,t.getZ()+1-c.getElevation());
    c.setTranslationZ(Math.max(originalZ,needed));
    raised=true;
   }else if(!open&&raised){
    raised=false;
    c.setTranslationZ(originalZ);
   }
   return true;
  }
 }
 private static boolean hasVisibleDrawer(View node,int depth){
  if(depth>18||!(node instanceof ViewGroup))return false;
  ViewGroup group=(ViewGroup)node;
  boolean named=node.getClass().getName().endsWith("DrawerLayout");
  boolean fullChild=false,sideChild=false;
  int w=group.getWidth(),h=group.getHeight();
  if(w>0&&h>0){
   for(int n=0;n<group.getChildCount();n++){
    View child=group.getChildAt(n);
    if(child.getVisibility()!=View.VISIBLE)continue;
    int cw=child.getWidth(),ch=child.getHeight();
    if(cw>=w*.94f&&ch>=h*.65f)fullChild=true;
    else if(cw>=w*.24f&&cw<w*.94f&&ch>=h*.55f){
     float left=child.getLeft()+child.getTranslationX();
     float right=left+cw;
     // An off-screen drawer has right <= 0. Allow partial slide-in.
     if(left<w*.32f&&right>1f&&right<=w*.96f)sideChild=true;
    }
   }
   if(sideChild&&(named||fullChild))return true;
  }
  for(int i=0;i<group.getChildCount();i++){
   View child=group.getChildAt(i);
   if(child instanceof ViewGroup&&hasVisibleDrawer(child,depth+1))return true;
  }
  return false;
 }
}
