/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-05.
 */
package app.morphe.extension.youtube.patches.general.offline;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;

/** Immutable item snapshots preserve playlist order and distinguish audio/video library keys. */
final class OfflinePlaylistSelection {
    record Item(String videoId, String title, long lengthMs, int index, boolean selected, boolean audioOnly,
                int heightLimit, boolean videoDownloaded, boolean audioDownloaded) {
        String key() {
            return OfflineVideo.keyOf(videoId, audioOnly);
        }

        boolean alreadyDownloaded() {
            return audioOnly ? audioDownloaded : videoDownloaded;
        }

        Item select(boolean selected) {
            return new Item(videoId, title, lengthMs, index, selected, audioOnly, heightLimit,
                    videoDownloaded, audioDownloaded);
        }

        Item format(boolean audioOnly, int heightLimit) {
            return new Item(videoId, title, lengthMs, index, selected, audioOnly, heightLimit,
                    videoDownloaded, audioDownloaded);
        }
    }

    private final List<Item> items;
    int heightLimit = Integer.MAX_VALUE;

    OfflinePlaylistSelection(List<Item> items) {
        this.items = new ArrayList<>(items);
    }

    static List<Item> from(List<OfflinePlaylist.Entry> entries, Predicate<String> downloaded) {
        List<Item> result = new ArrayList<>();
        for (int index = 0; index < entries.size(); index++) {
            OfflinePlaylist.Entry entry = entries.get(index);
            boolean video = downloaded.test(OfflineVideo.keyOf(entry.videoId(), false));
            boolean audio = downloaded.test(OfflineVideo.keyOf(entry.videoId(), true));
            result.add(new Item(entry.videoId(), entry.title(), entry.lengthMs(), index + 1, !video, false,
                    Integer.MAX_VALUE, video, audio));
        }
        return List.copyOf(result);
    }

    int size() {
        return items.size();
    }

    Item get(int index) {
        return items.get(index);
    }

    void select(int index, boolean selected) {
        items.set(index, items.get(index).select(selected));
    }

    void selectAll(boolean selected) {
        for (int index = 0; index < items.size(); index++) select(index, selected);
    }

    void edit(int index, boolean audioOnly, int heightLimit) {
        items.set(index, items.get(index).format(audioOnly, heightLimit));
    }

    int selectedCount() {
        int count = 0;
        for (Item item : items) if (item.selected()) count++;
        return count;
    }

    List<Item> selectedItems() {
        List<Item> result = new ArrayList<>();
        for (Item item : items) {
            if (item.selected()) result.add(item.format(item.audioOnly(), Math.min(heightLimit, item.heightLimit())));
        }
        return List.copyOf(result);
    }
}
