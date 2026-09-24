package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.net.Uri;

import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;

/** Single bytecode hook called immediately before YouTube creates the Timed Text Cronet request. */
public final class DeepSeekCaptionHook {
    private static final String CLOSED_TRANSLATION_SINK =
            "http://127.0.0.1:9/deepseek-caption-unavailable";

    private static volatile Context appContext;
    private static volatile Object youtubeCronetEngine;

    private DeepSeekCaptionHook() {}

    public static void setMainActivity(Activity activity) {
        try {
            if (activity != null) appContext = activity.getApplicationContext();
            TokenCostAudit.install(appContext);
            CaptionPlayerTransitionGuard.setActivity(activity);
            DynamicCaptionController.setMainActivity(activity);
            CaptionLifecycleRestore.install(activity);
            CaptionButtonController.install(activity);
            NativeCaptionBridge.initialize(activity);
        } catch (Throwable ignored) {
        }
    }

    public static void onVideoId(String videoId) {
        try {
            TokenCostAudit.onVideoId(context(), videoId);
            DynamicCaptionController.onVideoId(videoId);
            CaptionButtonController.onVideoId(videoId);
        } catch (Throwable ignored) {
        }
    }

    public static void onPlayerType(Enum<?> playerType) {
        try {
            if (playerType != null) {
                String type = playerType.name();
                DynamicCaptionController.onPlayerType(type);
                CaptionPlayerTransitionGuard.onPlayerType(type);
            }
        } catch (Throwable ignored) {
        }
    }

    public static void onVideoTime(long timeMs) {
        try {
            DynamicCaptionController.onVideoTime(timeMs);
            TokenCostAudit.onVideoTime(context(), timeMs, DynamicCaptionController.isVisibleActive());
        } catch (Throwable ignored) {
        }
    }

    public static String rewriteUrl(Object cronetEngine, String originalUrl) {
        Context initialContext = context();
        try {
            if (cronetEngine != null) youtubeCronetEngine = cronetEngine;


        } catch (Throwable ignored) {
            // Fall through to the ordinary caption path rather than breaking YouTube captions.
        }

        if(initialContext==null || !DeepSeekConfig.enabled(initialContext))return originalUrl;

        // Prefetched/departed Shorts requests are not selections of the foreground video.
        // Never replace the visible session (or its overlay) with another video's source URL.
        String requestedVideo = PageCaptionController.videoIdFromUrl(originalUrl);
        String foregroundVideo = PageCaptionController.currentVideoIdSnapshot();
        if (isYouTubeTimedTextUrl(originalUrl) && !requestedVideo.isEmpty() &&
                !foregroundVideo.isEmpty() && !foregroundVideo.equals(requestedVideo)) return originalUrl;


        if(initialContext!=null && DeepSeekConfig.enabled(initialContext) &&
                isYouTubeTimedTextUrl(originalUrl) && TargetLanguage.fromUrl(originalUrl)!=null &&
                !CaptionModePolicy.mayTranslateSelection(CaptionChoice.known(),CaptionChoice.isOn(),CaptionChoice.translates())) {
            // YouTube can prefetch remembered tlang URLs while CC is Off, even on cold start.
            // Only an actual Auto-translate selection grants permission to use the paid API.
            return CLOSED_TRANSLATION_SINK;
        }
        if(initialContext!=null && DeepSeekConfig.load(initialContext).enabled &&
                isYouTubeTimedTextUrl(originalUrl) && CaptionChoice.known() &&
                (!CaptionChoice.isOn() || (!CaptionChoice.translates() && TargetLanguage.fromUrl(originalUrl)!=null))) {
            // A late auto-translation fetch must not revive Off or change source-only mode.
            return CLOSED_TRANSLATION_SINK;
        }
        if(initialContext!=null && DeepSeekConfig.load(initialContext).enabled &&
                DeepSeekCaptionHook.isYouTubeTimedTextUrl(originalUrl) && TargetLanguage.fromUrl(originalUrl)==null &&
                CaptionChoice.isOn() && !CaptionChoice.translates()) {
            ContextualUnitCaptionController.activateSource(initialContext,originalUrl);
            try { return LoopbackCaptionServer.get(initialContext).urlFor(originalUrl); }
            catch(Exception failure) { return CLOSED_TRANSLATION_SINK; }
        }
        String selectedUrl = DynamicCaptionController.restoreTargetAfterMiniplayer(originalUrl);
        selectedUrl = CaptionLifecycleRestore.restoreAfterLifecycle(selectedUrl);
        final boolean aiEnabled = initialContext != null &&
                DeepSeekConfig.load(initialContext).enabled;

        if (aiEnabled) {
            selectedUrl = CaptionButtonController.rewriteDefaultTarget(initialContext, selectedUrl);
        }

        TargetLanguage targetLanguage = TargetLanguage.fromUrl(selectedUrl);
        final boolean activationAllowed = targetLanguage != null &&
                (DynamicCaptionController.isVisibleActive() ||
                        CaptionButtonController.mayActivateAiTarget() ||
                        DeepSeekCaptionHook.isAutoTranslatedCaptionUrl(originalUrl));
        final boolean intercepted = aiEnabled && activationAllowed;
        final boolean unresolvedContextualOwner =
                ContextualUnitCorePolicy.shouldPassThroughUnresolvedActivation(
                        initialContext != null &&
                                DeepSeekConfig.contextualUnitCoreEnabled(initialContext),
                        intercepted,
                        PageCaptionController.videoIdFromUrl(selectedUrl),
                        PageCaptionController.currentVideoIdSnapshot()
                );
        if (unresolvedContextualOwner) {
            if (initialContext != null) {
                CaptionDiagnostics.mark(
                        initialContext,
                        "CONTEXTUAL_OWNER_UNRESOLVED_PASSTHROUGH",
                        "当前请求缺少可验证 video owner；保持 YouTube timed-text 原生直连"
                );
            }
            DynamicCaptionController.observeTimedTextUrl(selectedUrl);
            return selectedUrl;
        }


        try {
            if (cronetEngine != null) youtubeCronetEngine = cronetEngine;
            if (!intercepted) {
                DynamicCaptionController.observeTimedTextUrl(selectedUrl);
                return selectedUrl;
            }

            CaptionButtonController.noteAiTrackSelected();
            CaptionLifecycleRestore.noteAiTarget(selectedUrl);
            String rewritten = LoopbackCaptionServer.get(initialContext).urlFor(selectedUrl);
            DynamicCaptionController.activate(initialContext, selectedUrl);
            return rewritten;
        } catch (Throwable failure) {
            Context context = context();
            if (context != null) {
                CaptionDiagnostics.mark(context, "HOOK_ERROR", CaptionDiagnostics.errorDetail(failure));
                if (intercepted) {
                    try {
                        CaptionButtonController.noteAiTrackSelected();
                        CaptionLifecycleRestore.noteAiTarget(selectedUrl);
                        DynamicCaptionController.activate(context, selectedUrl);
                    } catch (Throwable ignored) {}
                }
            }
            return intercepted ? CLOSED_TRANSLATION_SINK : selectedUrl;
        }
    }

