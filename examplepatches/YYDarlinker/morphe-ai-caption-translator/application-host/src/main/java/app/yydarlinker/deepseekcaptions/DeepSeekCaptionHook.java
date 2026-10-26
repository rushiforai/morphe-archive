package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.net.Uri;

import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;

/**
 * The caption request path: called by the patch immediately before YouTube creates the timed-text
 * request, it starts the matching AI session while preserving YouTube's original request.
 *
 * <p>The language is owned by YouTube's committed native selection. A matching request only wakes
 * reconciliation; it never selects a language, adds a target or restores a previous target.
 */
public final class DeepSeekCaptionHook {
    private static final int MAX_URL_CHARS = 24 * 1024;

    private static volatile Context appContext;
    private static volatile Object youtubeCronetEngine;

    private DeepSeekCaptionHook() {}

    static void setMainActivity(Activity activity) {
        try {
            if (activity != null) appContext = activity.getApplicationContext();
            TokenCostAudit.install(appContext);
            CaptionPlayerTransitionGuard.installAuthorityListener();
            CaptionPlayerTransitionGuard.setActivity(activity);
            CaptionApplication.setMainActivity(activity);
            CaptionButtonController.install(activity);
            NativeCaptionBridge.initialize(activity);
        } catch (Throwable ignored) {
            // A broken extension must never stop YouTube from starting.
        }
    }

    static void onVideoId(String videoId) {
        try {
            CaptionPlayerAuthority.setVideo(videoId);
            // Clear the previous video's CC permission before any activation can run.
            CaptionButtonController.onVideoId(videoId);
            TokenCostAudit.onVideoId(context(), videoId);
            NativeCaptionBridge.onVideoId(videoId);
            CaptionActions.onVideoId(videoId);
        } catch (Throwable ignored) {
            // See setMainActivity.
        }
    }

    static void onVideoTime(long timeMs) {
        try {
            CaptionActions.onVideoTime(timeMs);
            TokenCostAudit.onVideoTime(context(), timeMs, CaptionActions.isVisibleActive());
        } catch (Throwable ignored) {
            // See setMainActivity.
        }
    }

    static void onPlayerType(String type) {
        try {
            CaptionActions.onPlayerType(type);
            CaptionPlayerTransitionGuard.onPlayerType(type);
        } catch (Throwable ignored) {
            // See setMainActivity.
        }
    }

    /**
     * The native renderer keeps its real caption data so switching AI off can restore it instantly.
     * The draw hook masks that renderer while AI is enabled; an empty replacement track would leave
     * nothing to display when the switch is turned off with CC still on.
     */
    static String rewriteUrl(Object cronetEngine, String originalUrl) {
        if (cronetEngine != null) youtubeCronetEngine = cronetEngine;
        Context context = context();
        if (!CaptionAddonSupport.aiInstalled()
                || context == null
                || originalUrl == null) return originalUrl;

        if (!isYouTubeTimedTextUrl(originalUrl)) return originalUrl;

        // Prefetched or departed requests are not selections of the foreground video: never
        // replace the visible session with another video's source.
        String requested = CaptionUrls.videoId(originalUrl);
        String foreground = CaptionActions.currentVideoIdSnapshot();
        if (!requested.isEmpty() && !foreground.isEmpty() && !foreground.equals(requested))
            return originalUrl;

        boolean aiEnabled = DeepSeekConfig.enabled(context);
        // Respect YouTube completely when AI is off.
        if (!aiEnabled) return originalUrl;
        if (!CaptionSessionReconciler.displayAllowed(context)) return originalUrl;

        CaptionNativeProjection.Snapshot selected = CaptionSessionReconciler.currentSelection();
        if (selected == null || foreground.isEmpty()) return originalUrl;
        TargetLanguage requestedTarget = TargetLanguage.fromUrl(originalUrl);
        if (selected.translated) {
            if (requestedTarget == null
                    || !selected.target().equalsIgnoreCase(requestedTarget.code)) return originalUrl;
        } else if (requestedTarget != null) return originalUrl;

        // Requests only wake reconciliation of the committed native selection. They cannot select
        // a target, restore an old target onto a source URL, or promote a prefetched language.
        try {
            CaptionSessionReconciler.onObservation(
                    context, "request", CaptionPlayerAuthority.ownerEpoch());
        } catch (Throwable failure) {
            CaptionDiagnostics.mark(context, "HOOK_ERROR", CaptionDiagnostics.errorDetail(failure));
        }
        return originalUrl;
    }

    /** Opens [url] with the connection factory of YouTube's own network stack, or null. */
    static HttpURLConnection openWithYouTubeCronet(URL url) {
        Object engine = youtubeCronetEngine;
        if (engine == null || url == null) return null;
        try {
            Method open;
            try {
                open = engine.getClass().getMethod("openConnection", URL.class);
            } catch (ReflectiveOperationException hidden) {
                open =
                        Class.forName("org.chromium.net.CronetEngine")
                                .getMethod("openConnection", URL.class);
            }
            Object connection = open.invoke(engine, url);
            return connection instanceof HttpURLConnection ? (HttpURLConnection) connection : null;
        } catch (Throwable unavailable) {
            return null;
        }
    }

    static boolean isAutoTranslatedCaptionUrl(String url) {
        return TargetLanguage.fromUrl(url) != null;
    }

    static boolean isYouTubeTimedTextUrl(String url) {
        if (url == null || url.length() < 12 || url.length() > MAX_URL_CHARS) return false;
        if (url.indexOf('\r') >= 0 || url.indexOf('\n') >= 0) return false;
        try {
            Uri uri = Uri.parse(url);
            String scheme = uri.getScheme();
            String host = uri.getHost();
            String path = uri.getPath();
            if (host == null
                    || path == null
                    || !("https".equalsIgnoreCase(scheme) || "http".equalsIgnoreCase(scheme)))
                return false;
            host = host.toLowerCase(Locale.ROOT);
            path = path.toLowerCase(Locale.ROOT);
            return (host.equals("youtube.com") || host.endsWith(".youtube.com"))
                    && path.endsWith("/timedtext");
        } catch (Throwable malformed) {
            return false;
        }
    }

    /** The application context, from the main activity or else from the running application. */
    static Context context() {
        Context cached = appContext;
        if (cached != null) return cached;
        try {
            Method current =
                    Class.forName("android.app.ActivityThread")
                            .getDeclaredMethod("currentApplication");
            Application application = (Application) current.invoke(null);
            if (application != null) appContext = cached = application.getApplicationContext();
        } catch (Throwable unavailable) {
            // Not available before the application exists.
        }
        return cached;
    }
}
