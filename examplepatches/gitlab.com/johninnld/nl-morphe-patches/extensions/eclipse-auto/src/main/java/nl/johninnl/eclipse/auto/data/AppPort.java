package nl.johninnl.eclipse.auto.data;

import java.util.List;

/**
 * Everything the car UI needs from the app, in plain models. {@code app/AppBridge} implements it
 * against the app's obfuscated classes; tests implement it with fakes. Every method is safe to
 * call on the main thread and never throws: failures come back as empty or neutral values, and an
 * {@link Async} result always arrives on the main thread.
 */
public interface AppPort {
    // Library
    List<Model.Track> librarySongs();
    List<Model.Track> favorites();
    List<Model.Track> downloads();
    int downloadsCount();
    List<Model.Track> cloudSongs();
    List<Model.HistoryEntry> history();
    List<Model.Ref> playlists();
    List<Model.Track> playlistTracks(Model.Ref playlist);
    List<Model.Ref> albums();
    List<Model.Track> albumTracks(Model.Ref album);
    List<Model.Ref> artists();
    List<Model.Track> artistTracks(Model.Ref artist);

    /** Play a recent song that is not in the library, found through the app's own catalogue search. */
    void playHistoryEntry(Model.HistoryEntry entry, Async<Boolean> done);

    // Radio
    List<Model.Category> radioCategories();
    List<Model.Station> radioStations(String categoryKey);
    void startStation(Model.Station station);
    /** Ask the app to load its radio stations, so the categories are not empty on a cold start. */
    void loadRadioStations(Async<Boolean> done);
    void liveStations(Async<List<Model.LiveStation>> done);
    void tuneLiveStation(String stationId);
    /** True while a live station is tuned: the queue ignores additions then. */
    boolean liveStationTuned();

    // Catalogue loaders
    void loadEditorialPlaylist(String appleMusicPlaylistId, String name, String artUrl, Async<Model.Loaded> done);
    void loadAlbum(Model.AlbumRef album, Async<Model.Loaded> done);
    void loadArtist(String appleMusicArtistId, String name, String imageUrl, Async<Model.ArtistPage> done);

    /** A linked service's list ({@code ytmusic-...}) with its songs, through the app's own linked-list loader. */
    void loadLinkedList(String rowKey, String listId, String name, String artUrl, Async<Model.Loaded> done);
    /** A linked-library playlist (the recents' {@code linked_playlist}) with its songs, through the app's own loader. */
    void loadLinkedLibraryPlaylist(String provider, String providerPlaylistId, String name, String artUrl, Async<Model.Loaded> done);

    // Native Home cards
    /** True while the Umbra DJ is running. */
    boolean djLive();
    /** Start the Umbra DJ exactly as its Home card does. */
    void startDj();
    /** Stop the Umbra DJ. */
    void stopDj();
    /** The current listening replay (this month, else this year), or null while the app has none yet. */
    Model.Replay replay();
    /** Ask the app to load and sync its replay summaries; the result arrives once, on the main thread. */
    void refreshReplay(Async<Boolean> done);
    /** The all-time top songs, as the app's own loader lists them. */
    void loadTopSongs(Async<List<Model.Track>> done);
    /** The podcast shows the user follows. */
    List<Model.Show> shows();
    /** One show's episodes as songs, through the app's own feed loader. */
    void loadShowEpisodes(Model.Show show, Async<Model.Loaded> done);

    // Search: the app's own library search (the offline fallback) and the phone's provider search
    void search(String query, Async<List<Model.SearchResult>> done);
    void playSearchResult(Model.SearchResult result);
    /** The installed addons the phone's Search can pick from (enabled, able to search), in the app's order. */
    List<Model.SearchProvider> searchProviders();
    /** The addon id the phone's Search has selected (its stored {@code active_addon_id}), or null. */
    String selectedSearchProvider();
    /** Select this provider the way the phone's Search does, so the phone follows. */
    void selectSearchProvider(String providerId);
    /** Search one provider through the app's own addon client. */
    void searchProvider(String providerId, String query, Async<Model.Found> done);
    /** An album found by a provider with its songs (a playlist the provider lists as an album comes back too). */
    void loadAddonAlbum(Model.SearchHit hit, Async<Model.Loaded> done);
    void loadAddonPlaylist(Model.SearchHit hit, Async<Model.Loaded> done);
    void loadAddonArtist(Model.SearchHit hit, Async<Model.ArtistPage> done);

    // Compose feed
    Model.ComposeAuth composeAuth();
    /** The phone's Home layout preferences (JSON), or null when never customised. */
    String homeLayoutJson();

    // Queue origins (opaque objects the app understands)
    Object libraryOrigin();
    Object playlistOrigin(String id, String name);
    Object composedOrigin(String surface, String key, String name);

    // Playback and queue
    void play(List<Model.Track> tracks, int index, Object origin);
    boolean shuffleOff();
    void toggleShuffle();
    /** True when anything is queued after the current song; cheaper than {@link #queue()}. */
    boolean hasUpcoming();
    Model.QueueSnapshot queue();
    void addToUpNext(Model.Track track);
    void clearUpNext();
    void removeUpNext(int index);
    void skipNext(boolean userInitiated);
    void setQueueIndex(int index);
    void playKeepingQueue(Model.Track track);

    /** The content:// URI the app's own provider serves for an artwork URL, or null. */
    String artUri(String url);
}
