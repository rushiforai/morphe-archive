/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.shared.utils.Logger;

/** Makes the Library tab start at the Library after a restart, not at the Downloads chip the last session used. */
@SuppressWarnings("unused")
public final class LibraryRestore {
    private static final AtomicBoolean FIRST_RESTORE = new AtomicBoolean(true);

    private LibraryRestore() {
    }

    /**
     * Injection point: the online restore of the Library tab, just before it opens the command it chose. The
     * offline start never gets here. The saved page is left as it is, so the chip keeps working in the session.
     *
     * @param chosen   The command the app restored, or the tab's own command when none was saved.
     * @param fallback The tab's own start command.
     */
    public static Object restoreLibraryStart(Object chosen, Object fallback) {
        try {
            boolean first = FIRST_RESTORE.getAndSet(false);
            if (!first || !(chosen instanceof NativeDownloads.Command chosenCommand)
                    || !(fallback instanceof NativeDownloads.Command fallbackCommand)) {
                return chosen;
            }

            String chosenId = OfflineReplayLogic.browseIdOf(chosenCommand.toByteArray());
            String fallbackId = OfflineReplayLogic.browseIdOf(fallbackCommand.toByteArray());
            Logger.printDebug(() -> "LibraryRestore: first restore, saved " + chosenId + ", start " + fallbackId);
            return LibraryRestoreLogic.opensLibrary(true, chosenId, fallbackId) ? fallback : chosen;
        } catch (Exception ex) {
            Logger.printException(() -> "LibraryRestore failed", ex);
            return chosen;
        }
    }
}
