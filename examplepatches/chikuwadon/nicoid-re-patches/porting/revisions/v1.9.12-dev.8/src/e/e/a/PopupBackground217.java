package e.e.a;
import android.view.View;
public final class PopupBackground217 {
 private PopupBackground217(){}
 public static void enter(Object owner,View root)throws Exception{if(root==null||!root.isAttachedToWindow()||Playback214.get(owner,"a")!=root)throw new IllegalStateException("Popup is not attached");DirectBackground235.adoptPopup(owner,root);}
 public static boolean currentPopup(Object owner,Object player,String video){try{return player!=null&&Playback214.get(owner,"e")==player&&video!=null&&video.equals(Playback214.get(owner,"f"))&&!owner.getClass().getField("p0").getBoolean(null)&&owner.getClass().getField("n0").getBoolean(null)&&((View)Playback214.get(owner,"a")).isAttachedToWindow();}catch(Exception stale){return false;}}
}
