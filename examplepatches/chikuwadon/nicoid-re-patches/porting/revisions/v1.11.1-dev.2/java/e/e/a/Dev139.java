package e.e.a;

import android.graphics.SurfaceTexture;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Surface;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.WeakHashMap;

/**
 * Idempotent output handoff for the EXISTING ExoPlayer and TextureView.
 * No video loading, seeking, decoder creation, playback rate or pause calls.
 */
public final class Dev139 {
 private static final String TAG="nicoid-surface";
 private static final Handler MAIN=new Handler(Looper.getMainLooper());
 private static final WeakHashMap<View,Binding> BOUND=new WeakHashMap<>();
 private Dev139(){}

 private static final class Binding {
  final WeakReference<SurfaceTexture> texture;
  final WeakReference<Surface> output;
  Binding(SurfaceTexture texture,Surface output){
   this.texture=new WeakReference<>(texture);
   this.output=new WeakReference<>(output);
  }
 }
 private static Object get(Object owner,String field)throws Exception {
  for(Class<?> c=owner.getClass();c!=null;c=c.getSuperclass())try{
   Field f=c.getDeclaredField(field);f.setAccessible(true);return f.get(owner);
  }catch(NoSuchFieldException ignored){}
  throw new NoSuchFieldException(field);
 }
 private static Object exoplayer(View video)throws Exception {
  Object impl=get(video,"videoViewImpl");
  Object delegate=get(impl,"delegate");
  return get(delegate,"exoMediaPlayer");
 }
 private static Surface currentSurface(Object player)throws Exception {
  Object value=get(player,"surface");
  return value instanceof Surface?(Surface)value:null;
 }
 private static TextureView texture(View root){
  if(root instanceof TextureView &&
     "com.devbrackets.android.exomedia.core.video.exo.ExoTextureVideoView"
      .equals(root.getClass().getName()))return (TextureView)root;
  if(root instanceof ViewGroup){
   ViewGroup group=(ViewGroup)root;
   for(int i=0;i<group.getChildCount();i++){
    TextureView found=texture(group.getChildAt(i));if(found!=null)return found;
   }
  }
  return null;
 }

 /** Snapshot the already-bound decoder output BEFORE moving the view. */
 public static void remember(Object playerView){
  if(!(playerView instanceof View))return;
  View video=(View)playerView;
  rememberOutput(video,texture(video));
 }

 /** Called before the native keeper reparents a previously bound view. */
 public static void rememberOutput(View video,TextureView texture){
  if(video==null||texture==null||!texture.isAvailable())return;
  synchronized(BOUND){if(BOUND.containsKey(video))return;}
  try{
   Surface current=currentSurface(exoplayer(video));
   SurfaceTexture image=texture.getSurfaceTexture();
   if(current!=null&&current.isValid()&&image!=null){
    synchronized(BOUND){BOUND.put(video,new Binding(image,current));}
   }
  }catch(Exception e){Log.d(TAG,"No bound video output to retain");}
 }

 /** Use a new Surface only when the old one no longer belongs to this texture. */
 public static void connect(View video,TextureView texture){
  if(video==null||texture==null)return;
  if(Looper.myLooper()!=Looper.getMainLooper()){
   WeakReference<View> view=new WeakReference<>(video);
   WeakReference<TextureView> target=new WeakReference<>(texture);
   MAIN.post(()->{View v=view.get();TextureView t=target.get();if(v!=null&&t!=null)connect(v,t);});
   return;
  }
  if(texture(video)!=texture||!texture.isAttachedToWindow()||!texture.isAvailable())return;
  SurfaceTexture surfaceTexture=texture.getSurfaceTexture();
  if(surfaceTexture==null)return;
  try{
   Object player=exoplayer(video);
   Surface existing=currentSurface(player);
   Binding before;
   synchronized(BOUND){before=BOUND.get(video);}
   if(before!=null && before.texture.get()==surfaceTexture &&
      before.output.get()==existing && existing!=null && existing.isValid()){
    Log.d(TAG,"Preserved existing output; duplicate setSurface skipped");
    return;
   }
   // The first bind may happen without an earlier snapshot.  A genuine
   // output change remains necessary in that case.
   Surface next=new Surface(surfaceTexture);
   try {
    player.getClass().getMethod("setSurface",Surface.class).invoke(player,next);
   }catch(Exception failure){
    next.release();
    Log.w(TAG,"Output switch rejected; preserving existing playback",failure);
    return;
   }
   synchronized(BOUND){BOUND.put(video,new Binding(surfaceTexture,next));}
   Log.i(TAG,"Decoder output changed because SurfaceTexture changed");
  }catch(Exception failure){
   Log.w(TAG,"Unable to inspect retained player output",failure);
  }
 }

