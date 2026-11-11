package app.originisland.jovi;

import android.app.Service;
import android.content.Intent;
import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.PlaybackState;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.os.RemoteException;
import android.os.SystemClock;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * Takes the songs Jovi is asked for by voice, the way QQ Music does, and has Apple Music play them.
 *
 * Jovi binds this service of QQ Music, says hi, searches for what was asked for, plays a song of
 * the results by its id, and waits to be told that it plays. A search is answered with what was
 * asked for as the only song, and playing it has Apple Music play the first result of a search for
 * it. Nothing is played here: everything plays in Apple Music.
 */
public final class QQMusicApiService extends Service {

    private static final String TAG = "AppleMusicJovi";

    private static final String API_DESCRIPTOR = "com.tencent.qqmusic.third.api.contract.IQQMusicApi";
    private static final String CALLBACK_DESCRIPTOR = "com.tencent.qqmusic.third.api.contract.IQQMusicApiCallback";
    private static final String LISTENER_DESCRIPTOR = "com.tencent.qqmusic.third.api.contract.IQQMusicApiEventListener";

    private static final int TRANSACTION_EXECUTE = 1;
    private static final int TRANSACTION_EXECUTE_ASYNC = 2;
    private static final int TRANSACTION_REGISTER_EVENT_LISTENER = 3;
    private static final int TRANSACTION_UNREGISTER_EVENT_LISTENER = 4;
    private static final int TRANSACTION_ON_RETURN = 1;
    private static final int TRANSACTION_ON_EVENT = 1;

    private static final String EVENT_PLAY_STATE_CHANGED = "API_EVENT_PLAY_STATE_CHANGED";
    private static final String EVENT_PLAY_SONG_CHANGED = "API_EVENT_PLAY_SONG_CHANGED";
    private static final int PLAY_STATE_STARTED = 4;
    private static final int PLAY_STATE_PAUSED = 5;
    private static final int PLAY_STATE_STOPPED = 6;
    private static final int PLAY_STATE_BUFFERING = 10;

    private static final String KEY_CODE = "code";
    private static final String KEY_DATA = "data";
    private static final int CODE_OK = 0;

    /**
     * Start of the ids of the songs of the results, which are what was asked for.
     */
    private static final String SEARCH_ID_PREFIX = "applemusic_search:";

    /**
     * How long playback is waited for after a song is asked for.
     */
    private static final long WAIT_FOR_PLAYBACK_MS = 20_000;

    private static final Handler mainHandler = new Handler(Looper.getMainLooper());

