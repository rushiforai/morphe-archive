package app.yydarlinker.deepseekcaptions;
import android.app.Activity;
import android.content.Context;
import android.net.Uri;
/** Single production core. Legacy experiments are not selectable from the app. */
final class PageCaptionController {
    private static volatile String currentId="";
    static String currentVideoIdSnapshot() { return currentId; }
    static void onPlayerStable() { }
    private PageCaptionController() {}
    static boolean isVisibleActive() { return ContextualUnitCaptionController.isVisibleActive(); }
    static void deactivateFromCaptionButton() { ContextualUnitCaptionController.deactivateFromCaptionButton(); }
    static void deactivateFromNativeCaptionState() { ContextualUnitCaptionController.deactivateFromNativeCaptionState(); }
    static void setMainActivity(Activity activity) { if(activity!=null) TokenCostAudit.onCoreSelected(activity,"contextual_unit_v1"); ContextualUnitCaptionController.setMainActivity(activity); }
    static void onPlayerType(String rawType) { ContextualUnitCaptionController.onPlayerType(rawType); }
    static String restoreTargetAfterMiniplayer(String url) { return ContextualUnitCaptionController.restoreTargetAfterMiniplayer(url); }
    static void onVideoId(String videoId) { currentId=videoId==null ? "" : videoId.trim(); ContextualUnitCaptionController.onVideoId(videoId); NativeCaptionBridge.onVideoId(currentId); }
    static void refreshConfiguration(Context context) { ContextualUnitCaptionController.refreshConfiguration(context); }
    static void activate(Context context, String translatedUrl) { ContextualUnitCaptionController.activate(context, translatedUrl); }
    static void prewarm(Context context, String sourceUrl) { ContextualUnitCaptionController.prewarm(context, sourceUrl); }
    static void observeTimedTextUrl(String url) { ContextualUnitCaptionController.observeTimedTextUrl(url); }
    static void onVideoTime(long timeMs) { ContextualUnitCaptionController.onVideoTime(timeMs); }
    static String videoIdFromUrl(String url) {
        if (url==null) return "";
        try { String id=Uri.parse(url).getQueryParameter("v"); return id==null ? "" : id; }
        catch(Exception invalid) { return ""; }
    }
}