 /** Prevent Android from destroying the live TextureView output on app switch. */
 public static Retention hold(Object playerView){
  if(!(playerView instanceof View))return null;
  View video=(View)playerView;
  TextureView texture=texture(video);
  if(texture==null||!texture.isAvailable()||texture.getSurfaceTexture()==null)return null;
  if(texture.getSurfaceTextureListener() instanceof Retention)return null;
  try{
   remember(video);
   Retention retention=new Retention(video,texture);
   Log.i(TAG,"Original SurfaceTexture retained across app switch");
   return retention;
  }catch(RuntimeException exception){
   Log.w(TAG,"Cannot retain original texture; keeping standard playback",exception);
   return null;
  }
 }

 public static final class Retention implements TextureView.SurfaceTextureListener {
  private final WeakReference<View> video;
  private final TextureView view;
  private final TextureView.SurfaceTextureListener delegate;
  private SurfaceTexture saved;
  private boolean closed;
  private Retention(View video,TextureView texture){
   this.video=new WeakReference<>(video);
   view=texture;delegate=texture.getSurfaceTextureListener();
   saved=texture.getSurfaceTexture();
   texture.setSurfaceTextureListener(this);
  }
  @Override public boolean onSurfaceTextureDestroyed(SurfaceTexture texture){
   if(closed)return delegate==null||delegate.onSurfaceTextureDestroyed(texture);
   saved=texture;return false; // renderer is still running; retain its output
  }
  @Override public void onSurfaceTextureAvailable(SurfaceTexture texture,int width,int height){
   if(closed){if(delegate!=null)delegate.onSurfaceTextureAvailable(texture,width,height);return;}
   if(saved!=null&&saved!=texture){
    try{view.setSurfaceTexture(saved);}
    catch(RuntimeException failure){
     Log.w(TAG,"Original texture could not be reattached",failure);
     saved=texture;
     if(delegate!=null)delegate.onSurfaceTextureAvailable(texture,width,height);
    }
   }else if(saved==null){
    saved=texture;
    if(delegate!=null)delegate.onSurfaceTextureAvailable(texture,width,height);
   }
   restore();
  }
  @Override public void onSurfaceTextureSizeChanged(SurfaceTexture texture,int w,int h){
   if(delegate!=null)delegate.onSurfaceTextureSizeChanged(texture,w,h);
  }
  @Override public void onSurfaceTextureUpdated(SurfaceTexture texture){
   if(delegate!=null)delegate.onSurfaceTextureUpdated(texture);
  }
  /** Reconnect only if the held Surface was actually lost. */
  public void restore(){
   if(closed)return;
   View owner=video.get();
   if(owner==null)return;
   if(view.isAttachedToWindow()&&view.isAvailable()){
    SurfaceTexture now=view.getSurfaceTexture();
    if(saved!=null&&saved!=now)try{view.setSurfaceTexture(saved);}
    catch(RuntimeException error){Log.w(TAG,"Original texture no longer reusable",error);saved=now;}
    Dev139.connect(owner,view);
   }
  }
  /** Restore ExoTextureVideoView's native callback ownership. */
  public void close(){
   if(closed)return;
   closed=true;
   if(view.getSurfaceTextureListener()==this)view.setSurfaceTextureListener(delegate);
   if(!view.isAttachedToWindow()&&saved!=null){
    try{
     if(delegate==null||delegate.onSurfaceTextureDestroyed(saved))saved.release();
    }catch(RuntimeException ignored){}
   }
   saved=null;
  }
 }
}
