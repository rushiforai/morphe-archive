package app.kyt.extension.rym;

import android.net.Uri;

/**
 * A search on RateYourMusic, shown as an option when the menu item is pressed.
 */
final class RymSearch {
    /**
     * Search types of the RateYourMusic search page.
     */
    static final String TYPE_ARTIST = "a";
    static final String TYPE_RELEASE = "l";
    static final String TYPE_SONG = "z";

    private static final String SEARCH_URL = "https://rateyourmusic.com/search?searchterm=%s&searchtype=%s";

    /**
     * Text shown in the list of searches, such as "Song: Bajan".
     */
    final String label;

    /**
     * Address of the RateYourMusic search page.
     */
    final String url;

    /**
     * @param labelPrefix Kind of search shown before the query, such as "Song".
     * @param query       What to search for, such as the name of the song.
     * @param searchType  One of the TYPE_ constants.
     */
    RymSearch(String labelPrefix, String query, String searchType) {
        this.label = labelPrefix + ": " + query;
        // Uri.encode() escapes characters that are not allowed in an address,
        // such as spaces (%20) and accented letters (á is %C3%A1).
        this.url = String.format(SEARCH_URL, Uri.encode(query), searchType);
    }
}
