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
import java.util.List;

/** The video rows actually displayed from one notifications response. */
final class InboxVideos {
    private final List<String> videoIds = new ArrayList<>();
    private final List<String> seenVideoIds = new ArrayList<>();
    private final List<String> unseenVideoIds = new ArrayList<>();

    void add(@Nullable String videoId, boolean unseen) {
        if (videoId == null) {
            return;
        }
        videoIds.add(videoId);
        (unseen ? unseenVideoIds : seenVideoIds).add(videoId);
    }

    void save() {
        if (!videoIds.isEmpty()) {
            SeenVideos.update(videoIds, seenVideoIds, unseenVideoIds);
        }
    }
}
