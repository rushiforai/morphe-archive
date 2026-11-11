package app.originisland.extension;

import static app.originisland.extension.MusicCardProtocol.*;

import android.app.Application;
import android.content.Context;
import android.graphics.Bitmap;
import android.media.MediaDescription;
import android.media.MediaMetadata;
import android.media.Rating;
import android.media.browse.MediaBrowser;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.service.media.MediaBrowserService;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Makes Apple Music speak the protocol of the OriginOS music card (com.vivo.musicwidgetmix).
 *
 * The heart needs nothing here to act: Apple Music toggles the favorite for any rating. If a song
 * is a favorite, and the repeat and shuffle modes, are only told by the icons of its custom actions.
 */
@SuppressWarnings("unused")
public final class AppleMusicCardPatch {

    private static final String TAG = "OriginIslandAppleMusic";

    private static final String ICON_NOT_FAVORITE = "snackbar_favorite";
    private static final String ACTION_NAME_FAVORITE = "favorite";
    private static final String ACTION_NAME_SHUFFLE = "shuffle";
    private static final String ACTION_NAME_REPEAT = "repeat";

    // MediaSessionCompat
    private static final String ACTION_SET_REPEAT_MODE = "android.support.v4.media.session.action.SET_REPEAT_MODE";
    private static final String ARGUMENT_REPEAT_MODE = "android.support.v4.media.session.action.ARGUMENT_REPEAT_MODE";
    private static final String ACTION_SET_SHUFFLE_MODE = "android.support.v4.media.session.action.SET_SHUFFLE_MODE";
    private static final String ARGUMENT_SHUFFLE_MODE = "android.support.v4.media.session.action.ARGUMENT_SHUFFLE_MODE";

    // PlaybackStateCompat
    private static final int REPEAT_MODE_NONE = 0;
    private static final int REPEAT_MODE_ONE = 1;
    private static final int REPEAT_MODE_ALL = 2;
    private static final int SHUFFLE_MODE_NONE = 0;
    private static final int SHUFFLE_MODE_ALL = 1;

    /**
     * The card only listens for the metadata once it has connected, which takes a moment.
     */
    private static final long PUBLISH_AFTER_CONNECTING_DELAY_MS = 1500;
    private static final long PUBLISH_DELAY_MS = 150;
    private static final int MAX_COVER_SIZE = 720;

    /**
     * The island only looks for lyrics a moment after the media id changes, so for lyrics that came
     * later the id of the same song is changed.
     */
    private static final long ISLAND_LYRICS_WINDOW_MS = 2000;
    private static final long LYRICS_AFTER_MEDIA_ID_MS = 1000;
    private static final long LYRICS_RESEND_DELAY_MS = 2500;
    private static final String LATE_LYRICS_SUFFIX = "-lyrics";

    /**
     * The island and the widget of the lock screen forget the lyrics when they are made again, as
     * when the screen locks, and they ask the app for them again in a way the card never passes
     * on to apps like this one. So the lyrics are sent again now and then while a song plays.
     */
    private static final long LYRICS_REFRESH_INTERVAL_MS = 4000;

    private static final String[] COVER_ADDRESS_KEYS = {
            MediaMetadata.METADATA_KEY_ALBUM_ART_URI,
            MediaMetadata.METADATA_KEY_ART_URI,
            MediaMetadata.METADATA_KEY_DISPLAY_ICON_URI,
    };

    /**
     * The app Jovi asks for songs by voice, under the package of QQ Music, which Jovi knows.
     */
    private static final String JOVI_STAND_IN_PACKAGE = "com.tencent.qqmusic";

    private static final Handler mainHandler = new Handler(Looper.getMainLooper());
    private static final ExecutorService lyricsLoader = Executors.newSingleThreadExecutor();
    private static final Runnable publishTask = AppleMusicCardPatch::publishLastMetadata;
    private static final Runnable sendLyricsTask = AppleMusicCardPatch::sendLyrics;
    private static final Runnable refreshLyricsTask = AppleMusicCardPatch::refreshLyrics;

