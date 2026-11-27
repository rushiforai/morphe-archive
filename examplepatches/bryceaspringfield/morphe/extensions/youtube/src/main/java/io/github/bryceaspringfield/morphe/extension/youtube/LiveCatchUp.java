package io.github.bryceaspringfield.morphe.extension.youtube;

import android.os.Handler;
import android.os.Looper;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.shared.PlayerType;

final class LiveCatchUp {

    private static final long TICK_MS = 500;
    private static final long MAX_BEHIND_S = 15;
    private static final long GIVE_UP_MS = 60_000;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static String videoId = "";
    private static long openedAt;
    private static boolean catching;
    private static boolean userTookOver;
    private static float before = 1f;
    private static float applied;
    private static boolean ticking;
    private static long edgeOffset = Long.MIN_VALUE;

    private LiveCatchUp() {
    }

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

    static long delayMs() {
        try {
            String raw = XSettings.LIVE_CATCH_UP_DELAY.get().trim();
            if (raw.isEmpty()) return 5000;
            double s = Double.parseDouble(raw.replace(',', '.'));
            return Math.round(Math.max(0, Math.min(MAX_BEHIND_S, s)) * 1000);
        } catch (Exception e) {
            return 5000;
        }
    }

    static boolean starts(long behindMs, long delayMs) {
        return behindMs >= delayMs && behindMs <= MAX_BEHIND_S * 1000;
    }

    static boolean reachedEdge(long behindMs, long delayMs) {
        return delayMs > 0 && behindMs < 400;
    }

    static void optionChanged() {
        MAIN.post(() -> {
            if (!XSettings.LIVE_CATCH_UP.get() && catching) restore("option off");
            if (XSettings.LIVE_CATCH_UP.get() && !ticking) {
                ticking = true;
                openedAt = System.currentTimeMillis();
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
            if (!on) {
                if (catching) restore("option off");
                MAIN.postDelayed(LiveCatchUp::tick, 2000);
                return;
            }
            if ((!live && System.currentTimeMillis() - openedAt > GIVE_UP_MS)
                    || !videoId.equals(VideoInformation.getVideoId()) && !videoId.isEmpty()
                    && System.currentTimeMillis() - openedAt > GIVE_UP_MS) {
                if (catching) restore("not live");
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
                    catching = false;
                    if (Math.abs(now - 1f) >= 0.02f) {
                        userTookOver = true;
                        Logger.printDebug(() -> "YouTube Extras: live catch-up ended by the user's speed " + now);
                    } else {
                        Logger.printDebug(() -> "YouTube Extras: live catch-up speed reset to 1x by the player, applied again");
                    }
                } else if (catching && reachedEdge(behindMs, delayMs())) {
                    restore("caught up, " + behind + " s behind");
                } else if (!catching && starts(behindMs, delayMs()) && Math.abs(now - 1f) < 0.02f) {
                    before = now;
                    applied = speed();
                    if (set(applied)) {
                        catching = true;
                        Logger.printDebug(() -> "YouTube Extras: live catch-up at " + applied + "x, " + behind + " s behind");
                    }
                } else if (catching && behindMs > MAX_BEHIND_S * 1000) {
                    restore("rewound, " + behind + " s behind");
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
