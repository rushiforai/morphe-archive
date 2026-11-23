package nl.johninnl.eclipse.auto.data;

import java.time.LocalDate;
import java.time.Month;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import nl.johninnl.eclipse.auto.ui.Presentation;

/**
 * Turns the compose feeds into what the car draws, every row kind through the {@link Presentation}
 * table, in the phone's order. Nothing the feed sends is hidden behind a "See all": each section
 * shows its items up to the one silent {@link Presentation#SECTION_CAP}. Rows are drawn by what
 * the app can open: native rows (the Umbra DJ, Made For You, Your Shows) through the app's own
 * loaders, linked rows (YouTube Music, Spotify) through the app's linked-list loader, and a card
 * that cannot be opened is not drawn at all. A tile that needs the catalogue opens a deferred
 * collection: the screen shows a spinner while the app's own loader runs.
 */
public final class HomeBuilder {
    static final String ALL_TIME_TOP_SONGS = "All-Time Top Songs";
    static final String ALL_TIME_SUBTITLE = "Your most played, ever";
    static final String REPLAY_BUILDING = "Building your replay…";
    private static final int CAP = Presentation.SECTION_CAP;

    private final AppPort app;
    private final LibraryStore library;
    private final RadioStore radio;

    public HomeBuilder(AppPort app, LibraryStore library, RadioStore radio) {
        this.app = app;
        this.library = library;
        this.radio = radio;
    }

    private static <T> List<T> head(List<T> items) { return new ArrayList<>(items.subList(0, Math.min(CAP, items.size()))); }

    // ---- Home ----------------------------------------------------------------------------------

    public HomeView home(Catalog.State<ComposeFeed.Home> state, HomeLayout layout, List<Model.LiveStation> live) {
        if (state.phase == Catalog.Phase.LOADING) {
            return new HomeView(true, HomeView.Notice.NONE, Collections.<Model.Section>emptyList(), Collections.<Model.Tile>emptyList());
        }
        HomeView.Notice notice = HomeView.Notice.NONE;
        List<Model.Section> sections;
        switch (state.phase) {
            case SIGNED_OUT:
                notice = HomeView.Notice.SIGNED_OUT;
                sections = Collections.emptyList();
                break;
            case DISABLED:
                // The server has compose switched off: a quiet, Library-backed Home with no error.
                sections = libraryBacked(live);
                break;
            case OFFLINE:
                notice = HomeView.Notice.OFFLINE;
                sections = libraryBacked(live);
                break;
            default:
                notice = state.refreshFailed ? HomeView.Notice.REFRESH_FAILED : HomeView.Notice.NONE;
                sections = fromRows(layout.apply(state.value.rows), layout, live);
        }
        return new HomeView(false, notice, sections, radio.categories());
    }

    private List<Model.Section> fromRows(List<ComposeFeed.Row> rows, HomeLayout layout, List<Model.LiveStation> live) {
        List<Model.Section> sections = new ArrayList<>();
        for (ComposeFeed.Row row : rows) {
            Model.Section section = section(row, layout, live);
            if (section != null) sections.add(section);
        }
        return sections;
    }

    /** The title a row is shown under: the user's rename (already applied), else the server's, else the phone's label. */
    private static String titleOf(ComposeFeed.Row row) {
        if (!row.title.isEmpty()) return row.title;
        String label = HomeLayout.defaultLabel(row.key);
        return label != null ? label : row.key;
    }

    private Model.Section section(ComposeFeed.Row row, HomeLayout layout, List<Model.LiveStation> live) {
        // The recents are drawn without a title, as on the phone, unless the user gave them one.
        String title = "recently_played".equals(row.key) ? (layout.hasTitle(row.key) ? row.title : "") : titleOf(row);
        if ("native".equals(row.kind)) return nativeSection(row, title);
        if ("linked".equals(row.provenance)) return linkedSection(row, title);
        if ("stations".equals(row.kind)) return stationRow(row, title, live);
        if (row.items.isEmpty()) return null;
        switch (row.kind) {
            case "tracks": return trackRow(row, title);
            case "playlists": return tileRow(row, title, "home.playlists", Model.Kind.PLAYLISTS);
            case "albums": return tileRow(row, title, "home.albums", Model.Kind.ALBUMS);
            case "mixes": return tileRow(row, title, "home.mixes", Model.Kind.PLAYLISTS);
            case "artists":
                if ("featured_artist".equals(row.key) && row.items.size() == 1) {
                    return Model.Section.spotlight(row.key, title, artistTile(row.items.get(0)));
                }
                return tileRow(row, title, "home.artists", Model.Kind.ARTISTS);
            default: return null;
        }
    }