    private static final long LIST_REFRESH_INTERVAL_MS = 5 * 60 * 1000;
    private static final long DOWNLOADS_REFRESH_INTERVAL_MS = 30 * 1000;
    private static final Map<String, List<MediaDescription>> libraryLists = new HashMap<>();
    private static final Map<String, Long> listsLoadedAt = new HashMap<>();
    private static final Map<String, List<MediaBrowserService.Result<List<MediaBrowser.MediaItem>>>> waitingForLists =
            new HashMap<>();
    private static final Set<String> listsLoading = new HashSet<>();

    private static WeakReference<MediaSession> sessionRef = new WeakReference<>(null);

    /**
     * If the app may connect to its own player, which it does to start it for a voice request.
     */
    static volatile boolean allowOwnBrowser;
    private static final String OWN_PACKAGE = "com.apple.android.music";

    static MediaSession getSession() {
        return sessionRef.get();
    }

    private static WeakReference<MediaBrowserService> browserServiceRef = new WeakReference<>(null);
    private static MediaMetadata lastMetadata;
    private static String songId = "";
    private static String trackId = "";
    private static long trackIdChangedAt;
    private static long firstLyricsSendsUntil;
    private static boolean refreshingLyrics;
    private static String lyrics = "";
    private static volatile String lyricsFor = "";

    private AppleMusicCardPatch() {
    }

    /**
     * Injection point.
     *
     * @return The root for the client, or null if the client is not the music card.
     */
    public static MediaBrowserService.BrowserRoot onGetBrowserRoot(String clientPackageName) {
        if (allowOwnBrowser && OWN_PACKAGE.equals(clientPackageName)) {
            // The voice request receiver, starting the player for a song asked for by voice.
            return new MediaBrowserService.BrowserRoot(BROWSER_ROOT_ID, null);
        }
        if (JOVI_STAND_IN_PACKAGE.equals(clientPackageName)) {
            // The app that takes the songs Jovi is asked for by voice, and has them played here.
            Log.i(TAG, "Jovi stand-in connected");
            return new MediaBrowserService.BrowserRoot(BROWSER_ROOT_ID, null);
        }
        if (!MUSIC_CARD_PACKAGE.equals(clientPackageName)) {
            return null;
        }
        Log.i(TAG, "Card connected");
        mainHandler.postDelayed(publishTask, PUBLISH_AFTER_CONNECTING_DELAY_MS);
        mainHandler.postDelayed(sendLyricsTask, PUBLISH_AFTER_CONNECTING_DELAY_MS);
        mainHandler.postDelayed(() -> {
            refreshLibraryList(LIST_FAVORITE);
            refreshLibraryList(LIST_LOCAL);
        }, PUBLISH_AFTER_CONNECTING_DELAY_MS);
        return new MediaBrowserService.BrowserRoot(BROWSER_ROOT_ID, null);
    }

    /**
     * Injection point. Called as the app makes a session.
     */
    public static void onSessionCreated(MediaSession session) {
        // The app sets the session up after it has made it.
        mainHandler.post(() -> attachSession(session));
    }

    /**
     * Injection point. Called with the metadata of the app.
     */
    public static synchronized MediaMetadata onSetMetadata(MediaSession session, MediaMetadata metadata) {
        try {
            attachSession(session);
            lastMetadata = metadata;
            return metadata == null ? null : withMusicCardKeys(metadata);
        } catch (Exception ex) {
            Log.e(TAG, "onSetMetadata failure", ex);
            return metadata;
        }
    }

    /**
     * Injection point.
     *
     * @return The custom action the app should handle, or null if it was handled here.
     */
    public static String onCustomAction(String action, Bundle extras) {
        try {
            if (!ACTION_PLAY_MODE.equals(action)) {
                return action;
            }
            MediaSession session = sessionRef.get();
            if (session != null && extras != null) {
                setLoopMode(session.getController().getTransportControls(), extras.getInt(KEY_LOOP_MODE));
            }
            return null;
        } catch (Exception ex) {
            Log.e(TAG, "onCustomAction failure", ex);
            return action;
        }
    }

