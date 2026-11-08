package semicoloncolonel.mobilestream.extension.truthsocial;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Application;
import android.app.DownloadManager;
import android.content.Context;
import android.net.Uri;
import android.os.Environment;
import android.util.Log;
import android.widget.Toast;

import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Truth Social "Save videos". The app's "Save image" buttons (in a post's
 * menu and in the media viewer) receive the URL of the media on screen,
 * which is a video's own file for videos. The app saves only pictures, so
 * for a video this class names the button "Save video" and saves the file
 * with Android's download manager, to Movies/Truth Social.
 *
 * Videos that open in the full-screen player get the same: the player's
 * Playback Controls sheet has a Video Quality row that the app hides for
 * these videos. That row is shown, named "Save video", and saves the video
 * the player was opened with. The player is opened with the media
 * attachment's ID, so each attachment's ID and URL are recorded as the app
 * reads them.
 */
@SuppressWarnings("unused")
public final class MediaSaver {
    private static volatile String lastUrl;
    private static volatile String playerUrl;
    private static final String TAG = "MSP-SAVE";
    private static final Map<String, String> mediaUrls = new LinkedHashMap<String, String>(64, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
            return size() > 500;
        }
    };

    /** Called by each media attachment the app reads, with its ID and URL. */
    public static void rememberMedia(String id, String url) {
        if (id == null || !isVideo(url)) return;
        synchronized (mediaUrls) {
            mediaUrls.put(id, url);
        }
    }

    private MediaSaver() {
    }

    /** Called with the URL each save button is built for. */
    public static void remember(String url) {
        if (url != null) lastUrl = url;
    }

    /** Called when the full-screen player opens. */
    public static void rememberPlayer(Activity activity) {
        try {
            String item = activity.getIntent().getStringExtra("videoUrl");
            String url;
            synchronized (mediaUrls) {
                url = mediaUrls.get(item);
            }
            playerUrl = url != null ? url : item;
            Log.i(TAG, "player video " + (isVideo(playerUrl) ? "can be saved" : "cannot be saved: " + item));
        } catch (Throwable ignored) {
            playerUrl = null;
        }
    }

    /** Whether the player's video can be saved, so its Save row shows. */
    public static boolean canSavePlayerVideo() {
        return isVideo(playerUrl);
    }

    /** Called with the player sheet's "Video Quality" text. */
    public static String playerLabel(String label) {
        return canSavePlayerVideo() ? "Save video" : label;
    }

    /**
     * Called with the player sheet's Video Quality click handler. For a video
     * that can be saved, answers a handler of the same kind that saves it.
     */
    public static Object playerClick(Object original) {
        if (original == null || !canSavePlayerVideo()) return original;
        try {
            for (Class<?> type : original.getClass().getInterfaces()) {
                for (Method method : type.getMethods()) {
                    if (method.getName().equals("invoke") && method.getParameterTypes().length == 0) {
                        return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, (proxy, called, args) -> {
                            if (called.getName().equals("invoke")) {
                                saveVideo(application(), playerUrl);
                                return null;
                            }
                            if (called.getName().equals("hashCode")) return System.identityHashCode(proxy);
                            if (called.getName().equals("equals")) return proxy == args[0];
                            if (called.getName().equals("toString")) return "MediaSaver";
                            return null;
                        });
                    }
                }
            }
        } catch (Throwable ignored) {
            // Keep the app's own handler.
        }
        return original;
    }

    @SuppressLint({"PrivateApi", "DiscouragedPrivateApi"})
    private static Context application() throws Exception {
        return (Application) Class.forName("android.app.ActivityThread")
                .getMethod("currentApplication")
                .invoke(null);
    }

    /** Called with the button's "Save image" text. */
    public static String label(String label) {
        return isVideo(lastUrl) ? "Save video" : label;
    }

    /** Called before the app saves; true when this class saved a video. */
    public static boolean saveVideo(Context context, String url) {
        if (context == null || !isVideo(url)) return false;
        try {
            Uri uri = Uri.parse(url);
            String name = uri.getLastPathSegment();
            if (name == null || name.isEmpty()) name = "truth-" + System.currentTimeMillis() + ".mp4";
            DownloadManager.Request request = new DownloadManager.Request(uri)
                    .setTitle(name)
                    .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
                    .setDestinationInExternalPublicDir(Environment.DIRECTORY_MOVIES, "Truth Social/" + name);
            DownloadManager manager = (DownloadManager) context.getSystemService(Context.DOWNLOAD_SERVICE);
            manager.enqueue(request);
            Toast.makeText(context, "Saving video to Movies/Truth Social", Toast.LENGTH_SHORT).show();
        } catch (Throwable t) {
            Toast.makeText(context, "Could not save the video", Toast.LENGTH_SHORT).show();
        }
        return true;
    }

    private static boolean isVideo(String url) {
        if (url == null) return false;
        String path = Uri.parse(url).getPath();
        if (path == null) return false;
        path = path.toLowerCase(Locale.ROOT);
        return path.endsWith(".mp4") || path.endsWith(".mov") || path.endsWith(".m4v") || path.endsWith(".webm");
    }
}