    private Model.Section trackRow(ComposeFeed.Row row, String title) {
        List<Model.Track> tracks = new ArrayList<>();
        for (ComposeFeed.Item item : row.items) {
            if (tracks.size() >= CAP) break;
            tracks.add(item.toTrack());
        }
        return Model.Section.tracks(row.key, title, tracks, app.composedOrigin("home", row.key, title));
    }

    /** The feed's own stations, or the app's live ones (with what is on air) when it has them: same place either way. */
    private Model.Section stationRow(ComposeFeed.Row row, String title, List<Model.LiveStation> live) {
        if (!live.isEmpty()) return Model.Section.stations(row.key, title, head(live));
        List<Model.LiveStation> stations = new ArrayList<>();
        for (ComposeFeed.Item item : row.items) {
            if (item.stationId == null || stations.size() >= CAP) continue;
            stations.add(new Model.LiveStation(item.stationId, item.title, item.subtitle, item.nowTitle, item.nowArtist, item.nowCover));
        }
        return stations.isEmpty() ? null : Model.Section.stations(row.key, title, stations);
    }

    private Model.Section tileRow(ComposeFeed.Row row, String title, String kindKey, Model.Kind kind) {
        List<Model.Tile> tiles = new ArrayList<>();
        for (ComposeFeed.Item item : row.items) {
            if (tiles.size() >= CAP) break;
            Model.Tile tile;
            switch (row.kind) {
                case "playlists": tile = playlistTile(item); break;
                case "albums": tile = albumTile(item); break;
                case "mixes": tile = mixTile(row.key, item); break;
                default: tile = artistTile(item);
            }
            if (tile != null) tiles.add(tile);
        }
        if (tiles.isEmpty()) return null;
        String presentationKey = "recently_played".equals(row.key) ? "home.recently_played" : kindKey;
        return Model.Section.tiles(row.key, title, presentationKey, null, tiles);
    }

    // ---- native rows ---------------------------------------------------------------------------

    private Model.Section nativeSection(ComposeFeed.Row row, String title) {
        switch (row.key) {
            case "ai_dj": return Model.Section.dj(row.key, title, app.djLive());
            case "made_for_you": return madeForYou(row, title);
            case "your_shows": return shows(row, title);
            default: return null;
        }
    }

    /** Made For You: this month's Replay (disabled while it is being built) and the All-Time Top Songs. */
    private Model.Section madeForYou(ComposeFeed.Row row, String title) {
        List<Model.Tile> cards = new ArrayList<>();
        cards.add(replayTile(app.replay(), row.art.get("replay")));
        cards.add(topSongsTile(row.art.get("top_songs")));
        return Model.Section.tiles(row.key, title, "home.made_for_you", null, cards);
    }

    private static String replayName(Model.Replay replay) {
        int month = replay != null && replay.month >= 1 && replay.month <= 12 ? replay.month : LocalDate.now().getMonthValue();
        return Month.of(month).getDisplayName(TextStyle.FULL, Locale.US) + " Replay";
    }

    private static String replaySubtitle(Model.Replay replay) {
        if (replay != null && replay.hasContent && replay.listened != null && !replay.listened.isEmpty()) return replay.listened + " listened";
        return REPLAY_BUILDING;
    }

    private Model.Tile replayTile(final Model.Replay replay, final String artUrl) {
        final String name = replayName(replay);
        final String subtitle = replaySubtitle(replay);
        // Until the replay has songs there is nothing to open: the card is drawn without a tap target.
        Model.Opener opener = replay != null && replay.ready() ? new Model.Opener() {
            @Override public Model.Collection open() { return replayCollection(replay, artUrl); }
        } : null;
        return new Model.Tile(name, subtitle, artUrl, null, false, opener, null).withKey("native", "replay");
    }

    private Model.Collection replayCollection(Model.Replay replay, String artUrl) {
        String name = replayName(replay);
        return Model.Collection.ofTracks(name, replaySubtitle(replay), artUrl, replay.tracks,
            app.composedOrigin("home", "replay", name), false);
    }