    static HttpURLConnection openWithYouTubeCronet(URL url) {
        Object engine = youtubeCronetEngine;
        if (engine == null || url == null) return null;
        try {
            Method openConnection = engine.getClass().getMethod("openConnection", URL.class);
            Object connection = openConnection.invoke(engine, url);
            return connection instanceof HttpURLConnection ? (HttpURLConnection) connection : null;
        } catch (Throwable ignored) {
            try {
                Class<?> cronetEngine = Class.forName("org.chromium.net.CronetEngine");
                Method openConnection = cronetEngine.getMethod("openConnection", URL.class);
                Object connection = openConnection.invoke(engine, url);
                return connection instanceof HttpURLConnection ? (HttpURLConnection) connection : null;
            } catch (Throwable ignoredAgain) {
                return null;
            }
        }
    }

    static boolean isAutoTranslatedCaptionUrl(String url) {
        return TargetLanguage.fromUrl(url) != null;
    }

    static boolean isYouTubeTimedTextUrl(String url) {
        if (url == null || url.length() < 12 || url.length() > 24 * 1024) return false;
        if (url.indexOf('\r') >= 0 || url.indexOf('\n') >= 0) return false;
        try {
            Uri uri = Uri.parse(url);
            String scheme = uri.getScheme();
            if (!("https".equalsIgnoreCase(scheme) || "http".equalsIgnoreCase(scheme))) return false;
            String host = uri.getHost();
            if (host == null) return false;
            String lowerHost = host.toLowerCase(Locale.ROOT);
            if (!(lowerHost.equals("youtube.com") || lowerHost.endsWith(".youtube.com"))) return false;
            String path = uri.getPath();
            if (path == null) return false;
            String lowerPath = path.toLowerCase(Locale.ROOT);
            return lowerPath.endsWith("/api/timedtext") || lowerPath.endsWith("/timedtext");
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static Context context() {
        Context cached = appContext;
        if (cached != null) return cached;
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Method currentApplication = activityThread.getDeclaredMethod("currentApplication");
            Application application = (Application) currentApplication.invoke(null);
            if (application != null) {
                cached = application.getApplicationContext();
                appContext = cached;
            }
        } catch (Throwable ignored) {
        }
        return cached;
    }
}
