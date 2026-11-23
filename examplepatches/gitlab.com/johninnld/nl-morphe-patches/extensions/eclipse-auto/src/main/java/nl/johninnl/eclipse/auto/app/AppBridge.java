package nl.johninnl.eclipse.auto.app;

import android.content.Context;
import android.content.SharedPreferences;
import android.media.session.MediaSession;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.support.v4.media.session.MediaSessionCompat;
import com.eclipse.android.core.audio.CarArtworkProvider;
import com.eclipse.android.core.audio.PlaybackService;
import com.eclipse.android.data.models.CanonicalAlbum;
import com.eclipse.android.data.models.Playlist;
import com.eclipse.android.data.models.SavedLibraryItem;
import com.eclipse.android.data.models.Song;
import com.eclipse.android.data.models.addon.EclipseAddonAlbum;
import com.eclipse.android.data.models.addon.EclipseAddonArtist;
import com.eclipse.android.data.models.addon.EclipseAddonPlaylistResult;
import com.eclipse.android.data.models.addon.EclipseAddonSearchResponse;
import com.eclipse.android.data.models.addon.EclipseAddonTrack;
import com.eclipse.android.data.models.addon.InstalledAddon;
import com.eclipse.android.services.PlayHistoryItem;
import com.eclipse.android.services.podcasts.PodcastEpisode;
import com.eclipse.android.services.podcasts.PodcastShow;
import com.eclipse.android.services.replay.ReplaySummary;
import com.eclipse.android.services.replay.ReplayTrack;
import com.eclipse.android.services.tidal.TidalTrack;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import nl.johninnl.eclipse.app.a38;
import nl.johninnl.eclipse.app.a3b;
import nl.johninnl.eclipse.app.a82;
import nl.johninnl.eclipse.app.afa;
import nl.johninnl.eclipse.app.ah8;
import nl.johninnl.eclipse.app.b0;
import nl.johninnl.eclipse.app.b35;
import nl.johninnl.eclipse.app.bfa;
import nl.johninnl.eclipse.app.bh8;
import nl.johninnl.eclipse.app.bt1;
import nl.johninnl.eclipse.app.b6b;
import nl.johninnl.eclipse.app.c38;
import nl.johninnl.eclipse.app.cm7;
import nl.johninnl.eclipse.app.d6b;
import nl.johninnl.eclipse.app.dh8;
import nl.johninnl.eclipse.app.e69;
import nl.johninnl.eclipse.app.e6b;
import nl.johninnl.eclipse.app.eb5;
import nl.johninnl.eclipse.app.ed9;
import nl.johninnl.eclipse.app.ee8;
import nl.johninnl.eclipse.app.ej6;
import nl.johninnl.eclipse.app.eh5;
import nl.johninnl.eclipse.app.f18;
import nl.johninnl.eclipse.app.fe8;
import nl.johninnl.eclipse.app.fm3;
import nl.johninnl.eclipse.app.fv0;
import nl.johninnl.eclipse.app.gd7;
import nl.johninnl.eclipse.app.gj1;
import nl.johninnl.eclipse.app.gv2;
import nl.johninnl.eclipse.app.gwa;
import nl.johninnl.eclipse.app.h35;
import nl.johninnl.eclipse.app.he8;
import nl.johninnl.eclipse.app.hv0;
import nl.johninnl.eclipse.app.ja5;
import nl.johninnl.eclipse.app.jh0;
import nl.johninnl.eclipse.app.jh8;
import nl.johninnl.eclipse.app.jn1;
import nl.johninnl.eclipse.app.je8;
import nl.johninnl.eclipse.app.ke8;
import nl.johninnl.eclipse.app.l95;
import nl.johninnl.eclipse.app.lb5;
import nl.johninnl.eclipse.app.le8;
import nl.johninnl.eclipse.app.m6b;
import nl.johninnl.eclipse.app.n95;
import nl.johninnl.eclipse.app.p16;
import nl.johninnl.eclipse.app.p2b;
import nl.johninnl.eclipse.app.pw0;
import nl.johninnl.eclipse.app.qi0;
import nl.johninnl.eclipse.app.s06;
import nl.johninnl.eclipse.app.s57;
import nl.johninnl.eclipse.app.sf4;
import nl.johninnl.eclipse.app.ta5;
import nl.johninnl.eclipse.app.tl7;
import nl.johninnl.eclipse.app.uh6;
import nl.johninnl.eclipse.app.vf8;
import nl.johninnl.eclipse.app.vm3;
import nl.johninnl.eclipse.app.xa5;
import nl.johninnl.eclipse.app.y5b;
import nl.johninnl.eclipse.app.z5b;
import nl.johninnl.eclipse.app.zf8;
import nl.johninnl.eclipse.auto.data.Async;
import nl.johninnl.eclipse.auto.data.AppPort;
import nl.johninnl.eclipse.auto.data.Model;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * One of the three classes allowed to import stub types (see section 5.3 of the design): the
 * app's obfuscated classes are reached only here. Every entry catches Throwable so an app-side
 * failure never reaches a host callback, reads come back empty or neutral, and every mutation runs
 * on the main thread. The patch relocates the stubs to the app's real classes and link-checks each
 * reference against its dex.
 */