    private Model.Tile topSongsTile(final String artUrl) {
        return new Model.Tile(ALL_TIME_TOP_SONGS, ALL_TIME_SUBTITLE, artUrl, null, new Model.Opener() {
            @Override public Model.Collection open() { return topSongsCollection(artUrl); }
        }).withKey("native", "top_songs");
    }

    private Model.Collection topSongsCollection(final String artUrl) {
        return Model.Collection.deferred(ALL_TIME_TOP_SONGS, ALL_TIME_SUBTITLE, artUrl, new Model.Loader() {
            @Override public void load(final Model.LoadCallback callback) {
                app.loadTopSongs(new Async<List<Model.Track>>() {
                    @Override public void done(List<Model.Track> tracks, Throwable failure) {
                        if (tracks == null || tracks.isEmpty()) callback.failed();
                        else callback.loaded(Model.Collection.ofTracks(ALL_TIME_TOP_SONGS, ALL_TIME_SUBTITLE, artUrl, tracks,
                            app.composedOrigin("home", "top_songs", ALL_TIME_TOP_SONGS), false));
                    }
                });
            }
        });
    }

    /** Your Shows: the podcasts the user follows; the section is left out while there are none. */
    private Model.Section shows(ComposeFeed.Row row, String title) {
        List<Model.Tile> tiles = new ArrayList<>();
        for (Model.Show show : app.shows()) {
            if (tiles.size() >= CAP) break;
            if (!show.title.isEmpty()) tiles.add(showTile(show));
        }
        return tiles.isEmpty() ? null : Model.Section.tiles(row.key, title, "home.shows", null, tiles);
    }

    private Model.Tile showTile(final Model.Show show) {
        Model.Tile tile = new Model.Tile(show.title, show.author, show.artUrl, null, new Model.Opener() {
            @Override public Model.Collection open() { return showCollection(show); }
        });
        return show.id.isEmpty() ? tile : tile.withKey("show", show.id);
    }

    private Model.Collection showCollection(final Model.Show show) {
        return Model.Collection.deferred(show.title, show.author, show.artUrl, new Model.Loader() {
            @Override public void load(Model.LoadCallback callback) {
                app.loadShowEpisodes(show, loaded(callback, show.title, show.artUrl));
            }
        });
    }

    // ---- search results ------------------------------------------------------------------------

    /**
     * The tile for one album, artist or playlist a provider's search found. An album or playlist opens
     * its songs, an artist opens an artist page; each is fetched through the app's own loader while a
     * spinner shows, exactly like the tiles of Home.
     */
    public Model.Tile searchTile(final Model.SearchHit hit) {
        String subtitle = hit.subtitle;
        Model.Opener opener;
        switch (hit.kind) {
            case ARTIST:
                opener = new Model.Opener() {
                    @Override public Model.Collection open() { return addonArtistPage(hit); }
                };
                subtitle = "";
                break;
            case PLAYLIST:
                opener = new Model.Opener() {
                    @Override public Model.Collection open() {
                        return Model.Collection.deferred(hit.title, hit.subtitle, hit.artUrl, new Model.Loader() {
                            @Override public void load(Model.LoadCallback callback) {
                                app.loadAddonPlaylist(hit, loaded(callback, hit.title, hit.artUrl));
                            }
                        });
                    }
                };
                break;
            default:
                opener = new Model.Opener() {
                    @Override public Model.Collection open() {
                        return Model.Collection.deferred(hit.title, hit.subtitle, hit.artUrl, new Model.Loader() {
                            @Override public void load(Model.LoadCallback callback) {
                                app.loadAddonAlbum(hit, loaded(callback, hit.title, hit.artUrl));
                            }
                        });
                    }
                };
        }
        return new Model.Tile(hit.title, subtitle, hit.artUrl, null, opener);
    }

    private Model.Collection addonArtistPage(final Model.SearchHit hit) {
        return Model.Collection.deferred(hit.title, "", hit.artUrl, new Model.Loader() {
            @Override public void load(final Model.LoadCallback callback) {
                app.loadAddonArtist(hit, new Async<Model.ArtistPage>() {
                    @Override public void done(Model.ArtistPage page, Throwable failure) {
                        if (page == null) callback.failed();
                        else callback.loaded(artistCollection("addon:" + hit.providerId + ":" + hit.id, page));
                    }
                });
            }
        });
    }

