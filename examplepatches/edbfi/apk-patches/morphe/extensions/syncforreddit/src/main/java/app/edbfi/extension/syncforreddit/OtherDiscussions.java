// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

/** Turns the app's "Other discussions" listing into a Reddit search for the link. */
public final class OtherDiscussions {
    private static final String SEEN = "seen###";
    // The app's search key with no subreddit: search###<subreddit>###<query>.
    private static final String SEARCH = "search######url:";

    private OtherDiscussions() {}

    /**
     * Called with each listing key the posts URL builder gets. {@code seen###<link>}, whose link the app URL-encoded,
     * becomes the search {@code url:<link>}, still encoded once; every other key is returned as it was.
     */
    public static String asSearch(String key) {
        if (key == null || !key.regionMatches(true, 0, SEEN, 0, SEEN.length())) return key;
        String link = key.substring(SEEN.length());
        return link.isEmpty() ? key : SEARCH + link;
    }
}
