package app.yydarlinker.deepseekcaptions;
import android.app.Activity;import android.content.Context;import android.graphics.drawable.Drawable;import android.view.View;import android.widget.Toast;import java.nio.charset.StandardCharsets;import java.util.*;
/** Same state as settings. Only the native player's recognized top menu receives the entry. */
public final class CaptionQuickToggle {
    private static long shortsMenuAt;
    private static String shortsVideo="";
    public static void observeMenuPath(String path,byte[] buffer){
        if(!shortsOpen()||path==null||!path.startsWith("overflow_menu_item.e")||buffer==null)return;
        if(path.contains("captions_sheet")||path.contains("quality_sheet"))return;
        String data=new String(buffer,StandardCharsets.ISO_8859_1);
        if(data.contains("closed_caption")||data.contains("closed_captions")){shortsMenuAt=android.os.SystemClock.uptimeMillis();shortsVideo=PageCaptionController.currentVideoIdSnapshot();}
    }
    public static int onMenu(Object panel,int index){
        Activity a=CaptionAddonSupport.activity();if(a==null||!CaptionAddonSupport.aiInstalled())return index;
        // Choose the setting by player state, not by the broad top-menu signal:
        // Shorts can also report topMenu=true. A disabled Shorts row must not leak through it.
        boolean inShorts=shortsOpen();
        boolean visible=inShorts?DeepSeekConfig.shortsFlyoutMenuEnabled(a):DeepSeekConfig.flyoutMenuEnabled(a);
        if(!visible){shortsMenuAt=0;shortsVideo="";return index;}
        boolean shorts=shortsMenuAt>0&&inShorts&&android.os.SystemClock.uptimeMillis()-shortsMenuAt<1500&&shortsVideo.equals(PageCaptionController.currentVideoIdSnapshot());
        if(!topMenu()&&!shorts)return index;shortsMenuAt=0;
        String text=CaptionStrings.get(a,"ai_title")+" · "+CaptionStrings.get(a,DeepSeekConfig.enabled(a)?"on":"off");
        int id=a.getResources().getIdentifier("deepseek_caption_settings","drawable",a.getPackageName());Drawable icon=id==0?null:a.getDrawable(id);
        int next=addNativeRow(panel,icon,text,v->{if(toggle(a))dismissNative();},index);
        if(next<0)return index;
        normalizeNativeGap(nativeContainer(panel));
        return next;
    }
    static boolean toggle(Context context){return setEngine(context,!DeepSeekConfig.enabled(context));}
    /** Only the known native list's top inset: the Morphe group already clears the drag handle. */
    static void normalizeNativeGap(android.widget.LinearLayout container){
        if(container==null||container.getChildCount()<2)return;
        View list=container.getChildAt(container.getChildCount()-1);
        if(!(list instanceof android.view.ViewGroup))return;
        if(list.getPaddingTop()>0)list.setPadding(list.getPaddingLeft(),0,list.getPaddingRight(),list.getPaddingBottom());
        if(list.getLayoutParams() instanceof android.view.ViewGroup.MarginLayoutParams){
            android.view.ViewGroup.MarginLayoutParams params=(android.view.ViewGroup.MarginLayoutParams)list.getLayoutParams();
            if(params.topMargin>0){params.topMargin=0;list.setLayoutParams(params);}
        }
    }
    public static android.widget.LinearLayout nativeContainer(Object panel){return null;}
    static boolean setEngine(Context context,boolean enabled){
        if(enabled && DeepSeekConfig.load(context).apiKey.isEmpty()){Toast.makeText(context,CaptionStrings.get(context,"configure_api"),Toast.LENGTH_LONG).show();return false;}
        boolean previous=DeepSeekConfig.enabled(context);
        // Saving the user's mode is independent of an ephemeral native player/track reference.
        // In particular, OFF must never be rolled back to ON by a stale Shorts manager.
        DeepSeekConfig.saveEnabled(context,enabled);
        DynamicCaptionController.refreshConfiguration(context);
        NativeCaptionBridge.Refresh refreshed=NativeCaptionBridge.Refresh.DEFERRED;
        try{refreshed=NativeCaptionBridge.refreshNativeTrack();}
        catch(Exception failed){CaptionDiagnostics.mark(context,"ENGINE_NATIVE_REFRESH_DEFERRED",failed.getClass().getSimpleName());}
        CaptionMusicSuppressor.forceNativeRendererScan();CaptionMusicSuppressor.kick();
        CaptionDiagnostics.mark(context,"ENGINE_MODE_SAVED","enabled="+enabled+";native="+refreshed.name()+";session="+DynamicCaptionController.isVisibleActive()+";choice_known="+CaptionChoice.known());
        if(previous!=enabled&&refreshed==NativeCaptionBridge.Refresh.DEFERRED)
            Toast.makeText(context,CaptionStrings.get(context,enabled?"mode_pending":"mode_off_pending"),Toast.LENGTH_LONG).show();
        else if(enabled&&CaptionChoice.isOn()&&!CaptionChoice.translates())
            Toast.makeText(context,CaptionStrings.get(context,"choose_translation"),Toast.LENGTH_LONG).show();
        return true;
    }
    public static boolean shortsOpen(){return false;}
    public static boolean topMenu(){return false;}
    public static int addNativeRow(Object panel,Drawable icon,String label,View.OnClickListener click,int index){return -1;}
    public static void dismissNative(){}
}
