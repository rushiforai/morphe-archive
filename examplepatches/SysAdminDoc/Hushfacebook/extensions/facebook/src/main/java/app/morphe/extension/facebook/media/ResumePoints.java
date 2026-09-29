/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import android.content.SharedPreferences;

import androidx.annotation.Nullable;

import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Where each long video was left, by video id: at most {@link #MAX_POINTS} of them, none older than
 * {@link #KEEP_MS}.
 *
 * <p>The points live in a preferences file of their own, so they never reach the settings export or
 * the diagnostic report. A point is the video's ID with a position and a time, nothing about what
 * the video shows. The file is read once, the first time a point is asked for, and every change
 * after that writes only the keys it changes. The oldest point goes first once there are too many,
 * and a point past its age is dropped when it's read and at every start of Facebook, switch on or
 * off ({@link ResumePlayback#onFacebookStart}).
 */
final class ResumePoints {
    /** The preferences file, in Facebook's own preferences folder. Only this class writes it. */
    static final String FILE = "hushfacebook_resume_points";

    /** How many videos are remembered. The least recently saved goes first. */
    static final int MAX_POINTS = 200;

    /** How long a point is kept after it was last saved: 30 days. */
    static final long KEEP_MS = 30L * 24 * 60 * 60 * 1000;

    /** One remembered position. */
    static final class Point {
        final int positionMs;
        final long savedAt;

        Point(int positionMs, long savedAt) {
            this.positionMs = positionMs;
            this.savedAt = savedAt;
        }
    }

    private final SharedPreferences store;
    /** In the order they were saved, oldest first. */
    private final LinkedHashMap<String, Point> points = new LinkedHashMap<>();
    private boolean loaded;

    ResumePoints(SharedPreferences store) {
        this.store = store;
    }

    /** The point saved for [videoId], or null when there's none or it's past its age. */
    @Nullable
    synchronized Point get(String videoId, long now) {
        load(now);
        Point point = points.get(videoId);
        if (point == null) return null;
        if (expired(point, now)) {
            points.remove(videoId);
            store.edit().remove(videoId).apply();
            return null;
        }
        return point;
    }

    /** Remembers [positionMs] for [videoId] as its newest point, and drops the oldest past the limit. */
    synchronized void put(String videoId, int positionMs, long now) {
        load(now);
        points.remove(videoId);
        points.put(videoId, new Point(positionMs, now));
        SharedPreferences.Editor edit = store.edit().putString(videoId, encode(positionMs, now));
        Iterator<String> oldest = points.keySet().iterator();
        while (points.size() > MAX_POINTS && oldest.hasNext()) {
            String gone = oldest.next();
            oldest.remove();
            edit.remove(gone);
        }
        edit.apply();
    }

    /** Drops every point past its age now, rather than when it's next read. */
    synchronized void dropExpired(long now) {
        load(now);
        SharedPreferences.Editor edit = null;
        for (Iterator<Map.Entry<String, Point>> each = points.entrySet().iterator(); each.hasNext(); ) {
            Map.Entry<String, Point> point = each.next();
            if (!expired(point.getValue(), now)) continue;
            each.remove();
            if (edit == null) edit = store.edit();
            edit.remove(point.getKey());
        }
        if (edit != null) edit.apply();
    }

    /** Forgets [videoId]'s point. True when there was one. */
    synchronized boolean remove(String videoId, long now) {
        load(now);
        if (points.remove(videoId) == null) return false;
        store.edit().remove(videoId).apply();
        return true;
    }

    /** How many points are kept. */
    synchronized int size(long now) {
        load(now);
        return points.size();
    }

    /**
     * Reads the file the first time. A value that doesn't parse, a point past its age, and the
     * oldest points past the limit (a file written by a build that kept more) are removed from it.
     */
    private void load(long now) {
        if (loaded) return;
        loaded = true;
        List<String> dropped = new ArrayList<>();
        List<Map.Entry<String, Point>> read = new ArrayList<>();
        for (Map.Entry<String, ?> entry : store.getAll().entrySet()) {
            Point point = entry.getValue() instanceof String ? decode((String) entry.getValue()) : null;
            if (point == null || expired(point, now)) {
                dropped.add(entry.getKey());
                continue;
            }
            read.add(new AbstractMap.SimpleImmutableEntry<>(entry.getKey(), point));
        }
        Collections.sort(read, (a, b) -> Long.compare(a.getValue().savedAt, b.getValue().savedAt));
        int surplus = Math.max(0, read.size() - MAX_POINTS);
        for (int index = 0; index < read.size(); index++) {
            Map.Entry<String, Point> entry = read.get(index);
            if (index < surplus) dropped.add(entry.getKey());
            else points.put(entry.getKey(), entry.getValue());
        }
        if (dropped.isEmpty()) return;
        SharedPreferences.Editor edit = store.edit();
        for (String key : dropped) edit.remove(key);
        edit.apply();
    }

    private static boolean expired(Point point, long now) {
        return now - point.savedAt > KEEP_MS;
    }

    static String encode(int positionMs, long savedAt) {
        return positionMs + ":" + savedAt;
    }

    @Nullable
    static Point decode(String value) {
        int colon = value.indexOf(':');
        if (colon <= 0) return null;
        try {
            int position = Integer.parseInt(value.substring(0, colon));
            long savedAt = Long.parseLong(value.substring(colon + 1));
            return position > 0 ? new Point(position, savedAt) : null;
        } catch (NumberFormatException notANumber) {
            return null;
        }
    }
}
