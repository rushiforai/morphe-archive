package app.yydarlinker.aicaptions.host;

import app.yydarlinker.aicaptions.overlay.CaptionOverlay;
import app.yydarlinker.aicaptions.settings.AiCaptionConfig;

import androidx.annotation.Nullable;

import android.app.Activity;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.ImageView;

import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;

/** YouTube injection entry points. Player and caption state change on the main thread. */
public final class AiCaptionHook {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Object HANDOFF = new Object();
    private static long queuedOwner, deliveredOwner;
    private static volatile boolean installed, enabled;
    private static volatile Object youtubeCronetEngine;

    private AiCaptionHook() {}

    static boolean installed() { return installed; }
    static boolean enabled() { return enabled; }
    static void enabled(boolean value) { enabled = installed && value; }

    static void setMainActivity(@Nullable Activity activity) {
        if (activity == null || !CaptionAddonSupport.aiInstalled()) return;
        dispatchOwner("setMainActivity", () -> {
            installed = true;
            enabled(AiCaptionConfig.enabled(activity));
            CaptionSession.bind(activity);
        });
    }

    public static void onVideoId(@Nullable String videoId) {
        if (!installed) return;
        String id = videoId == null ? "" : videoId.trim();
        if (Looper.myLooper() == Looper.getMainLooper() && id.equals(CaptionSession.video()))
            run("onVideoId", () -> CaptionSession.onVideo(id));
        else dispatchOwner("onVideoId", () -> CaptionSession.onVideo(id));
    }

    public static void onPlayerType(@Nullable Enum<?> type) {
        if (!enabled || type == null) return;
        dispatch("onPlayerType", () -> {
            if (enabled) CaptionActions.onPlayerType(type.name());
        });
    }

    public static void onPlayerControlsVisibility(@Nullable Enum<?> state) {
        if (!enabled || state == null) return;
        long owner = CaptionPlayer.ownerEpoch();
        dispatch("onPlayerControlsVisibility", () -> {
            if (!enabled || owner != CaptionPlayer.ownerEpoch()) return;
            CaptionOverlay.setPlayerControlsVisible(switch (state.name()) {
                case "PLAYER_CONTROLS_VISIBILITY_WILL_SHOW", "PLAYER_CONTROLS_VISIBILITY_SHOWN" -> true;
                default -> false;
            });
        });
    }

    public static void onVideoTime(long timeMs) {
        if (!enabled) return;
        dispatch("onVideoTime", () -> {
            if (!enabled) return;
            CaptionSession.onTick();
            CaptionActions.onVideoTime(Math.max(0L, timeMs));
        });
    }

    public static void onNativeCaptionButtonController(@Nullable ImageView button) {
        if (!enabled || button == null) return;
        // The controller changes its accessibility and selected state after the injected call.
        enqueue("onNativeCaptionButtonController", () -> {
            if (enabled) CaptionButton.observe(button);
        });
    }

    public static void onTimedTextRequest(@Nullable Object engine, @Nullable String url) {
        if (!enabled || !isYouTubeTimedTextUrl(url)) return;
        dispatch("onTimedTextRequest", () -> {
            if (!enabled) return;
            if (engine != null) youtubeCronetEngine = engine;
            if (CaptionSession.matchesRequest(url)) CaptionSession.observe();
        });
    }

    public static void onShortsStateChanged(boolean open) {
        if (installed) dispatchOwner("onShortsStateChanged", () -> CaptionPlayer.onShortsStateChanged(open));
    }

    /** Runs scoped work in posting order, unless a newer owner has already taken over on main. */
    static void dispatch(Runnable event) {
        dispatch("captionCallback", event);
    }

    static void dispatch(String callback, Runnable event) {
        if (Looper.myLooper() == Looper.getMainLooper()) run(callback, event);
        else enqueue(callback, event);
    }

    private static void enqueue(String callback, Runnable event) {
        synchronized (HANDOFF) {
            long owner = queuedOwner;
            MAIN.post(() -> {
                if (owner == deliveredOwner) run(callback, event);
            });
        }
    }

    private static void dispatchOwner(String callback, Runnable event) {
        boolean main = Looper.myLooper() == Looper.getMainLooper();
        long owner;
        synchronized (HANDOFF) {
            owner = ++queuedOwner;
            if (!main) {
                MAIN.post(() -> deliverOwner(owner, callback, event));
                return;
            }
        }
        deliverOwner(owner, callback, event);
    }

    private static void deliverOwner(long owner, String callback, Runnable event) {
        if (owner <= deliveredOwner) return;
        deliveredOwner = owner;
        run(callback, event);
    }

    private static void run(String callback, Runnable event) {
        try {
            event.run();
        } catch (RuntimeException | LinkageError failure) {
            Log.w("AiCaptions", callback + " failed: " + failure.getClass().getSimpleName());
        }
    }

    @Nullable public static HttpURLConnection openWithYouTubeCronet(@Nullable URL url) {
        Object engine = youtubeCronetEngine;
        if (engine == null || url == null) return null;
        try {
            Method open;
            try {
                open = engine.getClass().getMethod("openConnection", URL.class);
            } catch (NoSuchMethodException hidden) {
                open = Class.forName("org.chromium.net.CronetEngine")
                        .getMethod("openConnection", URL.class);
            }
            Object connection = open.invoke(engine, url);
            return connection instanceof HttpURLConnection ? (HttpURLConnection) connection : null;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError failure) {
            return null;
        }
    }

    public static boolean isYouTubeTimedTextUrl(@Nullable String url) {
        if (url == null || url.length() < 12 || url.length() > 24 * 1024
                || url.indexOf('\r') >= 0 || url.indexOf('\n') >= 0) return false;
        try {
            Uri uri = Uri.parse(url);
            String scheme = uri.getScheme(), host = uri.getHost(), path = uri.getPath();
            if (host == null || path == null
                    || !("https".equalsIgnoreCase(scheme) || "http".equalsIgnoreCase(scheme))) return false;
            host = host.toLowerCase(Locale.ROOT);
            return (host.equals("youtube.com") || host.endsWith(".youtube.com"))
                    && path.toLowerCase(Locale.ROOT).endsWith("/timedtext");
        } catch (RuntimeException malformed) {
            return false;
        }
    }
}