    /**
     * Apple Music can repeat and shuffle at the same time, which the card has no mode for,
     * so each turns the other off.
     */
    private static void setLoopMode(MediaController.TransportControls controls, int loopMode) {
        boolean shuffle = loopMode == LOOP_MODE_RANDOM;
        Bundle shuffleArguments = new Bundle();
        shuffleArguments.putInt(ARGUMENT_SHUFFLE_MODE, shuffle ? SHUFFLE_MODE_ALL : SHUFFLE_MODE_NONE);
        Bundle repeatArguments = new Bundle();
        repeatArguments.putInt(ARGUMENT_REPEAT_MODE, shuffle ? REPEAT_MODE_NONE
                : loopMode == LOOP_MODE_SINGLE ? REPEAT_MODE_ONE : REPEAT_MODE_ALL);
        controls.sendCustomAction(ACTION_SET_SHUFFLE_MODE, shuffleArguments);
        controls.sendCustomAction(ACTION_SET_REPEAT_MODE, repeatArguments);
    }

    /**
     * Injection point.
     *
     * @return The parent the app should load the children of, or null if they were loaded here.
     */
    public static String onLoadChildren(MediaBrowserService browserService, String parentId,
                                        MediaBrowserService.Result<List<MediaBrowser.MediaItem>> result,
                                        Bundle options) {
        try {
            if (BROWSER_ROOT_ID.equals(parentId)) {
                result.sendResult(new ArrayList<>());
                return null;
            }
            int page = options == null ? 0 : options.getInt(LIST_KEY_PAGE);
            if (LIST_FAVORITE.equals(parentId) || LIST_LOCAL.equals(parentId)) {
                browserServiceRef = new WeakReference<>(browserService);
                loadLibraryList(parentId, page, result);
                return null;
            }
            if (!LIST_CURRENT.equals(parentId)) {
                return parentId;
            }
            browserServiceRef = new WeakReference<>(browserService);

            List<MediaDescription> songs = new ArrayList<>();
            List<MediaSession.QueueItem> queue = page == 0 ? getQueue() : null;
            if (queue != null) {
                for (MediaSession.QueueItem song : queue) {
                    MediaDescription description = song.getDescription();
                    songs.add(new MediaDescription.Builder()
                            .setMediaId(mediaIdOf(description.getTitle(), description.getSubtitle()))
                            .setTitle(description.getTitle())
                            .setSubtitle(description.getSubtitle() == null ? "" : description.getSubtitle())
                            .build());
                }
            }
            if (songs.isEmpty() && page == 0) {
                songs.add(new MediaDescription.Builder()
                        .setMediaId(EMPTY_LIST_MEDIA_ID)
                        .setTitle("Nothing playing")
                        .setSubtitle("Play something in Apple Music")
                        .build());
            }
            result.sendResult(toSinglePage(songs));
            return null;
        } catch (Exception ex) {
            Log.e(TAG, "onLoadChildren failure", ex);
            return parentId;
        }
    }

    /**
     * Injection point.
     */
    public static String onLoadChildren(MediaBrowserService browserService, String parentId,
                                        MediaBrowserService.Result<List<MediaBrowser.MediaItem>> result) {
        return onLoadChildren(browserService, parentId, result, null);
    }

    /**
     * Injection point.
     *
     * @return The media id the app should play, or null if it was played here.
     */
    public static String onPlayFromMediaId(String mediaId, Bundle extras) {
        try {
            if (EMPTY_LIST_MEDIA_ID.equals(mediaId)) {
                return null;
            }
            if (mediaId == null || extras == null || !LIST_CURRENT.equals(extras.getString(KEY_LIST))) {
                return mediaId;
            }
            MediaSession session = sessionRef.get();
            List<MediaSession.QueueItem> queue = getQueue();
            if (session != null && queue != null) {
                for (MediaSession.QueueItem song : queue) {
                    MediaDescription description = song.getDescription();
                    if (mediaId.equals(mediaIdOf(description.getTitle(), description.getSubtitle()))) {
                        session.getController().getTransportControls().skipToQueueItem(song.getQueueId());
                        break;
                    }
                }
            }
            return null;
        } catch (Exception ex) {
            Log.e(TAG, "onPlayFromMediaId failure", ex);
            return mediaId;
        }
    }

