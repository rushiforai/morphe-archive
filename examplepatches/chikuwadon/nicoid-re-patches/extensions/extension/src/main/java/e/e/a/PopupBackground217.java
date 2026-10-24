package e.e.a;

import android.view.View;
import android.view.WindowManager;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** The service, rather than window attachment, owns background playback. */
public final class PopupBackground217 {
 private PopupBackground217() {}
 public static void enter(Object owner,View root)throws Exception {
  Field mode=owner.getClass().getField("p0");
  if(mode.getBoolean(null))return;
  if(root==null||!root.isAttachedToWindow()||Review181.field(owner,"a")!=root)throw new IllegalStateException("Popup is not attached");
  Object player=Review181.field(owner,"e");
  WindowManager manager=(WindowManager)Review181.field(owner,"b");
  if(player==null||manager==null)throw new IllegalStateException("Popup playback is unavailable");
  Class<?> type=Class.forName("com.devbrackets.android.exomedia.ExoMedia$RendererType");
  Object video=type.getField("VIDEO").get(null);
  Method releasePolicy=player.getClass().getMethod("setReleaseOnDetachFromWindow",boolean.class);
  Method renderer=player.getClass().getMethod("setRendererEnabled",type,boolean.class);
  boolean previousRelease=player.getClass().getField("releaseOnDetachFromWindow").getBoolean(player);
  boolean previousVideo=(Boolean)player.getClass().getMethod("isRendererEnabled",type).invoke(player,video);
  try {
   releasePolicy.invoke(player,false);
   renderer.invoke(player,video,false);
   mode.setBoolean(null,true);
   owner.getClass().getMethod("b",boolean.class).invoke(owner,true);
   manager.removeView(root);
  }catch(Exception failure){
   if(root.isAttachedToWindow()){
    mode.setBoolean(null,false);
    try{renderer.invoke(player,video,previousVideo);releasePolicy.invoke(player,previousRelease);owner.getClass().getMethod("b",boolean.class).invoke(owner,false);}catch(Exception rollback){failure.addSuppressed(rollback);}
   }
   throw failure;
  }
  try {Class.forName("e.e.a.ModernDebug").getMethod("record",String.class).invoke(null,"Popup switched to background without releasing playback");} catch (ReflectiveOperationException ignored) {}
 }
 public static boolean currentPopup(Object owner,Object player,String video){
  try{return player!=null&&Review181.field(owner,"e")==player&&video!=null&&video.equals(Review181.field(owner,"f"))&&!owner.getClass().getField("p0").getBoolean(null)&&owner.getClass().getField("n0").getBoolean(null)&&((View)Review181.field(owner,"a")).isAttachedToWindow();}
  catch(Exception stale){return false;}
 }
}
