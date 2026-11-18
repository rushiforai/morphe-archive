package io.github.sabopura.morphe.extension.twitch.danmaku;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Decides which comments of a VOD's chat replay flow, and when. Twitch hands its chat list the
 * comments of each second of the VOD as playback reaches that second; this keeps the ones that
 * belong to where the video is, once each. Content time is the playback position plus the VOD
 * chat offset, the second Twitch asks comments for. Pure so it can be unit tested.
 */
final class VodReplay {
    /** Twitch fetches a page of comments when playback enters it, so a second's comments may come this late. */
    static final double LATE_SECONDS = 3;
    /** The position may be read just before the second whose comments arrived. */
    static final double EARLY_SECONDS = 1;
    /** Playback is never faster than this, so content time moving further is a seek. */
    private static final double MAX_RATE = 2;
    private static final double SEEK_SLACK_SECONDS = 2;
    private static final int REMEMBERED = 4096;

    /** Comment id to its second, for the comments that flowed. */
    private final Map<String, Integer> shown = new LinkedHashMap<String, Integer>() {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Integer> eldest) {
            return size() > REMEMBERED;
        }
    };
    private String vod = "";
    private double lastNow;
    private long lastWallMs;

    /** The second Twitch asks comments for, with a fraction: Twitch never asks for one before the start. */
    static double contentSeconds(long positionMs, int offsetSeconds) {
        return Math.max(0, positionMs / 1000.0 + offsetSeconds);
    }

    /**
     * Notes that comments arrived at content time {@code now} of {@code vod}, at wall time {@code wallMs}.
     * Returns true for another VOD or a seek: comments still waiting or flying then belong elsewhere.
     * After a seek back, the comments from there on flow again, as the viewer watches that part again.
     */
    boolean moveTo(String vod, double now, long wallMs) {
        boolean jumped;
        if (!vod.equals(this.vod)) {
            this.vod = vod;
            shown.clear();
            jumped = true;
        } else if (now < lastNow - SEEK_SLACK_SECONDS) {
            forgetFrom((int) Math.floor(now));
            jumped = true;
        } else {
            jumped = now - lastNow > (wallMs - lastWallMs) / 1000.0 * MAX_RATE + SEEK_SLACK_SECONDS;
        }
        lastNow = now;
        lastWallMs = wallMs;
        return jumped;
    }

    /** Whether a comment of second {@code offsetSeconds} that arrived at {@code now} flows: it belongs there and has not flowed. */
    boolean admit(String id, int offsetSeconds, double now) {
        if (offsetSeconds < now - LATE_SECONDS || offsetSeconds > now + EARLY_SECONDS) return false;
        return id == null || shown.put(id, offsetSeconds) == null;
    }

    /**
     * Milliseconds until the comment ranked {@code index} of the {@code count} that arrived for its second
     * starts: a second's comments are spread over a second of playback instead of starting together.
     */
    static long delayMillis(int offsetSeconds, int index, int count, double now, float rate) {
        double seconds = Math.max(0, offsetSeconds - now) + (double) index / count;
        return Math.round(seconds * 1000 / rate);
    }

    private void forgetFrom(int second) {
        for (Iterator<Integer> it = shown.values().iterator(); it.hasNext(); ) {
            if (it.next() >= second) it.remove();
        }
    }
}