    private static void loadLibraryList(String list, int page,
                                        MediaBrowserService.Result<List<MediaBrowser.MediaItem>> result) {
        if (page != 0) {
            result.sendResult(new ArrayList<>());
            return;
        }

        List<MediaDescription> cached = libraryLists.get(list);
        if (cached != null) {
            result.sendResult(toSinglePage(orSayEmpty(list, cached)));
            // It may have changed since, which the card is told of.
            refreshLibraryList(list);
            return;
        }
        result.detach();
        waitingForLists.computeIfAbsent(list, key -> new ArrayList<>()).add(result);
        refreshLibraryList(list);
    }

    /**
     * Loading the playlists takes longer than the card waits, so the lists are kept here.
     */
    private static void refreshLibraryList(String list) {
        long now = SystemClock.elapsedRealtime();
        Long loadedAt = listsLoadedAt.get(list);
        long interval = LIST_LOCAL.equals(list) ? DOWNLOADS_REFRESH_INTERVAL_MS : LIST_REFRESH_INTERVAL_MS;
        if (listsLoading.contains(list) || (loadedAt != null && now - loadedAt < interval)) {
            return;
        }
        listsLoading.add(list);
        try {
            AppleMusicLibrary.Callback callback = songs -> onLibraryListLoaded(list, songs);
            if (LIST_FAVORITE.equals(list)) {
                AppleMusicLibrary.loadFavorites(application(), callback);
            } else {
                AppleMusicLibrary.loadDownloads(application(), callback);
            }
        } catch (Exception ex) {
            Log.e(TAG, "Could not load a list", ex);
            onLibraryListLoaded(list, new ArrayList<>());
        }
    }

    private static void onLibraryListLoaded(String list, List<MediaDescription> songs) {
        listsLoading.remove(list);
        boolean changed = !sameList(libraryLists.get(list), songs);
        // A list that failed to load is not kept in place of the one before.
        // An empty list is asked for again the next time, as the app may not have been ready.
        if (!songs.isEmpty()) {
            libraryLists.put(list, songs);
            listsLoadedAt.put(list, SystemClock.elapsedRealtime());
        }

        List<MediaBrowserService.Result<List<MediaBrowser.MediaItem>>> waiting = waitingForLists.remove(list);
        if (waiting != null) {
            for (MediaBrowserService.Result<List<MediaBrowser.MediaItem>> result : waiting) {
                result.sendResult(toSinglePage(orSayEmpty(list, songs)));
            }
        } else if (changed) {
            MediaBrowserService browserService = browserServiceRef.get();
            if (browserService != null) {
                browserService.notifyChildrenChanged(list);
            }
        }
    }

    private static boolean sameList(List<MediaDescription> first, List<MediaDescription> second) {
        if (first == null || first.size() != second.size()) {
            return false;
        }
        for (int i = 0; i < first.size(); i++) {
            if (!Objects.equals(first.get(i).getMediaId(), second.get(i).getMediaId())) {
                return false;
            }
        }
        return true;
    }

    private static List<MediaDescription> orSayEmpty(String list, List<MediaDescription> songs) {
        if (!songs.isEmpty()) {
            return songs;
        }
        List<MediaDescription> empty = new ArrayList<>();
        empty.add(new MediaDescription.Builder()
                .setMediaId(EMPTY_LIST_MEDIA_ID)
                .setTitle(LIST_FAVORITE.equals(list) ? "No favorites found" : "No downloads found")
                .setSubtitle("")
                .build());
        return empty;
    }

    private static List<MediaSession.QueueItem> getQueue() {
        MediaSession session = sessionRef.get();
        return session == null ? null : session.getController().getQueue();
    }

    private static synchronized void attachSession(MediaSession session) {
        if (session == null || sessionRef.get() == session) {
            return;
        }
        sessionRef = new WeakReference<>(session);
        // The card only reads the favorite and the loop mode when the metadata changes,
        // and Apple Music tells them with its playback state.
        session.getController().registerCallback(new MediaController.Callback() {
            @Override
            public void onPlaybackStateChanged(PlaybackState state) {
                mainHandler.removeCallbacks(publishTask);
                mainHandler.postDelayed(publishTask, PUBLISH_DELAY_MS);
                if (isPlaying(state) && !refreshingLyrics) {
                    scheduleLyricsRefresh(LYRICS_REFRESH_INTERVAL_MS);
                }
            }
        }, mainHandler);
    }

    private static boolean isPlaying(PlaybackState state) {
        return state != null && (state.getState() == PlaybackState.STATE_PLAYING
                || state.getState() == PlaybackState.STATE_BUFFERING);
    }