    // ---- linked rows ---------------------------------------------------------------------------

    /**
     * A row from a linked service (YouTube Music, Spotify). A playlist card opens through the app's
     * linked-list loader, and a songs row plays under the linked ids; anything the app has no loader
     * for (albums and artists of the service) is left out rather than drawn as a card that goes nowhere.
     */
    private Model.Section linkedSection(ComposeFeed.Row row, String title) {
        if ("playlists".equals(row.kind)) {
            List<Model.Tile> tiles = new ArrayList<>();
            for (ComposeFeed.Item item : row.items) {
                if (tiles.size() >= CAP) break;
                if (item.title != null && item.linkedListId != null) tiles.add(linkedListTile(row.key, item));
            }
            return tiles.isEmpty() ? null : Model.Section.tiles(row.key, title, "home.playlists", null, tiles);
        }
        if ("tracks".equals(row.kind) && !row.items.isEmpty()) return trackRow(row, title);
        return null;
    }

    private Model.Tile linkedListTile(final String rowKey, final ComposeFeed.Item item) {
        String subtitle = item.subtitle != null ? item.subtitle : songs(item.trackCount);
        return new Model.Tile(item.title, subtitle, item.artUrl, null, new Model.Opener() {
            @Override public Model.Collection open() { return linkedList(rowKey, item.linkedListId, item.title, item.artUrl); }
        }).withKey("list", rowKey + "/" + item.linkedListId);
    }

    private Model.Collection linkedList(final String rowKey, final String listId, final String name, final String artUrl) {
        return Model.Collection.deferred(name, "", artUrl, new Model.Loader() {
            @Override public void load(Model.LoadCallback callback) {
                app.loadLinkedList(rowKey, listId, name, artUrl, loaded(callback, name, artUrl));
            }
        });
    }

    private Model.Tile linkedLibraryTile(final ComposeFeed.Item item) {
        String subtitle = item.subtitle != null ? item.subtitle : songs(item.trackCount);
        final String provider = item.provider;
        final String id = item.providerPlaylistId;
        return new Model.Tile(item.title, subtitle, item.artUrl, null, new Model.Opener() {
            @Override public Model.Collection open() { return linkedLibraryPlaylist(provider, id, item.title, item.artUrl); }
        }).withKey("linkedlib", provider + "|" + id);
    }

    private Model.Collection linkedLibraryPlaylist(final String provider, final String id, final String name, final String artUrl) {
        return Model.Collection.deferred(name, "", artUrl, new Model.Loader() {
            @Override public void load(Model.LoadCallback callback) {
                app.loadLinkedLibraryPlaylist(provider, id, name, artUrl, loaded(callback, name, artUrl));
            }
        });
    }

    // ---- tiles ---------------------------------------------------------------------------------

    private static String songs(Integer count) {
        return count == null ? "" : count + (count == 1 ? " song" : " songs");
    }

    private Model.Tile playlistTile(final ComposeFeed.Item item) {
        if (item.title == null) return null;
        if (item.provider != null && item.providerPlaylistId != null) {
            // A linked-library playlist in the recents: only the two services the app can load.
            return "spotify".equals(item.provider) || "ytmusic".equals(item.provider) ? linkedLibraryTile(item) : null;
        }
        // A card with no identity the app could open is not drawn.
        if (!item.favorites && item.playlistId == null && item.appleMusicPlaylistId == null) return null;
        String subtitle = item.subtitle != null ? item.subtitle : songs(item.trackCount);
        Model.Tile tile = new Model.Tile(item.title, subtitle, item.artUrl, null, new Model.Opener() {
            @Override public Model.Collection open() {
                if (item.favorites) return library.favorites();
                Model.Ref own = library.playlistById(item.playlistId);
                if (own != null) return library.playlist(own);
                if (item.appleMusicPlaylistId != null) {
                    return editorialPlaylist(item.appleMusicPlaylistId, item.title, item.subtitle, item.artUrl);
                }
                // One of the user's playlists the library has not loaded: nothing to show yet.
                return Model.Collection.ofTracks(item.title, "", item.artUrl, Collections.<Model.Track>emptyList(), null, false);
            }
        });
        if (item.favorites) return tile.withKey("favorites", "all");
        if (item.playlistId != null) return tile.withKey("playlist", item.playlistId);
        return tile.withKey("editorial", item.appleMusicPlaylistId);
    }

