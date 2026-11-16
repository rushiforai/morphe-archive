/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.downloads;

/** Online streaming keeps every value; takeover is allowed only before the first response. */
class PlaybackStreamState {
    private boolean stock;
    private boolean local;
    private boolean terminal;
    private boolean disposed;

    final synchronized boolean stockValue() {
        if (local || terminal || disposed) return false;
        stock = true;
        return true;
    }

    final synchronized boolean stockTerminal() {
        if (local || terminal || disposed) return false;
        terminal = true;
        return true;
    }

    final synchronized boolean selectLocal() {
        if (stock || local || terminal || disposed) return false;
        local = true;
        return true;
    }

    final synchronized boolean localTerminal() {
        if (!local || terminal || disposed) return false;
        terminal = true;
        return true;
    }

    final synchronized boolean pendingResponse() {
        return !stock && !local && !terminal && !disposed;
    }

    final synchronized boolean locallySelected() {
        return local;
    }


    final synchronized boolean disposed() {
        return disposed;
    }

    final synchronized boolean disposeOnce() {
        if (disposed) return false;
        disposed = true;
        return true;
    }
}
