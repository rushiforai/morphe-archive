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
 * request, it decides whether the request is passed on, closed, or answered by the loopback server.
 *
 * <p>The language is owned by YouTube. This hook only acts on a translated request that YouTube
 * itself selected (the URL already contains {@code tlang}); it never adds a target to a source
 * request and never keeps a separate language memory.
 */
public final class DeepSeekCaptionHook {
    private static final String CLOSED_TRANSLATION_SINK =
            "http://127.0.0.1:9/deepseek-caption-unavailable";
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
            TokenCostAudit.onVideoId(context(), videoId);
            NativeCaptionBridge.onVideoId(videoId);
            CaptionActions.onVideoId(videoId);
            CaptionButtonController.onVideoId(videoId);
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
     * Decides what YouTube gets for a timed-text request: the url itself, a closed sink (a
     * translation the session intent does not own), or the loopback url of the caption server.
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

        // The native selection is the only language source. A source request means the user/native
        // model selected source captions: never synthesize a target from it.
        TargetLanguage target = TargetLanguage.fromUrl(originalUrl);
        if (target == null) return originalUrl;

        // A background prefetch is not the visible selection.
        if (foreground.isEmpty()) return originalUrl;

        // The session intent is the only evidence that this request belongs to a session the user
        // asked for. It is written by user acts only, so a request can neither revive a session the
        // user turned off nor create one, and YouTube's own idea of a target cannot replace it.
        CaptionSessionIntent intent = CaptionSessionIntent.load(context);
        if (!selectionEvidence(intent)) return originalUrl;
        if (!ownsRequest(intent, target)) return CLOSED_TRANSLATION_SINK;

        // restoreTargetAfterMiniplayer already restores the intent's target for a lifecycle
        // re-request; the request is then translated from the source track it names.
        String selected = CaptionActions.restoreTargetAfterMiniplayer(originalUrl);
        selected = SourceTrackPolicy.apply(context, selected);

        try {
            CaptionButtonController.noteAiTrackSelected();
            SourceSelection own = SourceTrackPolicy.ownTargetTrack(context, selected);
            if (own != null) {
                // The video already has captions in the selected language: no API call.
                CaptionActions.activateSource(context, own.url);
                return LoopbackCaptionServer.get(context).urlFor(own.url);
            }
            String rewritten = LoopbackCaptionServer.get(context).urlFor(selected);
            CaptionActions.activate(context, selected);
            return rewritten;
        } catch (Throwable failure) {
            CaptionDiagnostics.mark(context, "HOOK_ERROR", CaptionDiagnostics.errorDetail(failure));
            try {
                CaptionButtonController.noteAiTrackSelected();
                CaptionActions.activate(context, selected);
            } catch (Throwable ignored) {
                // The request is closed below either way.
            }
            return CLOSED_TRANSLATION_SINK;
        }
    }

    /**
     * The user asked for AI captions in a target language, and that target is still the one the
     * session stands for. No UI observation is consulted: an observed CC state can never become the
     * reason a translation runs.
     */
    private static boolean selectionEvidence(CaptionSessionIntent intent) {
        return intent.aiEnabled && intent.hasTarget();
    }

    /** A translated request for another language belongs to no session of this app. */
    private static boolean ownsRequest(CaptionSessionIntent intent, TargetLanguage target) {
        TargetLanguage wanted = TargetLanguage.fromCode(intent.targetLanguage);
        return intent.translateTarget
                && wanted != null
                && target != null
                && wanted.code.equalsIgnoreCase(target.code);
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
