// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.translation;

import java.util.function.Consumer;
import java.util.function.Supplier;

final class BulkSnapshot<Rows> {
    private final Runnable release;
    private boolean finished;

    BulkSnapshot(Runnable release) {
        this.release = release;
    }

    void deliver(Supplier<Rows> copy, Consumer<Rows> start) {
        if (finished) return;
        finished = true;
        Rows rows;
        try {
            rows = copy.get();
        } finally {
            release.run();
        }
        start.accept(rows);
    }

    void cancel() {
        if (finished) return;
        finished = true;
        release.run();
    }
}
