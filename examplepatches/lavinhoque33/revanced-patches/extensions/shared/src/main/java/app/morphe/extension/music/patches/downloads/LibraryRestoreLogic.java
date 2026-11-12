/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

/**
 * Whether the Library tab's restored start page is replaced by the Library itself, with no Android dependency.
 * The app keeps the last page the Library tab showed; tapping the Downloads chip makes that page Downloads, so after
 * a restart the Library tab opened with the Downloads chip selected.
 */
final class LibraryRestoreLogic {
    private static final String LANDING_BROWSE_ID = "FEmusic_library_landing";

    private LibraryRestoreLogic() {
    }

    /**
     * @param firstRestore Whether this is the first restore of the app process, which is a restart of the app.
     * @param chosenId     The browse id of the command the app is about to open, null if it is no browse command.
     * @param fallbackId   The browse id of the tab's own start command, null if it is no browse command.
     * @return Whether the tab's own start command is opened instead: only on the first restore, and only when the
     * app restored the Downloads page where the tab starts at the Library.
     */
    static boolean opensLibrary(boolean firstRestore, @Nullable String chosenId, @Nullable String fallbackId) {
        return firstRestore
                && OfflineLibraryLogic.DOWNLOADS_BROWSE_ID.equals(chosenId)
                && LANDING_BROWSE_ID.equals(fallbackId);
    }
}
