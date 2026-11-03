package app.kyt.extension.rym;

import android.util.Log;

import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("unused")
public final class RateYourMusicPatch {
    static final String TAG = "KYT";

    private static final String MENU_ITEM_TITLE = "Search on Rate Your Music";
    private static final String MENU_ITEM_ID = "kyt_search_rateyourmusic";

    /**
     * Same value the TIDAL menu items use.
     */
    private static final int MENU_ITEM_DEFAULTS_MASK = 0x50;

    /**
     * Injection point.
     * Called right before the track context menu returns the list of its items.
     *
     * @param items The menu items that are about to be shown.
     * @param track The track the menu was opened for.
     * @return The menu items to show instead.
     */
    public static List<Object> onTrackMenuItems(List<Object> items, Object track) {
        try {
            Object album = callGetter(track, "getAlbum");
            Object artist = callGetter(track, "getMainArtist");

            List<RymSearch> searches = new ArrayList<>();
            addSearch(searches, "Song", callStringGetter(track, "getTitle"), RymSearch.TYPE_SONG);
            addSearch(searches, "Release", callStringGetter(album, "getTitle"), RymSearch.TYPE_RELEASE);
            addSearch(searches, "Artist", callStringGetter(artist, "getName"), RymSearch.TYPE_ARTIST);

            return withMenuItem(items, "track", track, searches);
        } catch (Throwable ex) {
            // Never crash TIDAL because of this patch. Throwable instead of Exception also catches
            // errors such as VerifyError, if the menu item class was not set up correctly by the patch.
            Log.e(TAG, "onTrackMenuItems failure", ex);
            return items;
        }
    }

    /**
     * Injection point.
     * Called right before the album context menu returns the list of its items.
     *
     * @param items The menu items that are about to be shown.
     * @param album The album the menu was opened for.
     * @return The menu items to show instead.
     */
    public static List<Object> onAlbumMenuItems(List<Object> items, Object album) {
        try {
            Object artist = callGetter(album, "getMainArtist");

            List<RymSearch> searches = new ArrayList<>();
            addSearch(searches, "Release", callStringGetter(album, "getTitle"), RymSearch.TYPE_RELEASE);
            addSearch(searches, "Artist", callStringGetter(artist, "getName"), RymSearch.TYPE_ARTIST);

            return withMenuItem(items, "album", album, searches);
        } catch (Throwable ex) {
            Log.e(TAG, "onAlbumMenuItems failure", ex);
            return items;
        }
    }

    /**
     * Injection point.
     * Called right after the artist context menu creates the list of all its possible items.
     * The menu filters the list later, such as to show either "Follow" or "Unfollow".
     *
     * @param items  All possible menu items.
     * @param artist The artist the menu was opened for.
     */
    public static void onArtistMenuItems(List<Object> items, Object artist) {
        try {
            // A single search, so pressing the menu item opens it directly without a dialog.
            List<RymSearch> searches = new ArrayList<>();
            addSearch(searches, "Artist", callStringGetter(artist, "getName"), RymSearch.TYPE_ARTIST);
            if (searches.isEmpty()) return;

            // The menu keeps this list in a field and filters it later,
            // so the item must be added to this same list. It is an ArrayList, which can be changed.
            items.add(createMenuItem("artist", artist, searches));
        } catch (Throwable ex) {
            Log.e(TAG, "onArtistMenuItems failure", ex);
        }
    }

    /**
     * @return A copy of the menu items with the RateYourMusic menu item at the end,
     * or the same menu items if there is nothing to search.
     * A copy is returned because the menu items can be an unmodifiable list,
     * such as a list created with listOf() in Kotlin.
     */
    private static List<Object> withMenuItem(List<Object> items, String contentType, Object content, List<RymSearch> searches) {
        if (searches.isEmpty()) return items;

        List<Object> itemsWithMenuItem = new ArrayList<>(items);
        itemsWithMenuItem.add(createMenuItem(contentType, content, searches));
        return itemsWithMenuItem;
    }

    /**
     * Adds a search to the list, unless the query is empty, such as a track without an album.
     */
    private static void addSearch(List<RymSearch> searches, String labelPrefix, String query, String searchType) {
        if (!query.isEmpty()) {
            searches.add(new RymSearch(labelPrefix, query, searchType));
        }
    }

    /**
     * @param contentType Kind of content the menu was opened for, used by TIDAL for event tracking.
     * @param content     The track, album or artist the menu was opened for.
     */
    private static RymMenuItem createMenuItem(String contentType, Object content, List<RymSearch> searches) {
        return new RymMenuItem(
                TidalObjects.createTitle(MENU_ITEM_TITLE),
                TidalObjects.getIconResId(),
                MENU_ITEM_ID,
                TidalObjects.createContentMetadata(contentType, callStringGetter(content, "getId")),
                0,
                TidalObjects.getColorResId(),
                0,
                MENU_ITEM_DEFAULTS_MASK,
                MENU_ITEM_TITLE,
                searches
        );
    }

    /**
     * Calls a public getter without parameters, such as Track.getAlbum().
     * The TIDAL model classes are not obfuscated, so their getters keep their names.
     *
     * @return The value, or null if the object is null or the getter cannot be called.
     */
    private static Object callGetter(Object object, String getterName) {
        if (object == null) return null;

        try {
            return object.getClass().getMethod(getterName).invoke(object);
        } catch (Exception ex) {
            Log.e(TAG, "Could not call " + getterName, ex);
            return null;
        }
    }

    /**
     * Same as {@link #callGetter(Object, String)}, but returns the value as a String.
     *
     * @return The value as a String without surrounding spaces, or an empty String if it is null.
     */
    private static String callStringGetter(Object object, String getterName) {
        Object value = callGetter(object, getterName);
        return value == null ? "" : value.toString().trim();
    }
}
