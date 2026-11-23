package nl.johninnl.eclipse.auto.data;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Plain models the screens and stores work with. Anything that belongs to the app (a song, a
 * playlist, a station, a queue origin) travels as an opaque {@code Object}: only
 * {@code app/AppBridge} knows its real type.
 */
public final class Model {
    /**
     * One song. It is playable when it carries the app's song, or a compose-feed entry the bridge
     * turns into one when it is played. A history entry with neither must first be resolved.
     */
    public static final class Track {
        public final Object song;
        /** The raw compose-feed JSON of a track that has not been turned into the app's song yet, or null. */
        public final String deferredJson;
        /** The history entry an unresolved recent song stands for, or null. */
        public final HistoryEntry history;
        public final String title;
        public final String artist;
        public final String album;
        public final String artUrl;
        /**
         * The linked track id ({@code linked_ytmusic_...}) of a deferred track that comes from a linked
         * service: the app's own song builder needs it to play the track. Null for every other track.
         */
        public final String linkedId;
        /** The explicit flag that goes with {@link #linkedId}. */
        public final boolean explicit;

        private Track(Object song, String deferredJson, HistoryEntry history, String title, String artist, String album, String artUrl,
                      String linkedId, boolean explicit) {
            this.song = song;
            this.deferredJson = deferredJson;
            this.history = history;
            this.title = title == null ? "" : title;
            this.artist = artist == null ? "" : artist;
            this.album = album == null ? "" : album;
            this.artUrl = artUrl;
            this.linkedId = linkedId;
            this.explicit = explicit;
        }

        /** A song the app already holds. */
        public Track(Object song, String title, String artist, String album, String artUrl) {
            this(song, null, null, title, artist, album, artUrl, null, false);
        }

        /** A compose-feed track, converted by the app's own parser when it is played. */
        public static Track deferred(String json, String title, String artist, String album, String artUrl) {
            return new Track(null, json, null, title, artist, album, artUrl, null, false);
        }

        /** A compose-feed track of a linked service: converted like {@link #deferred} but played under its linked id. */
        public static Track deferredLinked(String json, String title, String artist, String album, String artUrl, String linkedId,
                                           boolean explicit) {
            return new Track(null, json, null, title, artist, album, artUrl, linkedId, explicit);
        }

        /** A history entry with no library song behind it; playing it searches the catalogue. */
        public static Track unresolved(HistoryEntry entry) {
            return new Track(null, null, entry, entry.title, entry.artist, "", entry.artUrl, null, false);
        }

        public boolean isPlayable() { return song != null || deferredJson != null; }
    }

    /** One play-history entry; it only carries text, so it must be matched to a library song. */
    public static final class HistoryEntry {
        public final String title;
        public final String artist;
        public final String artUrl;

        public HistoryEntry(String title, String artist) { this(title, artist, null); }

        public HistoryEntry(String title, String artist, String artUrl) {
            this.title = title == null ? "" : title;
            this.artist = artist == null ? "" : artist;
            this.artUrl = artUrl;
        }
    }

    /** A library playlist, album or artist the store can open. */
    public static final class Ref {
        public final Object ref;
        public final String id;
        public final String title;
        public final String subtitle;
        public final String artUrl;

        public Ref(Object ref, String id, String title, String subtitle, String artUrl) {
            this.ref = ref;
            this.id = id == null ? "" : id;
            this.title = title == null ? "" : title;
            this.subtitle = subtitle == null ? "" : subtitle;
            this.artUrl = artUrl;
        }
    }

    /** One algorithmic radio station. */
    public static final class Station {
        public final Object station;
        public final String name;
        public final String description;
        public final String category;

        public Station(Object station, String name, String description, String category) {
            this.station = station;
            this.name = name == null ? "" : name;
            this.description = description == null ? "" : description;
            this.category = category == null ? "" : category;
        }
    }

    /** One live station with what it is playing now. */
    public static final class LiveStation {
        public final String id;
        public final String name;
        public final String description;
        public final String nowTitle;
        public final String nowArtist;
        public final String coverUrl;