    /**
     * Sends the lyrics again while a song plays, and stops when it does not.
     */
    private static void refreshLyrics() {
        refreshingLyrics = false;
        MediaSession session = sessionRef.get();
        if (session == null || !isPlaying(session.getController().getPlaybackState())) {
            return;
        }
        // Not while the lyrics for a new song are still being sent for the first time.
        if (SystemClock.elapsedRealtime() >= firstLyricsSendsUntil) {
            sendLyrics();
        }
        scheduleLyricsRefresh(LYRICS_REFRESH_INTERVAL_MS);
    }

    private static void scheduleLyricsRefresh(long delay) {
        mainHandler.removeCallbacks(refreshLyricsTask);
        mainHandler.postDelayed(refreshLyricsTask, delay);
        refreshingLyrics = true;
    }

    private static synchronized void publishLastMetadata() {
        try {
            MediaSession session = sessionRef.get();
            if (session != null) {
                session.setMetadata(lastMetadata == null ? nothingLoaded() : withMusicCardKeys(lastMetadata));
            }
        } catch (Exception ex) {
            Log.e(TAG, "publishLastMetadata failure", ex);
        }
    }

    /**
     * The card only offers the lists of an app that says it has them, which it reads from the
     * metadata, so this is said while no song is loaded as well.
     */
    private static MediaMetadata nothingLoaded() {
        return new MediaMetadata.Builder()
                .putLong(KEY_SUPPORT_EVENT, EVENT_PLAY_CONTROL | EVENT_MUSIC_INFO | EVENT_MUSIC_IMAGE
                        | EVENT_LIST_CURRENT | EVENT_LIST_FAVORITE | EVENT_LIST_LOCAL)
                .build();
    }

    private static MediaMetadata withMusicCardKeys(MediaMetadata metadata) {
        String title = metadata.getString(MediaMetadata.METADATA_KEY_TITLE);
        String artist = metadata.getString(MediaMetadata.METADATA_KEY_ARTIST);
        String album = metadata.getString(MediaMetadata.METADATA_KEY_ALBUM);
        long duration = metadata.getLong(MediaMetadata.METADATA_KEY_DURATION);
        if (title == null) {
            return nothingLoaded();
        }

        // The card ignores a song change unless the media id changes as well.
        String mediaId = mediaIdOf(title, artist);
        if (!mediaId.equals(songId)) {
            songId = mediaId;
            trackId = mediaId;
            trackIdChangedAt = SystemClock.elapsedRealtime();
            Log.i(TAG, "Song changed, id " + Integer.toHexString(trackId.hashCode()));
            MediaBrowserService browserService = browserServiceRef.get();
            if (browserService != null) {
                browserService.notifyChildrenChanged(LIST_CURRENT);
            }
        }
        if (!mediaId.equals(lyricsFor)) {
            loadLyrics(mediaId, title, artist, album, duration);
        }

        long supportEvent = EVENT_PLAY_CONTROL | EVENT_MUSIC_INFO | EVENT_MUSIC_IMAGE
                | EVENT_SEEK_POSITION | EVENT_LIST_CURRENT | EVENT_LIST_FAVORITE | EVENT_LIST_LOCAL
                | EVENT_MUSIC_LRC;

        // The card prefers the address of the cover, and can only read it from a file of the device.
        Bitmap cover = coverOf(metadata);
        MediaMetadata.Builder builder = cover == null ? new MediaMetadata.Builder(metadata) : withoutCoverAddresses(metadata);
        builder.putString(MediaMetadata.METADATA_KEY_MEDIA_ID, trackId);
        if (cover != null) {
            builder.putBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART, cover);
            builder.putBitmap(MediaMetadata.METADATA_KEY_DISPLAY_ICON, cover);
            builder.putBitmap(MediaMetadata.METADATA_KEY_ART, cover);
        }

        PlaybackState.CustomAction favorite = customAction(ACTION_NAME_FAVORITE);
        if (favorite != null) {
            supportEvent |= EVENT_FAVORITE;
            String icon = iconOf(favorite);
            builder.putRating(MediaMetadata.METADATA_KEY_RATING,
                    Rating.newHeartRating(icon != null && !ICON_NOT_FAVORITE.equals(icon)));
        }

