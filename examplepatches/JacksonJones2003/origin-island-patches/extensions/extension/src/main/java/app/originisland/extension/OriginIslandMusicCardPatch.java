package app.originisland.extension;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.media.MediaDescription;
import android.media.MediaMetadata;
import android.media.Rating;
import android.media.browse.MediaBrowser;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.service.media.MediaBrowserService;
import android.util.Log;
import android.view.KeyEvent;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import static app.originisland.extension.MusicCardProtocol.*;

/**
 * Makes YouTube Music speak the protocol of the OriginOS music card (com.vivo.musicwidgetmix).
 *
 * The card reads what it shows from the session metadata and the session extras, and controls
 * the app through the transport controls of the session:
 * <ul>
 *     <li>The heart button is drawn from a heart {@link Rating} in the metadata, and sends
 *     a heart rating. YouTube Music rates with thumbs instead, and tells if a song is liked
 *     with a custom action of the playback state.</li>
 *     <li>The loop mode button is drawn from a mode in the metadata, and sends a custom action.
 *     YouTube Music has a repeat mode and a shuffle mode instead.</li>
 *     <li>Lyrics are read from the session extras. They are taken from the
 *     "Third-party lyrics" patch of Morphe, if it is applied.</li>
 *     <li>The playlist, the favorites and the downloads are loaded from the media browser
 *     service, and what is tapped in them is played from its media id. The playlist is the
 *     queue of the session here, and the other two are playlists of the library of the app.</li>
 * </ul>
 */
@SuppressWarnings("unused")
public final class OriginIslandMusicCardPatch {

    private static final String TAG = "OriginIslandMusicCard";

    /**
     * Custom actions of the playback state the app likes a song with, or removes the like with.
     * They are named after which of the two they do, with these strings of the app.
     */
    private static final String[] LIKE_ACTIONS = {"thumbs_up_action", "waze.thumbUp"};
    private static final String LIKE_ACTION_NAME_LIKE = "accessibility_like_video";
    private static final String LIKE_ACTION_NAME_REMOVE_LIKE = "accessibility_undo_like_video";

    /**
     * Package of the resources of the app, which patches can install under another package.
     */
    private static final String APP_RESOURCES_PACKAGE = "com.google.android.apps.youtube.music";

    /**
     * Extra of the intent the card opens some apps with, to have them start to play.
     * The card does so in place of asking them to play, if they are not running.
     */
    private static final String EXTRA_LAUNCH_FROM = "key_launch_from";
    private static final String LAUNCH_FROM_MUSIC_CARD = "vivomusicmix";

    /**
     * The app is given a moment to start to play before it is moved out of view,
     * since it may not start to play from the background.
     */
    private static final long HIDE_AFTER_PLAY_DELAY_MS = 700;
    private static final long OPEN_TO_PLAY_DELAY_MS = 2_000;

    /**
     * The card only listens for lyrics once it has connected, which takes a moment.
     */
    private static final long SEND_LYRICS_AFTER_CONNECTING_DELAY_MS = 1500;

    /**
     * Changing the loop mode changes the repeat and the shuffle mode one after the other,
     * and the app changes its playback state several times as it starts a song.
     */
    private static final long PUBLISH_LAST_METADATA_DELAY_MS = 150;

    private static final Handler mainHandler = new Handler(Looper.getMainLooper());
    private static final Runnable publishLastMetadataTask = OriginIslandMusicCardPatch::publishLastMetadata;

    private static WeakReference<MediaSession> sessionRef = new WeakReference<>(null);
    private static WeakReference<MediaBrowserService> browserServiceRef = new WeakReference<>(null);
    private static PlayModes playModes;
    private static Boolean lyricsSupported;
    private static Context appContext;
    private static boolean libraryRequested;
    /**
     * If the card has connected to the media browser service since the app was started.
     */
    private static boolean cardConnected;
    private static WeakReference<Activity> playOnLaunchActivityRef = new WeakReference<>(null);
    private static boolean resumingFromClosed;

    /**
     * If the song is liked according to the playback state, or null if it does not tell.
     */
    private static Boolean likedByPlaybackState;