        public LiveStation(String id, String name, String description, String nowTitle, String nowArtist, String coverUrl) {
            this.id = id == null ? "" : id;
            this.name = name == null ? "" : name;
            this.description = description == null ? "" : description;
            this.nowTitle = nowTitle == null ? "" : nowTitle;
            this.nowArtist = nowArtist == null ? "" : nowArtist;
            this.coverUrl = coverUrl;
        }

        /** "LIVE · {title} – {artist}", or just "LIVE" while nothing is known. */
        public String nowPlaying() {
            if (nowTitle.isEmpty()) return "LIVE";
            return nowArtist.isEmpty() ? "LIVE · " + nowTitle : "LIVE · " + nowTitle + " – " + nowArtist;
        }
    }

    /** A radio category (genre, mood, decade, activity). */
    public static final class Category {
        public final String key;
        public final String name;

        public Category(String key, String name) {
            this.key = key == null ? "" : key;
            this.name = name == null ? "" : name;
        }
    }

    /** Resolves the screen a tile opens. Cheap; a collection that must be fetched comes back deferred. */
    public interface Opener {
        Collection open();
    }

    /** Receives a fetched collection, or its failure. Always called on the main thread. */
    public interface LoadCallback {
        void loaded(Collection collection);

        void failed();
    }

    /** Fetches a collection from the catalogue; the call returns at once and the callback follows. */
    public interface Loader {
        void load(LoadCallback callback);
    }

    /** A tile that opens a collection screen. */
    public static final class Tile {
        public final String title;
        public final String subtitle;
        public final String artUrl;
        /** Bundled icon name, or null when {@link #artUrl} is the image. */
        public final String icon;
        /** True when the icon is tinted with the accent colour on hosts that support it. */
        public final boolean accent;
        /** What a tap opens; null for a tile that cannot be opened (it is drawn without a tap target). */
        public final Opener opener;
        /** What a spotlight's "Play top songs" does; null for every other tile. */
        public final Loader playLoader;
        /**
         * What the tile opens, as a stable (type, key) pair the classic browse tree turns into a media
         * id and back: album, artist, playlist, editorial, favorites, mix or card. Null for tiles that
         * have no stable identity (they are left out of the classic tree).
         */
        public final String type;
        public final String key;

        public Tile(String title, String subtitle, String artUrl, String icon, Opener opener) {
            this(title, subtitle, artUrl, icon, false, opener, null);
        }

        public Tile(String title, String subtitle, String artUrl, String icon, boolean accent, Opener opener, Loader playLoader) {
            this(title, subtitle, artUrl, icon, accent, opener, playLoader, null, null);
        }

        private Tile(String title, String subtitle, String artUrl, String icon, boolean accent, Opener opener, Loader playLoader,
                     String type, String key) {
            this.title = title == null ? "" : title;
            this.subtitle = subtitle == null ? "" : subtitle;
            this.artUrl = artUrl;
            this.icon = icon;
            this.accent = accent;
            this.opener = opener;
            this.playLoader = playLoader;
            this.type = type;
            this.key = key;
        }

        /** The same tile with a stable identity. */
        public Tile withKey(String type, String key) {
            return new Tile(title, subtitle, artUrl, icon, accent, opener, playLoader, type, key);
        }

        /** True when a tap opens something. */
        public boolean enabled() { return opener != null; }
    }

    /** A podcast show the user follows; {@code show} is the app's own object. */
    public static final class Show {
        public final Object show;
        public final String id;
        public final String title;
        public final String author;
        public final String artUrl;

        public Show(Object show, String id, String title, String author, String artUrl) {
            this.show = show;
            this.id = id == null ? "" : id;
            this.title = title == null ? "" : title;
            this.author = author == null ? "" : author;
            this.artUrl = artUrl;
        }
    }

    /** The listening replay of the current month (or year) as the app holds it right now. */
    public static final class Replay {
        /** 1 to 12, or 0 when the summary is not for a single month. */
        public final int month;
        /** True when the summary has listening in it (the phone shows "Building your replay…" until then). */
        public final boolean hasContent;
        /** The listening time as the app words it ("3h 12m"), or null. */
        public final String listened;
        public final List<Track> tracks;

