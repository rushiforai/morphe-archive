package app.afterglow.extension.downloads;

import android.app.Activity;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.ui.DownloadsUi;
import app.afterglow.extension.video.VideoState;
import app.afterglow.extension.diagnostics.DebugLog;

/** Native button and command entry points into the Afterglow download sheet. */
public final class DownloadHooks {
    private DownloadHooks() {}
    public static void openCurrent() { open(VideoState.videoId()); }
    public static boolean open(String videoId) {
        Activity activity=Afterglow.mainActivity();
        if(!InstalledTweaks.has("downloads")||activity==null||activity.isFinishing()||activity.isDestroyed()
                ||videoId==null||!videoId.matches("[A-Za-z0-9_-]{11}"))return false;
        DebugLog.write("download", "Opened Afterglow download sheet");
        Afterglow.runOnMain(()->DownloadsUi.openDownloadSheet(activity,new DownloadRequest(videoId)));
        return true;
    }
    public static boolean nativeButton(String videoId) {
        if (!AfterglowPrefs.getBool("nativeDownloadRouting")) return false;
        boolean opened = open(videoId);
        DebugLog.write("offline-routing", "Native download button routed=" + opened);
        return opened;
    }
    public static boolean nativeCommand(Object command) {
        if(!InstalledTweaks.has("downloads")||!AfterglowPrefs.getBool("nativeDownloadRouting")||command==null)return false;
        try {
            // fixProtoLibraryPatch retains the standard MessageLite contract in the host.
            java.lang.reflect.Method encode=command.getClass().getMethod("toByteArray");
            encode.setAccessible(true);
            return routeCommand((byte[])encode.invoke(command));
        } catch(Exception ignored) { return false; }
    }
    static String commandVideoId(byte[] bytes) throws Exception {
        // Explicit download requests only; watch/navigation and remove-offline commands pass through.
        return DownloadProto.downloadCommandVideoId(bytes);
    }
    private static boolean routeCommand(byte[] bytes) throws Exception {
        String id=commandVideoId(bytes);
        if (id.isEmpty()) return false;
        boolean opened = open(id);
        DebugLog.write("offline-routing", "Native download command routed=" + opened);
        return opened;
    }
}
