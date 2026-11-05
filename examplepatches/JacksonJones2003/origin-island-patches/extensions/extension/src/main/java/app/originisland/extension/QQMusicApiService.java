package app.originisland.extension;

import android.app.Service;
import android.content.Intent;
import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import android.os.SystemClock;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;

/**
 * Lets the Jovi voice assistant of vivo ask the app for songs, the way it asks QQ Music.
 *
 * Jovi only takes requests for songs to a few music apps it knows. QQ Music is the one it asks
 * through an interface for other apps: it binds this service of QQ Music, says hi, searches for
 * what was asked for, and plays a song of the results by its id. A copy of the app installed under
 * the package of QQ Music is given the service. It answers a search with what was asked for as
 * the only song, and has the app play that from a search, as it does for a voice assistant.
 *
 * The music card of vivo asks QQ Music for what plays, its lyrics and its lists through the same
 * interface, and not through the session, so the service answers it with what the session of the
 * app plays, the lyrics the patch loads, the queue, and the playlists and downloads of the library.
 */
public final class QQMusicApiService extends Service {

    private static final String TAG = "OriginIslandJovi";

    static final String QQ_MUSIC_PACKAGE = "com.tencent.qqmusic";

    private static final String API_DESCRIPTOR = "com.tencent.qqmusic.third.api.contract.IQQMusicApi";
    private static final String CALLBACK_DESCRIPTOR = "com.tencent.qqmusic.third.api.contract.IQQMusicApiCallback";

    private static final int TRANSACTION_EXECUTE = 1;
    private static final int TRANSACTION_EXECUTE_ASYNC = 2;
    private static final int TRANSACTION_REGISTER_EVENT_LISTENER = 3;
    private static final int TRANSACTION_UNREGISTER_EVENT_LISTENER = 4;
    private static final int TRANSACTION_ON_RETURN = 1;
    private static final int TRANSACTION_ON_EVENT = 1;

    private static final String LISTENER_DESCRIPTOR = "com.tencent.qqmusic.third.api.contract.IQQMusicApiEventListener";
    private static final String EVENT_PLAY_STATE_CHANGED = "API_EVENT_PLAY_STATE_CHANGED";
    private static final String EVENT_PLAY_SONG_CHANGED = "API_EVENT_PLAY_SONG_CHANGED";
    private static final int PLAY_STATE_STARTED = 4;
    private static final int PLAY_STATE_PAUSED = 5;
    private static final int PLAY_STATE_STOPPED = 6;
    private static final int PLAY_STATE_BUFFERING = 10;
    private static final int PLAY_MODE_REPEAT_LIST = 0;

    private MediaController followed;
    private String lastSongId;

    /**
     * How long playback is waited for after a song is asked for.
     */
    private static final long WAIT_FOR_PLAYBACK_MS = 15_000;

    private static final android.os.Handler mainHandler = new android.os.Handler(android.os.Looper.getMainLooper());

    private final List<IBinder> listeners = new java.util.concurrent.CopyOnWriteArrayList<>();

    private static final String KEY_CODE = "code";
    private static final String KEY_DATA = "data";

    private static final int CODE_OK = 0;

    /**
     * Start of the ids of the songs of the results, which are what was asked for.
     */
    private static final String SEARCH_ID_PREFIX = "ytm_search:";

