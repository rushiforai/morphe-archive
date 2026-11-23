package nl.johninnl.eclipse.auto.data;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * The Library destination: facets, recents and playlists, all read from the app's local stores,
 * so it is instant and works offline. A tile's {@link Model.Opener} resolves its collection when
 * the driver taps it.
 */
public final class LibraryStore {
    /** Recently played rows shown under the facets. */
    public static final int RECENT_ROWS = 10;
    /** Songs in the Recent facet. */
    public static final int RECENT_FACET = 30;
    /** Playlist tiles shown under the facets before "See all". */
    public static final int PLAYLIST_TILES = 12;
    /** Items one facet screen lists before the cap applies (design section 3.3). */
    public static final int LIST_CAP = 300;

    /** The library facets, in display order. */
    public enum Facet {
        PLAYLISTS("Playlists", "facet_playlists"),
        ALBUMS("Albums", "facet_albums"),
        ARTISTS("Artists", "facet_artists"),
        SONGS("Songs", "facet_songs"),
        FAVORITES("Favorites", "facet_favorites"),
        DOWNLOADS("Downloads", "facet_downloads"),
        RECENT("Recent", "facet_recent"),
        CLOUD("Cloud", "facet_cloud");

        public final String title;
        public final String icon;

        Facet(String title, String icon) {
            this.title = title;
            this.icon = icon;
        }
    }

    /** What the Library destination shows. */
    public static final class View {
        public final List<Model.Tile> facets;
        public final List<Model.Track> recents;
        public final Model.Tile recentFacet;
        public final List<Model.Tile> playlists;
        /** Opens the full Playlists facet; null when every playlist is already shown. */
        public final Model.Tile morePlaylists;

        View(List<Model.Tile> facets, List<Model.Track> recents, Model.Tile recentFacet, List<Model.Tile> playlists,
             Model.Tile morePlaylists) {
            this.facets = Collections.unmodifiableList(facets);
            this.recents = Collections.unmodifiableList(recents);
            this.recentFacet = recentFacet;
            this.playlists = Collections.unmodifiableList(playlists);
            this.morePlaylists = morePlaylists;
        }
    }

    private final AppPort app;

    public LibraryStore(AppPort app) { this.app = app; }

    public View view() {
        List<Model.Track> songs = app.librarySongs();
        List<Model.Track> recents = recents(songs, app.history(), RECENT_FACET);
        List<Model.Ref> playlists = app.playlists();
        List<Model.Tile> facets = new ArrayList<>();
        Model.Tile recentFacet = null;
        for (final Facet facet : Facet.values()) {
            int count;
            switch (facet) {
                case PLAYLISTS: count = playlists.size(); break;
                case ALBUMS: count = app.albums().size(); break;
                case ARTISTS: count = app.artists().size(); break;
                case SONGS: count = songs.size(); break;
                case FAVORITES: count = app.favorites().size(); break;
                case DOWNLOADS: count = app.downloadsCount(); break;
                case RECENT: count = recents.size(); break;
                default: count = app.cloudSongs().size(); break;
            }
            if (facet == Facet.CLOUD && count == 0) continue;
            Model.Tile tile = new Model.Tile(facet.title, String.valueOf(count), null, facet.icon, new Model.Opener() {
                @Override public Model.Collection open() { return LibraryStore.this.open(facet); }
            }).withKey("facet", facet.name());
            facets.add(tile);
            if (facet == Facet.RECENT) recentFacet = tile;
        }
        List<Model.Tile> playlistTiles = new ArrayList<>();
        for (int i = 0; i < playlists.size() && i < PLAYLIST_TILES; i++) playlistTiles.add(playlistTile(playlists.get(i)));
        Model.Tile more = playlists.size() > PLAYLIST_TILES ? new Model.Tile("See all", "", null, "see_all", new Model.Opener() {
            @Override public Model.Collection open() { return LibraryStore.this.open(Facet.PLAYLISTS); }
        }) : null;
        return new View(facets, recents.subList(0, Math.min(RECENT_ROWS, recents.size())), recentFacet, playlistTiles, more);
    }

