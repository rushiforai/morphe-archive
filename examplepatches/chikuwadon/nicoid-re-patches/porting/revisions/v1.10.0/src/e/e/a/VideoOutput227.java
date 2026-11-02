package e.e.a;
import android.graphics.SurfaceTexture;import java.util.WeakHashMap;import java.lang.ref.WeakReference;import android.view.*;import android.os.*;
/** Rebind the existing decoder's output; never prepare a URI or change playback intent. */
public final class VideoOutput227 {
 static final Handler MAIN=new Handler(Looper.getMainLooper());
 public static void prepared(Object owner){try{View video=(View)Playback214.get(owner,"a0");TextureView texture=MiniSession225.texture(video);if(texture==null)return;bind(video,texture);PlayerCollapse227.attach(owner);}catch(Exception e){android.util.Log.w("nicoid-video-output","Cannot inspect prepared output",e);}}
 static final WeakHashMap<View,WeakReference<TextureView>> PENDING=new WeakHashMap<>();
 static final WeakHashMap<View,WeakReference<SurfaceTexture>> OUTPUTS=new WeakHashMap<>();
 static void bind(View video,TextureView texture){if(video==null||texture==null)return;if(Looper.myLooper()!=Looper.getMainLooper()){MAIN.post(()->bind(video,texture));return;}WeakReference<TextureView> previous=PENDING.put(video,new WeakReference<>(texture));if(previous!=null)return;WeakReference<View> target=new WeakReference<>(video);MAIN.post(()->{View v=target.get();if(v==null)return;WeakReference<TextureView> request=PENDING.remove(v);TextureView t=request==null?null:request.get();if(t!=null)connect(v,t);});}
 static void connect(View video,TextureView texture){try{
  if(!texture.isAttachedToWindow()||!texture.isAvailable()||texture.getSurfaceTexture()==null)return;
  Object impl=Playback214.get(video,"videoViewImpl"),delegate=Playback214.get(impl,"delegate"),player=Playback214.get(delegate,"exoMediaPlayer");
  Object old=Playback214.get(player,"surface");WeakReference<SurfaceTexture> bound=OUTPUTS.get(video);boolean reused=bound!=null&&bound.get()==texture.getSurfaceTexture()&&old instanceof Surface&&((Surface)old).isValid();Surface next=reused?(Surface)old:new Surface(texture.getSurfaceTexture());
  try{if(!reused)player.getClass().getMethod("setSurface",Surface.class).invoke(player,next);}catch(Exception e){if(!reused)next.release();throw e;}OUTPUTS.put(video,new WeakReference<>(texture.getSurfaceTexture()));
  // Surface ownership stays with the renderer until its queued output switch completes.
  Object preview=Playback214.get(video,"previewImageView");if(preview instanceof View)((View)preview).setVisibility(View.GONE);
  if(!reused)ModernDebug.record("Existing video output rebound; hardware="+video.isHardwareAccelerated()+" surface="+next.isValid()+" size="+texture.getWidth()+"x"+texture.getHeight());
 }catch(Exception e){android.util.Log.w("nicoid-video-output","Cannot bind retained decoder output",e);}}
}