        public Replay(int month, boolean hasContent, String listened, List<Track> tracks) {
            this.month = month;
            this.hasContent = hasContent;
            this.listened = listened;
            this.tracks = Collections.unmodifiableList(new ArrayList<>(tracks));
        }

        /** True when there is something to open: listening and songs. */
        public boolean ready() { return hasContent && !tracks.isEmpty(); }
    }

    /** A titled group of tiles below a collection's songs (an artist's albums and singles). */
    public static final class TileGroup {
        public final String title;
        public final List<Tile> tiles;

        public TileGroup(String title, List<Tile> tiles) {
            this.title = title == null ? "" : title;
            this.tiles = Collections.unmodifiableList(new ArrayList<>(tiles));
        }
    }

    /** What a collection screen lists. */
    public enum Kind { TRACKS, PLAYLISTS, ALBUMS, ARTISTS, STATIONS }

    /** A screen's worth of content: songs, tiles that open other collections, or stations. */
    public static final class Collection {
        public final String title;
        public final String subtitle;
        public final String artUrl;
        public final Kind kind;
        public final List<Track> tracks;
        public final List<Tile> tiles;
        /** Heading of {@link #tiles} when they sit below the songs (an artist's albums). */
        public final String tilesTitle;
        /** Further groups of tiles below {@link #tiles} (an artist's singles). */
        public final List<TileGroup> moreGroups;
        public final List<Station> stations;
        /** The queue origin songs are played under (an opaque app object), or null. */
        public final Object origin;
        /** True for long alphabetical lists the host should index. */
        public final boolean indexed;
        /** Non-null while the contents still have to be fetched; the screen shows a spinner and asks it. */
        public final Loader loader;

        private Collection(String title, String subtitle, String artUrl, Kind kind, List<Track> tracks, List<Tile> tiles,
                           String tilesTitle, List<TileGroup> moreGroups, List<Station> stations, Object origin, boolean indexed,
                           Loader loader) {
            this.title = title == null ? "" : title;
            this.subtitle = subtitle == null ? "" : subtitle;
            this.artUrl = artUrl;
            this.kind = kind;
            this.tracks = Collections.unmodifiableList(new ArrayList<>(tracks));
            this.tiles = Collections.unmodifiableList(new ArrayList<>(tiles));
            this.tilesTitle = tilesTitle;
            this.moreGroups = Collections.unmodifiableList(new ArrayList<>(moreGroups));
            this.stations = Collections.unmodifiableList(new ArrayList<>(stations));
            this.origin = origin;
            this.indexed = indexed;
            this.loader = loader;
        }

        public static Collection ofTracks(String title, String subtitle, String artUrl, List<Track> tracks, Object origin,
                                          boolean indexed) {
            return new Collection(title, subtitle, artUrl, Kind.TRACKS, tracks, Collections.<Tile>emptyList(), null,
                Collections.<TileGroup>emptyList(), Collections.<Station>emptyList(), origin, indexed, null);
        }

        /** Songs with a grid of related collections below (an artist's songs and albums). */
        public static Collection ofTracksAndTiles(String title, String subtitle, String artUrl, List<Track> tracks,
                                                  String tilesTitle, List<Tile> tiles, Object origin) {
            return ofTracksAndGroups(title, subtitle, artUrl, tracks, tilesTitle, tiles, Collections.<TileGroup>emptyList(), origin);
        }

        public static Collection ofTracksAndGroups(String title, String subtitle, String artUrl, List<Track> tracks,
                                                   String tilesTitle, List<Tile> tiles, List<TileGroup> moreGroups, Object origin) {
            return new Collection(title, subtitle, artUrl, Kind.TRACKS, tracks, tiles, tilesTitle, moreGroups,
                Collections.<Station>emptyList(), origin, false, null);
        }

        public static Collection ofTiles(String title, Kind kind, List<Tile> tiles) {
            return new Collection(title, "", null, kind, Collections.<Track>emptyList(), tiles, null,
                Collections.<TileGroup>emptyList(), Collections.<Station>emptyList(), null, false, null);
        }

