package nl.johninnl.eclipse.auto.ui;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Section formats are data, not code (design section 3.3). One table maps a section key to a
 * format per API level plus its item cap. Every API 9 format names its API 8 fallback in the same
 * entry, so changing how a section looks is a one-line edit here and can never leak an API 9
 * component to a level 8 host.
 */
public final class Presentation {
    /** How a section of tiles or rows is drawn. */
    public enum Format {
        GRID_SMALL(false), GRID_LARGE(false), GRID_XL(false), GRID_CIRCLE(false), ROWS(false),
        CONDENSED(true), SPOTLIGHT(true), BANNER(true);

        /** True for formats built from API 9 components. */
        public final boolean api9Only;

        Format(boolean api9Only) { this.api9Only = api9Only; }
    }

    /** One table entry: the preferred format at API 9, the format at API 8, and the item cap. */
    public static final class Entry {
        public final Format api9;
        public final Format api8;
        public final int cap;

        Entry(Format api9, Format api8, int cap) {
            if (api8.api9Only) throw new IllegalArgumentException("The API 8 fallback must not be an API 9 format: " + api8);
            this.api9 = api9;
            this.api8 = api8;
            this.cap = cap;
        }
    }

    /** What to draw at the negotiated level. */
    public static final class Resolved {
        public final Format format;
        public final int cap;

        Resolved(Format format, int cap) {
            this.format = format;
            this.cap = cap;
        }
    }

    private static Entry same(Format format, int cap) { return new Entry(format, format, cap); }

    /**
     * The one hard safety limit on a Home or Discover section: everything the feed sends is shown, and
     * only a feed that sends more than this is cut, silently (no "See all", no header target). It
     * exists so a runaway feed cannot build a template the host refuses, not to shape the page.
     */
    public static final int SECTION_CAP = 30;

    /** Search under "All" shows this many of each type; the type's own filter shows {@link #SEARCH_FILTERED}. */
    public static final int SEARCH_PER_TYPE = 10;
    public static final int SEARCH_FILTERED = 60;

    /** The format of one type of search result at either level: the same on API 8 and API 9. */
    public static Entry search(Format format, int cap) { return same(format, cap); }

    public static final Entry LIBRARY_FACETS = new Entry(Format.CONDENSED, Format.GRID_SMALL, 8);
    public static final Entry LIBRARY_PLAYLISTS = same(Format.GRID_LARGE, 12);
    public static final Entry RADIO_CATEGORIES = new Entry(Format.CONDENSED, Format.GRID_SMALL, 4);
    /** Facet screens: playlists and albums as large tiles. */
    public static final Entry FACET_GRID = same(Format.GRID_LARGE, 300);
    public static final Entry FACET_ARTISTS = same(Format.GRID_CIRCLE, 300);

    private static final Map<String, Entry> TABLE;
    static {
        Map<String, Entry> table = new LinkedHashMap<>();
        // The phone's recents: two columns of untitled small tiles (condensed items on API 9).
        table.put("home.recently_played", new Entry(Format.CONDENSED, Format.GRID_SMALL, SECTION_CAP));
        table.put("home.playlists", same(Format.GRID_LARGE, SECTION_CAP));
        table.put("home.albums", same(Format.GRID_LARGE, SECTION_CAP));
        table.put("home.mixes", same(Format.GRID_LARGE, SECTION_CAP));
        table.put("home.artists", same(Format.GRID_CIRCLE, SECTION_CAP));
        table.put("home.featured_artist", new Entry(Format.SPOTLIGHT, Format.GRID_CIRCLE, 1));
        // Songs rows (New For You, Popular Tracks, Trending on Eclipse ...) are large tiles with title and artist.
        table.put("home.tracks", same(Format.GRID_LARGE, SECTION_CAP));
        // Live stations: large tiles with the cover of the song on air.
        table.put("home.stations", same(Format.GRID_LARGE, SECTION_CAP));
        // Native cards: Made For You (Replay, All-Time Top Songs) and Your Shows.
        table.put("home.made_for_you", same(Format.GRID_LARGE, SECTION_CAP));
        table.put("home.shows", same(Format.GRID_LARGE, SECTION_CAP));
        // The Umbra DJ card: a banner on API 9, one row below.
        table.put("home.dj", new Entry(Format.BANNER, Format.ROWS, 1));
        table.put("discover.cards", same(Format.GRID_LARGE, SECTION_CAP));
        // Discover's hero: a spotlight with its songs on API 9, one card row and the songs below.
        table.put("discover.hero", new Entry(Format.SPOTLIGHT, Format.ROWS, SECTION_CAP));
        table.put("library.facets", LIBRARY_FACETS);
        table.put("library.playlists", LIBRARY_PLAYLISTS);
        table.put("radio.categories", RADIO_CATEGORIES);
        TABLE = Collections.unmodifiableMap(table);
    }

    /** The table entry for a section key; unknown keys render as large tiles. */
    public static Entry forKey(String key) {
        Entry entry = TABLE.get(key);
        return entry != null ? entry : same(Format.GRID_LARGE, SECTION_CAP);
    }

    /** Every key in the table, for tests. */
    static Map<String, Entry> table() { return TABLE; }

    public static Resolved resolve(Entry entry, boolean api9) {
        return new Resolved(api9 ? entry.api9 : entry.api8, entry.cap);
    }

    /**
     * Whether browsing screens carry {@code Action.MEDIA_PLAYBACK} as a template action. Google's
     * guide says the host surfaces it as the minimized control panel at API 9 too. If DriveDeck
     * draws a second panel, switch the API 9 value here and nowhere else.
     */
    public static boolean showPlaybackAction(boolean api9) { return api9 ? PLAYBACK_ACTION_API9 : PLAYBACK_ACTION_API8; }

    static final boolean PLAYBACK_ACTION_API8 = true;
    static final boolean PLAYBACK_ACTION_API9 = true;

    private Presentation() { }
}
