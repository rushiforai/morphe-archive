/*
 * Copyright 2026 Ayufa.
 * Part of Ayufa YouTube Patches (GPL-3.0).
 *
 * The hooking design follows the approach proven by Morphe's
 * "Remember live stream playback position" patch
 * (MorpheApp/morphe-patches, GPL-3.0): a once-per-second playback
 * time callback and seeking through VideoInformation.
 */

package app.ayufa.extension.youtube;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.reflect.Method;

/**
 * Keeps live stream playback close to the live edge.
 *
 * <p>While a live stream plays, the playback position slowly falls behind
 * the live edge (the end of the seek bar). This class is called about once
 * per second with the current playback time by the "Live latency keeper"
 * patch. When the lag behind the live edge exceeds the configured
 * threshold, it seeks forward by the lag (minus a safety margin).
 *
 * <p>How far behind playback is cannot be derived from the video length
 * reported by the official Morphe extension: for long-running streams
 * that length is the (constant) DVR window duration, while the playback
 * position counts up from the start of the stream, so the two values are
 * not comparable. Instead, the lag is estimated from wall-clock time:
 * while playback advances normally, the position grows in real time;
 * while it is paused or stalled, the live edge keeps moving but the
 * position does not, and the difference accumulates as lag. The estimate
 * starts at zero when a video is opened (playback opens at the edge).
 *
 * <p>Playback state (live flag, video id, seeking) is read from the
 * official Morphe extension class
 * {@code app.morphe.extension.youtube.patches.VideoInformation} through
 * reflection, so this class has no compile-time dependency on the official
 * patches. If the official Morphe patches are not applied, every call is a
 * no-op.
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

    // Shared preferences holding the Morphe settings, resolved lazily.
    private static SharedPreferences morphePrefs;

    // region Configuration.
    //
    // The values in the static initializer are the defaults. At patch time
    // the patch replaces the static initial values of these three fields
    // with the values of the patch options (check interval / threshold /
    // safety margin). Do not make these fields final.

    private static int checkIntervalSeconds;
    private static int thresholdSeconds;
    private static int safetySeconds;

    static {
        checkIntervalSeconds = 45;
        thresholdSeconds = 15;
        safetySeconds = 2;
    }

    // endregion

    /**
     * How long catch-up is suppressed after the user manually rewinds.
     */
    private static final long MANUAL_REWIND_SUPPRESS_MS = 5 * 60 * 1000L;

    /**
     * Position/wall-clock differences smaller than this are treated as
     * tick jitter, not as lag accumulating or draining.
     */
    private static final long JITTER_TOLERANCE_MS = 250;

    /**
     * A single-tick forward jump larger than this is a discontinuity
     * (user seek forward, ad transition, ...), not fast playback.
     */
    private static final long FORWARD_JUMP_MS = 10 * 1000L;

    /**
     * A single-tick position change (in either direction, relative to
     * wall-clock time) larger than this cannot come from playback or an
     * ordinary seek: it is a timeline discontinuity such as an ad break
     * starting or ending. The tick is then ignored for lag accounting,
     * so ad positions never corrupt the estimate. (A manual seek larger
     * than this is ignored too, which is safe: the lag estimate simply
     * keeps its pre-seek value and re-accumulates from the new position,
     * so the keeper still does not fight the user.)
     */
    private static final long DISCONTINUITY_MS = 60 * 1000L;

    /**
     * A single-tick backward jump larger than this is a manual rewind.
     */
    private static final long REWIND_JUMP_MS = 3 * 1000L;

    /**
     * Small delay before seeking, so the seek does not run inside the
     * playback time callback itself (seeking synchronously from that
     * callback can recurse into it).
     */
    private static final long SEEK_DELAY_MS = 200;

    // Reflection handles to Morphe's VideoInformation (official patches).
    private static boolean apiResolutionAttempted;
    private static Method videoInformationIsLiveStream;
    private static Method videoInformationGetVideoId;
    private static Method videoInformationSeekToRelative;

    // Per-video state.
    private static String currentVideoId = "";
    private static long lastPositionMs = -1;
    private static long lastWallMs;
    private static long lastPositionDeltaMs;
    private static long behindMs;
    private static long lastCheckAtMs;
    private static long suppressUntilMs;
    private static boolean seekPending;

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
                lastWallMs = now;
                lastPositionDeltaMs = 0;
                return;
            }

            if (lastPositionMs < 0) {
                // First tick of this video. Playback opens at the live
                // edge, so the lag estimate starts at zero here.
                lastPositionMs = playbackTimeMs;
                lastWallMs = now;
                lastPositionDeltaMs = 0;
                return;
            }

            long wallDeltaMs = now - lastWallMs;
            if (wallDeltaMs < 0) {
                wallDeltaMs = 0;
            }
            long positionDeltaMs = playbackTimeMs - lastPositionMs;
            lastPositionMs = playbackTimeMs;
            lastWallMs = now;
            lastPositionDeltaMs = positionDeltaMs;

            if (Math.abs(positionDeltaMs - wallDeltaMs) > DISCONTINUITY_MS) {
                // Timeline discontinuity (ad break, very large seek):
                // ignore this tick for lag accounting.
            } else if (positionDeltaMs < -REWIND_JUMP_MS) {
                // Manual rewind: the lag grows by the rewind amount, and
                // catch-up is suppressed for a while so the keeper does
                // not fight the user.
                behindMs += wallDeltaMs - positionDeltaMs;
                suppressUntilMs = now + MANUAL_REWIND_SUPPRESS_MS;
            } else if (positionDeltaMs - wallDeltaMs > FORWARD_JUMP_MS) {
                // Forward discontinuity (e.g. the user tapped the live
                // badge): the lag shrinks by the jumped amount.
                behindMs = Math.max(0, behindMs - (positionDeltaMs - wallDeltaMs));
            } else {
                long deficitMs = wallDeltaMs - positionDeltaMs;
                if (deficitMs > JITTER_TOLERANCE_MS) {
                    // Paused, stalled or buffering: the edge moved on
                    // without the position following.
                    behindMs += deficitMs;
                } else if (deficitMs < -JITTER_TOLERANCE_MS) {
                    // Playing faster than real time: the lag drains.
                    behindMs = Math.max(0, behindMs + deficitMs);
                }
            }

            // Throttle the actual check to the configured interval.
            if (now - lastCheckAtMs < checkIntervalSeconds * 1000L) {
                return;
            }
            lastCheckAtMs = now;

            if (now < suppressUntilMs || seekPending) {
                return;
            }
            if (lastPositionDeltaMs <= 0) {
                // Paused or stalled right now: do not yank the player.
                return;
            }
            if (behindMs <= thresholdSeconds * 1000L) {
                return;
            }

            final long seekForwardMs = behindMs - safetySeconds * 1000L;
            if (seekForwardMs <= 0) {
                return;
            }
            final long behindBeforeSeekMs = behindMs;
            seekPending = true;
            new Handler(Looper.getMainLooper()).postDelayed(() -> {
                try {
                    videoInformationSeekToRelative.invoke(null, seekForwardMs);
                    Log.d(TAG, "Catch-up seek forward by " + seekForwardMs
                            + " ms (was behind " + behindBeforeSeekMs + " ms)");
                    // Assume the seek landed as requested: only the
                    // safety margin of lag remains.
                    behindMs = safetySeconds * 1000L;
                } catch (Throwable ex) {
                    Log.e(TAG, "Catch-up seek failed", ex);
                } finally {
                    seekPending = false;
                }
            }, SEEK_DELAY_MS);
        } catch (Throwable ex) {
            // Never break playback because of this feature.
            Log.e(TAG, "videoTimeChanged failure", ex);
        }
    }

    /**
     * Reads the on/off switch from the Morphe settings. Defaults to on
     * when the setting was never touched or cannot be read.
     */
    private static boolean isEnabledInSettings() {
        try {
            if (morphePrefs == null) {
                Context context = resolveAppContext();
                if (context == null) {
                    // Too early to tell; stay enabled and retry next call.
                    return true;
                }
                morphePrefs = context.getSharedPreferences(
                        MORPHE_PREFS_NAME, Context.MODE_PRIVATE);
            }
            return morphePrefs.getBoolean(KEY_KEEP_LIVE_AT_EDGE, true);
        } catch (Throwable ignored) {
            return true;
        }
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
        lastWallMs = 0;
        lastPositionDeltaMs = 0;
        behindMs = 0;
        lastCheckAtMs = 0;
        suppressUntilMs = 0;
        seekPending = false;
    }

    /**
     * Resolves the static methods of Morphe's VideoInformation class once.
     *
     * @return True if the official Morphe patches are present.
     */
    private static boolean resolveVideoInformationApi() {
        if (apiResolutionAttempted) {
            return videoInformationSeekToRelative != null;
        }
        apiResolutionAttempted = true;
        try {
            Class<?> videoInformation =
                    Class.forName("app.morphe.extension.youtube.patches.VideoInformation");
            videoInformationIsLiveStream = videoInformation.getMethod("isLiveStream");
            videoInformationGetVideoId = videoInformation.getMethod("getVideoId");
            videoInformationSeekToRelative =
                    videoInformation.getMethod("seekToRelative", long.class);
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
