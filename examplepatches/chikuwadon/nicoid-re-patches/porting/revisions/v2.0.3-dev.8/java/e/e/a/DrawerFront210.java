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
public final class DrawerFront210 {
 private static final WeakHashMap<Activity,Watcher> ACTIVE=new WeakHashMap<>();
 private DrawerFront210(){}
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
  View windowContent,windowTabLayer;
  float originalElevation;
  boolean raised;
  View miniBody,miniPanel;
  float miniBodyElevation;
  boolean miniRaised;
  Boolean last;
  Watcher(View d,View c,View t){decor=new WeakReference<>(d);update(c,t);}
  void update(View c,View t){
   if(content!=null&&tabs!=null&&content.get()==c&&tabs.get()==t)return;
   if(raised)restore();
   content=new WeakReference<>(c);tabs=new WeakReference<>(t);last=null;
  }
  View directChild(View root,View descendant){
   if(root==null||descendant==null)return null;
   View node=descendant;
   while(node.getParent() instanceof View && node.getParent()!=root)
    node=(View)node.getParent();
   return node.getParent()==root?node:null;
  }
  void restoreMini(){
   if(!miniRaised)return;
   if(miniBody!=null)miniBody.setElevation(miniBodyElevation);
   if(miniPanel!=null&&miniPanel.getParent() instanceof ViewGroup)miniPanel.bringToFront();
   miniBody=null;miniPanel=null;miniRaised=false;
  }
  void raiseMini(View root,View contentView){
   ViewGroup appContent=contentView.getId()==android.R.id.content
       &&contentView instanceof ViewGroup?(ViewGroup)contentView:null;
   View node=contentView;
   while(appContent==null&&node!=null&&node.getParent() instanceof View){
    View p=(View)node.getParent();
    if(p.getId()==android.R.id.content&&p instanceof ViewGroup){appContent=(ViewGroup)p;break;}
    node=p;
   }
   if(appContent==null){restoreMini();return;}
   View currentPanel=null;
   for(int i=0;i<appContent.getChildCount();i++){
    View child=appContent.getChildAt(i);
    if("nicoid-retained-mini-player".equals(child.getTag())){currentPanel=child;break;}
   }
   View body=directChild(appContent,contentView);
   if(body==null&&appContent==contentView){
    // AppCompat ContentFrameLayout IS android.R.id.content. The retained
    // mini panel and application body are direct siblings inside this host.
    for(int i=0;i<appContent.getChildCount();i++){
     View child=appContent.getChildAt(i);
     if(child!=currentPanel&&child.getHeight()>=appContent.getHeight()*.5f){
      body=child;break;
     }
    }
   }
   if(currentPanel==null||body==null||body==currentPanel){restoreMini();return;}
   if(miniRaised&&(miniPanel!=currentPanel||miniBody!=body))restoreMini();
   if(!miniRaised){
    miniPanel=currentPanel;miniBody=body;miniBodyElevation=body.getElevation();
    miniRaised=true;
    ModernDebug.record("native-drawer mini detected, content moved above retained player");
   }
   // MiniSession225 can attach its bar after the drawer opens.
   // Reorder the two siblings, never hide or detach the playing TextureView.
   if(body.getElevation()<=currentPanel.getElevation()){
    body.setElevation(currentPanel.getElevation()+1f);
    body.bringToFront();
   }
  }
  void restore(){
   restoreMini();
   if(!raised)return;
   if(windowContent!=null)windowContent.setElevation(originalElevation);
   if(windowTabLayer!=null)windowTabLayer.bringToFront();
   windowContent=null;windowTabLayer=null;raised=false;
  }
  void raise(View decorView,View contentView,View tabLayer){
   if(raised)return;
   View foreground=directChild(decorView,contentView);
   View tabsTop=directChild(decorView,tabLayer);
   if(foreground==null||tabsTop==null||foreground==tabsTop)return;
   float highest=tabsTop.getElevation();
   if(decorView instanceof ViewGroup){
    ViewGroup decorGroup=(ViewGroup)decorView;
    for(int i=0;i<decorGroup.getChildCount();i++)
     highest=Math.max(highest,decorGroup.getChildAt(i).getElevation());
   }
   windowContent=foreground;windowTabLayer=tabsTop;
   originalElevation=foreground.getElevation();
   foreground.bringToFront();
   foreground.setElevation(highest+1f);
   raised=true;
  }
  @Override public boolean onPreDraw(){
   View root=decor.get(),c=content==null?null:content.get(),t=tabs==null?null:tabs.get();
   if(root==null||c==null||t==null||!c.isAttachedToWindow()||!t.isAttachedToWindow()){
    restore();
    if(root!=null&&root.getViewTreeObserver().isAlive())
     root.getViewTreeObserver().removeOnPreDrawListener(this);
    return true;
   }
   boolean open=hasVisibleDrawer(root,0);
   if(open)raiseMini(root,c);else restoreMini();
   if(last==null||last!=open){
    if(open)raise(root,c,t);else restore();
    last=open;
    ModernDebug.record("native-drawer top-layer="+open+" raised="+raised
        +" tab-visibility="+t.getVisibility());
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
