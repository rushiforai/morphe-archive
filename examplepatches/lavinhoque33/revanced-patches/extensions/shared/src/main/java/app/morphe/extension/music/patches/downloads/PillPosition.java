/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

/**
 * Where the Song/Video switch continues: the position the player had when the pill was pressed, unless that is not
 * known or lies so near the end that the other item would hardly play. A pure rule, so it can be tested without
 * Android.
 */
final class PillPosition {
    /** A position nearer than this to the end of the video starts the other item from its beginning. */
    static final long END_MARGIN_MILLIS = 3_000;
    /** The stock start time has whole seconds only: less than one has nothing to continue from. */
    static final long MIN_MILLIS = 1_000;

    private PillPosition() {}

    /**
     * The start of the item the switch navigates to.
     *
     * @param millis Where to start, 0 for the beginning.
     * @param reason Why this start was chosen, for the log.
     */
    record Start(long millis, String reason) {
        boolean continues() {
            return millis > 0;
        }
    }

    /**
     * @param positionMillis The player's playback time, negative when it is not known.
     * @param lengthMillis   The length of the video being played, which is that of the item switched to as well; 0
     *                       when it is not known, and the end is then not checked.
     */
    static Start choose(long positionMillis, long lengthMillis) {
        if (positionMillis < 0) return new Start(0, "position unknown");
        if (positionMillis < MIN_MILLIS) return new Start(0, "position " + positionMillis + "ms is at the start");
        if (lengthMillis > 0 && positionMillis >= lengthMillis - END_MARGIN_MILLIS) {
            return new Start(0, "position " + positionMillis + "ms is within " + END_MARGIN_MILLIS
                    + "ms of the end (" + lengthMillis + "ms)");
        }
        return new Start(positionMillis, lengthMillis > 0 ? "continues at " + positionMillis + "ms of " + lengthMillis
                : "continues at " + positionMillis + "ms (length unknown)");
    }
}
