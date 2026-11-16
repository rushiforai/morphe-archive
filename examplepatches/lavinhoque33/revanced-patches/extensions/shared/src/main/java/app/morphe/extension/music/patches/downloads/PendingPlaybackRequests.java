/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-14.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.downloads;

import java.util.ArrayList;
import java.util.List;
import java.util.function.BooleanSupplier;
import java.util.function.Predicate;

/** Identity-scoped pending results; no callbacks execute under the registry monitor. */
final class PendingPlaybackRequests {
    interface Ownership {
        boolean owns(Object request, Object ownership);
    }

    interface Unavailable {
        void handle(Object request, Object ownership, Runnable completed);
    }

    interface Entry {
        Object request();
        Object ownership();
        boolean player();
        boolean selectUnavailable();
        void cancelUnavailable();
        boolean pending();
        boolean recover(PlaybackConnectionLoss loss);
    }

    private final List<Entry> entries = new ArrayList<>();

    synchronized void add(Entry entry) {
        for (int index = entries.size() - 1; index >= 0; index--) {
            Entry previous = entries.get(index);
            if (previous == entry) return;
            if (!previous.pending()) entries.remove(index);
        }
        if (entry.pending()) entries.add(entry);
    }

    synchronized void remove(Entry entry) {
        for (int index = entries.size() - 1; index >= 0; index--) {
            if (entries.get(index) == entry) entries.remove(index);
        }
    }

    void disconnected(Ownership owns, Predicate<Object> cached, BooleanSupplier offline,
                      Unavailable unavailable) {
        List<Entry> snapshot;
        synchronized (this) {
            if (entries.isEmpty()) return;
            snapshot = new ArrayList<>(entries);
        }
        for (Entry entry : snapshot) {
            if (!entry.pending() || !owns.owns(entry.request(), entry.ownership())) {
                remove(entry);
            } else if (cached.test(entry.request())) {
                entry.recover(new PlaybackConnectionLoss(entry.request(), entry.ownership()));
            } else if (entry.player() && offline.getAsBoolean() && entry.selectUnavailable()) {
                abandon(snapshot, entry, unavailable);
            }
        }
    }

    private static void abandon(List<Entry> snapshot, Entry player, Unavailable unavailable) {
        List<Entry> claimed = new ArrayList<>();
        claimed.add(player);
        for (Entry sibling : snapshot) {
            if (sibling != player && PlaybackRequestIdentity.same(sibling.request(), player.request())
                    && sibling.ownership() == player.ownership() && sibling.selectUnavailable()) {
                claimed.add(sibling);
            }
        }
        // Claim every lane before native cancellation can synchronously send a late terminal signal.
        unavailable.handle(player.request(), player.ownership(), () -> {
            for (Entry entry : claimed) entry.cancelUnavailable();
        });
    }
}
