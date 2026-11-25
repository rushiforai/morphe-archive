/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4896
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.youtube.patches.notifications;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Private local history of video IDs, never notification payloads or account identifiers. */
final class SeenVideos {
    private static final class Store {
        private static final long DAY_MILLIS = 24L * 60 * 60 * 1000;

        private static final TimedVideoIds seen = new TimedVideoIds(
                "morphe_ungroup_notifications_seen", 2000, 90 * DAY_MILLIS);
        private static final TimedVideoIds notificationVideos = new TimedVideoIds(
                "morphe_ungroup_notifications_videos", 2000, 90 * DAY_MILLIS);
        private static final TimedVideoIds recentlyPlayed = new TimedVideoIds(
                "morphe_ungroup_notifications_played", 200, 14 * DAY_MILLIS);
        private static final TimedVideoIds recentlyPlayedShorts = new TimedVideoIds(
                "morphe_ungroup_notifications_played_shorts", 500, 3 * DAY_MILLIS);
        private static final TimedVideoIds shownUnseen = new TimedVideoIds(
                "morphe_ungroup_notifications_unseen", 2000, 90 * DAY_MILLIS);

        private static synchronized void update(Collection<String> videoIds, Collection<String> seenVideoIds,
                                                Collection<String> unseenVideoIds) {
            long now = System.currentTimeMillis();
            notificationVideos.addAll(videoIds, now);
            seen.addAll(seenVideoIds, now);
            shownUnseen.addAll(unseenVideoIds, now);
            moveToSeen(recentlyPlayed, videoIds, now);
            moveToSeen(recentlyPlayedShorts, videoIds, now);
        }

        private static void moveToSeen(TimedVideoIds played, Collection<String> videoIds, long now) {
            List<String> moved = new ArrayList<>();
            for (String videoId : videoIds) {
                if (played.contains(videoId, now)) {
                    moved.add(videoId);
                }
            }
            if (!moved.isEmpty()) {
                seen.addAll(moved, now);
                played.removeAll(moved);
            }
        }

        private static synchronized void addPlayed(String videoId, boolean isShort) {
            long now = System.currentTimeMillis();
            TimedVideoIds destination = notificationVideos.contains(videoId, now) ? seen
                    : isShort ? recentlyPlayedShorts : recentlyPlayed;
            destination.addAll(List.of(videoId), now);
        }

        private static synchronized boolean wasShownUnseen(String videoId) {
            return shownUnseen.contains(videoId, System.currentTimeMillis());
        }

        private static synchronized boolean contains(String videoId) {
            long now = System.currentTimeMillis();
            return seen.contains(videoId, now) || recentlyPlayed.contains(videoId, now)
                    || recentlyPlayedShorts.contains(videoId, now);
        }
    }

    static boolean isVideoId(@Nullable String videoId) {
        if (videoId == null || videoId.length() != 11) {
            return false;
        }
        for (int index = 0; index < videoId.length(); index++) {
            char current = videoId.charAt(index);
            if (!(current >= 'A' && current <= 'Z' || current >= 'a' && current <= 'z'
                    || current >= '0' && current <= '9' || current == '-' || current == '_')) {
                return false;
            }
        }
        return true;
    }

    static void addPlayedInBackground(String videoId, boolean isShort) {
        Utils.runOnBackgroundThread(() -> recordPlayed(videoId, isShort));
    }

    static void recordPlayed(String videoId, boolean isShort) {
        if (!isVideoId(videoId) || !Utils.isContextSet()) {
            return;
        }
        try {
            Store.addPlayed(videoId, isShort);
        } catch (RuntimeException | LinkageError ex) {
            Logger.printDebug(() -> "Could not save notification playback state");
        }
    }

    static void update(Collection<String> notificationVideoIds, Collection<String> seenVideoIds,
                       Collection<String> unseenVideoIds) {
        if (!Utils.isContextSet()) {
            return;
        }
        try {
            Store.update(notificationVideoIds, seenVideoIds, unseenVideoIds);
        } catch (RuntimeException | LinkageError ex) {
            Logger.printDebug(() -> "Could not save notification inbox state");
        }
    }

    static boolean wasShownUnseen(String videoId) {
        try {
            return Utils.isContextSet() && Store.wasShownUnseen(videoId);
        } catch (RuntimeException | LinkageError ex) {
            return false;
        }
    }

    static boolean contains(String videoId) {
        try {
            return Utils.isContextSet() && Store.contains(videoId);
        } catch (RuntimeException | LinkageError ex) {
            return false;
        }
    }
}