    /** The collection behind one facet tile. */
    public Model.Collection open(Facet facet) {
        switch (facet) {
            case PLAYLISTS: {
                List<Model.Tile> tiles = new ArrayList<>();
                for (Model.Ref ref : app.playlists()) tiles.add(playlistTile(ref));
                return Model.Collection.ofTiles(facet.title, Model.Kind.PLAYLISTS, tiles);
            }
            case ALBUMS: {
                List<Model.Tile> tiles = new ArrayList<>();
                for (Model.Ref ref : app.albums()) tiles.add(albumTile(ref));
                return Model.Collection.ofTiles(facet.title, Model.Kind.ALBUMS, tiles);
            }
            case ARTISTS: {
                List<Model.Tile> tiles = new ArrayList<>();
                for (Model.Ref ref : app.artists()) tiles.add(artistTile(ref));
                return Model.Collection.ofTiles(facet.title, Model.Kind.ARTISTS, tiles);
            }
            case SONGS: return songsOf(facet, app.librarySongs(), app.libraryOrigin(), true);
            case FAVORITES: return songsOf(facet, app.favorites(), app.playlistOrigin("favorites", "Favorites"), true);
            case DOWNLOADS: return songsOf(facet, app.downloads(), app.libraryOrigin(), true);
            case RECENT: return songsOf(facet, recents(app.librarySongs(), app.history(), RECENT_FACET), app.libraryOrigin(), false);
            default: return songsOf(facet, app.cloudSongs(), app.libraryOrigin(), true);
        }
    }

    private Model.Collection songsOf(Facet facet, List<Model.Track> songs, Object origin, boolean indexed) {
        return Model.Collection.ofTracks(facet.title, songs.size() + (songs.size() == 1 ? " song" : " songs"), null, songs,
            origin, indexed);
    }

    private Model.Tile playlistTile(final Model.Ref playlist) {
        return new Model.Tile(playlist.title, playlist.subtitle, playlist.artUrl, null, new Model.Opener() {
            @Override public Model.Collection open() { return playlist(playlist); }
        }).withKey("playlist", playlist.id);
    }

    /** The collection behind a facet's name (the key of its tile), or null for a name that is not a facet. */
    public Model.Collection facet(String name) {
        for (Facet facet : Facet.values()) if (facet.name().equals(name)) return open(facet);
        return null;
    }

    /** The collection of one of the user's own playlists. */
    public Model.Collection playlist(Model.Ref playlist) {
        List<Model.Track> songs = app.playlistTracks(playlist);
        return Model.Collection.ofTracks(playlist.title, songs.size() + (songs.size() == 1 ? " song" : " songs"),
            playlist.artUrl, songs, app.playlistOrigin(playlist.id, playlist.title), false);
    }

    /** The user's own playlist with this id, or null when the library does not hold it (yet). */
    public Model.Ref playlistById(String id) {
        if (id == null) return null;
        for (Model.Ref ref : app.playlists()) if (ref.id.equals(id)) return ref;
        return null;
    }

    /** The favourites collection, as the compose feed's "isFavorites" playlist opens it. */
    public Model.Collection favorites() { return open(Facet.FAVORITES); }

    private Model.Tile albumTile(final Model.Ref album) {
        return new Model.Tile(album.title, album.subtitle, album.artUrl, null, new Model.Opener() {
            @Override public Model.Collection open() {
                List<Model.Track> songs = app.albumTracks(album);
                return Model.Collection.ofTracks(album.title, album.subtitle, album.artUrl, songs, app.libraryOrigin(), false);
            }
        });
    }

    private Model.Tile artistTile(final Model.Ref artist) {
        return new Model.Tile(artist.title, artist.subtitle, artist.artUrl, null, new Model.Opener() {
            @Override public Model.Collection open() {
                List<Model.Track> songs = app.artistTracks(artist);
                List<Model.Tile> albums = new ArrayList<>();
                for (Model.Ref album : app.albums()) {
                    if (album.subtitle.equalsIgnoreCase(artist.title)) albums.add(albumTile(album));
                }
                return Model.Collection.ofTracksAndTiles(artist.title, artist.subtitle, artist.artUrl, songs, "Albums",
                    albums, app.libraryOrigin());
            }
        });
    }

    /**
     * The songs the history names, in history order, each once. History entries only carry text, so
     * they are matched to the library by title and artist (ignoring case), as the app's own recent
     * list does. An entry with no library song stays in the list as an unresolved track: tapping it
     * asks the app's catalogue search for the song, exactly as the phone does.
     */
    static List<Model.Track> recents(List<Model.Track> library, List<Model.HistoryEntry> history, int limit) {
        List<Model.Track> result = new ArrayList<>();
        java.util.Set<String> seen = new java.util.HashSet<>();
        for (Model.HistoryEntry entry : history) {
            if (result.size() >= limit) break;
            String identity = entry.title.trim().toLowerCase(Locale.ROOT) + "\u0000" + entry.artist.trim().toLowerCase(Locale.ROOT);
            if (!seen.add(identity)) continue;
            Model.Track match = null;
            for (Model.Track song : library) {
                if (same(song.title, entry.title) && same(song.artist, entry.artist)) {
                    match = song;
                    break;
                }
            }
            if (match != null) result.add(match);
            else if (!entry.title.isEmpty()) result.add(Model.Track.unresolved(entry));
        }
        return result;
    }

    private static boolean same(String a, String b) {
        return a.trim().toLowerCase(Locale.ROOT).equals(b.trim().toLowerCase(Locale.ROOT));
    }
}
