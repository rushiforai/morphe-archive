package com.anderson.applemusic.one.screen;

import com.anderson.applemusic.one.media.MediaClient;

import java.util.List;

/**
 * What the screens are allowed to ask of {@code OneActivity}: browse subscriptions,
 * transport, overlays and status. Keeps the screens independent from the activity's
 * MediaBrowser/updater wiring.
 */
public interface ScreenHost {

    /** One library section already loaded from the browse tree (Biblioteca or its cache). */
    final class LibrarySection {
        public final String title;
        public final List<MediaClient.Item> items;

        public LibrarySection(String title, List<MediaClient.Item> items) {
            this.title = title;
            this.items = items;
        }
    }

    void loadChildren(String parentId, ChildSink sink);

    /**
     * Library categories already loaded from the browse tree, for the local search scope;
     * null when the Biblioteca never loaded in this process. Never touches the network.
     */
    List<LibrarySection> librarySections();

    /** Leaves the search (when open) and selects the Biblioteca tab. */
    void openLibrary();

    /** Drops the cached children and re-subscribes, for an explicit refresh. */
    void refreshChildren(String parentId, ChildSink sink);

    void forgetChildren(ChildSink sink);

    void play(MediaClient.Item item);

    void playId(String mediaId, String label);

    /** Plays a collection id and starts at its 0-based track {@code index}. */
    void playCollectionFrom(String collectionId, String label, int index, MediaClient.Item track);

    /** Jumps inside the session queue ({@code MediaController.skipToQueueItem}). */
    void skipToQueue(long queueId);

    /** Latest playback snapshot, for the "tocando agora" state of a freshly built list. */
    MediaClient.Snapshot nowPlaying();

    void togglePlayPause();

    void skipNext();

    void skipPrevious();

    void seek(long positionMs);

    void status(String message);

    void openSearch();

    void openAccount();

    /** Opens the engine's official account/subscription screen. */
    void openAccountSummary();

    /** Whether the engine's own settings screen can be reached: the navigation helper class
     * and the {@code action_settings} destination both exist in this engine build. */
    boolean engineSettingsAvailable();

    /** Opens the engine's settings screen inside its {@code MainActivity}. */
    void openEngineSettings();

    void openUpdates();

    void openPlayer();

    void openCollection(String title, String parentId, boolean grid);

    /**
     * Opens the collection browser at an album/playlist that only exists in the library:
     * the tracks still come from the catalogue by name and "Tocar" degrades to the
     * library id when that resolution fails.
     */
    void openLibraryCollection(int kind, String title, String subtitle, String libraryId);

    /** Opens the catalogue detail stack at an artist/album/playlist/song id. */
    void openArtist(String id, String name, String artworkUrl);

    void openAlbum(String id, String title, String artist, String artworkUrl);

    void openPlaylist(String id, String title, String curator, String artworkUrl);

    void openSong(String id, String title, String artist, String artworkUrl);

    void closeDetail();

    void sessionActions();

    /** Sends one session custom action and returns its user-facing confirmation. */
    String sessionAction(String actionId);

    void itemActions(MediaClient.Item item);

    void createStation();

    void closePlayer();

    void closeSearch();

    void closeActions();

    void closeUpdates();

    void closeAccount();

    void closeCollection();

    /** Id of the mini player, the D-pad "down" target from the shelves. */
    int downFocusId();

    boolean isTv();
}
