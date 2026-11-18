/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.extension.music.patches.downloads;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.function.UnaryOperator;

final class PlaylistSyncPlan {
    private PlaylistSyncPlan() {}

    /** Download once per new ID without changing the positions or duplicates in the source itself. */
    static Set<String> additions(List<String> previous, List<String> fresh) {
        Set<String> known = new HashSet<>(previous);
        Set<String> additions = new LinkedHashSet<>();
        for (String id : fresh) {
            if (PlaylistPage.isAvailable(id) && !known.contains(id)) additions.add(id);
        }
        return additions;
    }

    /** Maps a full native row position to the matching occurrence in the ready-only offline queue. */
    static int readyIndex(List<String> full, List<OfflineWatchNext.Item> ready, String songId, int position,
                          UnaryOperator<String> canonical) {
        if (position >= 0 && position < full.size() && songId.equals(canonical.apply(full.get(position)))) {
            int occurrence = 0;
            for (int index = 0; index < position; index++) {
                if (songId.equals(canonical.apply(full.get(index)))) occurrence++;
            }
            for (int index = 0; index < ready.size(); index++) {
                if (songId.equals(ready.get(index).videoId()) && occurrence-- == 0) return index;
            }
        }
        return OfflineReplayLogic.currentIndex(ready, songId, -1);
    }

    static boolean wifiEligible(boolean wifi, boolean internet, boolean validated, boolean unmetered) {
        return wifi && internet && validated && unmetered;
    }
}
