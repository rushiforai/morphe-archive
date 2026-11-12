/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.util.List;

/**
 * The track numbers an album page shows in its rows, and whether they can be trusted to name the tracks of the
 * recorded track list of that album. A row that is not laid out yet or shows an icon instead of a number has no
 * number; it is never guessed from its neighbours. Pure logic, so it can be tested without Android.
 */
final class AlbumTrackNumbers {
    /** A row whose number is not known. */
    static final int UNKNOWN = -1;

    private static final int MAX_DIGITS = 3;

    private AlbumTrackNumbers() {}

    /** The number a text shows: 1 to 3 digits and nothing else, or {@link #UNKNOWN}. */
    static int parse(@Nullable CharSequence text) {
        if (text == null) return UNKNOWN;

        String trimmed = text.toString().trim();
        if (trimmed.isEmpty() || trimmed.length() > MAX_DIGITS) return UNKNOWN;

        int number = 0;
        for (int index = 0; index < trimmed.length(); index++) {
            int digit = Character.digit(trimmed.charAt(index), 10);
            if (digit < 0) return UNKNOWN;

            number = number * 10 + digit;
        }
        return number >= 1 ? number : UNKNOWN;
    }

    /**
     * The number of a row, from the texts drawn inside the number cell: exactly one text, and a number. A row whose
     * cell draws no text of its own falls back to the texts of the whole row, and then only when exactly one of them
     * is a number (a title is never all digits unless it is a rare exception, which the row order check catches).
     */
    static int pick(List<String> insideCell, List<String> inRow) {
        if (!insideCell.isEmpty()) return insideCell.size() == 1 ? parse(insideCell.get(0)) : UNKNOWN;

        int found = UNKNOWN;
        for (String text : inRow) {
            int number = parse(text);
            if (number == UNKNOWN) continue;
            if (found != UNKNOWN) return UNKNOWN;

            found = number;
        }
        return found;
    }

    /**
     * Why the numbers of the rows, top to bottom, cannot be used, or null when they can. They can when every number
     * is within the recorded track list, none ever seen on the page was beyond it (the album is not the one that
     * was recorded) and the rows are consecutive: every number is its row's place in the list plus one offset.
     *
     * @param numbersByTop The number of each track row top to bottom, {@link #UNKNOWN} for a row without one.
     * @param highestSeen  The highest number the page showed so far, including rows that were scrolled away.
     */
    @Nullable
    static String problem(List<Integer> numbersByTop, int highestSeen, int recordedCount) {
        if (recordedCount <= 0) return "no recorded tracks";
        if (highestSeen > recordedCount) {
            return "the page numbers a track " + highestSeen + " but " + recordedCount + " were recorded";
        }

        Integer offset = null;
        for (int place = 0; place < numbersByTop.size(); place++) {
            int number = numbersByTop.get(place);
            if (number == UNKNOWN) continue;

            if (offset == null) offset = number - place;
            else if (number - place != offset) return "the numbers " + numbersByTop + " are not consecutive";
        }
        return offset == null ? "no row shows a number" : null;
    }
}