        public static Collection ofStations(String title, List<Station> stations) {
            return new Collection(title, "", null, Kind.STATIONS, Collections.<Track>emptyList(),
                Collections.<Tile>emptyList(), null, Collections.<TileGroup>emptyList(), stations, null, false, null);
        }

        /** A collection whose contents are fetched when its screen opens. */
        public static Collection deferred(String title, String subtitle, String artUrl, Loader loader) {
            return new Collection(title, subtitle, artUrl, Kind.TRACKS, Collections.<Track>emptyList(),
                Collections.<Tile>emptyList(), null, Collections.<TileGroup>emptyList(), Collections.<Station>emptyList(),
                null, false, loader);
        }
    }

    /** What the catalogue loaders hand back for an album or editorial playlist. */
    public static final class Loaded {
        public final String title;
        public final String subtitle;
        public final String artUrl;
        public final List<Track> tracks;
        public final Object origin;

        public Loaded(String title, String subtitle, String artUrl, List<Track> tracks, Object origin) {
            this.title = title;
            this.subtitle = subtitle;
            this.artUrl = artUrl;
            this.tracks = tracks;
            this.origin = origin;
        }
    }

    /** An album as the catalogue names it; {@code canonical} is the app's own object when one exists. */
    public static final class AlbumRef {
        public final String id;
        public final String title;
        public final String artist;
        public final String artUrl;
        public final String releaseDate;
        public final Integer trackCount;
        public final String genre;
        public final Boolean explicit;
        public final Object canonical;

        public AlbumRef(String id, String title, String artist, String artUrl, String releaseDate, Integer trackCount,
                        String genre, Boolean explicit, Object canonical) {
            this.id = id == null ? "" : id;
            this.title = title == null ? "" : title;
            this.artist = artist == null ? "" : artist;
            this.artUrl = artUrl;
            this.releaseDate = releaseDate;
            this.trackCount = trackCount;
            this.genre = genre;
            this.explicit = explicit;
            this.canonical = canonical;
        }
    }

    /** What the artist loader hands back. */
    public static final class ArtistPage {
        public final String name;
        public final String imageUrl;
        public final List<Track> topSongs;
        public final List<AlbumRef> albums;
        public final List<AlbumRef> singles;

        public ArtistPage(String name, String imageUrl, List<Track> topSongs, List<AlbumRef> albums, List<AlbumRef> singles) {
            this.name = name;
            this.imageUrl = imageUrl;
            this.topSongs = topSongs;
            this.albums = albums;
            this.singles = singles;
        }
    }

    /** One result of the app's own car search. */
    public static final class SearchResult {
        /** The app's media item, kept to play the result. */
        public final Object handle;
        public final String mediaId;
        public final String title;
        public final String subtitle;
        public final String artUrl;
        public final boolean browsable;

        public SearchResult(Object handle, String mediaId, String title, String subtitle, String artUrl, boolean browsable) {
            this.handle = handle;
            this.mediaId = mediaId == null ? "" : mediaId;
            this.title = title == null ? "" : title;
            this.subtitle = subtitle == null ? "" : subtitle;
            this.artUrl = artUrl;
            this.browsable = browsable;
        }
    }

    /** An installed addon that can search: what the phone's Search screen lists in its provider dropdown. */
    public static final class SearchProvider {
        public final String id;
        public final String name;

        public SearchProvider(String id, String name) {
            this.id = id == null ? "" : id;
            this.name = name == null || name.trim().isEmpty() ? this.id : name;
        }
    }

    /** One album, artist or playlist a provider's search found; opening it goes through the app's own loader. */
    public static final class SearchHit {
        public enum Kind { ALBUM, ARTIST, PLAYLIST }

        public final Kind kind;
        public final String providerId;
        /** The provider's own id (not prefixed). */
        public final String id;
        public final String title;
        /** The artist of an album, the creator of a playlist; empty for an artist. */
        public final String subtitle;
        public final String artUrl;

        public SearchHit(Kind kind, String providerId, String id, String title, String subtitle, String artUrl) {
            this.kind = kind;
            this.providerId = providerId == null ? "" : providerId;
            this.id = id == null ? "" : id;
            this.title = title == null ? "" : title;
            this.subtitle = subtitle == null ? "" : subtitle;
            this.artUrl = artUrl;
        }
    }

