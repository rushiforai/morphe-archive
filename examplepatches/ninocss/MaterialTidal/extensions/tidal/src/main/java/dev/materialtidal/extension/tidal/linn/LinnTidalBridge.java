package dev.materialtidal.extension.tidal.linn;

import android.content.Context;

/**
 * Patch-time Dalvik bridge between pure-Java Linn controllers and obfuscated TIDAL runtime types.
 * Every {@code native*} method body is replaced with verified Smali instructions by
 * {@code LinnDsmPlaybackPatch}.
 */
@SuppressWarnings("unused")
public final class LinnTidalBridge {

    private LinnTidalBridge() {
    }

    public static Context nativeGetAppContext() {
        return null;
    }

    /**
     * Returns {@code [accessToken, clientIdOrToken]} synchronously via TIDAL's
     * {@code CredentialsProvider}. Must be called on a background thread.
     */
    public static String[] nativeGetAuthTokens() {
        return null;
    }

    public static String nativeGetCountryCode() {
        return null;
    }

    public static Object nativeGetAudioPlayerLock() {
        return null;
    }

    public static void nativePerformSwitchToLinnPlayback(Object playbackAdapter) {
    }

    public static void nativePerformSwitchToLocalPlayback() {
    }

    public static void switchToLinnPlayback(Object playbackAdapter) {
        Object lock = nativeGetAudioPlayerLock();
        if (lock != null) {
            synchronized (lock) {
                nativePerformSwitchToLinnPlayback(playbackAdapter);
            }
        } else {
            nativePerformSwitchToLinnPlayback(playbackAdapter);
        }
    }

    public static void switchToLocalPlayback() {
        Object lock = nativeGetAudioPlayerLock();
        if (lock != null) {
            synchronized (lock) {
                nativePerformSwitchToLocalPlayback();
            }
        } else {
            nativePerformSwitchToLocalPlayback();
        }
    }

    public static Object nativeCreateLocalPlayQueue() {
        return null;
    }

    public static String nativeGetPlaybackStateName(Object playback) {
        return "IDLE";
    }

    public static Object nativeGetPlaybackQueue(Object playback) {
        return null;
    }

    public static void nativeNotifyPlaybackState(String stateName) {
    }

    public static Object nativeMapStateNameToEnum(String stateName) {
        return null;
    }

    public static void nativeNotifyItemUpdated() {
    }

    public static void nativeStartProgress(int positionMs, int durationMs) {
    }

    public static void nativeUpdateProgress(int positionMs, int durationMs) {
    }

    public static void nativeResetProgress() {
    }

    public static void nativeQueueInitFrom(Object targetQueue, Object sourceQueue, int positionMs) {
    }

    public static Object nativeQueueGetCurrentItem(Object queue) {
        return null;
    }

    public static Object nativeQueuePeekNext(Object queue) {
        return null;
    }

    public static Object nativeQueueGoTo(Object queue, int position, boolean removeActives) {
        return null;
    }

    public static Object nativeQueueMoveNext(Object queue) {
        return null;
    }

    public static Object nativeQueueMovePrevious(Object queue) {
        return null;
    }

    public static int nativeQueueGetCurrentPosition(Object queue) {
        return 0;
    }

    public static boolean nativeQueueHasNext(Object queue) {
        return false;
    }

    public static boolean nativeQueueHasPrevious(Object queue) {
        return false;
    }

    public static String nativeQueueGetRepeatModeName(Object queue) {
        return "OFF";
    }

    public static boolean nativeReadPrepareAutoPlay(Object prepareParams) {
        return true;
    }

    /**
     * Reads metadata from a {@code PlayQueueItem} ({@code Luqd;}).
     *
     * @return {@code [trackId, title, artistNames, albumTitle, coverUuid, durationMs, isTrack("1"/"0"), uid]}
     */
    public static String[] nativeReadQueueItemMetadata(Object queueItem) {
        return null;
    }

    public static Object nativeCreateSingleJust(Object list) {
        return null;
    }

    public static Object nativeCreatePublishSubject() {
        return null;
    }

    public static Object nativeCreateBehaviorSubject() {
        return null;
    }

    public static void nativeSubjectOnNextInt(Object subject, int value) {
    }

    public static void nativeInvokeDisconnectCallback(Object callback) {
    }

    public static void nativeNotifyListenerConnected(Object listener, Object provider) {
    }

    public static void nativeNotifyListenerDisconnected(Object listener, Object provider, int reason) {
    }

    public static void nativeNotifyListenerConnecting(Object listener, Object provider) {
    }

    public static void nativeNotifyListenerDevicesUpdated(Object listener) {
    }

    public static void nativeSetVolumeProviderCurrentVolume(Object volumeProvider, int volume) {
    }

    /**
     * Maps logical icon key ({@code 0}=speaker, {@code 1}=connecting anim, {@code 2}=connected anim)
     * to TIDAL's {@code R$drawable} IDs.
     */
    public static int nativeGetDrawableResId(int key) {
        return 0;
    }
}
