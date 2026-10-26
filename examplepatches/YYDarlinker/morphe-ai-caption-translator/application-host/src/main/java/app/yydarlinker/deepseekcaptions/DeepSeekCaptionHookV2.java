package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.widget.ImageView;

/**
 * The callbacks the patch inserts into YouTube. They add the native-renderer masking and the
 * cross-video default handoff around {@link DeepSeekCaptionHook}.
 */
public final class DeepSeekCaptionHookV2 {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Object PLAYER_LOCK = new Object();

    /** The newest player type reported off the main thread, until the main thread takes it. */
    private static Enum<?> queuedPlayerType;

    private static boolean playerNotificationPosted;
    private static long queuedOwnerEpoch;

    private DeepSeekCaptionHookV2() {}

    public static void setMainActivity(Activity activity) {
        CaptionMusicSuppressor.setActivity(activity);
        DeepSeekCaptionHook.setMainActivity(activity);
        CaptionMusicSuppressor.kick();
    }

    public static void onVideoId(String videoId) {
        DeepSeekCaptionHook.onVideoId(videoId);
        CaptionMusicSuppressor.forceNativeRendererScan();
    }

    public static void onPlayerType(Enum<?> playerType) {
        if (deferToMainThread(playerType)) return;
        if (playerType != null) DeepSeekCaptionHook.onPlayerType(playerType.name());
        // YouTube can rebuild subtitle windows during fullscreen and miniplayer transitions while
        // the previous renderer view stays attached: force one player-local recheck. The
        // transition guard still owns the animation; this adds no timer of its own.
        CaptionMusicSuppressor.requestNativeRendererScanAfterTransition();
        CaptionMusicSuppressor.kick();
    }

    /**
     * Off-main player notifications are coalesced to the newest type and merged on the main thread.
     * They are guarded by the player <em>owner</em> epoch, not a caption render identity: a caption
     * clear, an AI toggle or a style change must not discard a valid player callback, while a real
     * Activity or video change still rejects a stale one.
     */
    private static boolean deferToMainThread(Enum<?> type) {
        if (Looper.myLooper() == Looper.getMainLooper()) return false;
        synchronized (PLAYER_LOCK) {
            queuedPlayerType = type;
            queuedOwnerEpoch = CaptionPlayerAuthority.ownerEpoch();
            if (!playerNotificationPosted) {
                playerNotificationPosted = true;
                MAIN.post(DeepSeekCaptionHookV2::deliverQueuedPlayerType);
            }
        }
        return true;
    }

    private static void deliverQueuedPlayerType() {
        Enum<?> type;
        long epoch;
        synchronized (PLAYER_LOCK) {
            type = queuedPlayerType;
            epoch = queuedOwnerEpoch;
            queuedPlayerType = null;
            playerNotificationPosted = false;
        }
        if (epoch == CaptionPlayerAuthority.ownerEpoch()) onPlayerType(type);
    }

    /**
     * The player's caption button controller. Binding waits until the controller method has
     * returned, so YouTube has the last word on its own listener and state setup and the observer
     * reads only the final, settled view.
     */
    public static void onNativeCaptionButtonController(ImageView button) {
        if (button != null)
            button.post(() -> CaptionButtonController.onNativeCaptionButtonController(button));
    }

    public static void onVideoTime(long timeMs) {
        DeepSeekCaptionHook.onVideoTime(Math.max(0L, timeMs));
        CaptionMusicSuppressor.kick();
    }

    public static String rewriteUrl(Object cronetEngine, String originalUrl) {
        // The target authority is the per-request policy inside the hook, not a one-shot handoff.
        // Every translated request follows the explicit target of this launch, and a new video
        // cannot fall back to YouTube's persisted default.
        String rewritten = DeepSeekCaptionHook.rewriteUrl(cronetEngine, originalUrl);
        // The hook preserves the native URL and reconciles the committed selection. Recheck the
        // renderer mask immediately; native caption data remains available when AI is off.
        CaptionMusicSuppressor.forceNativeRendererScan();
        CaptionMusicSuppressor.kick();
        return rewritten;
    }

}
