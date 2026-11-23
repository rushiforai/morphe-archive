package nl.johninnl.eclipse.auto.data;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** An in-memory app that records every call it receives, in order. Asynchronous results arrive at once. */
public final class FakeApp implements AppPort {
    public final List<String> calls = new ArrayList<>();
    public final Object library = new Object();

    public List<Model.Track> songs = new ArrayList<>();
    public List<Model.Track> favorites = new ArrayList<>();
    public List<Model.Track> downloads = new ArrayList<>();
    public int downloadsCount;
    public List<Model.Track> cloud = new ArrayList<>();
    public List<Model.HistoryEntry> history = new ArrayList<>();
    public List<Model.Ref> playlists = new ArrayList<>();
    public Map<String, List<Model.Track>> playlistSongs = new HashMap<>();
    public List<Model.Ref> albums = new ArrayList<>();
    public Map<String, List<Model.Track>> albumSongs = new HashMap<>();
    public List<Model.Ref> artists = new ArrayList<>();
    public Map<String, List<Model.Track>> artistSongs = new HashMap<>();
    public List<Model.Category> categories = new ArrayList<>();
    public Map<String, List<Model.Station>> stations = new HashMap<>();
    public Model.QueueSnapshot queue = Model.QueueSnapshot.empty();
    public boolean shuffleOff = true;

    // Catalogue, live radio, search
    public List<Model.LiveStation> live = new ArrayList<>();
    public boolean liveTuned;
    public boolean historyResolves = true;
    public Model.Loaded editorial;
    public Model.Loaded album;
    public Model.ArtistPage artist;
    public List<Model.SearchResult> searchResults = new ArrayList<>();
    public Throwable searchFailure;

    // Provider search
    public List<Model.SearchProvider> providers = new ArrayList<>();
    public String selectedProvider;
    public Map<String, Model.Found> providerAnswers = new HashMap<>();
    public Map<String, Throwable> providerFailures = new HashMap<>();
    /** When set, a provider search is not answered at once: its callbacks queue here for the test to answer. */
    public boolean holdProviderAnswers;
    public final List<Runnable> heldAnswers = new ArrayList<>();
    public Model.Loaded addonAlbum;
    public Model.Loaded addonPlaylist;
    public Model.ArtistPage addonArtist;

    // Native Home cards and linked lists
    public boolean djLive;
    public Model.Replay replay;
    public List<Model.Track> topSongs = new ArrayList<>();
    public List<Model.Show> shows = new ArrayList<>();
    public Model.Loaded showEpisodes;
    public Model.Loaded linkedList;
    public Model.Loaded linkedLibraryPlaylist;
    public Model.ComposeAuth auth = new Model.ComposeAuth("secret-token-value", "device-1", "us", "user-1|us");
    public String layoutJson;
    public int composeAuthReads;

    public static Model.Track track(String title, String artist) {
        return new Model.Track(new Object(), title, artist, "", "https://art.example/" + title);
    }

    public static List<Model.Track> tracks(String... titles) {
        List<Model.Track> result = new ArrayList<>();
        for (String title : titles) result.add(track(title, "Artist " + title));
        return result;
    }

    @Override public List<Model.Track> librarySongs() { return songs; }
    @Override public List<Model.Track> favorites() { return favorites; }
    @Override public List<Model.Track> downloads() { return downloads; }
    @Override public int downloadsCount() { return downloadsCount; }
    @Override public List<Model.Track> cloudSongs() { return cloud; }
    @Override public List<Model.HistoryEntry> history() { return history; }
    @Override public List<Model.Ref> playlists() { return playlists; }
    @Override public List<Model.Track> playlistTracks(Model.Ref playlist) { return playlistSongs.getOrDefault(playlist.id, Collections.<Model.Track>emptyList()); }
    @Override public List<Model.Ref> albums() { return albums; }
    @Override public List<Model.Track> albumTracks(Model.Ref album) { return albumSongs.getOrDefault(album.id, Collections.<Model.Track>emptyList()); }
    @Override public List<Model.Ref> artists() { return artists; }
    @Override public List<Model.Track> artistTracks(Model.Ref artist) { return artistSongs.getOrDefault(artist.id, Collections.<Model.Track>emptyList()); }

    @Override public void playHistoryEntry(Model.HistoryEntry entry, Async<Boolean> done) {
        calls.add("playHistoryEntry " + entry.title);
        done.done(historyResolves, null);
    }

    @Override public List<Model.Category> radioCategories() { return categories; }
    @Override public List<Model.Station> radioStations(String categoryKey) { return stations.getOrDefault(categoryKey, Collections.<Model.Station>emptyList()); }
    @Override public void startStation(Model.Station station) { calls.add("startStation " + station.name); }

    @Override public void loadRadioStations(Async<Boolean> done) {
        calls.add("loadRadioStations");
        done.done(true, null);
    }

    @Override public void liveStations(Async<List<Model.LiveStation>> done) {
        calls.add("liveStations");
        done.done(live, null);
    }

    @Override public void tuneLiveStation(String stationId) { calls.add("tuneLiveStation " + stationId); }
    @Override public boolean liveStationTuned() { return liveTuned; }

    @Override public void loadEditorialPlaylist(String id, String name, String artUrl, Async<Model.Loaded> done) {
        calls.add("loadEditorialPlaylist " + id);
        done.done(editorial, editorial == null ? new IllegalStateException("none") : null);
    }

    @Override public void loadAlbum(Model.AlbumRef ref, Async<Model.Loaded> done) {
        calls.add("loadAlbum " + ref.id);
        done.done(album, album == null ? new IllegalStateException("none") : null);
    }