        PlaybackState.CustomAction shuffle = customAction(ACTION_NAME_SHUFFLE);
        PlaybackState.CustomAction repeat = customAction(ACTION_NAME_REPEAT);
        if (shuffle != null && repeat != null) {
            supportEvent |= EVENT_LOOP_MODE;
            String shuffleIcon = iconOf(shuffle);
            String repeatIcon = iconOf(repeat);
            int loopMode = LOOP_MODE_LIST;
            if (shuffleIcon != null && !shuffleIcon.contains("off")) {
                loopMode = LOOP_MODE_RANDOM;
            } else if (repeatIcon != null && repeatIcon.contains("one")) {
                loopMode = LOOP_MODE_SINGLE;
            }
            builder.putLong(KEY_LOOP_MODE, loopMode);
        }

        return builder.putLong(KEY_SUPPORT_EVENT, supportEvent).build();
    }

    private static PlaybackState.CustomAction customAction(String name) {
        MediaSession session = sessionRef.get();
        PlaybackState state = session == null ? null : session.getController().getPlaybackState();
        if (state != null) {
            for (PlaybackState.CustomAction action : state.getCustomActions()) {
                if (action.getName() != null && name.contentEquals(action.getName().toString().toLowerCase())) {
                    return action;
                }
            }
        }
        return null;
    }

    /**
     * @return The name of the icon of an action, as only the icon tells the state of the action.
     */
    private static String iconOf(PlaybackState.CustomAction action) {
        try {
            return application().getResources().getResourceEntryName(action.getIcon());
        } catch (Exception ex) {
            return null;
        }
    }

    private static Context application() throws Exception {
        return (Application) Class.forName("android.app.ActivityThread")
                .getMethod("currentApplication").invoke(null);
    }

    private static void loadLyrics(String mediaId, String title, String artist, String album, long duration) {
        lyrics = "";
        lyricsFor = mediaId;
        long startedAt = System.currentTimeMillis();
        if (artist == null) {
            return;
        }
        lyricsLoader.execute(() -> {
            String lrc;
            try {
                lrc = AppleMusicLyrics.load(application(), title, artist, album, duration,
                        () -> !mediaId.equals(lyricsFor));
            } catch (Exception ex) {
                Log.e(TAG, "Could not load the lyrics", ex);
                return;
            }
            mainHandler.post(() -> onLyricsLoaded(mediaId, lrc, startedAt));
        });
    }

    private static synchronized void onLyricsLoaded(String mediaId, String lrc, long startedAt) {
        if (!mediaId.equals(lyricsFor)) {
            return;
        }
        lyrics = lrc;
        Log.i(TAG, "Lyrics " + (lrc.isEmpty() ? "not found" : "loaded") + " after "
                + (System.currentTimeMillis() - startedAt) + " ms");
        if (lrc.isEmpty()) {
            return;
        }
        if (System.currentTimeMillis() - startedAt > ISLAND_LYRICS_WINDOW_MS) {
            trackId = mediaId + LATE_LYRICS_SUFFIX;
            trackIdChangedAt = SystemClock.elapsedRealtime();
            Log.i(TAG, "Lyrics came late, id changed to " + Integer.toHexString(trackId.hashCode()));
            publishLastMetadata();
        }
        scheduleLyrics();
    }

    /**
     * The card drops lyrics for a media id that is not yet the one it has for the song, and it takes
     * the song a moment after the metadata is set, so the lyrics are sent a moment after the media id
     * changed. They are sent once more a little later, as the card can be slower than that.
     */
    private static void scheduleLyrics() {
        long wait = Math.max(0, trackIdChangedAt + LYRICS_AFTER_MEDIA_ID_MS - SystemClock.elapsedRealtime());
        mainHandler.removeCallbacks(sendLyricsTask);
        mainHandler.postDelayed(sendLyricsTask, wait);
        mainHandler.postDelayed(sendLyricsTask, wait + LYRICS_RESEND_DELAY_MS);
        firstLyricsSendsUntil = SystemClock.elapsedRealtime() + wait + LYRICS_RESEND_DELAY_MS + 100;
        scheduleLyricsRefresh(wait + LYRICS_RESEND_DELAY_MS + LYRICS_REFRESH_INTERVAL_MS);
    }

    /**
     * Saying there are no lyrics would have the island give up on showing them when they come.
     */
    private static synchronized void sendLyrics() {
        try {
            MediaSession session = sessionRef.get();
            if (session == null || lyrics.isEmpty() || !songId.equals(lyricsFor)) {
                if (SystemClock.elapsedRealtime() - trackIdChangedAt < 10_000) Log.i(TAG, "Lyrics not sent: session " + (session != null) + ", have lyrics "
                        + !lyrics.isEmpty() + ", same song " + songId.equals(lyricsFor));
                return;
            }
            if (SystemClock.elapsedRealtime() - trackIdChangedAt < 10_000) {
                Log.i(TAG, "Lyrics sent for id " + Integer.toHexString(trackId.hashCode()) + ", "
                        + (SystemClock.elapsedRealtime() - trackIdChangedAt) + " ms after the id changed");
            }
            // The app keeps extras of its own on the session.
            Bundle appExtras = session.getController().getExtras();
            Bundle extras = appExtras == null ? new Bundle() : new Bundle(appExtras);
            extras.putString(EXTRA_ACTION, EXTRA_ACTION_LYRICS_CHANGED);
            extras.putString(EXTRA_MEDIA_ID, trackId);
            extras.putString(EXTRA_LYRICS, lyrics);
            session.setExtras(extras);
        } catch (Exception ex) {
            Log.e(TAG, "sendLyrics failure", ex);
        }
    }

    /**
     * @return An image of the cover the card can draw, and no larger than it needs.
     */
    private static Bitmap coverOf(MediaMetadata metadata) {
        Bitmap cover = metadata.getBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART);
        if (cover == null) {
            cover = metadata.getBitmap(MediaMetadata.METADATA_KEY_ART);
        }
        if (cover == null) {
            cover = metadata.getBitmap(MediaMetadata.METADATA_KEY_DISPLAY_ICON);
        }
        if (cover == null || cover.isRecycled()) {
            return null;
        }
        if (cover.getConfig() == null || cover.getConfig() == Bitmap.Config.HARDWARE) {
            cover = cover.copy(Bitmap.Config.ARGB_8888, false);
        }
        int largest = Math.max(cover.getWidth(), cover.getHeight());
        if (largest > MAX_COVER_SIZE) {
            float scale = MAX_COVER_SIZE / (float) largest;
            cover = Bitmap.createScaledBitmap(cover,
                    Math.max(1, Math.round(cover.getWidth() * scale)),
                    Math.max(1, Math.round(cover.getHeight() * scale)), true);
        }
        return cover;
    }

    /**
     * @return The metadata without the addresses of the cover, which it has no way to remove.
     */
    private static MediaMetadata.Builder withoutCoverAddresses(MediaMetadata metadata) {
        MediaMetadata.Builder builder = new MediaMetadata.Builder();

        keys:
        for (String key : metadata.keySet()) {
            for (String addressKey : COVER_ADDRESS_KEYS) {
                if (addressKey.equals(key)) {
                    continue keys;
                }
            }
            try {
                Bitmap bitmap = metadata.getBitmap(key);
                if (bitmap != null) {
                    builder.putBitmap(key, bitmap);
                    continue;
                }
            } catch (Exception ignored) {
                // Not an image.
            }
            try {
                Rating rating = metadata.getRating(key);
                if (rating != null) {
                    builder.putRating(key, rating);
                    continue;
                }
            } catch (Exception ignored) {
                // Not a rating.
            }
            try {
                CharSequence text = metadata.getText(key);
                if (text != null) {
                    builder.putText(key, text);
                    continue;
                }
            } catch (Exception ignored) {
                // Not a text.
            }
            try {
                builder.putLong(key, metadata.getLong(key));
            } catch (Exception ignored) {
                // Of a kind the builder does not take.
            }
        }
        return builder;
    }

    /**
     * The same song gets the same media id in the metadata and in the queue.
     */
    private static String mediaIdOf(CharSequence title, CharSequence artist) {
        return Integer.toHexString(Objects.hash(
                title == null ? null : title.toString(),
                artist == null ? null : artist.toString()
        ));
    }
}