    private final List<IBinder> listeners = new CopyOnWriteArrayList<>();
    private MediaController followed;
    private String lastSongId;

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
                        returnTo(callback, execute(action, params));
                        return true;
                    }
                    case TRANSACTION_REGISTER_EVENT_LISTENER:
                    case TRANSACTION_UNREGISTER_EVENT_LISTENER: {
                        data.enforceInterface(API_DESCRIPTOR);
                        data.createStringArrayList();
                        IBinder listener = data.readStrongBinder();
                        if (listener != null) {
                            if (code == TRANSACTION_REGISTER_EVENT_LISTENER) {
                                listeners.add(listener);
                                AppleMusic.withController(QQMusicApiService.this, c -> followSession());
                            } else {
                                listeners.remove(listener);
                            }
                        }
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

    @Override
    public IBinder onBind(Intent intent) {
        Log.i(TAG, "Bound by " + getPackageManager().getNameForUid(Binder.getCallingUid()));
        AppleMusic.addOnConnectedListener(this::followSession);
        return binder;
    }

    private Bundle execute(String action, Bundle params) {
        if (!"getCurrTime".equals(action) && !"getPlaybackState".equals(action)) {
            Log.i(TAG, "Asked to " + action);
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
                    playFromSearch(query, id);
                } else {
                    command("play");
                }
                return result(CODE_OK);
            }

            case "playMusic":
            case "resumeMusic":
                command("play");
                return result(CODE_OK);

            case "pauseMusic":
            case "stopMusic":
                command("pause");
                return result(CODE_OK);

            case "skipToNext":
                command("next");
                return result(CODE_OK);

            case "skipToPrevious":
                command("previous");
                return result(CODE_OK);

            case "getPlayList":
            case "getFolderList":
            case "getSongList":
            case "getUserSongList":
                return listResult(new JSONArray());

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

    /**
     * Has Apple Music play what was asked for, and tells Jovi once it plays, which it waits for.
     */
    private static final String VOICE_REQUEST_ACTION = "app.originisland.applemusic.action.PLAY_FROM_SEARCH";

    /**
     * Has Apple Music play what was asked for. vivo does not let this app connect to Apple Music
     * while it is in the background, as it is when Jovi asks, so what was asked for is sent to the
     * patched Apple Music, which searches for it and plays it itself.
     */
    private void playFromSearch(String query, String id) {
        String raw = id.substring(SEARCH_ID_PREFIX.length());
        // Jovi puts the singer and the name of the song together without a space.
        String artist = null;
        String title = null;
        for (int i = 1; i < raw.length(); i++) {
            if (Character.isLowerCase(raw.charAt(i - 1)) && Character.isUpperCase(raw.charAt(i))) {
                artist = raw.substring(0, i).trim();
                title = raw.substring(i).trim();
                break;
            }
        }
        String search = title != null ? title + " " + artist : query;
        Log.i(TAG, "Asking Apple Music to play: " + (title != null ? title + " by " + artist : query));
        sendToAppleMusic(new Intent(VOICE_REQUEST_ACTION)
                .putExtra("query", search)
                .putExtra("title", title)
                .putExtra("artist", artist));
        // Jovi waits to be told the song plays.
        mainHandler.postDelayed(() -> sendPlaying(id), 2500);
    }

    private void sendToAppleMusic(Intent intent) {
        intent.setPackage(AppleMusic.PACKAGE);
        // Without this, Android holds the request back while Apple Music is in the background,
        // until it is opened again.
        intent.addFlags(Intent.FLAG_RECEIVER_FOREGROUND | Intent.FLAG_INCLUDE_STOPPED_PACKAGES);
        android.app.BroadcastOptions options = android.app.BroadcastOptions.makeBasic();
        // Apple Music only takes requests it knows come from this app.
        options.setShareIdentityEnabled(true);
        sendBroadcast(intent, null, options.toBundle());
    }

    private static String idOfMetadata(MediaMetadata metadata) {
        if (metadata == null) {
            return null;
        }
        return metadata.getString(MediaMetadata.METADATA_KEY_TITLE) + "|" + metadata.getString(MediaMetadata.METADATA_KEY_ARTIST);
    }

    private void command(String name) {
        Log.i(TAG, "Sending " + name + " to Apple Music");
        sendToAppleMusic(new Intent(VOICE_REQUEST_ACTION).putExtra("command", name));
    }

    private void sendPlaying(String id) {
        Bundle state = new Bundle();
        state.putInt("playState", PLAY_STATE_STARTED);
        sendEvent(EVENT_PLAY_STATE_CHANGED, state);
        JSONObject song = currentSong();
        if (song == null) {
            song = searchResult(queryOf(id));
        }
        try {
            song.put("mid", id).put("id", id);
        } catch (Exception ignored) {
        }
        Bundle extras = new Bundle();
        extras.putString("playSong", song.toString());
        sendEvent(EVENT_PLAY_SONG_CHANGED, extras);
    }

    /**
     * Tells Jovi as Apple Music plays, pauses or changes the song. On the main thread.
     */
    private void followSession() {
        MediaController controller = AppleMusic.controller();
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
                Bundle extras = new Bundle();
                extras.putString("playSong", song.toString());
                sendEvent(EVENT_PLAY_SONG_CHANGED, extras);
            }
        }, mainHandler);
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
                listeners.remove(listener);
            } finally {
                data.recycle();
            }
        }
    }

    private static JSONObject searchResult(String keyword) {
        return song(SEARCH_ID_PREFIX + keyword, keyword, "Apple Music", "", "");
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

    private static PlaybackState playbackState() {
        MediaController controller = AppleMusic.controller();
        return controller == null ? null : controller.getPlaybackState();
    }

    private static MediaMetadata metadata() {
        MediaController controller = AppleMusic.controller();
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

    private static JSONObject currentSong() {
        MediaMetadata metadata = metadata();
        if (metadata == null || metadata.getString(MediaMetadata.METADATA_KEY_TITLE) == null) {
            return null;
        }
        String title = metadata.getString(MediaMetadata.METADATA_KEY_TITLE);
        String artist = metadata.getString(MediaMetadata.METADATA_KEY_ARTIST);
        String album = metadata.getString(MediaMetadata.METADATA_KEY_ALBUM);
        return song(title + "|" + artist, title, artist == null ? "" : artist, album == null ? "" : album, "");
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
            return new JSONObject();
        }
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
