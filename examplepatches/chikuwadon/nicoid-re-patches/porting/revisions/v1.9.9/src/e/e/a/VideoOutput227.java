package e.e.a;
import android.graphics.SurfaceTexture;import android.view.*;import android.os.*;
/** Rebind the existing decoder's output; never prepare a URI or change playback intent. */
public final class VideoOutput227 {
 static final Handler MAIN=new Handler(Looper.getMainLooper());
 public static void prepared(Object owner){try{View video=(View)Playback214.get(owner,"a0");TextureView texture=MiniSession225.texture(video);if(texture==null)return;bind(video,texture);PlayerCollapse227.attach(owner);}catch(Exception e){android.util.Log.w("nicoid-video-output","Cannot inspect prepared output",e);}}
 static void bind(View video,TextureView texture){try{
  if(!texture.isAvailable()||texture.getSurfaceTexture()==null)return;
  Object impl=Playback214.get(video,"videoViewImpl"),delegate=Playback214.get(impl,"delegate"),player=Playback214.get(delegate,"exoMediaPlayer");
  Object old=Playback214.get(player,"surface");Surface next=new Surface(texture.getSurfaceTexture());
  try{player.getClass().getMethod("setSurface",Surface.class).invoke(player,next);}catch(Exception e){next.release();throw e;}
  if(old instanceof Surface&&old!=next){final Surface previous=(Surface)old;MAIN.postDelayed(()->previous.release(),100);}
  Object preview=Playback214.get(video,"previewImageView");if(preview instanceof View)((View)preview).setVisibility(View.GONE);
  ModernDebug.record("Existing video output rebound; hardware="+video.isHardwareAccelerated()+" surface="+next.isValid()+" size="+texture.getWidth()+"x"+texture.getHeight());
 }catch(Exception e){android.util.Log.w("nicoid-video-output","Cannot bind retained decoder output",e);}}
}
