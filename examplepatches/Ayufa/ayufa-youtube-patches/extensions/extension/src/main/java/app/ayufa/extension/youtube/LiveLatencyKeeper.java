/*
 * Copyright 2026 Ayufa.
 * Part of Ayufa Patches (GPL-3.0).
 *
 * The hooking design follows the approach proven by Morphe's
 * "Remember live stream playback position" patch
 * (MorpheApp/morphe-patches, GPL-3.0): a once-per-second playback
 * time callback and reading playback state through VideoInformation.
 */

package app.ayufa.extension.youtube;

import android.content.Context;
import android.content.SharedPreferences;
import android.media.AudioManager;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.KeyEvent;

import java.lang.reflect.Method;

/**
 * Keeps live stream playback at the live edge (the newest position).
 *
 * <p>While a live stream plays, the playback position slowly falls behind
 * the live edge. This class is called about once per second with the
 * current playback time by the "Live latency keeper" patch. At a fixed
 * interval it re-syncs playback to the live edge, no matter how far
 * behind playback has fallen: it momentarily pauses playback and resumes
 * it right away. Resuming a live stream snaps playback to the newest
 * position, so the amount of lag never needs to be measured or turned
 * into a seek distance. The interval (in minutes) can be typed in
 * directly in Morphe settings (Ayufa patch settings), from 0 to 120
 * minutes; 0 turns the automatic re-sync off. Until it is changed
 * there, the interval configured at patch time applies.
 *
 * <p>The pause/resume is sent as media key events through
 * {@link AudioManager#dispatchMediaKeyEvent(KeyEvent)} with
 * {@code KEYCODE_MEDIA_PAUSE} / {@code KEYCODE_MEDIA_PLAY} — the same
 * mechanism a Bluetooth headset uses, which needs no special permission.
 * If the media keys cannot be dispatched (no context or no audio
 * service), the fallback is a single very large relative seek, which the
 * player clamps to the live edge.
 *
 * <p>Playback state (live flag, video id) is read from the official
 * Morphe extension class
 * {@code app.morphe.extension.youtube.patches.VideoInformation} through
 * reflection, so this class has no compile-time dependency on the
 * official patches. If the official Morphe patches are not applied,
 * every call is a no-op.
 *
 * <p>The feature can be turned off in Morphe settings (Ayufa patch
 * settings). The setting is stored by the Morphe settings UI in the
 * "morphe_prefs" shared preferences and read here on every call, so
 * toggling takes effect immediately. If the setting was never touched,
 * the feature defaults to on.
 */
@SuppressWarnings("unused")
public final class LiveLatencyKeeper {

    private static final String TAG = "AyufaLiveKeeper";

    private static final String MORPHE_PREFS_NAME = "morphe_prefs";
    private static final String KEY_KEEP_LIVE_AT_EDGE = "ayufa_keep_live_at_edge";
    private static final String KEY_SYNC_INTERVAL_MINUTES = "ayufa_live_sync_interval_minutes";

    // Shared preferences holding the Morphe settings, resolved lazily.
    private static SharedPreferences morphePrefs;

    // region Configuration.
    //
    // The value in the static initializer is the default. At patch time
    // the patch replaces the static initial value of this field with the
    // value of the patch option (default sync interval). Do not make
    // this field final.

    private static int checkIntervalMinutes;

    static {
        checkIntervalMinutes = 10;
    }

    // endregion

    /**
     * How long playback stays paused during a re-sync. Long enough for
     * the player to register the pause, short enough to be barely
     * noticeable.
     */
    private static final long PAUSE_DURATION_MS = 300;

    /**
     * Small delay before re-syncing, so the pause does not run inside
     * the playback time callback itself.
     */
    private static final long RESYNC_DELAY_MS = 200;

    /**
     * How long re-syncing is suppressed after the user manually rewinds,
     * so the keeper does not fight the user.
     */
    private static final long MANUAL_REWIND_SUPPRESS_MS = 5 * 60 * 1000L;

    /**
     * A single-tick backward jump larger than this is a manual rewind.
     */
    private static final long REWIND_JUMP_MS = 3 * 1000L;

    /**
     * Fallback only: forward distance for the relative seek used when
     * the media keys cannot be dispatched. Far larger than any real lag
     * (24 hours); the player clamps it to the live edge.
     */
    private static final long FALLBACK_SEEK_FORWARD_MS = 24 * 60 * 60 * 1000L;

    // Reflection handles to Morphe's VideoInformation (official patches).
    private static boolean apiResolutionAttempted;
    private static Method videoInformationIsLiveStream;
    private static Method videoInformationGetVideoId;
    private static Method videoInformationSeekToRelative;

    // Per-video state.
    private static String currentVideoId = "";
    private static long lastPositionMs = -1;
    private static long lastPositionDeltaMs;
    private static long lastCheckAtMs;
    private static long suppressUntilMs;
    private static boolean resyncPending;

    private LiveLatencyKeeper() {
    }

