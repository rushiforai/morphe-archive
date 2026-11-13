package io.github.bryceaspringfield.morphe.extension.youtube;

import android.os.Handler;
import android.os.Looper;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.shared.PlayerType;

/**
 * Catch up to live: while a live stream plays behind its live edge by START_MS or more, and by no more than MAX_BEHIND_S
 * seconds (a viewer further behind rewound on purpose), it plays at the chosen speed, and back at the speed it had once
 * it is within STOP_MS of the edge, where it cannot play faster. A stream which falls behind again (a stall, a pause)
 * starts catching up again at once. The player states no live edge (its length is the
 * seekable span, 12 hours on a long stream, and its time counts from the stream's start), so the edge is the furthest
 * point ahead of the clock playback has reached: a stream opens at its edge, and the edge then moves at the clock's pace.
 * A pause, a stall, or a rewind leaves playback behind it. A speed the user
 * picks while catching up ends the catch-up for that video. Checked twice a second while a video plays.
 */
final class LiveCatchUp {

    private static final long TICK_MS = 500;
    /** A live stream starts catching up this far behind its live edge (1 s: the player's time moves in steps of that size)... */
    private static final long START_MS = 1000;
    /** ...and stops this close to it. */
    private static final long STOP_MS = 500;
    /** A stream further behind than this is left alone: the viewer rewound on purpose. */
    private static final long MAX_BEHIND_S = 15;
    /** A video not seen live within this long after it opens stops the checks. */
    private static final long GIVE_UP_MS = 60_000;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static String videoId = "";
    private static long openedAt;
    private static boolean catching;
    private static boolean userTookOver;
    private static float before = 1f;
    private static float applied;
    private static boolean ticking;
    /** The live edge as the video time minus the clock, in ms; the largest seen for this video. */
    private static long edgeOffset = Long.MIN_VALUE;

    private LiveCatchUp() {
    }

    /** Called with each new video ID (on the main thread or not). */
    static void onVideo(String id) {
        MAIN.post(() -> {
            if (id == null || id.equals(videoId)) return;
            if (catching) restore("new video");
            videoId = id;
            openedAt = System.currentTimeMillis();
            userTookOver = false;
            edgeOffset = Long.MIN_VALUE;
            if (!ticking) {
                ticking = true;
                MAIN.postDelayed(LiveCatchUp::tick, TICK_MS);
            }
        });
    }

    private static float speed() {
        try {
            float s = Float.parseFloat(XSettings.LIVE_CATCH_UP_SPEED.get().trim());
            return s > 1f && s <= 4f ? s : 2f;
        } catch (Exception e) {
            return 2f;
        }
    }

    private static void tick() {
        try {
            boolean on = XSettings.LIVE_CATCH_UP.get();
            boolean live = VideoInformation.isLiveStream();
            if (!on || (!live && System.currentTimeMillis() - openedAt > GIVE_UP_MS)
                    || !videoId.equals(VideoInformation.getVideoId()) && !videoId.isEmpty()
                    && System.currentTimeMillis() - openedAt > GIVE_UP_MS) {
                if (catching) restore(on ? "not live" : "option off");
                ticking = false;
                return;
            }
            PlayerType type = PlayerType.getCurrent();
            long time = VideoInformation.getVideoTime();
            if (live && time > 0) {
                long offset = time - android.os.SystemClock.elapsedRealtime();
                if (offset > edgeOffset) edgeOffset = offset;
            }
            if (live && !userTookOver && time > 0 && !type.isNoneOrHidden()) {
                long behindMs = edgeOffset - (time - android.os.SystemClock.elapsedRealtime());
                double behind = behindMs / 1000.0;
                float now = VideoInformation.getPlaybackSpeed();
                if (catching && Math.abs(now - applied) > 0.01f) {
                    // The user chose a speed: theirs stays, and this video is left alone.
                    catching = false;
                    userTookOver = true;
                    Logger.printDebug(() -> "YouTube Extras: live catch-up ended by the user's speed " + now);
                } else if (!catching && behindMs >= START_MS && behindMs <= MAX_BEHIND_S * 1000 && Math.abs(now - 1f) < 0.02f) {
                    before = now;
                    applied = speed();
                    if (set(applied)) {
                        catching = true;
                        Logger.printDebug(() -> "YouTube Extras: live catch-up at " + applied + "x, " + behind + " s behind");
                    }
                } else if (catching && (behindMs < STOP_MS || behindMs > MAX_BEHIND_S * 1000)) {
                    restore(behindMs < STOP_MS ? "caught up, " + behind + " s behind" : "rewound, " + behind + " s behind");
                } else if (XSettings.DEBUG.get() && System.currentTimeMillis() / 1000 % 10 == 0) {
                    Logger.printDebug(() -> "YouTube Extras: live " + behind + " s behind at " + now + "x");
                }
            }
        } catch (Throwable t) {
            Logger.printDebug(() -> "YouTube Extras: live catch-up failure: " + t);
        }
        MAIN.postDelayed(LiveCatchUp::tick, TICK_MS);
    }

    private static boolean set(float s) {
        try {
            VideoInformation.changePlaybackSpeed(s);
            if (Math.abs(VideoInformation.getPlaybackSpeed() - s) > 0.01f) {
                VideoInformation.setPlaybackParameters(s, VideoInformation.getPlaybackAudioPitch());
            }
            return true;
        } catch (Throwable t) {
            Logger.printDebug(() -> "YouTube Extras: live catch-up speed not set: " + t);
            return false;
        }
    }

    private static void restore(String why) {
        catching = false;
        set(before);
        Logger.printDebug(() -> "YouTube Extras: live catch-up back to " + before + "x (" + why + ")");
    }
}
