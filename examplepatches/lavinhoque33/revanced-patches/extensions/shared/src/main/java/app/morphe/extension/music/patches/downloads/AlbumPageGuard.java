/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * The two decisions that keep the checks of an album page from landing on another page: who may scan a page's list,
 * and whether the rows of the list show the titles this album's rows showed before. Pure logic, so it can be tested
 * without Android.
 */
final class AlbumPageGuard {
    private static final int MAX_ALBUMS = 8;

    /** The titles that the rows of each album showed, by track number; the least recently used albums are dropped. */
    private static final Map<String, Titles> titlesByAlbum = new LinkedHashMap<>(16, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Titles> eldest) {
            return size() > MAX_ALBUMS;
        }
    };

    private AlbumPageGuard() {}

    /**
     * Whether the header with the bind number {@code mine} may scan the list that the header with the bind number
     * {@code owner} claimed before. The header that was bound last owns the list, unless the owner is gone.
     *
     * @param owner     The bind number of the owner, or a negative number when nobody owns the list.
     * @param ownerLive Whether the owner's header is still attached and shown.
     */
    static boolean mayScan(int mine, int owner, boolean ownerLive) {
        return owner < 0 || !ownerLive || mine >= owner;
    }

    /** The titles of an album, remembered for the whole process. Main thread only. */
    static Titles titlesOf(String albumId) {
        return titlesByAlbum.computeIfAbsent(albumId, id -> new Titles());
    }

    /**
     * The title each track number showed the first time the album's page was looked at. Album tracks do not change
     * their titles, so rows that show another title under a known number belong to another page (a list that is
     * reused for another album, a header that was bound again behind it): such a page is never marked.
     */
    static final class Titles {
        private final Map<Integer, String> byNumber = new HashMap<>();

        /**
         * Whether a row with this number and title can belong to the album. Everything fits while nothing is
         * known; once titles are known, a row must show the title it showed before, and a row whose title cannot
         * be read does not fit.
         */
        boolean fits(int number, @Nullable CharSequence title) {
            if (byNumber.isEmpty()) return true;
            if (title == null) return false;

            String known = byNumber.get(number);
            return known == null || known.contentEquals(title);
        }

        void remember(int number, @Nullable CharSequence title) {
            if (title != null) byNumber.putIfAbsent(number, title.toString());
        }
    }
}