    /**
     * Injection point. Called approximately once per second while a video
     * is playing (and while it is loading), with the current playback time.
     *
     * @param playbackTimeMs Current playback position in milliseconds.
     */
    public static void videoTimeChanged(long playbackTimeMs) {
        try {
            if (playbackTimeMs <= 0) {
                return;
            }
            if (!resolveVideoInformationApi()) {
                return;
            }
            if (!isEnabledInSettings()) {
                return;
            }

            String videoId = (String) videoInformationGetVideoId.invoke(null);
            if (videoId == null) {
                videoId = "";
            }
            if (!videoId.equals(currentVideoId)) {
                resetForVideo(videoId);
            }

            boolean isLive = (Boolean) videoInformationIsLiveStream.invoke(null);
            long now = System.currentTimeMillis();
            if (!isLive) {
                // Not a live stream (or it just ended): keep the position
                // reference fresh and do nothing.
                lastPositionMs = playbackTimeMs;
                lastPositionDeltaMs = 0;
                return;
            }

            if (lastPositionMs < 0) {
                // First tick of this video. Playback opens at the live
                // edge, so start the interval timer here; there is
                // nothing to re-sync yet.
                lastPositionMs = playbackTimeMs;
                lastPositionDeltaMs = 0;
                lastCheckAtMs = now;
                return;
            }

            long positionDeltaMs = playbackTimeMs - lastPositionMs;
            lastPositionMs = playbackTimeMs;
            lastPositionDeltaMs = positionDeltaMs;

            if (positionDeltaMs < -REWIND_JUMP_MS) {
                // Manual rewind: suppress re-syncing for a while so the
                // keeper does not fight the user.
                suppressUntilMs = now + MANUAL_REWIND_SUPPRESS_MS;
            }

            // Re-sync at the configured interval, regardless of how
            // much lag has accumulated. An interval of 0 minutes turns
            // the automatic re-sync off.
            int intervalMinutes = syncIntervalMinutes();
            if (intervalMinutes <= 0) {
                lastCheckAtMs = now;
                return;
            }
            if (now - lastCheckAtMs < intervalMinutes * 60_000L) {
                return;
            }
            lastCheckAtMs = now;

            if (now < suppressUntilMs || resyncPending) {
                return;
            }
            if (lastPositionDeltaMs <= 0) {
                // Paused (by the user) or stalled right now: do not
                // touch playback. In particular, never resume a pause
                // the user made on purpose.
                return;
            }

            resyncPending = true;
            new Handler(Looper.getMainLooper()).postDelayed(
                    LiveLatencyKeeper::resyncToLiveEdge, RESYNC_DELAY_MS);
        } catch (Throwable ex) {
            // Never break playback because of this feature.
            Log.e(TAG, "videoTimeChanged failure", ex);
        }
    }

    /**
     * Momentarily pauses playback and resumes it, which snaps a live
     * stream to the newest position. Runs on the main thread.
     */
    private static void resyncToLiveEdge() {
        Handler handler = new Handler(Looper.getMainLooper());
        try {
            Context context = resolveAppContext();
            if (context == null || !dispatchMediaKey(context, KeyEvent.KEYCODE_MEDIA_PAUSE)) {
                // Media keys are unavailable: fall back to a clamped
                // seek to the live edge.
                fallbackSeekToLiveEdge();
                resyncPending = false;
                return;
            }
            Log.d(TAG, "Live edge re-sync: paused, resuming in "
                    + PAUSE_DURATION_MS + " ms");
            handler.postDelayed(() -> {
                if (dispatchMediaKey(context, KeyEvent.KEYCODE_MEDIA_PLAY)) {
                    Log.d(TAG, "Live edge re-sync: resumed at the live edge");
                    resyncPending = false;
                    return;
                }
                // Play did not go out: retry once, then fall back to a
                // clamped seek, so playback is not left paused because
                // of this feature if it can be avoided.
                handler.postDelayed(() -> {
                    try {
                        if (!dispatchMediaKey(context, KeyEvent.KEYCODE_MEDIA_PLAY)) {
                            fallbackSeekToLiveEdge();
                        } else {
                            Log.d(TAG, "Live edge re-sync: resumed at the live edge (retry)");
                        }
                    } finally {
                        resyncPending = false;
                    }
                }, PAUSE_DURATION_MS);
            }, PAUSE_DURATION_MS);
        } catch (Throwable ex) {
            Log.e(TAG, "Live edge re-sync failed", ex);
            resyncPending = false;
        }
    }