    /**
     * What one search answered: the provider's songs, albums, artists and playlists, or (when no
     * provider could answer) the app's own library search, which is then labelled "From your library".
     */
    public static final class Found {
        public static final Found NONE = new Found(Collections.<Track>emptyList(), Collections.<SearchHit>emptyList(),
            Collections.<SearchHit>emptyList(), Collections.<SearchHit>emptyList(), null, null);

        public final List<Track> tracks;
        public final List<SearchHit> albums;
        public final List<SearchHit> artists;
        public final List<SearchHit> playlists;
        /** The app's library results; non-null exactly when this answer is the library fallback. */
        public final List<SearchResult> library;
        /** Why the library answered instead of a provider (shown under the label), or null. */
        public final String note;

        private Found(List<Track> tracks, List<SearchHit> albums, List<SearchHit> artists, List<SearchHit> playlists,
                      List<SearchResult> library, String note) {
            this.tracks = Collections.unmodifiableList(new ArrayList<>(tracks));
            this.albums = Collections.unmodifiableList(new ArrayList<>(albums));
            this.artists = Collections.unmodifiableList(new ArrayList<>(artists));
            this.playlists = Collections.unmodifiableList(new ArrayList<>(playlists));
            this.library = library == null ? null : Collections.unmodifiableList(new ArrayList<>(library));
            this.note = note;
        }

        public static Found ofProvider(List<Track> tracks, List<SearchHit> albums, List<SearchHit> artists, List<SearchHit> playlists) {
            return new Found(tracks, albums, artists, playlists, null, null);
        }

        public static Found ofLibrary(List<SearchResult> results, String note) {
            return new Found(Collections.<Track>emptyList(), Collections.<SearchHit>emptyList(), Collections.<SearchHit>emptyList(),
                Collections.<SearchHit>emptyList(), results, note);
        }

        public boolean fromLibrary() { return library != null; }

        public boolean isEmpty() {
            return library != null ? library.isEmpty()
                : tracks.isEmpty() && albums.isEmpty() && artists.isEmpty() && playlists.isEmpty();
        }
    }

    /**
     * What a compose request needs. The token exists only in memory, only for the request, and is
     * never logged, cached or written: {@link #toString()} redacts it.
     */
    public static final class ComposeAuth {
        private final String token;
        public final String deviceId;
        /** The storefront query value; "auto" means the parameter is omitted. */
        public final String storefront;
        /** Identifies the account and storefront in cache keys; carries no secret. */
        public final String accountKey;

        public ComposeAuth(String token, String deviceId, String storefront, String accountKey) {
            this.token = token == null || token.isEmpty() ? null : token;
            this.deviceId = deviceId == null || deviceId.isEmpty() ? "android_unknown" : deviceId;
            this.storefront = storefront == null || storefront.isEmpty() ? "auto" : storefront;
            this.accountKey = accountKey == null ? "" : accountKey;
        }

        public boolean signedIn() { return token != null; }

        /** The bearer token for one request. Never store or print the result. */
        public String bearer() { return token; }

        @Override public String toString() { return "ComposeAuth[" + (token == null ? "signed out" : "token redacted") + "]"; }
    }

    /** How one Home or Discover block is drawn. */
    public static final class Section {
        public enum Type { TILES, TRACKS, STATIONS, SPOTLIGHT, HERO, DJ }

        public final Type type;
        public final String key;
        /** The title shown above the block; empty for a block that is drawn without one (the recents). */
        public final String title;
        /** Key into {@code Presentation} for the format and cap. */
        public final String presentationKey;
        /** First text under the title on API 9 (a discover card's first signal), or null. */
        public final String subtitle;
        public final List<Tile> tiles;
        public final List<Track> tracks;
        /** The queue origin the row's songs play under. */
        public final Object origin;
        public final List<LiveStation> stations;
        /** The featured artist or hero card behind a {@link Type#SPOTLIGHT} or {@link Type#HERO} block. */
        public final Tile feature;
        /** For {@link Type#DJ}: true while the DJ is running. */
        public final boolean active;

