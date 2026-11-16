/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.downloads;

/** State of a native onErrorResumeNext function; its version-specific function bridge is installed by the patch. */
@SuppressWarnings("unused")
public final class PlayerStreamFailure {
    public final Object request;
    public final boolean next;

    public PlayerStreamFailure(Object request, boolean next) {
        this.request = request;
        this.next = next;
    }
}
