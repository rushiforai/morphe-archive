/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-19.
 * Written by lavinhoque33, 2026-11-18.
 */
package app.morphe.extension.music.patches.downloads;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.BiConsumer;
import java.util.function.BooleanSupplier;
import java.util.function.Predicate;
import java.util.function.UnaryOperator;

/** One pass over a stream playlist. Membership is ordered; the work is per distinct media copy. */
final class PlaylistTransfer {
    record Progress(int ready, int total) {
        boolean complete() {
            return total != 0 && ready == total;
        }
    }

    /** Counts all positions of a copy while transferring it only once. */
    static final class ProgressCounter {
        private final Map<String, Integer> missing = new HashMap<>();
        private int ready;
        private int total;

        ProgressCounter(List<String> tracks, UnaryOperator<String> canonical, Predicate<String> isReady) {
            for (String track : tracks) {
                if (!PlaylistPage.isAvailable(track)) continue;

                total++;
                missing.merge(canonical.apply(track), 1, Integer::sum);
            }
            var copies = missing.entrySet().iterator();
            while (copies.hasNext()) {
                var copy = copies.next();
                if (!isReady.test(copy.getKey())) continue;

                ready += copy.getValue();
                copies.remove();
            }
        }

        Progress snapshot() {
            return new Progress(ready, total);
        }

        void saved(String id) {
            Integer positions = missing.remove(id);
            if (positions != null) ready += positions;
        }
    }

    record Outcome(int downloaded, boolean allReady) {}

    @FunctionalInterface
    interface TrackWork {
        /** Returns whether this step transferred audio. */
        boolean ensure(String videoId) throws Exception;
    }

    @FunctionalInterface
    interface Backfill {
        String fetch(String videoId);
    }

    static boolean prepare(String id, Predicate<String> hasAudio, Predicate<String> hasResponse,
                           TrackWork download, Backfill backfill) throws Exception {
        boolean downloaded = !hasAudio.test(id) && download.ensure(id);
        if (!hasResponse.test(id)) {
            String failure = backfill.fetch(id);
            if (!hasResponse.test(id)) throw new IOException("No saved playback response: " + failure);
        }
        if (!hasAudio.test(id)) throw new IOException("Stream copy is not available");
        return downloaded;
    }

    private PlaylistTransfer() {}

    static Progress progress(List<String> tracks, Predicate<String> ready) {
        int total = 0;
        int copies = 0;
        for (String id : tracks) {
            if (!PlaylistPage.isAvailable(id)) continue;

            total++;
            if (ready.test(id)) copies++;
        }
        return new Progress(copies, total);
    }

    static Outcome fill(List<String> tracks, UnaryOperator<String> canonical, Predicate<String> ready,
                        BooleanSupplier canTransfer, TrackWork work, BiConsumer<String, Exception> onFailure) {
        Set<String> seen = new HashSet<>();
        int downloaded = 0;
        boolean allReady = true;
        for (String track : tracks) {
            if (!PlaylistPage.isAvailable(track)) continue;

            String copyId = canonical.apply(track);
            if (!seen.add(copyId) || ready.test(copyId)) continue;

            if (Thread.currentThread().isInterrupted() || !canTransfer.getAsBoolean()) {
                return new Outcome(downloaded, false);
            }
            try {
                if (work.ensure(copyId)) downloaded++;
            } catch (InterruptedException ex) {
                Thread.currentThread().interrupt();
                return new Outcome(downloaded, false);
            } catch (Exception ex) {
                allReady = false;
                onFailure.accept(copyId, ex);
            }
        }
        return new Outcome(downloaded, allReady);
    }
}
