/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-05.
 * Written by lavinhoque33, 2026-11-05.
 */
package app.morphe.extension.youtube.patches.general.offline;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.youtube.patches.general.offline.OfflineCaptionChoices.Track;

/** Native-only playlist matching and the batch-wide first-429 circuit breaker. */
final class OfflineBatchSubtitles {
    int saved;
    int skipped;
    boolean rateLimited;

    boolean shouldResolve(boolean requested) {
        return requested && !rateLimited;
    }

    void metadataResolved(boolean limited) {
        rateLimited |= limited;
    }

    void finished(int requested, int downloaded, boolean limited) {
        saved += downloaded;
        skipped += Math.max(0, requested - downloaded);
        rateLimited |= limited;
    }

    static List<Track> match(List<Track> wanted, List<Track> available) {
        List<Track> result = new ArrayList<>();
        for (Track selected : wanted) {
            if (!selected.translation().isEmpty()) continue;
            Track match = null;
            for (Track track : available) {
                if (track.translation().isEmpty() && track.key().equals(selected.key())) {
                    match = track;
                    break;
                }
            }
            if (match == null) {
                for (Track track : available) {
                    if (track.translation().isEmpty() && track.language().equals(selected.language())) {
                        match = track;
                        break;
                    }
                }
            }
            if (match != null && !result.contains(match) && result.size() < OfflineSubtitle.MAX_TRACKS) {
                result.add(match);
            }
        }
        return List.copyOf(result);
    }

    static String languageOf(String key) {
        if (key.startsWith("translate:")) return "";
        String language = key.startsWith("a.") ? key.substring(2) : key.startsWith(".") ? key.substring(1) : key;
        int kind = language.indexOf(':');
        return kind < 0 ? language : language.substring(0, kind);
    }

    List<String> summaryKeys() {
        List<String> keys = new ArrayList<>();
        if (saved > 0) keys.add("revanced_offline_batch_subtitles_saved");
        if (skipped > 0) keys.add("revanced_offline_batch_subtitles_skipped");
        if (rateLimited) keys.add("revanced_offline_batch_subtitles_limited");
        return keys;
    }
}