    private Model.Collection editorialPlaylist(final String id, final String title, String subtitle, final String artUrl) {
        return Model.Collection.deferred(title, subtitle, artUrl, new Model.Loader() {
            @Override public void load(final Model.LoadCallback callback) {
                app.loadEditorialPlaylist(id, title, artUrl, loaded(callback, title, artUrl));
            }
        });
    }

    private Model.Tile albumTile(ComposeFeed.Item item) {
        if (item.title == null) return null;
        Model.AlbumRef album = new Model.AlbumRef(item.appleMusicAlbumId, item.title, item.subtitle, item.artUrl, item.releaseDate,
            item.trackCount, item.genre, item.explicit, null);
        return albumTile(album);
    }

    private Model.Tile albumTile(final Model.AlbumRef album) {
        Model.Tile tile = new Model.Tile(album.title, album.artist, album.artUrl, null, new Model.Opener() {
            @Override public Model.Collection open() { return albumCollection(album); }
        });
        return album.id.isEmpty() ? tile : tile.withKey("album", album.id);
    }

    private Model.Collection albumCollection(final Model.AlbumRef album) {
        if (album.id.isEmpty()) {
            return Model.Collection.ofTracks(album.title, album.artist, album.artUrl, Collections.<Model.Track>emptyList(), null, false);
        }
        return Model.Collection.deferred(album.title, album.artist, album.artUrl, new Model.Loader() {
            @Override public void load(Model.LoadCallback callback) {
                app.loadAlbum(album, loaded(callback, album.title, album.artUrl));
            }
        });
    }

    private Model.Tile mixTile(final String key, final ComposeFeed.Item item) {
        if (item.title == null || item.tracks.isEmpty()) return null;
        Model.Tile tile = new Model.Tile(item.title, item.subtitle, item.artUrl, null, new Model.Opener() {
            @Override public Model.Collection open() {
                List<Model.Track> tracks = new ArrayList<>();
                for (ComposeFeed.Item track : item.tracks) tracks.add(track.toTrack());
                return Model.Collection.ofTracks(item.title, item.subtitle, item.artUrl, tracks,
                    app.composedOrigin("daily_mix", key, item.title), false);
            }
        });
        return item.mixId == null ? tile : tile.withKey("mix", item.mixId);
    }

    private Model.Tile artistTile(final ComposeFeed.Item item) {
        if (item.title == null) return null;
        final String id = item.appleMusicArtistId;
        Model.Opener opener = new Model.Opener() {
            @Override public Model.Collection open() {
                if (id == null) return Model.Collection.ofTracks(item.title, "", item.artUrl, Collections.<Model.Track>emptyList(), null, false);
                return artistPage(id, item.title, item.artUrl);
            }
        };
        // "Play top songs" on the spotlight: load the page and hand back just the songs.
        Model.Loader play = id == null ? null : new Model.Loader() {
            @Override public void load(final Model.LoadCallback callback) {
                app.loadArtist(id, item.title, item.artUrl, new Async<Model.ArtistPage>() {
                    @Override public void done(Model.ArtistPage page, Throwable failure) {
                        if (page == null || page.topSongs.isEmpty()) callback.failed();
                        else callback.loaded(Model.Collection.ofTracks(page.name, "", page.imageUrl, page.topSongs,
                            app.composedOrigin("artist", id, page.name), false));
                    }
                });
            }
        };
        Model.Tile tile = new Model.Tile(item.title, "", item.artUrl, null, false, opener, play);
        return id == null ? tile : tile.withKey("artist", id);
    }

    /** An artist page, fetched through the app's own loader while a spinner (or the classic host's wait) shows. */
    private Model.Collection artistPage(final String id, final String name, final String artUrl) {
        return Model.Collection.deferred(name, "", artUrl, new Model.Loader() {
            @Override public void load(final Model.LoadCallback callback) {
                app.loadArtist(id, name, artUrl, new Async<Model.ArtistPage>() {
                    @Override public void done(Model.ArtistPage page, Throwable failure) {
                        if (page == null) callback.failed();
                        else callback.loaded(artistCollection(id, page));
                    }
                });
            }
        });
    }