    /**
     * Metadata as last given to the session, before the keys of the card are added.
     */
    private static MediaMetadata lastMetadata;
    private static String trackId = "";
    private static String lyrics = "";

    private OriginIslandMusicCardPatch() {
    }

    /**
     * Injection point.
     *
     * The app only answers clients of the media library it knows, and answers them through
     * a channel of that library. The card is given a root of the platform instead,
     * so that everything it asks the media browser service for goes through the platform.
     *
     * @return The root for the client connecting to the media browser service,
     *         or null if the client is not the music card.
     */
    public static MediaBrowserService.BrowserRoot onGetBrowserRoot(String clientPackageName) {
        if (!MUSIC_CARD_PACKAGE.equals(clientPackageName)) {
            // A copy of the app that is installed under another package asks for the downloads.
            Context context = getAppContext();
            boolean isCopy = clientPackageName != null && context != null
                    && !clientPackageName.equals(context.getPackageName())
                    && RegularApp.isPatchedApp(context, clientPackageName);

            return isCopy ? new MediaBrowserService.BrowserRoot(BROWSER_ROOT_ID, null) : null;
        }

        mainHandler.postDelayed(OriginIslandMusicCardPatch::sendLyrics, SEND_LYRICS_AFTER_CONNECTING_DELAY_MS);

        // The card starts the app to connect to it, and only offers the lists once it is told
        // of them in the metadata, which the app has none of until it plays.
        cardConnected = true;
        publishLastMetadataSoon();
        mainHandler.postDelayed(publishLastMetadataTask, SEND_LYRICS_AFTER_CONNECTING_DELAY_MS);

        return new MediaBrowserService.BrowserRoot(BROWSER_ROOT_ID, null);
    }

    /**
     * Injection point. Called as the main activity of the app comes to the front.
     */
    public static synchronized void onActivityResume(Activity activity) {
        try {
            Intent intent = activity.getIntent();
            if (intent == null || !LAUNCH_FROM_MUSIC_CARD.equals(intent.getStringExtra(EXTRA_LAUNCH_FROM))) {
                return;
            }
            // The activity keeps its intent as it comes to the front again.
            intent.removeExtra(EXTRA_LAUNCH_FROM);

            Log.i(TAG, "Opened by the music card to play");

            Runnable playHere = () -> {
                synchronized (OriginIslandMusicCardPatch.class) {
                    playOnLaunchActivityRef = new WeakReference<>(activity);
                    // Otherwise the session is made with the queue the app restores as it starts.
                    if (sessionRef.get() != null) {
                        mainHandler.post(OriginIslandMusicCardPatch::playOnLaunch);
                    }
                }
            };

            // A copy of the app that is installed under another package has the app play instead.
            if (RegularApp.isAvailable(activity)) {
                activity.moveTaskToBack(true);
                RegularApp.resume(activity.getApplicationContext(), playHere);
            } else {
                playHere.run();
            }
        } catch (Exception ex) {
            Log.e(TAG, "onActivityResume failure", ex);
        }
    }

    /**
     * Injection point. Called as the session of the app is asked to play.
     *
     * The card starts the app and asks it to play if it is closed, but the app only loads what it
     * last played for the play button of a headset, or as it opens.
     *
     * @return The callback if the app should be asked to play, or null if it is made to resume here.
     */
    public static synchronized Object onPlay(Object callback) {
        try {
            MediaSession session = sessionRef.get();
            if (session == null || resumingFromClosed || hasSomethingToPlay(session)
                    || Build.VERSION.SDK_INT < Build.VERSION_CODES.P
                    || !MUSIC_CARD_PACKAGE.equals(session.getCurrentControllerInfo().getPackageName())) {
                return callback;
            }

            Log.i(TAG, "Asked to play by the music card with nothing loaded");
            resumingFromClosed = true;
            Context context = getAppContext();
            Runnable pressPlay = () -> {
                pressPlay(session);
                mainHandler.postDelayed(() -> openToPlay(session, context), OPEN_TO_PLAY_DELAY_MS);
            };

            // A copy of the app that is installed under another package has the app play instead.
            if (RegularApp.isAvailable(context)) {
                RegularApp.resume(context, pressPlay);
                mainHandler.postDelayed(() -> resumingFromClosed = false, OPEN_TO_PLAY_DELAY_MS);
            } else {
                mainHandler.post(pressPlay);
            }

            return null;
        } catch (Exception ex) {
            Log.e(TAG, "onPlay failure", ex);
            return callback;
        }
    }

