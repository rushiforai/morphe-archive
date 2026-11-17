/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import android.media.MediaDescription;
import android.media.session.MediaSession;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.function.LongPredicate;
import java.util.function.Supplier;

import app.morphe.extension.shared.utils.StringRef;

/** Projects subtitles only at the platform publication boundary, after native queue/control construction. */
public final class SmartShuffleAuto {
    private static final LongPredicate SUGGESTIONS = SmartShuffleManager::isSuggested;
    private static final Supplier<String> LABEL = () -> StringRef.str("morphe_smart_shuffle_suggested");

    private static WeakReference<MediaSession> session = new WeakReference<>(null);
    private static List<MediaSession.QueueItem> originalQueue;
    private static long revision;

    private SmartShuffleAuto() {}

    /** Installed instead of the native framework setQueue call; its raw queue remains untouched. */
    public static void publish(MediaSession target, List<MediaSession.QueueItem> queue) {
        long publication;
        synchronized (SmartShuffleAuto.class) {
            if (session.get() != target) {
                session = new WeakReference<>(target);
            }

            originalQueue = queue;
            publication = ++revision;
        }

        publishIfCurrent(target, project(queue), publication);
    }

    /** Reprojects from native originals, so Keep/cancel clears the label without waiting for a queue mutation. */
    public static void refresh() {
        MediaSession target;
        List<MediaSession.QueueItem> queue;
        long publication;
        synchronized (SmartShuffleAuto.class) {
            target = session.get();
            if (target == null) {
                originalQueue = null;
                return;
            }

            queue = originalQueue;
            publication = ++revision;
        }

        publishIfCurrent(target, project(queue), publication);
    }

    private static void publishIfCurrent(MediaSession target, List<MediaSession.QueueItem> queue, long publication) {
        synchronized (SmartShuffleAuto.class) {
            if (publication == revision && session.get() == target) {
                target.setQueue(queue);
            }
        }
    }

    private static List<MediaSession.QueueItem> project(List<MediaSession.QueueItem> queue) {
        if (queue == null) {
            return null;
        }

        List<MediaSession.QueueItem> projected = null;
        for (int index = 0; index < queue.size(); index++) {
            MediaSession.QueueItem item = queue.get(index);
            MediaDescription description = item.getDescription();
            CharSequence subtitle = SmartShuffleAutoSubtitle.project(
                    description.getSubtitle(), item.getQueueId(), SUGGESTIONS, LABEL);
            if (subtitle == description.getSubtitle()) {
                continue;
            }

            if (projected == null) {
                projected = new ArrayList<>(queue);
            }

            projected.set(index, new MediaSession.QueueItem(withSubtitle(description, subtitle), item.getQueueId()));
        }

        return projected == null ? queue : projected;
    }

    private static MediaDescription withSubtitle(MediaDescription original, CharSequence subtitle) {
        return new MediaDescription.Builder()
                .setMediaId(original.getMediaId())
                .setTitle(original.getTitle())
                .setSubtitle(subtitle)
                .setDescription(original.getDescription())
                .setIconBitmap(original.getIconBitmap())
                .setIconUri(original.getIconUri())
                .setExtras(original.getExtras())
                .setMediaUri(original.getMediaUri())
                .build();
    }
}
