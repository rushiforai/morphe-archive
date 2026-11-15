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
public final class PlayerStart215 {
 private static final WeakHashMap<View,Watch> ACTIVE=new WeakHashMap<>();
 private PlayerStart215(){}
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
  boolean pendingReveal;
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
   if(!finished){
    hide();
   }else if(pendingReveal){
    // First frame must never expose the native overlapping glyph positions.
    if(separateQueueButtons(true))reveal();
   }else{
    // Visibility and layout changes in a queue are corrected before draw.
    separateQueueButtons(false);
   }
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
   unbind();
   pendingReveal=true;
   // Compute translations before revealing controls; posting spacing AFTER
   // visibility caused a one-frame overlapping cluster.
   if(separateQueueButtons(true))reveal();
   r.postDelayed(()->{
    if(pendingReveal){
     // Non-video surfaces without measurable videoLayout must remain usable.
     Log.w("nicoid-start","Queue controls not measurable; retaining native fallback");
     reveal();
    }
   },2000);
   r.postDelayed(()->{
    unobserve();
    r.removeOnAttachStateChangeListener(this);
   },4800);
   synchronized(ACTIVE){ACTIVE.remove(r);}
   FullscreenHandoff211.firstFrame(r);
   scheduleQueueSpacing();
   ModernDebug.record("player-center first frame, queue positions checked before visible");
  }
  void reveal(){
   if(!pendingReveal)return;
   View r=root.get();
   if(r==null)return;
   // Keep PreDraw active while native queue controls finalize their layout.
   for(int i=0;i<3;i++){
    View b=buttons[i].get();
    if(b!=null&&wanted[i]&&b.getVisibility()==View.INVISIBLE)
     b.setVisibility(View.VISIBLE);
   }
   pendingReveal=false;
   Log.i("nicoid-start","Center controls revealed after queue geometry correction");
   ModernDebug.record("player-center revealed only after queue spacing");
  }
  /** Navigation controls may become visible only AFTER a shuffled or
   * continuous queue advances. Native layout does not re-place them when
   * the visibility preference changes, leaving all three at the center. */
  boolean separateQueueButtons(boolean includeHidden){
   View r=root.get();
   if(r==null||!r.isAttachedToWindow())return false;
   View play=buttons[0].get();
   View video=find(r,"videoLayout");
   if(play==null||video==null||play.getWidth()<1||video.getWidth()<1)return false;
   int[] playAt=new int[2],frameAt=new int[2];
   play.getLocationOnScreen(playAt);
   video.getLocationOnScreen(frameAt);
   float center=playAt[0]+play.getWidth()/2f;
   float sideSpace=8*r.getResources().getDisplayMetrics().density;
   for(int i=1;i<3;i++){
    View button=buttons[i].get();
    if(button==null)continue;
    boolean eligible=button.getVisibility()==View.VISIBLE
        || (includeHidden&&wanted[i]&&button.getVisibility()==View.INVISIBLE);
    if(!eligible)continue;
    if(button.getWidth()<1)return false;
    int[] at=new int[2];button.getLocationOnScreen(at);
    float current=at[0]+button.getWidth()/2f;
    float collision=(play.getWidth()+button.getWidth())/2f+sideSpace*.3f;
    if(Math.abs(current-center)>=collision)continue;
    float wanted=center+(i==1?-1:1)*((play.getWidth()+button.getWidth())/2f+sideSpace);
    float left=frameAt[0]+button.getWidth()/2f+sideSpace;
    float right=frameAt[0]+video.getWidth()-button.getWidth()/2f-sideSpace;
    wanted=Math.max(left,Math.min(right,wanted));
    if(Math.abs(wanted-current)>1){
     button.setTranslationX(button.getTranslationX()+wanted-current);
     ModernDebug.record("player-center separated "+(i==1?"previous":"next")
         +" from center after queued first frame");
    }
   }
   return true;
  }
  void scheduleQueueSpacing(){
   View r=root.get();if(r==null)return;
   final WeakReference<Watch> watchRef=new WeakReference<>(this);
   for(int delay:new int[]{0,80,250,550,1200,2500,4200}){
    r.postDelayed(()->{
     Watch w=watchRef.get();
     if(w!=null&&w.finished){if(w.pendingReveal){if(w.separateQueueButtons(true))w.reveal();}else w.separateQueueButtons(false);}
    },delay);
   }
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