    /**
     * @return The session of the app, or null if it has not made one yet.
     */
    static MediaSession getSession() {
        return sessionRef.get();
    }

    /**
     * @return The lyrics of what plays in the LRC format, or an empty string if it has none.
     */
    static synchronized String getLyrics() {
        return lyrics;
    }

    /**
     * @return The loop mode of the card for the play modes of the app, or 0 if they are not known yet.
     */
    static int getLoopMode() {
        if (playModes == null || !playModes.isKnown()) {
            return 0;
        }
        if (playModes.getShuffleMode() >= PlayModes.SHUFFLE_MODE_ALL) {
            return LOOP_MODE_RANDOM;
        }
        return playModes.getRepeatMode() == PlayModes.REPEAT_MODE_ONE ? LOOP_MODE_SINGLE : LOOP_MODE_LIST;
    }

    private static boolean hasSomethingToPlay(MediaSession session) {
        return session.getController().getMetadata() != null;
    }

    private static void pressPlay(MediaSession session) {
        session.getController().dispatchMediaButtonEvent(
                new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_MEDIA_PLAY));
        session.getController().dispatchMediaButtonEvent(
                new KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_MEDIA_PLAY));
    }

    /**
     * Opens the app, as the card does for the apps it knows, if the play button did not help.
     */
    private static synchronized void openToPlay(MediaSession session, Context context) {
        try {
            resumingFromClosed = false;
            if (hasSomethingToPlay(session)) {
                return;
            }

            Intent intent = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
            if (intent != null) {
                Log.i(TAG, "Opening the app to play");
                context.startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                        .putExtra(EXTRA_LAUNCH_FROM, LAUNCH_FROM_MUSIC_CARD));
            }
        } catch (Exception ex) {
            Log.e(TAG, "openToPlay failure", ex);
        }
    }

    private static synchronized void playOnLaunch() {
        try {
            Activity activity = playOnLaunchActivityRef.get();
            MediaSession session = sessionRef.get();
            if (activity == null || session == null) {
                return;
            }
            playOnLaunchActivityRef = new WeakReference<>(null);

            // The app resumes what it last played for the play button of a headset.
            session.getController().dispatchMediaButtonEvent(
                    new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_MEDIA_PLAY));
            session.getController().dispatchMediaButtonEvent(
                    new KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_MEDIA_PLAY));

            mainHandler.postDelayed(() -> {
                try {
                    activity.moveTaskToBack(true);
                } catch (Exception ex) {
                    Log.e(TAG, "moveTaskToBack failure", ex);
                }
            }, HIDE_AFTER_PLAY_DELAY_MS);
        } catch (Exception ex) {
            Log.e(TAG, "playOnLaunch failure", ex);
        }
    }

    /**
     * Injection point. Called as the app makes a session, which it can do long before
     * it gives the session metadata.
     */
    public static void onSessionCreated(MediaSession session) {
        // The app sets the session up after it has made it.
        mainHandler.post(() -> {
            try {
                synchronized (OriginIslandMusicCardPatch.class) {
                    if (sessionRef.get() == null) {
                        attachSession(session);
                        if (cardConnected) {
                            publishLastMetadataSoon();
                        }
                    }
                }
            } catch (Exception ex) {
                Log.e(TAG, "onSessionCreated failure", ex);
            }
        });
    }

    /**
     * Injection point. Called on the main thread with the metadata of the app.
     */
    public static synchronized MediaMetadata onSetMetadata(MediaSession session, MediaMetadata metadata) {
        try {
            attachSession(session);

            if (playOnLaunchActivityRef.get() != null) {
                mainHandler.post(OriginIslandMusicCardPatch::playOnLaunch);
            }

            if (metadata != null) {
                // The card ignores a song change unless the media id changes as well.
                String mediaId = mediaIdOf(
                        metadata.getString(MediaMetadata.METADATA_KEY_TITLE),
                        metadata.getString(MediaMetadata.METADATA_KEY_ARTIST)
                );

                if (!mediaId.equals(trackId)) {
                    trackId = mediaId;
                    // The lyrics patch may have changed the lyrics before or after this call.
                    mainHandler.post(OriginIslandMusicCardPatch::sendLyrics);

                    // The app adds songs to the queue as it plays.
                    MediaBrowserService browserService = browserServiceRef.get();
                    if (browserService != null) {
                        browserService.notifyChildrenChanged(LIST_CURRENT);
                    }
                }
            }
        } catch (Exception ex) {
            Log.e(TAG, "onSetMetadata failure", ex);
        }

        return onSetExtensionMetadata(session, metadata);
    }

    /**
     * Injection point. Called with the metadata other patches publish in place of the app,
     * which can describe the track differently, such as with a line of the lyrics as the title.
     */
    public static synchronized MediaMetadata onSetExtensionMetadata(MediaSession session, MediaMetadata metadata) {
        try {
            // Other patches can have a session of their own.
            if (session == sessionRef.get()) {
                lastMetadata = metadata;
            }

            if (metadata != null) {
                return withMusicCardKeys(metadata, session == sessionRef.get());
            }
        } catch (Exception ex) {
            Log.e(TAG, "onSetExtensionMetadata failure", ex);
        }

        return metadata;
    }

    /**
     * Injection point. Called with the playback state of the app.
     *
     * The app does not always update the rating of the metadata when it learns that a song
     * is liked, such as for the first song it plays after it is started. It does update
     * the custom action that likes the song.
     */
    public static synchronized void onSetPlaybackState(MediaSession session, PlaybackState state) {
        try {
            if (session != sessionRef.get()) {
                return;
            }

            Boolean liked = likedOf(state);
            if (!Objects.equals(liked, likedByPlaybackState)) {
                likedByPlaybackState = liked;
                publishLastMetadataSoon();
            }
        } catch (Exception ex) {
            Log.e(TAG, "onSetPlaybackState failure", ex);
        }
    }

    /**
     * Injection point.
     *
     * The app likes the song for a thumb up, removes the like for an unrated thumb,
     * and dislikes the song for any other rating, which includes every heart rating.
     */
    public static Rating onSetRating(Rating rating) {
        try {
            if (rating == null || rating.getRatingStyle() != Rating.RATING_HEART) {
                return rating;
            }

            boolean like = rating.hasHeart();
            Log.i(TAG, "Heart rating received: " + like);

            return like
                    ? Rating.newThumbRating(true)
                    : Rating.newUnratedRating(Rating.RATING_THUMB_UP_DOWN);
        } catch (Exception ex) {
            Log.e(TAG, "onSetRating failure", ex);
        }

        return rating;
    }

    /**
     * Injection point.
     *
     * @return The custom action the app should handle, or null if it was handled here.
     */
    public static synchronized String onCustomAction(String action, Bundle extras) {
        try {
            if (!ACTION_PLAY_MODE.equals(action)) {
                return action;
            }

            int loopMode = extras == null ? 0 : extras.getInt(KEY_LOOP_MODE);
            Log.i(TAG, "Loop mode received: " + loopMode);

            if (playModes != null) {
                if (loopMode == LOOP_MODE_SINGLE) {
                    playModes.setRepeatMode(PlayModes.REPEAT_MODE_ONE);
                } else {
                    // The app can refuse to repeat all, so the repeat mode is turned off first.
                    // Otherwise repeat one would be kept, and the card would be stuck on single.
                    playModes.setRepeatMode(PlayModes.REPEAT_MODE_NONE);
                    playModes.setRepeatMode(PlayModes.REPEAT_MODE_ALL);
                }
                playModes.setShuffleMode(loopMode == LOOP_MODE_RANDOM
                        ? PlayModes.SHUFFLE_MODE_ALL
                        : PlayModes.SHUFFLE_MODE_NONE);
            }

            return null;
        } catch (Exception ex) {
            Log.e(TAG, "onCustomAction failure", ex);
        }

        return action;
    }

    /**
     * Injection point.
     *
     * @return The parent the app should load the children of, or null if they were loaded here.
     */
    public static synchronized String onLoadChildren(MediaBrowserService browserService, String parentId,
                                                     MediaBrowserService.Result<List<MediaBrowser.MediaItem>> result,
                                                     Bundle options) {
        try {
            LibraryBrowser.LibraryList libraryList;
            if (LIST_FAVORITE.equals(parentId)) {
                libraryList = LibraryBrowser.PLAYLISTS;
            } else if (LIST_LOCAL.equals(parentId)) {
                libraryList = LibraryBrowser.DOWNLOADS;
            } else if (LIST_CURRENT.equals(parentId)) {
                libraryList = null;
            } else {
                return parentId;
            }

            // Every list is a single page.
            int page = options == null ? 0 : options.getInt(LIST_KEY_PAGE);

            if (libraryList != null) {
                if (page == 0) {
                    result.detach();
                    boolean isDownloads = libraryList == LibraryBrowser.DOWNLOADS;
                    Runnable loadOwnList = () -> LibraryBrowser.load(browserService, libraryList, children ->
                            sendLibraryList(result, children, isDownloads));

                    // A copy of the app shows the downloads of the app, if it has any.
                    if (isDownloads && RegularApp.isAvailable(browserService)) {
                        RegularApp.loadDownloads(browserService, downloads -> {
                            try {
                                if (downloads == null || downloads.isEmpty()) {
                                    loadOwnList.run();
                                } else {
                                    result.sendResult(toSinglePage(downloads));
                                }
                            } catch (Exception ex) {
                                Log.e(TAG, "loadDownloads failure", ex);
                            }
                        });
                    } else {
                        loadOwnList.run();
                    }
                } else {
                    result.sendResult(new ArrayList<>());
                }

                return null;
            }

            browserServiceRef = new WeakReference<>(browserService);

            // The card loads the playlist as its lists are opened. The app takes a while to load
            // its library the first time, so it is asked to before the card loads the favorites.
            if (!libraryRequested) {
                libraryRequested = true;
                LibraryBrowser.load(browserService, LibraryBrowser.PLAYLISTS, children -> {
                });
            }

            List<MediaDescription> songs = new ArrayList<>();
            List<MediaSession.QueueItem> queue = page == 0 ? getQueue() : null;
            if (queue != null) {
                for (MediaSession.QueueItem song : queue) {
                    MediaDescription description = song.getDescription();
                    songs.add(new MediaDescription.Builder()
                            .setMediaId(mediaIdOf(description.getTitle(), description.getSubtitle()))
                            .setTitle(description.getTitle())
                            .setSubtitle(description.getSubtitle())
                            .build());
                }
            }

            Log.i(TAG, "Playlist loaded: " + songs.size() + " songs");
            if (songs.isEmpty() && page == 0) {
                songs.add(new MediaDescription.Builder()
                        .setMediaId(EMPTY_LIST_MEDIA_ID)
                        .setTitle("Nothing playing")
                        .setSubtitle("Pick a playlist from the favorites list")
                        .build());
            }
            result.sendResult(toSinglePage(songs));

            return null;
        } catch (Exception ex) {
            Log.e(TAG, "onLoadChildren failure", ex);
        }

        return parentId;
    }

    /**
     * Injection point.
     */
    public static String onLoadChildren(MediaBrowserService browserService, String parentId,
                                        MediaBrowserService.Result<List<MediaBrowser.MediaItem>> result) {
        return onLoadChildren(browserService, parentId, result, null);
    }

    private static void sendLibraryList(MediaBrowserService.Result<List<MediaBrowser.MediaItem>> result,
                                        List<MediaBrowser.MediaItem> children, boolean isDownloads) {
        try {
            List<MediaDescription> playlists = new ArrayList<>();
            if (children != null) {
                for (MediaBrowser.MediaItem child : children) {
                    if (!child.isPlayable()) {
                        continue;
                    }

                    // The app plays these from their media ids for every client,
                    // so the card is given them as they are.
                    MediaDescription description = child.getDescription();
                    playlists.add(new MediaDescription.Builder()
                            .setMediaId(child.getMediaId())
                            .setTitle(description.getTitle())
                            // The card shows what is not set as text.
                            .setSubtitle(description.getSubtitle() == null ? "" : description.getSubtitle())
                            .build());
                }
            }

            if (playlists.isEmpty()) {
                String title;
                String subtitle;
                if (children == null) {
                    title = "Couldn't load";
                    subtitle = "Open this list again in a moment";
                } else if (isDownloads) {
                    title = "No downloads";
                    subtitle = "Music downloaded in YouTube Music shows here";
                } else {
                    title = "No playlists";
                    subtitle = "Playlists of your library show here";
                }

                playlists.add(new MediaDescription.Builder()
                        .setMediaId(EMPTY_LIST_MEDIA_ID)
                        .setTitle(title)
                        .setSubtitle(subtitle)
                        .build());
            }

            result.sendResult(toSinglePage(playlists));
        } catch (Exception ex) {
            Log.e(TAG, "sendLibraryList failure", ex);
        }
    }

    /**
     * Injection point.
     *
     * @return The media id the app should play, or null if it was played here.
     */
    public static synchronized String onPlayFromMediaId(String mediaId, Bundle extras) {
        try {
            if (EMPTY_LIST_MEDIA_ID.equals(mediaId)) {
                return null;
            }

            if (RegularApp.isMediaIdOfApp(mediaId)) {
                Context context = getAppContext();
                if (context != null) {
                    RegularApp.play(context, mediaId);
                }
                return null;
            }

            String list = extras == null ? null : extras.getString(KEY_LIST);
            if (LIST_FAVORITE.equals(list) || LIST_LOCAL.equals(list)) {
                Log.i(TAG, "Playing from " + list + ": " + mediaId);
            }

            if (mediaId == null || !LIST_CURRENT.equals(list)) {
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
        }

        return mediaId;
    }

    private static List<MediaSession.QueueItem> getQueue() {
        MediaSession session = sessionRef.get();
        return session == null ? null : session.getController().getQueue();
    }

    /**
     * The app gives its songs no media id that is the same in the metadata and in the queue.
     */
    private static String mediaIdOf(CharSequence title, CharSequence artist) {
        return Integer.toHexString(Objects.hash(
                title == null ? null : title.toString(),
                artist == null ? null : artist.toString()
        ));
    }

    private static void attachSession(MediaSession session) {
        if (lyricsSupported == null) {
            lyricsSupported = MorpheLyrics.addListener(OriginIslandMusicCardPatch::onLyricsChanged);
        }

        if (session != null && sessionRef.get() != session) {
            sessionRef = new WeakReference<>(session);
            playModes = new PlayModes(session, mainHandler, OriginIslandMusicCardPatch::publishLastMetadataSoon);
            // The app can have set the playback state of the session before its metadata.
            likedByPlaybackState = likedOf(session.getController().getPlaybackState());
        }
    }

    private static void publishLastMetadataSoon() {
        mainHandler.removeCallbacks(publishLastMetadataTask);
        mainHandler.postDelayed(publishLastMetadataTask, PUBLISH_LAST_METADATA_DELAY_MS);
    }

    /**
     * @return If the song is liked according to the playback state, or null if it does not tell.
     */
    private static Boolean likedOf(PlaybackState state) {
        if (state == null) {
            return null;
        }

        for (PlaybackState.CustomAction action : state.getCustomActions()) {
            for (String likeAction : LIKE_ACTIONS) {
                if (!likeAction.equals(action.getAction())) {
                    continue;
                }

                String name = String.valueOf(action.getName());
                if (name.equals(getAppString(LIKE_ACTION_NAME_REMOVE_LIKE))) {
                    return true;
                }
                if (name.equals(getAppString(LIKE_ACTION_NAME_LIKE))) {
                    return false;
                }
            }
        }

        return null;
    }

    private static Context getAppContext() {
        try {
            if (appContext == null) {
                // Hidden, but not restricted.
                appContext = (Context) Class.forName("android.app.ActivityThread")
                        .getMethod("currentApplication")
                        .invoke(null);
            }
        } catch (Exception ex) {
            Log.e(TAG, "getAppContext failure", ex);
        }

        return appContext;
    }

    /**
     * @return The string of the app with this name, or null if it has none.
     */
    private static String getAppString(String name) {
        try {
            Context appContext = getAppContext();
            if (appContext == null) {
                return null;
            }

            for (String resourcesPackage : new String[]{appContext.getPackageName(), APP_RESOURCES_PACKAGE}) {
                int id = appContext.getResources().getIdentifier(name, "string", resourcesPackage);
                if (id != 0) {
                    return appContext.getString(id);
                }
            }
        } catch (Exception ex) {
            Log.e(TAG, "getAppString failure", ex);
        }

        return null;
    }

    private static synchronized void onLyricsChanged(String lrc) {
        if (!lrc.equals(lyrics)) {
            lyrics = lrc;
            // The app may still be about to publish the track these lyrics are for.
            mainHandler.post(OriginIslandMusicCardPatch::sendLyrics);
            mainHandler.post(QQMusicApiService::onLyricsChanged);
        }
    }

    private static synchronized void sendLyrics() {
        try {
            MediaSession session = sessionRef.get();
            if (session == null || !Boolean.TRUE.equals(lyricsSupported)) {
                return;
            }

            // The app keeps extras of its own on the session.
            Bundle appExtras = session.getController().getExtras();
            Bundle extras = appExtras == null ? new Bundle() : new Bundle(appExtras);
            extras.putString(EXTRA_ACTION, EXTRA_ACTION_LYRICS_CHANGED);
            extras.putString(EXTRA_MEDIA_ID, trackId);
            extras.putString(EXTRA_LYRICS, lyrics);
            session.setExtras(extras);

            Log.i(TAG, "Lyrics sent: " + lyrics.length() + " characters");
        } catch (Exception ex) {
            Log.e(TAG, "sendLyrics failure", ex);
        }
    }

    /**
     * The card only reads the loop mode and what it may control when the metadata changes.
     */
    private static synchronized void publishLastMetadata() {
        try {
            MediaSession session = sessionRef.get();
            if (session == null) {
                return;
            }

            if (lastMetadata != null) {
                session.setMetadata(withMusicCardKeys(lastMetadata, true));
            } else if (cardConnected && session.getController().getMetadata() == null) {
                // Nothing to show yet, but the card is told what it may show and control.
                session.setMetadata(withMusicCardKeys(new MediaMetadata.Builder().build(), true));
                Log.i(TAG, "Told the card what it may control before anything plays");
            }
        } catch (Exception ex) {
            Log.e(TAG, "publishLastMetadata failure", ex);
        }
    }

    /**
     * @param isAppSession If the metadata is for the session of the app,
     *                     and not for a session of another patch.
     */
    private static MediaMetadata withMusicCardKeys(MediaMetadata metadata, boolean isAppSession) {
        Rating userRating = metadata.getRating(MediaMetadata.METADATA_KEY_USER_RATING);
        boolean liked = isAppSession && likedByPlaybackState != null
                ? likedByPlaybackState
                : userRating != null && userRating.isThumbUp();

        long supportEvent = EVENT_PLAY_CONTROL | EVENT_MUSIC_INFO | EVENT_MUSIC_IMAGE
                | EVENT_SEEK_POSITION | EVENT_FAVORITE
                | EVENT_LIST_CURRENT | EVENT_LIST_FAVORITE | EVENT_LIST_LOCAL;

        MediaMetadata.Builder builder = new MediaMetadata.Builder(metadata)
                .putRating(MediaMetadata.METADATA_KEY_RATING, Rating.newHeartRating(liked))
                .putString(MediaMetadata.METADATA_KEY_MEDIA_ID, trackId);

        if (Boolean.TRUE.equals(lyricsSupported)) {
            supportEvent |= EVENT_MUSIC_LRC;
        }

        if (playModes != null && playModes.isKnown()) {
            supportEvent |= EVENT_LOOP_MODE;

            int loopMode;
            if (playModes.getShuffleMode() >= PlayModes.SHUFFLE_MODE_ALL) {
                loopMode = LOOP_MODE_RANDOM;
            } else if (playModes.getRepeatMode() == PlayModes.REPEAT_MODE_ONE) {
                loopMode = LOOP_MODE_SINGLE;
            } else {
                loopMode = LOOP_MODE_LIST;
            }
            builder.putLong(KEY_LOOP_MODE, loopMode);
        }

        return builder.putLong(KEY_SUPPORT_EVENT, supportEvent).build();
    }
}
