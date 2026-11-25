/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4896
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.youtube.patches.notifications;

import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.shared.settings.preference.SharedPrefCategory;

/** A bounded, expiring set of video IDs. Access is serialized by {@link SeenVideos}. */
final class TimedVideoIds {
    private final SharedPreferences prefs;
    private final Map<String, Long> times = new HashMap<>();
    private final int maxEntries;
    private final long maxAgeMillis;

    TimedVideoIds(String prefsName, int maxEntries, long maxAgeMillis) {
        prefs = new SharedPrefCategory(prefsName).preferences;
        this.maxEntries = maxEntries;
        this.maxAgeMillis = maxAgeMillis;
        for (Map.Entry<String, ?> entry : prefs.getAll().entrySet()) {
            if (entry.getValue() instanceof Long time && SeenVideos.isVideoId(entry.getKey())) {
                times.put(entry.getKey(), time);
            }
        }
        trim(System.currentTimeMillis());
    }

    boolean contains(String videoId, long now) {
        Long time = times.get(videoId);
        return time != null && now - time <= maxAgeMillis;
    }

    void addAll(Collection<String> videoIds, long now) {
        SharedPreferences.Editor editor = null;
        for (String videoId : videoIds) {
            if (contains(videoId, now)) {
                continue;
            }
            if (editor == null) {
                editor = prefs.edit();
            }
            times.put(videoId, now);
            editor.putLong(videoId, now);
        }
        if (editor != null) {
            editor.apply();
            if (times.size() > maxEntries) {
                trim(now);
            }
        }
    }

    void removeAll(Collection<String> videoIds) {
        SharedPreferences.Editor editor = null;
        for (String videoId : videoIds) {
            if (times.remove(videoId) == null) {
                continue;
            }
            if (editor == null) {
                editor = prefs.edit();
            }
            editor.remove(videoId);
        }
        if (editor != null) {
            editor.apply();
        }
    }

    private void trim(long now) {
        List<String> expired = new ArrayList<>();
        for (Map.Entry<String, Long> entry : times.entrySet()) {
            if (now - entry.getValue() > maxAgeMillis) {
                expired.add(entry.getKey());
            }
        }
        removeAll(expired);

        if (times.size() > maxEntries) {
            List<String> newestFirst = new ArrayList<>(times.keySet());
            newestFirst.sort((left, right) -> Long.compare(times.get(right), times.get(left)));
            removeAll(newestFirst.subList(maxEntries * 9 / 10, newestFirst.size()));
        }
    }
}