    /**
     * Sends one media key (down + up) through the audio manager, the
     * same way a Bluetooth headset button press reaches the player.
     *
     * @return True if the key was dispatched.
     */
    private static boolean dispatchMediaKey(Context context, int keyCode) {
        try {
            Object service = context.getSystemService(Context.AUDIO_SERVICE);
            if (!(service instanceof AudioManager)) {
                return false;
            }
            AudioManager audioManager = (AudioManager) service;
            long now = SystemClock.uptimeMillis();
            audioManager.dispatchMediaKeyEvent(
                    new KeyEvent(now, now, KeyEvent.ACTION_DOWN, keyCode, 0));
            audioManager.dispatchMediaKeyEvent(
                    new KeyEvent(now, now, KeyEvent.ACTION_UP, keyCode, 0));
            return true;
        } catch (Throwable ex) {
            Log.e(TAG, "dispatchMediaKey failed for keyCode " + keyCode, ex);
            return false;
        }
    }

    /**
     * Fallback when the media keys cannot be used: one relative seek far
     * past the live edge, which the player clamps to the edge.
     */
    private static void fallbackSeekToLiveEdge() {
        try {
            if (videoInformationSeekToRelative != null) {
                videoInformationSeekToRelative.invoke(null, FALLBACK_SEEK_FORWARD_MS);
                Log.d(TAG, "Live edge re-sync: fallback seek forward by "
                        + FALLBACK_SEEK_FORWARD_MS + " ms");
            }
        } catch (Throwable ex) {
            Log.e(TAG, "Fallback seek failed", ex);
        }
    }

    /**
     * The Morphe settings shared preferences, or null when they cannot
     * be reached yet (retried on the next call).
     */
    private static SharedPreferences settings() {
        try {
            if (morphePrefs == null) {
                Context context = resolveAppContext();
                if (context == null) {
                    return null;
                }
                morphePrefs = context.getSharedPreferences(
                        MORPHE_PREFS_NAME, Context.MODE_PRIVATE);
            }
            return morphePrefs;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /**
     * Reads the on/off switch from the Morphe settings. Defaults to on
     * when the setting was never touched or cannot be read.
     */
    private static boolean isEnabledInSettings() {
        SharedPreferences prefs = settings();
        if (prefs == null) {
            // Too early to tell; stay enabled and retry next call.
            return true;
        }
        try {
            return prefs.getBoolean(KEY_KEEP_LIVE_AT_EDGE, true);
        } catch (Throwable ignored) {
            return true;
        }
    }

    /**
     * The re-sync interval in minutes: the value typed in Morphe
     * settings when one is set, otherwise the interval configured at
     * patch time. Typed-in values are clamped to 0..120 minutes
     * (0 turns the automatic re-sync off); unparseable values fall
     * back to the patch-time default.
     */
    private static int syncIntervalMinutes() {
        SharedPreferences prefs = settings();
        if (prefs != null) {
            try {
                String value = prefs.getString(KEY_SYNC_INTERVAL_MINUTES, null);
                if (value != null) {
                    int parsed = Integer.parseInt(value.trim());
                    return Math.max(0, Math.min(120, parsed));
                }
            } catch (Throwable ignored) {
                // Fall through to the patch-time default.
            }
        }
        return checkIntervalMinutes;
    }

    private static Context resolveAppContext() {
        // Morphe's shared Utils holds the app context whenever the
        // official patches are applied.
        try {
            Class<?> utils = Class.forName("app.morphe.extension.shared.Utils");
            Object context = utils.getMethod("getContext").invoke(null);
            if (context instanceof Context) {
                return (Context) context;
            }
        } catch (Throwable ignored) {
            // Fall through to the framework way.
        }
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Object application = activityThread.getMethod("currentApplication").invoke(null);
            if (application instanceof Context) {
                return (Context) application;
            }
        } catch (Throwable ignored) {
            // No context available yet.
        }
        return null;
    }

    private static void resetForVideo(String videoId) {
        currentVideoId = videoId;
        lastPositionMs = -1;
        lastPositionDeltaMs = 0;
        lastCheckAtMs = 0;
        suppressUntilMs = 0;
        resyncPending = false;
    }

    /**
     * Resolves the static methods of Morphe's VideoInformation class once.
     *
     * @return True if the official Morphe patches are present.
     */
    private static boolean resolveVideoInformationApi() {
        if (apiResolutionAttempted) {
            return videoInformationIsLiveStream != null;
        }
        apiResolutionAttempted = true;
        try {
            Class<?> videoInformation =
                    Class.forName("app.morphe.extension.youtube.patches.VideoInformation");
            videoInformationIsLiveStream = videoInformation.getMethod("isLiveStream");
            videoInformationGetVideoId = videoInformation.getMethod("getVideoId");
            try {
                videoInformationSeekToRelative =
                        videoInformation.getMethod("seekToRelative", long.class);
            } catch (Throwable ignored) {
                // Only needed for the fallback path.
                videoInformationSeekToRelative = null;
            }
            return true;
        } catch (Throwable ex) {
            // Official Morphe patches are not applied (or changed).
            // Silently disable: this patch is an add-on to them.
            videoInformationIsLiveStream = null;
            videoInformationGetVideoId = null;
            videoInformationSeekToRelative = null;
            Log.d(TAG, "Morphe VideoInformation not available; latency keeper disabled");
            return false;
        }
    }
}
