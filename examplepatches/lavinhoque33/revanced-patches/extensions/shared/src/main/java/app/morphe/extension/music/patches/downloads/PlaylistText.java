/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

/** Text of a playlist download that is decided without Android. */
final class PlaylistText {
    /** A failure toast is one line: the reason is cut here, the log has all of it. */
    static final int MAX_REASON = 60;

    private PlaylistText() {}

    /**
     * What failed, short enough for a toast: the first line of the exception's message, or its class name when it
     * has none, cut to {@link #MAX_REASON} characters.
     */
    static String failureReason(Throwable failure) {
        String message = failure.getMessage();
        String line = message == null ? "" : message.strip().lines().findFirst().orElse("").strip();
        if (line.isEmpty()) line = failure.getClass().getSimpleName();

        return line.length() <= MAX_REASON ? line : line.substring(0, MAX_REASON - 1) + "…";
    }
}
