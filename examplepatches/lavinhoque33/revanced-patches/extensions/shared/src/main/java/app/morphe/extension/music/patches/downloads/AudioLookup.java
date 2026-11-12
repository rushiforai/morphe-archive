/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import java.io.FileNotFoundException;

/** What one MediaStore lookup of a downloaded track proves. Only {@link #MISSING} may delete saved state. */
enum AudioLookup {
    PRESENT,
    /** The query succeeded and there is no row/file (or an empty one): the track is gone. */
    MISSING,
    /** Permission loss, a provider failure or a null descriptor: nothing is known, so nothing may be deleted. */
    UNKNOWN;

    /** A failed open is MISSING only for the standard not-found result; `size < 0` is an unknown size. */
    static AudioLookup of(boolean opened, long size, Exception failure) {
        if (failure != null) return failure instanceof FileNotFoundException ? MISSING : UNKNOWN;
        if (!opened || size < 0) return UNKNOWN;
        return size > 0 ? PRESENT : MISSING;
    }
}
