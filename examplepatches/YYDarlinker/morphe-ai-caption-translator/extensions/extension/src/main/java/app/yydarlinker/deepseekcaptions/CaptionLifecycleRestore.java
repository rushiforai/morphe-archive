package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.app.Application;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;

import java.lang.ref.WeakReference;

/**
 * Preserves the user's active AI caption target across lifecycle and player-layout transitions.
 *
 * <p>YouTube may re-request its source-language Timed Text track while an AI session is visible.
 * Since native source-track choices are now decided explicitly and atomically by
 * {@link CaptionButtonController} before this class is consulted, an ordinary same-video source
 * request that reaches here is renderer/lifecycle noise, not a user command. Keep it on the current
 * AI target for the whole visible session so YouTube never paints a second native source track under
 * the AI overlay.</p>
 */
final class CaptionLifecycleRestore {
    private static final long RESUME_RESTORE_WINDOW_MS = 8_000L;
    private static final long PLAYER_TRANSITION_RESTORE_MS = 6_500L;

    private static volatile WeakReference<Activity> mainActivityRef = new WeakReference<>(null);
    private static volatile boolean callbacksRegistered;
    private static volatile boolean pausedWithVisibleAi;
    private static volatile long resumeRestoreUntilMs;
    private static volatile long lastPlayerGuardLogMs;
    private static volatile String retainedTargetCode = "";
    private static volatile String retainedVideoId = "";

    private CaptionLifecycleRestore() {}

    static void install(Activity activity) {
        if (activity == null) return;
        mainActivityRef = new WeakReference<>(activity);
        if (callbacksRegistered) return;
        synchronized (CaptionLifecycleRestore.class) {
            if (callbacksRegistered) return;
            Application application = activity.getApplication();
            if (application == null) return;
            application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override public void onActivityCreated(Activity activity, Bundle state) {}
                @Override public void onActivityStarted(Activity activity) {}

                @Override
                public void onActivityResumed(Activity activity) {
                    if (!isMainActivity(activity)) return;
                    if (pausedWithVisibleAi && DynamicCaptionController.isVisibleActive() &&
                            !retainedTargetCode.isEmpty()) {
                        resumeRestoreUntilMs = Math.max(
                                resumeRestoreUntilMs,
                                SystemClock.elapsedRealtime() + RESUME_RESTORE_WINDOW_MS
                        );
                        CaptionDiagnostics.mark(
                                activity,
                                "LIFECYCLE_CAPTION_RESTORE_ARMED",
                                "播放器恢复，短时保护当前 AI 字幕轨"
                        );
                    }
                    pausedWithVisibleAi = false;
                }

                @Override
                public void onActivityPaused(Activity activity) {
                    if (!isMainActivity(activity)) return;
                    if (DynamicCaptionController.isVisibleActive() && !retainedTargetCode.isEmpty()) {
                        pausedWithVisibleAi = true;
                    }
                }

                @Override public void onActivityStopped(Activity activity) {}
                @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}

                @Override
                public void onActivityDestroyed(Activity activity) {
                    Activity current = mainActivityRef.get();
                    if (current == activity) mainActivityRef = new WeakReference<>(null);
                }
            });
            callbacksRegistered = true;
        }
    }

    /** Arms a diagnostic guard marker for fullscreen/miniplayer player transitions. */
    static void onPlayerTransition(String rawType) {
        if (!DynamicCaptionController.isVisibleActive() || retainedTargetCode.isEmpty()) return;
        long now = SystemClock.elapsedRealtime();
        resumeRestoreUntilMs = Math.max(
                resumeRestoreUntilMs,
                now + PLAYER_TRANSITION_RESTORE_MS
        );
        Activity activity = mainActivityRef.get();
        if (activity != null && now - lastPlayerGuardLogMs > 1_000L) {
            lastPlayerGuardLogMs = now;
            CaptionDiagnostics.mark(
                    activity,
                    "PLAYER_TRANSITION_CAPTION_GUARD",
                    "播放器形态切换，锁定当前 AI 字幕轨，忽略瞬时原生字幕回写"
            );
        }
    }

    /** Records the concrete target only after the Hook has decided this is an AI-owned request. */
    static void noteAiTarget(String url) {
        TargetLanguage target = TargetLanguage.fromUrl(url);
        if (target == null) return;
        retainedTargetCode = target.code;
        String video = videoId(url);
        if (!video.isEmpty()) retainedVideoId = video;
    }

    /**
     * Keeps every ordinary source-language request for the active video on the AI sink while the AI
     * overlay is visible. Explicit native-track selection has already returned from
     * DeepSeekCaptionHook before this method runs; an Auto-translate choice already has tlang and is
     * also left untouched. This removes the old time-window heuristic that allowed a later internal
     * source refresh to repaint native captions underneath the AI overlay.
     */
    static String restoreAfterLifecycle(String url) {
        if(!CaptionChoice.translates()) return url;
        if (!DynamicCaptionController.isVisibleActive() ||
                retainedTargetCode.isEmpty() ||
                !DeepSeekCaptionHook.isYouTubeTimedTextUrl(url) ||
                TargetLanguage.fromUrl(url) != null) {
            return url;
        }

        String requestedVideo = videoId(url);
        if (!requestedVideo.isEmpty() && !retainedVideoId.isEmpty() &&
                !requestedVideo.equals(retainedVideoId)) {
            return url;
        }
        return TargetLanguage.withCode(url, retainedTargetCode);
    }

    private static boolean isMainActivity(Activity activity) {
        if (activity == null) return false;
        Activity current = mainActivityRef.get();
        if (current == activity) return true;
        return current == null && activity.getClass().getName().endsWith("MainActivity");
    }

    private static String videoId(String url) {
        try {
            Uri uri = Uri.parse(url);
            String value = uri.getQueryParameter("v");
            if (value == null || value.isEmpty()) value = uri.getQueryParameter("video_id");
            return value == null ? "" : value;
        } catch (Throwable ignored) {
            return "";
        }
    }
}