    @Override public void loadArtist(String id, String name, String imageUrl, Async<Model.ArtistPage> done) {
        calls.add("loadArtist " + id);
        done.done(artist, artist == null ? new IllegalStateException("none") : null);
    }

    @Override public void loadLinkedList(String rowKey, String listId, String name, String artUrl, Async<Model.Loaded> done) {
        calls.add("loadLinkedList " + rowKey + " " + listId);
        done.done(linkedList, linkedList == null ? new IllegalStateException("none") : null);
    }

    @Override public void loadLinkedLibraryPlaylist(String provider, String providerPlaylistId, String name, String artUrl,
                                                    Async<Model.Loaded> done) {
        calls.add("loadLinkedLibraryPlaylist " + provider + " " + providerPlaylistId);
        done.done(linkedLibraryPlaylist, linkedLibraryPlaylist == null ? new IllegalStateException("none") : null);
    }

    @Override public boolean djLive() { return djLive; }

    @Override public void startDj() {
        djLive = true;
        calls.add("startDj");
    }

    @Override public void stopDj() {
        djLive = false;
        calls.add("stopDj");
    }

    @Override public Model.Replay replay() { return replay; }

    @Override public void refreshReplay(Async<Boolean> done) {
        calls.add("refreshReplay");
        done.done(true, null);
    }

    @Override public void loadTopSongs(Async<List<Model.Track>> done) {
        calls.add("loadTopSongs");
        done.done(topSongs.isEmpty() ? null : topSongs, topSongs.isEmpty() ? new IllegalStateException("none") : null);
    }

    @Override public List<Model.Show> shows() { return shows; }

    @Override public void loadShowEpisodes(Model.Show show, Async<Model.Loaded> done) {
        calls.add("loadShowEpisodes " + show.id);
        done.done(showEpisodes, showEpisodes == null ? new IllegalStateException("none") : null);
    }

    @Override public void search(String query, Async<List<Model.SearchResult>> done) {
        calls.add("search " + query);
        done.done(searchFailure == null ? searchResults : null, searchFailure);
    }

    @Override public void playSearchResult(Model.SearchResult result) { calls.add("playSearchResult " + result.mediaId); }

    @Override public List<Model.SearchProvider> searchProviders() { return providers; }

    @Override public String selectedSearchProvider() { return selectedProvider; }

    @Override public void selectSearchProvider(String providerId) {
        selectedProvider = providerId;
        calls.add("selectSearchProvider " + providerId);
    }

    @Override public void searchProvider(final String providerId, final String query, final Async<Model.Found> done) {
        calls.add("searchProvider " + providerId + " " + query);
        Runnable answer = new Runnable() {
            @Override public void run() {
                Throwable failure = providerFailures.get(providerId);
                Model.Found found = providerAnswers.get(providerId);
                done.done(failure == null ? found : null, failure != null || found == null ? (failure != null ? failure : new IllegalStateException("none")) : null);
            }
        };
        if (holdProviderAnswers) heldAnswers.add(answer);
        else answer.run();
    }

    @Override public void loadAddonAlbum(Model.SearchHit hit, Async<Model.Loaded> done) {
        calls.add("loadAddonAlbum " + hit.providerId + " " + hit.id);
        done.done(addonAlbum, addonAlbum == null ? new IllegalStateException("none") : null);
    }

    @Override public void loadAddonPlaylist(Model.SearchHit hit, Async<Model.Loaded> done) {
        calls.add("loadAddonPlaylist " + hit.providerId + " " + hit.id);
        done.done(addonPlaylist, addonPlaylist == null ? new IllegalStateException("none") : null);
    }

    @Override public void loadAddonArtist(Model.SearchHit hit, Async<Model.ArtistPage> done) {
        calls.add("loadAddonArtist " + hit.providerId + " " + hit.id);
        done.done(addonArtist, addonArtist == null ? new IllegalStateException("none") : null);
    }

    @Override public Model.ComposeAuth composeAuth() {
        composeAuthReads++;
        return auth;
    }

    @Override public String homeLayoutJson() { return layoutJson; }

    @Override public Object libraryOrigin() { return library; }
    @Override public Object playlistOrigin(String id, String name) { return "origin:" + id + ":" + name; }
    @Override public Object composedOrigin(String surface, String key, String name) { return "composed:" + surface + ":" + key + ":" + name; }

    @Override public void play(List<Model.Track> tracks, int index, Object origin) {
        calls.add("play " + tracks.size() + "@" + index + " " + (origin == library ? "library" : origin));
    }

    @Override public boolean shuffleOff() { return shuffleOff; }

    @Override public void toggleShuffle() {
        shuffleOff = !shuffleOff;
        calls.add("toggleShuffle");
    }

    @Override public boolean hasUpcoming() { return !queue.upNext.isEmpty() || !queue.tail.isEmpty(); }
    @Override public Model.QueueSnapshot queue() { return queue; }
    @Override public void addToUpNext(Model.Track track) { calls.add("addToUpNext " + track.title); }
    @Override public void clearUpNext() { calls.add("clearUpNext"); }
    @Override public void removeUpNext(int index) { calls.add("removeUpNext " + index); }
    @Override public void skipNext(boolean userInitiated) { calls.add("skipNext " + userInitiated); }
    @Override public void setQueueIndex(int index) { calls.add("setQueueIndex " + index); }
    @Override public void playKeepingQueue(Model.Track track) { calls.add("playKeepingQueue " + track.title); }
    @Override public String artUri(String url) { return null; }
}
