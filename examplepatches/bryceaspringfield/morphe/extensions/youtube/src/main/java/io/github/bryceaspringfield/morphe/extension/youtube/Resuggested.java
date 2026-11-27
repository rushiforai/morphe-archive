package io.github.bryceaspringfield.morphe.extension.youtube;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

final class Resuggested {

    static final int DEFAULT_LIMIT = 3;
    static final long VISIT_GAP_MS = 10 * 60 * 1000L;
    private static final int MAX_VIDEOS = 4000;
    private static final long KEEP_MS = 60L * 24 * 3600 * 1000;
    private static final String FILE = "yx_resuggested";
    private static final String OPENED = "o";

    private static Map<String, String> counts;

    private Resuggested() {
    }

    private static synchronized Map<String, String> counts() {
        if (counts == null) {
            counts = new LinkedHashMap<>();
            try {
                SharedPreferences p = prefs();
                String all = p == null ? "" : p.getString("v", "");
                long now = System.currentTimeMillis();
                for (String line : all.split(";")) {
                    int eq = line.indexOf('=');
                    if (eq <= 0) continue;
                    String v = line.substring(eq + 1);
                    int comma = v.indexOf(',');
                    if (comma > 0 && now - Long.parseLong(v.substring(comma + 1)) > KEEP_MS) continue;
                    counts.put(line.substring(0, eq), v);
                }
            } catch (Throwable t) {
                Logger.printException(() -> "YouTube Extras: resuggested counts not read", t);
            }
        }
        return counts;
    }

    static int limit() {
        try {
            return Math.max(0, Integer.parseInt(XSettings.RESUGGESTED_LIMIT.get().trim()));
        } catch (NumberFormatException e) {
            return DEFAULT_LIMIT;
        }
    }

    private static long gapMs() {
        try {
            return Math.max(1, Long.parseLong(XSettings.RESUGGESTED_GAP.get().trim())) * 1000L;
        } catch (NumberFormatException e) {
            return VISIT_GAP_MS;
        }
    }

    private static SharedPreferences prefs() {
        Context c = Utils.getContext();
        return c == null ? null : c.getSharedPreferences(FILE, Context.MODE_PRIVATE);
    }

    private static synchronized void save() {
        while (counts.size() > MAX_VIDEOS) {
            Iterator<String> it = counts.keySet().iterator();
            it.next();
            it.remove();
        }
        StringBuilder b = new StringBuilder();
        for (Map.Entry<String, String> e : counts.entrySet()) b.append(e.getKey()).append('=').append(e.getValue()).append(';');
        SharedPreferences p = prefs();
        if (p != null) p.edit().putString("v", b.toString()).apply();
    }

    static void opened(String videoId) {
        if (videoId == null || limit() <= 0) return;
        Utils.runOnMainThreadDelayed(() -> {
            if (!videoId.equals(app.morphe.extension.youtube.patches.VideoInformation.getVideoId())) return;
            if (!app.morphe.extension.youtube.shared.PlayerType.getCurrent().isMaximizedOrFullscreen()) return;
            synchronized (Resuggested.class) {
                if (OPENED.equals(counts().put(videoId, OPENED))) return;
                save();
            }
        }, 1500);
    }

    static synchronized boolean onHome(VideoItem item) {
        if (limit() <= 0 || item.videoId == null || item.playlist || item.mix
                || item.shorts || item.live) return false;
        String id = item.videoId;
        if (id.equals(app.morphe.extension.youtube.patches.VideoInformation.getStartingOrPlayingVideoId())) return false;
        Map<String, String> c = counts();
        String v = c.get(id);
        if (OPENED.equals(v)) return false;
        long now = System.currentTimeMillis();
        int n = 0;
        long last = 0;
        if (v != null) {
            int comma = v.indexOf(',');
            n = Integer.parseInt(v.substring(0, comma));
            last = Long.parseLong(v.substring(comma + 1));
        }
        int limit = limit();
        if (n >= limit) return true;
        if (now - last < gapMs()) return false;
        n++;
        c.remove(id);
        c.put(id, n + "," + now);
        save();
        int shown = n;
        if (XSettings.DEBUG.get()) Logger.printDebug(() -> "YouTube Extras: Home suggests " + id + " for the " + shown + ". time");
        if (n < limit) return false;
        Feedback.notInterested(item, "suggested on Home " + n + " times, never opened");
        return true;
    }
}