    /**
     * The collection behind a stable (type, key) pair, for the classic browse tree: it holds no tile,
     * only an id. Types that need the feed (mix, card) are not resolved here. Null when unknown.
     */
    public Model.Collection collectionFor(String type, String key) {
        if (type == null || key == null) return null;
        switch (type) {
            case "facet": return library.facet(key);
            case "favorites": return library.favorites();
            case "playlist": {
                Model.Ref own = library.playlistById(key);
                return own == null ? null : library.playlist(own);
            }
            case "editorial": return editorialPlaylist(key, "", null, null);
            case "album": return albumCollection(new Model.AlbumRef(key, "", "", null, null, null, null, null, null));
            case "artist": return artistPage(key, "", null);
            case "list": {
                // key = <row key>/<list id>: the row key names the queue origin, the list id loads the songs.
                int slash = key.lastIndexOf('/');
                return slash < 0 ? null : linkedList(key.substring(0, slash), key.substring(slash + 1), "", null);
            }
            case "linkedlib": {
                int bar = key.indexOf('|');
                return bar < 0 ? null : linkedLibraryPlaylist(key.substring(0, bar), key.substring(bar + 1), "", null);
            }
            case "native":
                if ("top_songs".equals(key)) return topSongsCollection(null);
                if ("replay".equals(key)) {
                    Model.Replay replay = app.replay();
                    return replay != null && replay.ready() ? replayCollection(replay, null) : null;
                }
                return null;
            case "show":
                for (Model.Show show : app.shows()) if (show.id.equals(key)) return showCollection(show);
                return null;
            default: return null;
        }
    }

    /** An artist's page: top songs, then albums and singles. */
    private Model.Collection artistCollection(String id, Model.ArtistPage page) {
        List<Model.Tile> albums = new ArrayList<>();
        for (Model.AlbumRef album : page.albums) albums.add(albumTile(album));
        List<Model.TileGroup> more = new ArrayList<>();
        if (!page.singles.isEmpty()) {
            List<Model.Tile> singles = new ArrayList<>();
            for (Model.AlbumRef album : page.singles) singles.add(albumTile(album));
            more.add(new Model.TileGroup("Singles", singles));
        }
        return Model.Collection.ofTracksAndGroups(page.name, "", page.imageUrl, page.topSongs, "Albums", albums, more,
            app.composedOrigin("artist", id, page.name));
    }

    /** Adapts a catalogue loader's result to a collection loader's callback. */
    private static Async<Model.Loaded> loaded(final Model.LoadCallback callback, final String fallbackTitle, final String fallbackArt) {
        return new Async<Model.Loaded>() {
            @Override public void done(Model.Loaded result, Throwable failure) {
                if (result == null || result.tracks.isEmpty()) {
                    callback.failed();
                    return;
                }
                callback.loaded(Model.Collection.ofTracks(result.title == null || result.title.isEmpty() ? fallbackTitle : result.title,
                    result.subtitle, result.artUrl == null ? fallbackArt : result.artUrl, result.tracks, result.origin, false));
            }
        };
    }

    // ---- Library-backed Home -------------------------------------------------------------------

    /** Discover with nothing to show and an offline notice, for a surface that must answer before the feed has. */
    public HomeView offlineDiscover() {
        return new HomeView(false, HomeView.Notice.OFFLINE, Collections.<Model.Section>emptyList(), Collections.<Model.Tile>emptyList());
    }

    /** The Library-backed Home with no notice, for a surface that must answer before the feed has. */
    public HomeView libraryBackedHome(List<Model.LiveStation> live) {
        return new HomeView(false, HomeView.Notice.NONE, libraryBacked(live), radio.categories());
    }