public final class AppBridge implements AppPort {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private final Context context;
    private List<?> memoItems;
    private List<Model.Track> memoSongs = Collections.emptyList();

    public AppBridge(Context context) { this.context = context.getApplicationContext(); }

    // ---- singletons ----------------------------------------------------------------------------

    private jh0 player() { return jh0.K0.p(context); }

    private le8 queueStore() { return le8.x.u(context); }

    private ej6 library() { return ej6.l.H(context); }

    private f18 playlistStore() { return f18.J.t(context); }

    private sf4 liveManager() { return sf4.g0.n(context); }

    /** The app's car callback, reached through the playback service's session holder; null before it starts. */
    private cm7 carCallback() { return PlaybackService.I.a.e; }

    // ---- conversions ---------------------------------------------------------------------------

    private static List<?> list(Object value) { return value instanceof List ? (List<?>) value : Collections.emptyList(); }

    private static Model.Track track(Object value) {
        if (!(value instanceof Song)) return null;
        Song song = (Song) value;
        return new Model.Track(song, song.getTitle(), song.getArtist(), song.getAlbum(), song.getCoverURL());
    }

    private static List<Model.Track> tracks(List<?> songs) {
        List<Model.Track> result = new ArrayList<>(songs.size());
        for (Object song : songs) {
            Model.Track converted = track(song);
            if (converted != null) result.add(converted);
        }
        return result;
    }

    private static List<Model.Track> tracksOfItems(List<?> items) {
        List<Model.Track> result = new ArrayList<>(items.size());
        for (Object item : items) {
            if (!(item instanceof SavedLibraryItem)) continue;
            Model.Track converted = track(((SavedLibraryItem) item).toSong());
            if (converted != null) result.add(converted);
        }
        return result;
    }

    /** The app's song behind a track: the one it holds, or the one its parser makes from a feed entry. */
    public Song songOf(Model.Track track) {
        if (track.song instanceof Song) return (Song) track.song;
        if (track.deferredJson == null) return null;
        try {
            eh5 identity = vm3.k(new JSONArray("[" + track.deferredJson + "]"));
            if (identity.isEmpty()) return null;
            Object first = identity.get(0);
            if (!(first instanceof fm3)) return null;
            // A linked service's song plays under the id the server named for it, as the app's own linked rows do.
            if (track.linkedId != null) return lb5.q((fm3) first, track.linkedId, track.explicit);
            return ((fm3) first).a(context);
        } catch (Throwable unusable) {
            return null;
        }
    }

    private static String first(String... candidates) {
        for (String candidate : candidates) if (candidate != null && !candidate.isEmpty()) return candidate;
        return null;
    }

    private static String count(int songs) { return songs + (songs == 1 ? " song" : " songs"); }

    private void onMain(final Runnable action) {
        if (Looper.myLooper() == Looper.getMainLooper()) run(action);
        else MAIN.post(new Runnable() { @Override public void run() { AppBridge.run(action); } });
    }

    private static void run(Runnable action) {
        try {
            action.run();
        } catch (Throwable ignored) {
            // A bridge entry never lets an app-side failure reach a host callback.
        }
    }

    /** Run a suspend loader on the main thread; its result arrives on the main thread. */
    private void suspend(final Suspend.Loader loader, final Suspend.Callback callback) {
        onMain(new Runnable() { @Override public void run() { Suspend.run(loader, callback); } });
    }

    private static <T> void fail(Async<T> done, Throwable failure) {
        try {
            done.done(null, failure);
        } catch (Throwable ignored) {
            // The caller's callback failing is the caller's problem, never the app's.
        }
    }

    private static <T> void succeed(Async<T> done, T value) {
        try {
            done.done(value, null);
        } catch (Throwable ignored) {
            // See fail.
        }
    }

    // ---- library -------------------------------------------------------------------------------

    @Override public List<Model.Track> librarySongs() {
        try {
            List<?> items = list(library().c.getValue());
            if (items == memoItems) return memoSongs;
            List<Model.Track> converted = tracksOfItems(items);
            memoItems = items;
            memoSongs = converted;
            return converted;
        } catch (Throwable unavailable) {
            return Collections.emptyList();
        }
    }

    @Override public List<Model.Track> favorites() {
        try {
            return tracks(list(playlistStore().e.getValue()));
        } catch (Throwable unavailable) {
            return Collections.emptyList();
        }
    }

    @Override public List<Model.Track> downloads() {
        try {
            return tracks(s57.A.p(context).C());
        } catch (Throwable unavailable) {
            return Collections.emptyList();
        }
    }

    @Override public int downloadsCount() {
        try {
            Object keys = s57.A.p(context).k.getValue();
            return keys instanceof java.util.Collection ? ((java.util.Collection<?>) keys).size() : 0;
        } catch (Throwable unavailable) {
            return 0;
        }
    }

    @Override public List<Model.Track> cloudSongs() {
        try {
            return tracks(list(gj1.o.r(context).h.getValue()));
        } catch (Throwable unavailable) {
            return Collections.emptyList();
        }
    }

