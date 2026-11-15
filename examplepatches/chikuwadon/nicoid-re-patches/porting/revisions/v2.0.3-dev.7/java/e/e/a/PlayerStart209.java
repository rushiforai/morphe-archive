package e.e.a;
import android.graphics.SurfaceTexture;
import android.util.Log;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** A decoded TextureView frame, not duration or a timeout, releases the center controls. */
public final class PlayerStart209 {
 private static final WeakHashMap<View,Watch> ACTIVE=new WeakHashMap<>();
 private PlayerStart209(){}
 public static void install(View root){
  if(root==null)return;
  synchronized(ACTIVE){
   if(ACTIVE.containsKey(root))return;
   Watch watch=new Watch(root);
   if(!watch.hasControls())return;
   ACTIVE.put(root,watch);
   watch.begin();
   ModernDebug.record("player-center awaiting TextureView first frame");
  }
 }
 private static View find(View root,String id){
  int value=root.getResources().getIdentifier(id,"id",root.getContext().getPackageName());
  return value==0?null:root.findViewById(value);
 }
 private static TextureView texture(View root){
  if(root instanceof TextureView)return (TextureView)root;
  if(root instanceof ViewGroup){
   ViewGroup group=(ViewGroup)root;
   for(int i=0;i<group.getChildCount();i++){
    TextureView found=texture(group.getChildAt(i));
    if(found!=null)return found;
   }
  }
  return null;
 }
 static final class Watch implements Runnable,View.OnAttachStateChangeListener,ViewTreeObserver.OnPreDrawListener {
  final WeakReference<View> root;
  final WeakReference<View>[] buttons;
  final boolean[] wanted=new boolean[3];
  TextureView source;
  Hook hook;
  ViewTreeObserver observer;
  boolean finished;
  @SuppressWarnings("unchecked") Watch(View r){
   root=new WeakReference<>(r);
   buttons=new WeakReference[3];
   String[] names={"viewbutton","prevbutton","nextbutton"};
   for(int i=0;i<3;i++){
    View b=find(r,names[i]);
    buttons[i]=new WeakReference<>(b);
    wanted[i]=b!=null&&b.getVisibility()==View.VISIBLE;
   }
  }
  boolean hasControls(){return buttons[0].get()!=null;}
  void begin(){
   View r=root.get();
   if(r==null)return;
   hide();
   r.addOnAttachStateChangeListener(this);
   observe(r);
   r.post(this);
  }
  void hide(){
   for(int i=0;i<3;i++){
    View b=buttons[i].get();
    if(b==null)continue;
    if(b.getVisibility()==View.VISIBLE){
     wanted[i]=true;
     b.setVisibility(View.INVISIBLE);
    }
   }
  }
  @Override public void run(){
   View r=root.get();
   if(r==null||finished)return;
   hide();
   if(source==null||!source.isAttachedToWindow()||source.getSurfaceTextureListener()!=hook){
    TextureView t=texture(r);
    if(t!=null&&t.isAttachedToWindow())bind(t);
   }
   if(!finished)r.postDelayed(this,32);
  }
  void observe(View root){
   ViewTreeObserver next=root.getViewTreeObserver();
   if(next==observer)return;
   unobserve();
   if(next.isAlive()){next.addOnPreDrawListener(this);observer=next;}
  }
  void unobserve(){
   if(observer!=null&&observer.isAlive())observer.removeOnPreDrawListener(this);
   observer=null;
  }
  @Override public boolean onPreDraw(){
   if(!finished)hide();
   return true;
  }
  void bind(TextureView t){
   if(source==t&&hook!=null&&t.getSurfaceTextureListener()==hook)return;
   unbind();
   source=t;
   try{
    hook=new Hook(this,t.getSurfaceTextureListener());
    t.setSurfaceTextureListener(hook);
    ModernDebug.record("player-center TextureView frame observer attached");
   }catch(RuntimeException error){
    Log.w("nicoid-start","Could not observe decoded output",error);
    source=null;hook=null;
   }
  }
  void firstFrame(){
   if(finished)return;
   View r=root.get();
   if(r==null)return;
   finished=true;
   r.removeCallbacks(this);
   r.removeOnAttachStateChangeListener(this);
   unobserve();
   unbind();
   for(int i=0;i<3;i++){
    View b=buttons[i].get();
    if(b!=null&&wanted[i]&&b.getVisibility()==View.INVISIBLE)
     b.setVisibility(View.VISIBLE);
   }
   synchronized(ACTIVE){ACTIVE.remove(r);}
   FullscreenHandoff209.firstFrame(r);
   Log.i("nicoid-start","Center controls released on decoded first frame");
   ModernDebug.record("player-center released after decoded first frame");
  }
  void unbind(){
   TextureView t=source;Hook h=hook;
   if(t!=null&&h!=null&&t.getSurfaceTextureListener()==h)
    t.setSurfaceTextureListener(h.previous);
   source=null;hook=null;
  }
  @Override public void onViewAttachedToWindow(View v){observe(v);v.removeCallbacks(this);v.post(this);}
  @Override public void onViewDetachedFromWindow(View v){
   v.removeCallbacks(this);
   unobserve();
   unbind();
  }
 }
 static final class Hook implements TextureView.SurfaceTextureListener {
  final WeakReference<Watch> watch;
  final TextureView.SurfaceTextureListener previous;
  Hook(Watch w,TextureView.SurfaceTextureListener p){watch=new WeakReference<>(w);previous=p;}
  @Override public void onSurfaceTextureAvailable(SurfaceTexture t,int w,int h){
   if(previous!=null)previous.onSurfaceTextureAvailable(t,w,h);
  }
  @Override public void onSurfaceTextureSizeChanged(SurfaceTexture t,int w,int h){
   if(previous!=null)previous.onSurfaceTextureSizeChanged(t,w,h);
  }
  @Override public boolean onSurfaceTextureDestroyed(SurfaceTexture t){
   return previous==null||previous.onSurfaceTextureDestroyed(t);
  }
  @Override public void onSurfaceTextureUpdated(SurfaceTexture t){
   if(previous!=null)previous.onSurfaceTextureUpdated(t);
   Watch w=watch.get();
   if(w!=null)w.firstFrame();
  }
 }
}