    /** Favourites, downloads and recents as tiles, recent songs, the playlists and the live stations: Home is never empty offline. */
    private List<Model.Section> libraryBacked(List<Model.LiveStation> live) {
        LibraryStore.View view = library.view();
        List<Model.Section> sections = new ArrayList<>();
        List<Model.Tile> facets = new ArrayList<>();
        for (Model.Tile facet : view.facets) {
            if (facet.title.equals(LibraryStore.Facet.FAVORITES.title) || facet.title.equals(LibraryStore.Facet.DOWNLOADS.title)
                || facet.title.equals(LibraryStore.Facet.RECENT.title)) facets.add(facet);
        }
        sections.add(Model.Section.tiles("library_shortcuts", "Your library", "library.facets", null, facets));
        List<Model.Track> recents = library.open(LibraryStore.Facet.RECENT).tracks;
        if (!recents.isEmpty()) {
            sections.add(Model.Section.tracks("library_recents", "Recently played", head(recents), app.libraryOrigin()));
        }
        List<Model.Tile> playlists = library.open(LibraryStore.Facet.PLAYLISTS).tiles;
        if (!playlists.isEmpty()) {
            sections.add(Model.Section.tiles("library_playlists", "Playlists", "home.playlists", null, head(playlists)));
        }
        if (!live.isEmpty()) {
            sections.add(Model.Section.stations("eclipse_stations", HomeLayout.defaultLabel("eclipse_stations"), head(live)));
        }
        return sections;
    }

    // ---- Discover ------------------------------------------------------------------------------

    public HomeView discover(Catalog.State<ComposeFeed.Discover> state) {
        if (state.phase == Catalog.Phase.LOADING) {
            return new HomeView(true, HomeView.Notice.NONE, Collections.<Model.Section>emptyList(), Collections.<Model.Tile>emptyList());
        }
        HomeView.Notice notice = HomeView.Notice.NONE;
        List<Model.Section> sections = new ArrayList<>();
        switch (state.phase) {
            case SIGNED_OUT: notice = HomeView.Notice.SIGNED_OUT; break;
            case DISABLED: notice = HomeView.Notice.UNAVAILABLE; break;
            case OFFLINE: notice = HomeView.Notice.OFFLINE; break;
            default:
                notice = state.refreshFailed ? HomeView.Notice.REFRESH_FAILED : HomeView.Notice.NONE;
                for (ComposeFeed.Section section : state.value.sections) {
                    Model.Section built = discoverSection(section);
                    if (built != null) sections.add(built);
                }
        }
        return new HomeView(false, notice, sections, Collections.<Model.Tile>emptyList());
    }

    private Model.Section discoverSection(ComposeFeed.Section section) {
        List<ComposeFeed.Card> cards = new ArrayList<>();
        for (ComposeFeed.Card card : section.cards) if (!card.tracks.isEmpty()) cards.add(card);
        if (cards.isEmpty()) return null;
        String title = section.title.isEmpty() ? section.key : section.title;
        if ("hero".equals(section.layout)) {
            ComposeFeed.Card card = cards.get(0);
            List<Model.Track> tracks = head(cardTracks(card));
            Object origin = app.composedOrigin("discover", section.key, card.title);
            return Model.Section.hero(section.key, title, cardTile(section.key, 0, card, origin), tracks, origin);
        }
        List<Model.Tile> tiles = new ArrayList<>();
        for (int i = 0; i < cards.size() && i < CAP; i++) {
            ComposeFeed.Card card = cards.get(i);
            tiles.add(cardTile(section.key, i, card, app.composedOrigin("discover", section.key, card.title)));
        }
        String signal = cards.get(0).signals.isEmpty() ? null : cards.get(0).signals.get(0);
        return Model.Section.tiles(section.key, title, "discover.cards", signal, tiles);
    }

    private static List<Model.Track> cardTracks(ComposeFeed.Card card) {
        List<Model.Track> tracks = new ArrayList<>();
        for (ComposeFeed.Item item : card.tracks) tracks.add(item.toTrack());
        return tracks;
    }

    /** A card opens a collection built from its inline songs: no further request. */
    private static Model.Tile cardTile(String sectionKey, int index, final ComposeFeed.Card card, final Object origin) {
        String subtitle = !card.subtitle.isEmpty() ? card.subtitle : card.signals.isEmpty() ? "" : card.signals.get(0);
        Model.Tile tile = new Model.Tile(card.title, subtitle, card.artUrl, null, new Model.Opener() {
            @Override public Model.Collection open() {
                return Model.Collection.ofTracks(card.title, card.subtitle, card.artUrl, cardTracks(card), origin, false);
            }
        });
        // The card's own id is stable across refreshes; its position is the fallback.
        return tile.withKey("card", sectionKey + "|" + (card.id.isEmpty() ? "#" + index : card.id));
    }
}