    @Override public List<Model.HistoryEntry> history() {
        try {
            List<Model.HistoryEntry> result = new ArrayList<>();
            for (Object item : list(tl7.j.r(context).d.getValue())) {
                if (item instanceof PlayHistoryItem) {
                    PlayHistoryItem entry = (PlayHistoryItem) item;
                    result.add(new Model.HistoryEntry(entry.getTitle(), entry.getArtist(), entry.getArtworkUrl()));
                }
            }
            return result;
        } catch (Throwable unavailable) {
            return Collections.emptyList();
        }
    }

    /**
     * The app's own fallback for a recent song that is not in the library: search Tidal for
     * "artist title" and play the first hit, keeping the queue (yt6 case 9 does exactly this).
     */
    @Override public void playHistoryEntry(final Model.HistoryEntry entry, final Async<Boolean> done) {
        final String query = (entry.artist + " " + entry.title).trim();
        suspend(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) {
                return gwa.k.j(context).l(1, call, query);
            }
        }, new Suspend.Callback() {
            @Override public void done(Object value, Throwable failure) {
                try {
                    List<?> hits = list(value);
                    if (failure == null && !hits.isEmpty() && hits.get(0) instanceof TidalTrack) {
                        player().O(gwa.i(gwa.k.j(context), (TidalTrack) hits.get(0)));
                        succeed(done, Boolean.TRUE);
                        return;
                    }
                } catch (Throwable unusable) {
                    // Falls through to the failure below.
                }
                succeed(done, Boolean.FALSE);
            }
        });
    }

    @Override public List<Model.Ref> playlists() {
        try {
            List<Model.Ref> result = new ArrayList<>();
            for (Object item : list(playlistStore().c.getValue())) {
                if (!(item instanceof Playlist)) continue;
                Playlist playlist = (Playlist) item;
                result.add(new Model.Ref(playlist, playlist.getId(), playlist.getName(), count(playlist.getSongCount()),
                    first(playlist.getLocalArtworkURL(), playlist.getCoverURL())));
            }
            return result;
        } catch (Throwable unavailable) {
            return Collections.emptyList();
        }
    }

    @Override public List<Model.Track> playlistTracks(Model.Ref playlist) {
        try {
            return tracks(list(((Playlist) playlist.ref).getSongs()));
        } catch (Throwable unavailable) {
            return Collections.emptyList();
        }
    }

    @Override public List<Model.Ref> albums() {
        try {
            List<Model.Ref> result = new ArrayList<>();
            for (Object item : library().i()) {
                if (!(item instanceof b35)) continue;
                b35 album = (b35) item;
                result.add(new Model.Ref(album, album.f, album.a, album.b, album.c));
            }
            return result;
        } catch (Throwable unavailable) {
            return Collections.emptyList();
        }
    }

    @Override public List<Model.Track> albumTracks(Model.Ref album) {
        try {
            return tracksOfItems(library().r(((b35) album.ref).f));
        } catch (Throwable unavailable) {
            return Collections.emptyList();
        }
    }

    @Override public List<Model.Ref> artists() {
        try {
            List<Model.Ref> result = new ArrayList<>();
            for (Object item : library().j()) {
                if (!(item instanceof h35)) continue;
                h35 artist = (h35) item;
                result.add(new Model.Ref(artist, artist.a, artist.a, count(artist.b), artist.c));
            }
            return result;
        } catch (Throwable unavailable) {
            return Collections.emptyList();
        }
    }

    @Override public List<Model.Track> artistTracks(Model.Ref artist) {
        try {
            return tracksOfItems(library().t(((h35) artist.ref).a));
        } catch (Throwable unavailable) {
            return Collections.emptyList();
        }
    }

    // ---- radio ---------------------------------------------------------------------------------

    @Override public List<Model.Category> radioCategories() {
        try {
            List<Model.Category> result = new ArrayList<>();
            for (zf8 category : zf8.values()) result.add(new Model.Category(category.getKey(), category.getDisplayName()));
            return result;
        } catch (Throwable unavailable) {
            return Collections.emptyList();
        }
    }

    @Override public List<Model.Station> radioStations(String categoryKey) {
        try {
            List<Model.Station> result = new ArrayList<>();
            for (Object item : list(dh8.d.getValue())) {
                if (!(item instanceof bh8)) continue;
                bh8 station = (bh8) item;
                if (station.g != null && categoryKey.equals(station.g.getKey())) {
                    result.add(new Model.Station(station, station.b, station.c, categoryKey));
                }
            }
            return result;
        } catch (Throwable unavailable) {
            return Collections.emptyList();
        }
    }

    @Override public void startStation(final Model.Station station) {
        onMain(new Runnable() {
            @Override public void run() { ah8.m.t(context).i((bh8) station.station); }
        });
    }

    @Override public void loadRadioStations(final Async<Boolean> done) {
        suspend(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) { return dh8.a.a(context, call); }
        }, new Suspend.Callback() {
            @Override public void done(Object value, Throwable failure) { succeed(done, failure == null); }
        });
    }

    @Override public void liveStations(final Async<List<Model.LiveStation>> done) {
        suspend(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) { return bfa.a(context, call); }
        }, new Suspend.Callback() {
            @Override public void done(Object value, Throwable failure) {
                if (failure != null) {
                    fail(done, failure);
                    return;
                }
                List<Model.LiveStation> stations = new ArrayList<>();
                for (Object item : list(value)) {
                    if (!(item instanceof afa)) continue;
                    afa live = (afa) item;
                    stations.add(new Model.LiveStation(live.a, live.b, live.c, live.e, live.f, live.g));
                }
                succeed(done, stations);
            }
        });
    }

    @Override public void tuneLiveStation(final String stationId) {
        onMain(new Runnable() { @Override public void run() { liveManager().v(stationId); } });
    }

    @Override public boolean liveStationTuned() {
        try {
            return Boolean.TRUE.equals(liveManager().E.getValue());
        } catch (Throwable unavailable) {
            return false;
        }
    }

    // ---- catalogue loaders ---------------------------------------------------------------------

    private Model.Loaded loadedOf(a3b loaded) {
        return new Model.Loaded(loaded.a, loaded.b, loaded.c, tracks(list(loaded.d)), loaded.f);
    }

    @Override public void loadEditorialPlaylist(final String id, final String name, final String artUrl, final Async<Model.Loaded> done) {
        suspend(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) { return ed9.u(context, new e6b(id, name, artUrl), call); }
        }, new Suspend.Callback() {
            @Override public void done(Object value, Throwable failure) {
                if (failure == null && value instanceof a3b) succeed(done, loadedOf((a3b) value));
                else fail(done, failure != null ? failure : new IOException("Playlist not available"));
            }
        });
    }

    private CanonicalAlbum canonical(Model.AlbumRef album) {
        if (album.canonical instanceof CanonicalAlbum) return (CanonicalAlbum) album.canonical;
        // The order f3c.v fills it in for an Apple Music album.
        return new CanonicalAlbum("applemusic_album:" + album.id, album.title, album.artist, album.artUrl, null, album.trackCount,
            "applemusic", album.id, album.releaseDate, album.genre, null, album.id, album.explicit);
    }

    @Override public void loadAlbum(final Model.AlbumRef album, final Async<Model.Loaded> done) {
        final CanonicalAlbum canonical = canonical(album);
        suspend(new Suspend.Loader() {
            // The request the phone's album cards open with: c6b for a catalogue album, y5b or b6b for an addon's.
            @Override public Object invoke(Suspend.Call call) { return ed9.u(context, jh8.O(canonical), call); }
        }, new Suspend.Callback() {
            @Override public void done(Object value, Throwable failure) {
                if (failure == null && value instanceof a3b) {
                    succeed(done, loadedOf((a3b) value));
                    return;
                }
                // The collection loader did not answer: the album loader of last resort.
                suspend(new Suspend.Loader() {
                    @Override public Object invoke(Suspend.Call call) { return vf8.X(context, canonical, call); }
                }, new Suspend.Callback() {
                    @Override public void done(Object value, Throwable failure) {
                        if (failure == null && value instanceof gd7) {
                            List<Model.Track> songs = tracks(list(((gd7) value).q));
                            if (!songs.isEmpty()) {
                                succeed(done, new Model.Loaded(album.title, album.artist, album.artUrl, songs,
                                    new ee8(canonical.getId(), canonical.getTitle())));
                                return;
                            }
                        }
                        fail(done, failure != null ? failure : new IOException("Album not available"));
                    }
                });
            }
        });
    }

    private List<Model.AlbumRef> albumRefs(List<?> canonicals) {
        List<Model.AlbumRef> result = new ArrayList<>();
        for (Object item : canonicals) {
            if (!(item instanceof CanonicalAlbum)) continue;
            CanonicalAlbum album = (CanonicalAlbum) item;
            result.add(new Model.AlbumRef(first(album.getAppleMusicAlbumId(), album.getId()), album.getTitle(), album.getArtist(),
                album.getArtworkURL(), album.getReleaseDate(), album.getTrackCount(), album.getGenre(), album.isExplicit(), album));
        }
        return result;
    }

    @Override public void loadArtist(final String id, final String name, final String imageUrl, final Async<Model.ArtistPage> done) {
        suspend(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) { return ed9.t(context, new d6b(id, name, imageUrl), call); }
        }, artistCallback(name, imageUrl, done));
    }

    private Suspend.Callback artistCallback(final String name, final String imageUrl, final Async<Model.ArtistPage> done) {
        return new Suspend.Callback() {
            @Override public void done(Object value, Throwable failure) {
                if (failure == null && value instanceof p2b) {
                    p2b page = (p2b) value;
                    succeed(done, new Model.ArtistPage(first(page.a, name), first(page.b, imageUrl), tracks(list(page.c)),
                        albumRefs(list(page.d)), albumRefs(list(page.e))));
                } else {
                    fail(done, failure != null ? failure : new IOException("Artist not available"));
                }
            }
        };
    }

    // ---- provider search -----------------------------------------------------------------------

    /** The phone's search keeps its provider here: the stored addon id (and, for the built-ins, the provider name). */
    private SharedPreferences searchPrefs() { return context.getSharedPreferences("search_prefs", 0); }

    private InstalledAddon addon(String id) { return jn1.m.r(context).c(id); }

    /**
     * The addons the phone's provider list offers: enabled and able to search ({@code jn1.j}). An addon
     * that answers with the metadata provider's results is searched through Apple Music on the phone,
     * which the car does not reach, so it is not offered.
     */
    @Override public List<Model.SearchProvider> searchProviders() {
        try {
            List<Model.SearchProvider> result = new ArrayList<>();
            for (Object item : jn1.m.r(context).j()) {
                if (!(item instanceof InstalledAddon)) continue;
                InstalledAddon addon = (InstalledAddon) item;
                if (addon.getMetadataSearch()) continue;
                result.add(new Model.SearchProvider(addon.getId(), addon.getManifest().getName()));
            }
            return result;
        } catch (Throwable unavailable) {
            return Collections.emptyList();
        }
    }

    @Override public String selectedSearchProvider() {
        try {
            return searchPrefs().getString("active_addon_id", null);
        } catch (Throwable unavailable) {
            return null;
        }
    }

    @Override public void selectSearchProvider(String providerId) {
        try {
            searchPrefs().edit().putString("active_addon_id", providerId).apply();
        } catch (Throwable ignored) {
            // The pick still applies to this search; only the phone's memory of it is lost.
        }
    }

    private static <T> List<T> orEmpty(List<T> items) { return items == null ? Collections.<T>emptyList() : items; }

    private static boolean blank(String text) { return text == null || text.trim().isEmpty(); }

    /** The app's own addon client answers {@code search?q=}; its four lists become the car's four sections. */
    @Override public void searchProvider(final String providerId, final String query, final Async<Model.Found> done) {
        final InstalledAddon addon;
        try {
            addon = addon(providerId);
        } catch (Throwable unavailable) {
            fail(done, unavailable);
            return;
        }
        if (addon == null) {
            fail(done, new IOException("Search provider is not installed"));
            return;
        }
        suspend(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) { return gv2.j(call, addon, query); }
        }, new Suspend.Callback() {
            @Override public void done(Object value, Throwable failure) {
                if (failure != null || !(value instanceof EclipseAddonSearchResponse)) {
                    fail(done, failure != null ? failure : new IOException("Search provider answered nothing"));
                    return;
                }
                try {
                    succeed(done, foundOf(providerId, (EclipseAddonSearchResponse) value));
                } catch (Throwable unreadable) {
                    fail(done, unreadable);
                }
            }
        });
    }

    private Model.Found foundOf(String providerId, EclipseAddonSearchResponse response) {
        List<Model.Track> songs = new ArrayList<>();
        for (EclipseAddonTrack item : orEmpty(response.getTracks())) {
            if (item == null || blank(item.getId())) continue;
            // The song the app's own album and artist pages build for an addon's track.
            Model.Track converted = track(pw0.M(item, providerId, null));
            if (converted != null) songs.add(converted);
        }
        List<Model.SearchHit> albums = new ArrayList<>();
        for (EclipseAddonAlbum item : orEmpty(response.getAlbums())) {
            if (item == null || blank(item.getId())) continue;
            String artist = item.getArtist();
            albums.add(new Model.SearchHit(Model.SearchHit.Kind.ALBUM, providerId, item.getId(), item.getTitle(),
                blank(artist) ? "Unknown Artist" : artist, item.getEffectiveArtworkURL()));
        }
        List<Model.SearchHit> artists = new ArrayList<>();
        for (EclipseAddonArtist item : orEmpty(response.getArtists())) {
            if (item == null || blank(item.getId())) continue;
            artists.add(new Model.SearchHit(Model.SearchHit.Kind.ARTIST, providerId, item.getId(), item.getName(), "",
                item.getEffectiveArtworkURL()));
        }
        List<Model.SearchHit> playlists = new ArrayList<>();
        for (EclipseAddonPlaylistResult item : orEmpty(response.getPlaylists())) {
            if (item == null || blank(item.getId())) continue;
            playlists.add(new Model.SearchHit(Model.SearchHit.Kind.PLAYLIST, providerId, item.getId(), item.getTitle(),
                item.getCreator(), item.getEffectiveArtworkURL()));
        }
        return Model.Found.ofProvider(songs, albums, artists, playlists);
    }

    private void loadCollection(final m6b request, final String failureText, final Async<Model.Loaded> done) {
        suspend(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) { return ed9.u(context, request, call); }
        }, new Suspend.Callback() {
            @Override public void done(Object value, Throwable failure) {
                if (failure == null && value instanceof a3b) succeed(done, loadedOf((a3b) value));
                else fail(done, failure != null ? failure : new IOException(failureText));
            }
        });
    }

    /** An album the way the phone's search opens it; a provider may list a playlist as an album ({@code playlist_<id>}). */
    @Override public void loadAddonAlbum(Model.SearchHit hit, Async<Model.Loaded> done) {
        String playlist = hit.id.startsWith("playlist_") ? hit.id.substring("playlist_".length()) : null;
        loadCollection(playlist != null ? new b6b(hit.providerId, playlist, hit.title, hit.artUrl)
            : new y5b(hit.providerId, hit.id, hit.title, hit.subtitle, hit.artUrl), "Album not available", done);
    }

    @Override public void loadAddonPlaylist(Model.SearchHit hit, Async<Model.Loaded> done) {
        loadCollection(new b6b(hit.providerId, hit.id, hit.title, hit.artUrl), "Playlist not available", done);
    }

    @Override public void loadAddonArtist(final Model.SearchHit hit, final Async<Model.ArtistPage> done) {
        suspend(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) {
                return ed9.s(context, new z5b(hit.providerId, hit.id, hit.title, hit.artUrl), call);
            }
        }, artistCallback(hit.title, hit.artUrl, done));
    }

    // ---- linked lists --------------------------------------------------------------------------

    /**
     * A linked service's list ({@code ytmusic-...}): the app's own loader ({@code lb5.j}) answers the list
     * with its songs, and each song is built exactly as the phone's list screen builds it.
     */
    @Override public void loadLinkedList(final String rowKey, final String listId, final String name, final String artUrl,
                                         final Async<Model.Loaded> done) {
        suspend(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) { return lb5.a.j(context, listId, call); }
        }, new Suspend.Callback() {
            @Override public void done(Object value, Throwable failure) {
                if (failure == null && value instanceof ta5) {
                    try {
                        xa5 view = ((ta5) value).a;
                        List<Model.Track> songs = new ArrayList<>();
                        for (Object item : list(view.h)) {
                            if (!(item instanceof eb5)) continue;
                            eb5 entry = (eb5) item;
                            Song song = entry.c != null ? lb5.q(entry.a, entry.c, entry.b) : entry.a.a(context);
                            Model.Track converted = track(song);
                            if (converted != null) songs.add(converted);
                        }
                        String title = first(view.b, name);
                        succeed(done, new Model.Loaded(title, count(songs.size()), artUrl, songs, new fe8("home", rowKey + "/" + listId, title)));
                        return;
                    } catch (Throwable unusable) {
                        // Reported as a failed load below.
                    }
                }
                fail(done, failure != null ? failure : new IOException("List not available"));
            }
        });
    }

    /** A state holder the app's progress callback writes into; the loader's own result is what the car reads. */
    private static final class Holder implements uh6 {
        private volatile Object value;

        @Override public Object getValue() { return value; }

        @Override public void setValue(Object next) { value = next; }
    }

    private static String blankToNull(String text) { return text == null || text.trim().isEmpty() ? null : text; }

    /**
     * A linked-library playlist (the recents' {@code linked_playlist}): the app's own loader ({@code ja5.c})
     * answers it, and each playable entry becomes a song exactly as the phone's playlist screen builds it.
     */
    @Override public void loadLinkedLibraryPlaylist(final String provider, final String providerPlaylistId, final String name,
                                                    final String artUrl, final Async<Model.Loaded> done) {
        suspend(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) {
                // variant 5 of the app's callback class stores a partial playlist and a "ready" state into two holders.
                return ja5.a.c(context, provider, providerPlaylistId, false, new qi0(5, new Holder(), new Holder()), call);
            }
        }, new Suspend.Callback() {
            @Override public void done(Object value, Throwable failure) {
                if (failure == null && value instanceof l95) {
                    try {
                        List<Model.Track> songs = new ArrayList<>();
                        for (Object item : list(((l95) value).a.b)) {
                            if (!(item instanceof n95)) continue;
                            n95 entry = (n95) item;
                            if (!ja5.s(entry)) continue;
                            long millis = entry.g == null ? 0 : entry.g.longValue();
                            Model.Track converted = track(ja5.v("linked_" + provider + "_" + entry.a, entry.c.trim(), ja5.a(entry),
                                blankToNull(entry.e), millis <= 0 ? 0 : (int) (millis / 1000), blankToNull(entry.f), blankToNull(entry.h),
                                entry.i));
                            if (converted != null) songs.add(converted);
                        }
                        succeed(done, new Model.Loaded(name, count(songs.size()), artUrl, songs,
                            new fe8("linked", provider + "/" + providerPlaylistId, name)));
                        return;
                    } catch (Throwable unusable) {
                        // Reported as a failed load below.
                    }
                }
                fail(done, failure != null ? failure : new IOException("Playlist not available"));
            }
        });
    }

    // ---- native Home cards ---------------------------------------------------------------------

    private b0 dj() { return b0.G.l(context); }

    @Override public boolean djLive() {
        try {
            return Boolean.TRUE.equals(dj().f.getValue());
        } catch (Throwable unavailable) {
            return false;
        }
    }

    @Override public void startDj() {
        onMain(new Runnable() { @Override public void run() { dj().f(); } });
    }

    @Override public void stopDj() {
        onMain(new Runnable() { @Override public void run() { dj().g(); } });
    }

    private com.eclipse.android.services.replay.a replayService() { return com.eclipse.android.services.replay.a.m.v(context); }

    private static void put(JSONObject json, String key, String value) throws JSONException {
        if (value != null && !value.isEmpty()) json.put(key, value);
    }

    /** A replay track as the compose feed would send it, so the app's own parser makes the song when it is played. */
    private static Model.Track replayTrack(ReplayTrack replayTrack) {
        JSONObject json = new JSONObject();
        try {
            put(json, "title", replayTrack.getTitle());
            put(json, "artist", replayTrack.getArtistName());
            put(json, "album", replayTrack.getAlbumName());
            put(json, "isrc", replayTrack.getIsrc());
            put(json, "appleMusicTrackId", replayTrack.getAppleMusicTrackId());
            put(json, "artworkUrl", replayTrack.getArtworkURL());
        } catch (JSONException unusable) {
            // The fields written so far are what the parser gets.
        }
        return Model.Track.deferred(json.toString(), replayTrack.getTitle(), replayTrack.getArtistName(), replayTrack.getAlbumName(),
            replayTrack.getArtworkURL());
    }

    @Override public Model.Replay replay() {
        try {
            com.eclipse.android.services.replay.a service = replayService();
            Object summary = service.f.getValue();
            if (summary == null) summary = service.h.getValue();
            if (!(summary instanceof ReplaySummary)) return null;
            ReplaySummary replay = (ReplaySummary) summary;
            List<Model.Track> tracks = new ArrayList<>();
            for (Object item : list(replay.getTopTracks())) {
                if (item instanceof ReplayTrack) tracks.add(replayTrack((ReplayTrack) item));
            }
            Integer month = replay.getMonth();
            return new Model.Replay(month == null ? 0 : month.intValue(), replay.getHasContent(), replay.getFormattedListeningTime(), tracks);
        } catch (Throwable unavailable) {
            return null;
        }
    }

    @Override public void refreshReplay(final Async<Boolean> done) {
        suspend(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) { return replayService().e(call); }
        }, new Suspend.Callback() {
            @Override public void done(Object value, Throwable failure) { succeed(done, failure == null); }
        });
    }

    @Override public void loadTopSongs(final Async<List<Model.Track>> done) {
        suspend(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) { return hv0.b(context, call, 0); }
        }, new Suspend.Callback() {
            @Override public void done(Object value, Throwable failure) {
                if (failure != null) {
                    fail(done, failure);
                    return;
                }
                try {
                    List<Model.Track> songs = new ArrayList<>();
                    for (Object item : list(value)) {
                        if (!(item instanceof fv0)) continue;
                        Model.Track converted = track(((fv0) item).a(context));
                        if (converted != null) songs.add(converted);
                    }
                    succeed(done, songs);
                } catch (Throwable unusable) {
                    fail(done, unusable);
                }
            }
        });
    }

    @Override public List<Model.Show> shows() {
        try {
            List<Model.Show> result = new ArrayList<>();
            for (Object item : list(c38.k.A(context).h.getValue())) {
                if (!(item instanceof PodcastShow)) continue;
                PodcastShow show = (PodcastShow) item;
                result.add(new Model.Show(show, show.getId(), show.getTitle(), show.getAuthor(), show.getArtworkURL()));
            }
            return result;
        } catch (Throwable unavailable) {
            return Collections.emptyList();
        }
    }

    /** One show's episodes: the app's own feed loader reads the show's feed, each episode is the app's own song. */
    @Override public void loadShowEpisodes(final Model.Show show, final Async<Model.Loaded> done) {
        suspend(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) { return a38.d((PodcastShow) show.show, call); }
        }, new Suspend.Callback() {
            @Override public void done(Object value, Throwable failure) {
                if (failure != null) {
                    fail(done, failure);
                    return;
                }
                try {
                    List<Model.Track> songs = new ArrayList<>();
                    for (Object item : list(value)) {
                        if (!(item instanceof PodcastEpisode)) continue;
                        Model.Track converted = track(((PodcastEpisode) item).toSong());
                        if (converted != null) songs.add(converted);
                    }
                    succeed(done, new Model.Loaded(show.title, show.author, show.artUrl, songs, null));
                } catch (Throwable unusable) {
                    fail(done, unusable);
                }
            }
        });
    }

    // ---- search --------------------------------------------------------------------------------

    @Override public void search(final String query, final Async<List<Model.SearchResult>> done) {
        suspend(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) { return cm7.a(carCallback(), query, call); }
        }, new Suspend.Callback() {
            @Override public void done(Object value, Throwable failure) {
                if (failure != null) {
                    fail(done, failure);
                    return;
                }
                List<Model.SearchResult> results = new ArrayList<>();
                for (Object item : list(value)) {
                    if (!(item instanceof s06)) continue;
                    s06 media = (s06) item;
                    p16 metadata = media.d;
                    if (metadata == null) continue;
                    CharSequence title = metadata.a;
                    CharSequence detail = metadata.b != null ? metadata.b : metadata.f;
                    results.add(new Model.SearchResult(media, media.a, title == null ? null : title.toString(),
                        detail == null ? null : detail.toString(), metadata.n == null ? null : metadata.n.toString(),
                        Boolean.TRUE.equals(metadata.r)));
                }
                succeed(done, results);
            }
        });
    }

    @Override public void playSearchResult(final Model.SearchResult result) {
        onMain(new Runnable() {
            @Override public void run() {
                s06 media = (s06) result.handle;
                carCallback().d(media.a, media.d);
            }
        });
    }

    // ---- compose feed --------------------------------------------------------------------------

    @Override public Model.ComposeAuth composeAuth() {
        try {
            SharedPreferences secure = e69.c.v(context).b;
            String token = secure == null ? null : secure.getString("auth_token", null);
            String device = a82.a;
            if (device == null) device = Settings.Secure.getString(context.getContentResolver(), "android_id");
            String storefront = bt1.k(context);
            return new Model.ComposeAuth(token, device, storefront, bt1.h(context, storefront));
        } catch (Throwable unavailable) {
            return new Model.ComposeAuth(null, null, null, null);
        }
    }

    @Override public String homeLayoutJson() {
        try {
            return context.getSharedPreferences("home_layout_prefs", 0).getString("home_layout_v1", null);
        } catch (Throwable unavailable) {
            return null;
        }
    }

    // ---- origins and playback ------------------------------------------------------------------

    @Override public Object libraryOrigin() { return he8.e; }

    @Override public Object playlistOrigin(String id, String name) { return new je8(id, name); }

    @Override public Object composedOrigin(String surface, String key, String name) { return new fe8(surface, key, name); }

    @Override public void play(final List<Model.Track> tracks, final int index, final Object origin) {
        onMain(new Runnable() {
            @Override public void run() {
                List<Object> songs = new ArrayList<>(tracks.size());
                int start = -1;
                for (int i = 0; i < tracks.size(); i++) {
                    Song song = songOf(tracks.get(i));
                    if (song == null) continue;
                    // A feed entry the app cannot parse is skipped; the tapped song's place is the next one that works.
                    if (start < 0 && i >= index) start = songs.size();
                    songs.add(song);
                }
                if (songs.isEmpty()) return;
                player().P(songs, start < 0 ? songs.size() - 1 : start, origin instanceof ke8 ? (ke8) origin : he8.e);
            }
        });
    }

    @Override public boolean shuffleOff() {
        try {
            Object mode = player().r.getValue();
            return !(mode instanceof Enum) || "OFF".equals(((Enum<?>) mode).name());
        } catch (Throwable unavailable) {
            return false;
        }
    }

    @Override public void toggleShuffle() {
        onMain(new Runnable() { @Override public void run() { player().r0(); } });
    }

    // ---- queue ---------------------------------------------------------------------------------

    @Override public boolean hasUpcoming() {
        try {
            le8 queue = queueStore();
            return !list(queue.k.getValue()).isEmpty() || !list(queue.q()).isEmpty();
        } catch (Throwable unavailable) {
            return false;
        }
    }

    @Override public Model.QueueSnapshot queue() {
        try {
            le8 queue = queueStore();
            Object index = queue.e.getValue();
            return new Model.QueueSnapshot(track(player().c.getValue()), tracks(list(queue.k.getValue())),
                tracks(list(queue.q())), new ArrayList<Object>(list(queue.c.getValue())),
                index instanceof Number ? ((Number) index).intValue() : -1, queue.k(), queue.o());
        } catch (Throwable unavailable) {
            return Model.QueueSnapshot.empty();
        }
    }

    @Override public void addToUpNext(final Model.Track track) {
        onMain(new Runnable() {
            @Override public void run() {
                Song song = songOf(track);
                if (song != null) queueStore().a(song);
            }
        });
    }

    @Override public void clearUpNext() {
        onMain(new Runnable() { @Override public void run() { queueStore().f(); } });
    }

    @Override public void removeUpNext(final int index) {
        onMain(new Runnable() { @Override public void run() { queueStore().E(index); } });
    }

    @Override public void skipNext(final boolean userInitiated) {
        onMain(new Runnable() { @Override public void run() { player().K(userInitiated); } });
    }

    @Override public void setQueueIndex(final int index) {
        onMain(new Runnable() { @Override public void run() { queueStore().A(index); } });
    }

    @Override public void playKeepingQueue(final Model.Track track) {
        onMain(new Runnable() {
            @Override public void run() {
                Song song = songOf(track);
                if (song != null) player().O(song);
            }
        });
    }

    // ---- artwork -------------------------------------------------------------------------------

    @Override public String artUri(String url) {
        try {
            // Search results already carry the provider's own content:// URI.
            if (url.startsWith("content://")) return url;
            Uri uri = CarArtworkProvider.q.B(context, url);
            return uri == null ? null : uri.toString();
        } catch (Throwable unavailable) {
            return null;
        }
    }

    // ---- session -------------------------------------------------------------------------------

    /** True once the playback service has published its session holder. */
    public static boolean sessionHolderPublished() {
        try {
            return PlaybackService.I != null;
        } catch (Throwable unavailable) {
            return false;
        }
    }

    /**
     * Wraps the framework session token in the app's own compat token class. That class is
     * neither relocated nor bundled: its name travels in the parcel to the host.
     */
    public static MediaSessionCompat.Token compatToken(MediaSession.Token framework) {
        return new MediaSessionCompat.Token(framework, null);
    }
}
