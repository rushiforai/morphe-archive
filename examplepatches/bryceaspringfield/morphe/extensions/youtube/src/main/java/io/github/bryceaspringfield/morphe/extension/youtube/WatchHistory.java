package io.github.bryceaspringfield.morphe.extension.youtube;

import android.content.Context;
import android.content.SharedPreferences;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.youtube.patches.VideoInformation;

/**
 * The share of each video the user played in this app (its furthest position over its length), saved when the next
 * video opens, so "fully watched" can be told from a partial watch: a feed's red progress bar states no share.
 */
final class WatchHistory {

    private static final String FILE = "youtube_extras_watch_history";
    private static final String TITLES = "youtube_extras_watch_titles";
    private static final int MAX = 3000;

    private static String current = "";
    private static float furthest;
    private static String title;

    private WatchHistory() {
    }

    private static SharedPreferences prefs() {
        return Utils.getContext().getSharedPreferences(FILE, Context.MODE_PRIVATE);
    }

    /** Called with each new video ID; saves the previous video's share. */
    static synchronized void onVideo(String videoId) {
        saveCurrent();
        current = videoId;
        furthest = 0;
        title = null;
    }

    /** Called often enough while playing (each feed or video event) to follow the position. */
    static synchronized void sample() {
        try {
            long len = VideoInformation.getVideoLength(), t = VideoInformation.getVideoTime();
            if (len > 0 && current.equals(VideoInformation.getVideoId())) {
                furthest = Math.max(furthest, (float) t / len);
                String name = VideoInformation.getVideoTitle();
                if (name != null && !name.trim().isEmpty()) title = name.trim().toLowerCase();
            }
        } catch (Throwable ignored) {
        }
    }

    private static void saveCurrent() {
        sample();
        if (current.isEmpty() || furthest <= 0) return;
        SharedPreferences p = prefs();
        if (p.getAll().size() > MAX) p.edit().clear().apply();
        if (furthest > p.getFloat(current, 0)) p.edit().putFloat(current, furthest).apply();
        if (title != null) {
            SharedPreferences t = Utils.getContext().getSharedPreferences(TITLES, Context.MODE_PRIVATE);
            if (t.getAll().size() > MAX) t.edit().clear().apply();
            if (furthest > t.getFloat(title, 0)) t.edit().putFloat(title, furthest).apply();
        }
    }

    /** Percent of the video with this title played in this app, or -1. */
    static int percentByTitle(String name) {
        try {
            float f = Utils.getContext().getSharedPreferences(TITLES, Context.MODE_PRIVATE)
                    .getFloat(name.trim().toLowerCase(), -1);
            return f < 0 ? -1 : Math.round(f * 100);
        } catch (Throwable t) {
            return -1;
        }
    }

    static float fraction(String videoId) {
        try {
            if (videoId.equals(current)) sample();
            float saved = prefs().getFloat(videoId, 0);
            return videoId.equals(current) ? Math.max(saved, furthest) : saved;
        } catch (Throwable t) {
            return 0;
        }
    }
}
