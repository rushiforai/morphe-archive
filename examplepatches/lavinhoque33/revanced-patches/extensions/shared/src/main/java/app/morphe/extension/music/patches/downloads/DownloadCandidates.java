/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-11.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.function.Function;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;

/** Lazy client search with source-tier ranking and the unused formats retained for rejected-URL fallback. */
final class DownloadCandidates<T> {
    private final Iterator<List<T>> sources;
    private final Function<T, Format> formatOf;
    private final DownloadQuality quality;
    private final List<T> pending = new ArrayList<>();

    DownloadCandidates(Iterator<List<T>> sources, Function<T, Format> formatOf, DownloadQuality quality) {
        this.sources = sources;
        this.formatOf = formatOf;
        this.quality = quality;
    }

    @Nullable
    T next() {
        while (true) {
            int best = -1;
            for (int index = 0; index < pending.size(); index++) {
                T candidate = pending.get(index);
                if (candidate != null && (best < 0 || DownloadFormats.compare(
                        formatOf.apply(candidate), formatOf.apply(pending.get(best)), quality) > 0)) best = index;
            }
            if (best >= 0 && (!sources.hasNext()
                    || DownloadFormats.isTopChoice(formatOf.apply(pending.get(best)), quality))) {
                // Null slots retain arrival order for equal choices without shifting or copying the remaining items.
                return pending.set(best, null);
            }
            if (!sources.hasNext()) return null;

            pending.addAll(sources.next());
        }
    }
}