    private final Binder binder = new Binder() {
        @Override
        protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            if (code == INTERFACE_TRANSACTION) {
                reply.writeString(API_DESCRIPTOR);
                return true;
            }

            try {
                switch (code) {
                    case TRANSACTION_EXECUTE: {
                        data.enforceInterface(API_DESCRIPTOR);
                        String action = data.readString();
                        Bundle result = execute(action, readBundle(data));
                        reply.writeNoException();
                        writeBundle(reply, result);
                        return true;
                    }
                    case TRANSACTION_EXECUTE_ASYNC: {
                        data.enforceInterface(API_DESCRIPTOR);
                        String action = data.readString();
                        Bundle params = readBundle(data);
                        IBinder callback = data.readStrongBinder();
                        if (!executeAsync(action, params, result -> returnTo(callback, result))) {
                            returnTo(callback, execute(action, params));
                        }
                        return true;
                    }
                    case TRANSACTION_REGISTER_EVENT_LISTENER:
                    case TRANSACTION_UNREGISTER_EVENT_LISTENER: {
                        data.enforceInterface(API_DESCRIPTOR);
                        List<String> events = data.createStringArrayList();
                        IBinder listener = data.readStrongBinder();
                        if (listener != null) {
                            if (code == TRANSACTION_REGISTER_EVENT_LISTENER) {
                                listeners.add(listener);
                                mainHandler.post(QQMusicApiService.this::followSession);
                            } else {
                                listeners.remove(listener);
                            }
                        }
                        Log.i(TAG, (code == TRANSACTION_REGISTER_EVENT_LISTENER ? "Registered" : "Unregistered")
                                + " for " + events);
                        reply.writeNoException();
                        writeBundle(reply, result(CODE_OK));
                        return true;
                    }
                }
            } catch (Exception ex) {
                Log.e(TAG, "onTransact failure", ex);
                if (reply != null && code != TRANSACTION_EXECUTE_ASYNC) {
                    reply.writeNoException();
                    writeBundle(reply, result(CODE_OK));
                    return true;
                }
            }

            return super.onTransact(code, data, reply, flags);
        }
    };

    private interface Result {
        void send(Bundle result);
    }

    private static final String ID_QUEUE = "ytm_queue:";
    private static final String ID_PLAYLIST = "ytm_playlist:";
    private static final String ID_DOWNLOAD = "ytm_download:";
    private static final String FAVORITES_FOLDER_ID = "ytm_library_playlists";
    private static final int FOLDER_TYPE_FAVORITES = 101;

    private static java.lang.ref.WeakReference<QQMusicApiService> instanceRef = new java.lang.ref.WeakReference<>(null);

    @Override
    public void onCreate() {
        super.onCreate();
        instanceRef = new java.lang.ref.WeakReference<>(this);
    }

    /**
     * Called on the main thread as the lyrics of what plays load, which the card asks for
     * as it is told the song changed.
     */
    static void onLyricsChanged() {
        QQMusicApiService service = instanceRef.get();
        if (service != null && !service.listeners.isEmpty()) {
            service.sendSongChanged();
        }
    }

    /**
     * Answers the requests that take a while, such as for the lists of the library.
     *
     * @return If the request is answered here.
     */
    private boolean executeAsync(String action, Bundle params, Result result) {
        if (!"getSongList".equals(action) && !"getUserSongList".equals(action)) {
            return false;
        }
        Log.i(TAG, "Asked to " + action + " with " + describe(params));
        if (params != null && params.getInt("page", 0) > 0) {
            result.send(listResult(new JSONArray()));
            return true;
        }

        boolean favorites = "getUserSongList".equals(action)
                || (params != null && params.getInt("folderType") == FOLDER_TYPE_FAVORITES);
        LibraryBrowser.LibraryList list = favorites ? LibraryBrowser.PLAYLISTS : LibraryBrowser.DOWNLOADS;
        String prefix = favorites ? ID_PLAYLIST : ID_DOWNLOAD;
        Runnable loadOwn = () -> LibraryBrowser.load(getApplicationContext(), list, children -> {
            JSONArray songs = new JSONArray();
            if (children != null) {
                for (android.media.browse.MediaBrowser.MediaItem child : children) {
                    if (!child.isPlayable()) {
                        continue;
                    }
                    android.media.MediaDescription description = child.getDescription();
                    songs.put(song(prefix + child.getMediaId(), text(description.getTitle()),
                            text(description.getSubtitle()), "", ""));
                }
            }
            Log.i(TAG, "Answered " + action + " with " + songs.length() + " items");
            result.send(listResult(songs));
        });

        // The downloads are the ones of YouTube Music under its own package, if it is patched as well,
        // which also plays them.
        // The context of the service, as the one of the app may be made to tell the package of
        // YouTube Music for its sign-in.
        if (!favorites && RegularApp.isAvailable(this)) {
            mainHandler.post(() -> RegularApp.loadDownloads(this, downloads -> {
                if (downloads == null || downloads.isEmpty()) {
                    loadOwn.run();
                    return;
                }
                JSONArray songs = new JSONArray();
                for (android.media.MediaDescription description : downloads) {
                    songs.put(song(description.getMediaId(), text(description.getTitle()),
                            text(description.getSubtitle()), "", ""));
                }
                Log.i(TAG, "Answered " + action + " with " + songs.length() + " downloads of YouTube Music");
                result.send(listResult(songs));
            }));
        } else {
            mainHandler.post(loadOwn);
        }
        return true;
    }

    @Override
    public IBinder onBind(Intent intent) {
        // Only a copy of the app under the package of QQ Music is asked by Jovi.
        if (!QQ_MUSIC_PACKAGE.equals(getPackageName())) {
            return null;
        }
        Log.i(TAG, "Bound by " + getPackageManager().getNameForUid(Binder.getCallingUid()));
        return binder;
    }

    private Bundle execute(String action, Bundle params) {
        if (!"getCurrTime".equals(action) && !"getPlaybackState".equals(action)) {
            Log.i(TAG, "Asked to " + action + " with " + describe(params));
        }
        if (action == null) {
            return result(CODE_OK);
        }

        switch (action) {
            case "search": {
                String keyword = params == null ? null : params.getString("keyword");
                if (keyword == null || keyword.trim().isEmpty()) {
                    return listResult(new JSONArray());
                }
                return listResult(new JSONArray().put(searchResult(keyword.trim())));
            }

            case "playSongMidAtIndex":
            case "playSongMid":
            case "playSongIdAtIndex":
            case "playSongId": {
                String id = idOf(params);
                String query = queryOf(id);
                if (query != null) {
                    Log.i(TAG, "Playing what was asked for: " + query);
                    playFromSearch(query, id);
                } else {
                    playFromList(id);
                }
                return result(CODE_OK);
            }

            case "playMusic":
            case "resumeMusic":
                control(MediaController.TransportControls::play);
                return result(CODE_OK);

            case "pauseMusic":
            case "stopMusic":
                control(MediaController.TransportControls::pause);
                return result(CODE_OK);

            case "skipToNext":
                control(MediaController.TransportControls::skipToNext);
                return result(CODE_OK);

            case "skipToPrevious":
                control(MediaController.TransportControls::skipToPrevious);
                return result(CODE_OK);

            case "getPlayList":
                return params != null && params.getInt("page", 0) > 0 ? listResult(new JSONArray()) : queueResult();

            case "getFolderList":
            case "getSongList":
            case "getUserSongList":
                return listResult(new JSONArray());

            case "getFavouriteFolderId": {
                Bundle result = result(CODE_OK);
                result.putString(KEY_DATA, FAVORITES_FOLDER_ID);
                return result;
            }

            case "getLyricWithId": {
                Bundle result = result(CODE_OK);
                result.putString(KEY_DATA, OriginIslandMusicCardPatch.getLyrics());
                return result;
            }

            case "addToFavourite":
            case "removeFromFavourite": {
                boolean like = "addToFavourite".equals(action);
                control(controls -> controls.setRating(android.media.Rating.newHeartRating(like)));
                return result(CODE_OK);
            }

            case "setPlayMode": {
                int playMode = params == null ? 0 : params.getInt("playMode", params.getInt("mode", 0));
                Bundle extras = new Bundle();
                extras.putInt(MusicCardProtocol.KEY_LOOP_MODE, playMode == 1 ? MusicCardProtocol.LOOP_MODE_SINGLE
                        : playMode == 2 ? MusicCardProtocol.LOOP_MODE_RANDOM : MusicCardProtocol.LOOP_MODE_LIST);
                control(controls -> controls.sendCustomAction(MusicCardProtocol.ACTION_PLAY_MODE, extras));
                return result(CODE_OK);
            }

            case "getPlaybackState": {
                Bundle result = result(CODE_OK);
                result.putInt(KEY_DATA, playStateOf(playbackState()));
                return result;
            }

            case "getCurrentSong": {
                JSONObject song = currentSong();
                Bundle result = result(CODE_OK);
                if (song != null) {
                    result.putString(KEY_DATA, song.toString());
                }
                return result;
            }

            case "getCurrTime": {
                Bundle result = result(CODE_OK);
                result.putLong(KEY_DATA, positionMs());
                return result;
            }

            case "getTotalTime": {
                MediaMetadata metadata = metadata();
                Bundle result = result(CODE_OK);
                result.putLong(KEY_DATA, metadata == null ? 0 : metadata.getLong(MediaMetadata.METADATA_KEY_DURATION));
                return result;
            }

            case "getPlayMode": {
                int loopMode = OriginIslandMusicCardPatch.getLoopMode();
                Bundle result = result(CODE_OK);
                result.putInt(KEY_DATA, loopMode == MusicCardProtocol.LOOP_MODE_SINGLE ? 1
                        : loopMode == MusicCardProtocol.LOOP_MODE_RANDOM ? 2 : PLAY_MODE_REPEAT_LIST);
                return result;
            }

            case "isFavouriteMid": {
                Bundle result = result(CODE_OK);
                result.putBooleanArray(KEY_DATA, new boolean[]{isLiked()});
                return result;
            }

            case "isQQMusicForeground": {
                Bundle result = result(CODE_OK);
                result.putBoolean(KEY_DATA, false);
                return result;
            }

            case "getLoginState": {
                Bundle result = result(CODE_OK);
                result.putBoolean(KEY_DATA, true);
                return result;
            }

            default:
                // Says hi, and takes every other request, so that Jovi does not ask for an authorization.
                return result(CODE_OK);
        }
    }

    private static JSONObject searchResult(String keyword) {
        try {
            String id = SEARCH_ID_PREFIX + keyword;
            return new JSONObject()
                    .put("id", id)
                    .put("mid", id)
                    .put("title", keyword)
                    .put("type", 0)
                    .put("singer", new JSONObject().put("title", "YouTube Music").put("mid", "").put("id", 0))
                    .put("album", new JSONObject().put("title", "").put("coverUri", "").put("mid", "").put("id", 0));
        } catch (Exception ex) {
            Log.e(TAG, "searchResult failure", ex);
            return new JSONObject();
        }
    }

    /**
     * @return The id of the song of the results Jovi plays.
     */
    private static String idOf(Bundle params) {
        if (params == null) {
            return null;
        }

        List<String> ids = params.getStringArrayList("midList");
        if (ids == null) {
            ids = params.getStringArrayList("songIdList");
        }
        if (ids != null && !ids.isEmpty()) {
            int index = Math.max(0, Math.min(ids.size() - 1, params.getInt("index", 0)));
            return ids.get(index);
        }
        return params.getString("mid", params.getString("songId"));
    }

    /**
     * @return What was asked for, from the id of a song of the results.
     */
    private static String queryOf(String id) {
        if (id == null || !id.startsWith(SEARCH_ID_PREFIX)) {
            return null;
        }
        // Jovi puts the singer and the name of the song together without a space.
        return id.substring(SEARCH_ID_PREFIX.length()).replaceAll("(?<=\\p{Ll})(?=\\p{Lu})", " ").trim();
    }

    /**
     * Has the app play what was asked for, and tells Jovi once it plays, which it waits for.
     */
    private void playFromSearch(String query, String id) {
        LibraryBrowser.connectAsAndroidAuto(getApplicationContext(), controller -> {
            MediaController.Callback[] callback = {null};
            callback[0] = new MediaController.Callback() {
                @Override
                public void onPlaybackStateChanged(android.media.session.PlaybackState state) {
                    if (state == null || state.getState() != android.media.session.PlaybackState.STATE_PLAYING) {
                        return;
                    }
                    Log.i(TAG, "Plays what was asked for");
                    controller.unregisterCallback(callback[0]);
                    sendPlaying(id);
                }
            };
            controller.registerCallback(callback[0], mainHandler);
            mainHandler.postDelayed(() -> controller.unregisterCallback(callback[0]), WAIT_FOR_PLAYBACK_MS);

            Log.i(TAG, "Asking the app to play from a search: " + query);
            controller.getTransportControls().playFromSearch(query, new Bundle());
        });
    }

    private void sendPlaying(String id) {
        Bundle state = new Bundle();
        state.putInt("playState", PLAY_STATE_STARTED);
        sendEvent(EVENT_PLAY_STATE_CHANGED, state);

        try {
            Bundle song = new Bundle();
            song.putString("playSong", searchResult(queryOf(id)).put("mid", id).put("id", id).toString());
            sendEvent(EVENT_PLAY_SONG_CHANGED, song);
        } catch (Exception ex) {
            Log.e(TAG, "sendPlaying failure", ex);
        }
    }

    private void sendEvent(String event, Bundle extras) {
        for (IBinder listener : listeners) {
            Parcel data = Parcel.obtain();
            try {
                data.writeInterfaceToken(LISTENER_DESCRIPTOR);
                data.writeString(event);
                writeBundle(data, extras);
                listener.transact(TRANSACTION_ON_EVENT, data, null, IBinder.FLAG_ONEWAY);
            } catch (Exception ex) {
                Log.e(TAG, "sendEvent failure", ex);
                listeners.remove(listener);
            } finally {
                data.recycle();
            }
        }
    }

    private static MediaController controller() {
        MediaSession session = OriginIslandMusicCardPatch.getSession();
        return session == null ? null : session.getController();
    }

    private static PlaybackState playbackState() {
        MediaController controller = controller();
        return controller == null ? null : controller.getPlaybackState();
    }

    private static MediaMetadata metadata() {
        MediaController controller = controller();
        return controller == null ? null : controller.getMetadata();
    }

    private static int playStateOf(PlaybackState state) {
        if (state == null) {
            return PLAY_STATE_STOPPED;
        }
        switch (state.getState()) {
            case PlaybackState.STATE_PLAYING:
                return PLAY_STATE_STARTED;
            case PlaybackState.STATE_BUFFERING:
            case PlaybackState.STATE_CONNECTING:
                return PLAY_STATE_BUFFERING;
            case PlaybackState.STATE_PAUSED:
                return PLAY_STATE_PAUSED;
            default:
                return PLAY_STATE_STOPPED;
        }
    }

    private static long positionMs() {
        PlaybackState state = playbackState();
        if (state == null) {
            return 0;
        }
        long position = state.getPosition();
        if (state.getState() == PlaybackState.STATE_PLAYING) {
            position += (long) ((SystemClock.elapsedRealtime() - state.getLastPositionUpdateTime())
                    * state.getPlaybackSpeed());
        }
        return Math.max(0, position);
    }

    /**
     * @return What the app plays, as QQ Music tells a song.
     */
    private static JSONObject currentSong() {
        MediaMetadata metadata = metadata();
        if (metadata == null) {
            return null;
        }
        try {
            String title = metadata.getString(MediaMetadata.METADATA_KEY_TITLE);
            String artist = metadata.getString(MediaMetadata.METADATA_KEY_ARTIST);
            String album = metadata.getString(MediaMetadata.METADATA_KEY_ALBUM);
            String cover = metadata.getString(MediaMetadata.METADATA_KEY_ALBUM_ART_URI);
            if (cover == null) {
                cover = metadata.getString(MediaMetadata.METADATA_KEY_DISPLAY_ICON_URI);
            }
            if (cover == null) {
                cover = metadata.getString(MediaMetadata.METADATA_KEY_ART_URI);
            }
            String id = metadata.getString(MediaMetadata.METADATA_KEY_MEDIA_ID);
            if (id == null) {
                id = String.valueOf(title) + "|" + artist;
            }
            return new JSONObject()
                    .put("id", id)
                    .put("mid", id)
                    .put("title", title == null ? "" : title)
                    .put("type", 0)
                    .put("singer", new JSONObject().put("title", artist == null ? "" : artist).put("mid", "").put("id", 0))
                    .put("album", new JSONObject().put("title", album == null ? "" : album)
                            .put("coverUri", cover == null ? "" : cover).put("mid", "").put("id", 0));
        } catch (Exception ex) {
            Log.e(TAG, "currentSong failure", ex);
            return null;
        }
    }

    /**
     * Tells the listeners, such as the music card, as the app plays, pauses or changes the song.
     * Must be called on the main thread.
     */
    private void followSession() {
        MediaController controller = controller();
        if (controller == null || followed == controller) {
            return;
        }
        followed = controller;
        controller.registerCallback(new MediaController.Callback() {
            @Override
            public void onPlaybackStateChanged(PlaybackState state) {
                Bundle extras = new Bundle();
                extras.putInt("playState", playStateOf(state));
                sendEvent(EVENT_PLAY_STATE_CHANGED, extras);
            }

            @Override
            public void onMetadataChanged(MediaMetadata metadata) {
                JSONObject song = currentSong();
                String id = song == null ? null : song.optString("mid");
                if (song == null || id.equals(lastSongId)) {
                    return;
                }
                lastSongId = id;
                sendSongChanged();
            }
        }, mainHandler);
    }

    private void sendSongChanged() {
        JSONObject song = currentSong();
        if (song == null) {
            return;
        }
        Bundle extras = new Bundle();
        extras.putString("playSong", song.toString());
        sendEvent(EVENT_PLAY_SONG_CHANGED, extras);
    }

    private static String describe(Bundle bundle) {
        if (bundle == null) {
            return "nothing";
        }
        StringBuilder text = new StringBuilder("{");
        for (String key : bundle.keySet()) {
            text.append(key).append('=').append(bundle.get(key)).append(", ");
        }
        return text.append('}').toString();
    }

    private void control(LibraryBrowser.Control control) {
        LibraryBrowser.control(getApplicationContext(), control);
    }

    /**
     * Plays a song of the queue, or a playlist or download of the library, the card lists.
     */
    private void playFromList(String id) {
        if (id == null) {
            return;
        }
        Log.i(TAG, "Playing from a list: " + id);
        if (RegularApp.isMediaIdOfApp(id)) {
            mainHandler.post(() -> RegularApp.play(this, id));
        } else if (id.startsWith(ID_QUEUE)) {
            try {
                long queueId = Long.parseLong(id.substring(ID_QUEUE.length()));
                control(controls -> controls.skipToQueueItem(queueId));
            } catch (NumberFormatException ex) {
                Log.e(TAG, "playFromList failure", ex);
            }
        } else if (id.startsWith(ID_PLAYLIST) || id.startsWith(ID_DOWNLOAD)) {
            boolean playlist = id.startsWith(ID_PLAYLIST);
            String mediaId = id.substring((playlist ? ID_PLAYLIST : ID_DOWNLOAD).length());
            Bundle extras = new Bundle();
            extras.putString(MusicCardProtocol.KEY_LIST, playlist ? MusicCardProtocol.LIST_FAVORITE : MusicCardProtocol.LIST_LOCAL);
            control(controls -> controls.playFromMediaId(mediaId, extras));
        }
    }

    /**
     * @return The queue of the app, as QQ Music lists its playlist.
     */
    private static Bundle queueResult() {
        JSONArray songs = new JSONArray();
        MediaController controller = controller();
        List<MediaSession.QueueItem> queue = controller == null ? null : controller.getQueue();
        if (queue != null) {
            for (MediaSession.QueueItem item : queue) {
                android.media.MediaDescription description = item.getDescription();
                songs.put(song(ID_QUEUE + item.getQueueId(), text(description.getTitle()),
                        text(description.getSubtitle()), "", ""));
            }
        }
        return listResult(songs);
    }

    private static JSONObject song(String id, String title, String artist, String album, String cover) {
        try {
            return new JSONObject()
                    .put("id", id)
                    .put("mid", id)
                    .put("title", title)
                    .put("type", 0)
                    .put("singer", new JSONObject().put("title", artist).put("mid", "").put("id", 0))
                    .put("album", new JSONObject().put("title", album).put("coverUri", cover).put("mid", "").put("id", 0));
        } catch (Exception ex) {
            Log.e(TAG, "song failure", ex);
            return new JSONObject();
        }
    }

    private static String text(CharSequence text) {
        return text == null ? "" : text.toString();
    }

    private static boolean isLiked() {
        MediaMetadata metadata = metadata();
        android.media.Rating rating = metadata == null ? null : metadata.getRating(MediaMetadata.METADATA_KEY_RATING);
        return rating != null && rating.getRatingStyle() == android.media.Rating.RATING_HEART && rating.hasHeart();
    }

    private static Bundle result(int code) {
        Bundle result = new Bundle();
        result.putInt(KEY_CODE, code);
        return result;
    }

    private static Bundle listResult(JSONArray list) {
        Bundle result = result(CODE_OK);
        result.putString(KEY_DATA, list.toString());
        result.putBoolean("hasMore", false);
        return result;
    }

    private static void returnTo(IBinder callback, Bundle result) {
        if (callback == null) {
            return;
        }
        Parcel data = Parcel.obtain();
        try {
            data.writeInterfaceToken(CALLBACK_DESCRIPTOR);
            writeBundle(data, result);
            callback.transact(TRANSACTION_ON_RETURN, data, null, IBinder.FLAG_ONEWAY);
        } catch (Exception ex) {
            Log.e(TAG, "returnTo failure", ex);
        } finally {
            data.recycle();
        }
    }

    private static Bundle readBundle(Parcel parcel) {
        return parcel.readInt() != 0 ? Bundle.CREATOR.createFromParcel(parcel) : null;
    }

    private static void writeBundle(Parcel parcel, Bundle bundle) {
        if (bundle == null) {
            parcel.writeInt(0);
        } else {
            parcel.writeInt(1);
            bundle.writeToParcel(parcel, 0);
        }
    }
}