        private Section(Type type, String key, String title, String presentationKey, String subtitle, List<Tile> tiles,
                        List<Track> tracks, Object origin, List<LiveStation> stations, Tile feature, boolean active) {
            this.type = type;
            this.key = key;
            this.title = title == null ? "" : title;
            this.presentationKey = presentationKey;
            this.subtitle = subtitle;
            this.tiles = Collections.unmodifiableList(new ArrayList<>(tiles));
            this.tracks = Collections.unmodifiableList(new ArrayList<>(tracks));
            this.origin = origin;
            this.stations = Collections.unmodifiableList(new ArrayList<>(stations));
            this.feature = feature;
            this.active = active;
        }

        /** A name for the block even when it is drawn without a title: the classic tree groups by it. */
        public String label() {
            if (!title.isEmpty()) return title;
            String label = HomeLayout.defaultLabel(key);
            return label != null ? label : key;
        }

        public static Section tiles(String key, String title, String presentationKey, String subtitle, List<Tile> tiles) {
            return new Section(Type.TILES, key, title, presentationKey, subtitle, tiles, Collections.<Track>emptyList(), null,
                Collections.<LiveStation>emptyList(), null, false);
        }

        /** A row of songs, drawn as large tiles that each play the row from their song. */
        public static Section tracks(String key, String title, List<Track> tracks, Object origin) {
            return new Section(Type.TRACKS, key, title, "home.tracks", null, Collections.<Tile>emptyList(), tracks, origin,
                Collections.<LiveStation>emptyList(), null, false);
        }

        public static Section stations(String key, String title, List<LiveStation> stations) {
            return new Section(Type.STATIONS, key, title, "home.stations", null, Collections.<Tile>emptyList(),
                Collections.<Track>emptyList(), null, stations, null, false);
        }

        /** The featured artist: a spotlight on API 9, a one-tile circle grid below. */
        public static Section spotlight(String key, String title, Tile artist) {
            return new Section(Type.SPOTLIGHT, key, title, "home.featured_artist", null, Collections.singletonList(artist),
                Collections.<Track>emptyList(), null, Collections.<LiveStation>emptyList(), artist, false);
        }

        /** Discover's hero: one card with its songs (a spotlight on API 9, rows below). */
        public static Section hero(String key, String title, Tile card, List<Track> tracks, Object origin) {
            return new Section(Type.HERO, key, title, "discover.hero", null, Collections.<Tile>emptyList(), tracks, origin,
                Collections.<LiveStation>emptyList(), card, false);
        }

        /** The Umbra DJ card: a banner on API 9, a row below. */
        public static Section dj(String key, String title, boolean active) {
            return new Section(Type.DJ, key, title, "home.dj", null, Collections.<Tile>emptyList(), Collections.<Track>emptyList(),
                null, Collections.<LiveStation>emptyList(), null, active);
        }
    }

    /**
     * The queue as the app holds it right now: the context queue with the current index, the
     * user-queued songs and the context tail, all as opaque songs wrapped in tracks.
     */
    public static final class QueueSnapshot {
        public final Track nowPlaying;
        public final List<Track> upNext;
        public final List<Track> tail;
        /** The app's whole context queue, used to find a tail song's absolute position. */
        public final List<Object> contextSongs;
        public final int currentIndex;
        public final String originName;
        public final boolean remoteSession;

        public QueueSnapshot(Track nowPlaying, List<Track> upNext, List<Track> tail, List<Object> contextSongs,
                             int currentIndex, String originName, boolean remoteSession) {
            this.nowPlaying = nowPlaying;
            this.upNext = Collections.unmodifiableList(new ArrayList<>(upNext));
            this.tail = Collections.unmodifiableList(new ArrayList<>(tail));
            this.contextSongs = Collections.unmodifiableList(new ArrayList<>(contextSongs));
            this.currentIndex = currentIndex;
            this.originName = originName == null ? "" : originName;
            this.remoteSession = remoteSession;
        }

        public static QueueSnapshot empty() {
            return new QueueSnapshot(null, Collections.<Track>emptyList(), Collections.<Track>emptyList(),
                Collections.emptyList(), -1, "", false);
        }
    }

    private Model() { }
}
