/*
 * Copyright 2026 Rosaldivo.
 * https://github.com/Rosaldivo/rosaldivo-morphe-patches
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.rosaldivo.extension.music;

import android.app.Application;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.Map;

/**
 * Keeps a single song from turning into a radio mix when the autoplay setting is off.
 *
 * <p>Choosing a single song (tapping it in a list, or 'Play next' on an empty queue) asks the
 * server for that song, and the server answers with a radio mix of many songs. The app also asks
 * for more songs whenever the queue gets short, so a mix that is cut off would grow back.
 *
 * <p>This class cuts the mix off the queue once it arrives, and stops the app from asking for more
 * songs for as long as the queue still starts with the song that was chosen.
 */
@SuppressWarnings("unused")
public final class SingleSongMixPatch {

    private static final String TAG = "RosaldivoPatches";

    private static final String PREFERENCES_NAME = "youtube";
    private static final String AUTOPLAY_KEY = "autoplay_enabled";

    /**
     * Playlist ids of the radio of a single song start with this. Other radios, such as the one of
     * a playlist, and playlists and albums do not.
     */
    private static final String SINGLE_SONG_RADIO_ID_PREFIX = "RDAMVM";

    /**
     * Field of the queue response that holds its playlist id, and the wire types of protobuf fields.
     */
    private static final int PLAYLIST_ID_FIELD = 5;
    private static final int WIRE_TYPE_VARINT = 0;
    private static final int WIRE_TYPE_FIXED64 = 1;
    private static final int WIRE_TYPE_LENGTH_DELIMITED = 2;
    private static final int WIRE_TYPE_FIXED32 = 5;

    private static final long POLL_INTERVAL_MILLIS = 150;
    /**
     * How long to wait for the mix to arrive.
     */
    private static final long WAIT_FOR_MIX_MILLIS = 20_000;
    /**
     * How long to keep cutting after the first cut, in case the mix arrives in several parts.
     */
    private static final long KEEP_CUTTING_MILLIS = 3_000;

    private static final Handler handler = new Handler(Looper.getMainLooper());

    /**
     * The queue manager of the app, found when a queue lane is requested.
     */
    private static volatile Object queueManager;

    /**
     * A single song was chosen with autoplay off, and the queue is still that song's.
     */
    private static volatile boolean singleSongQueue;
    /**
     * The first song of the queue, once the mix arrived. Only set from the main thread.
     */
    private static volatile Object firstSong;

    private static boolean polling;
    private static long giveUpAtMillis;
    private static long stopCuttingAtMillis;

    private static volatile Method toByteArrayMethod;

    /**
     * Injection point. Called with the queue manager each time a queue lane is requested.
     */
    public static void setQueueManager(Object queueManager) {
        SingleSongMixPatch.queueManager = queueManager;
    }

    /**
     * Injection point. Called when a queue is about to be loaded from a server response.
     *
     * @param response Response with the songs of the queue.
     */
    public static void onQueueLoad(Object response) {
        try {
            if (response == null) return;

            String playlistId = getPlaylistId(toByteArray(response));
            if (!playlistId.startsWith(SINGLE_SONG_RADIO_ID_PREFIX)) {
                // A playlist, an album or another kind of radio.
                singleSongQueue = false;
                return;
            }

            if (isAutoplayOff()) {
                Log.d(TAG, "Loading the mix of a single song: " + playlistId);
                singleSongQueue = true;
                firstSong = null;
                handler.post(SingleSongMixPatch::startPolling);
            } else {
                singleSongQueue = false;
            }
        } catch (Exception ex) {
            Log.e(TAG, "onQueueLoad failure", ex);
        }
    }

    /**
     * Injection point. Called before the app asks for more songs for the queue.
     *
     * @param continuationType Type of the request: next page, previous page or radio.
     * @param continuations    The continuations the app knows of. Cleared when the request is dropped,
     *                         so the queue does not wait for more songs.
     * @return If the request is to be dropped.
     */
    public static boolean blockContinuation(Object continuationType, Map<?, ?> continuations) {
        if (!isSingleSongQueue()) return false;

        Log.d(TAG, "Dropped the request for " + continuationType);
        if (continuations != null) continuations.clear();
        return true;
    }

    /**
     * Injection point. Called when the queue is asked to load more songs.
     *
     * @return If the queue is the single song that was chosen, so no more songs are wanted.
     */
    public static boolean isSingleSongQueue() {
        try {
            if (!singleSongQueue) return false;

            Object manager = queueManager;
            if (manager != null && firstSong != null) {
                Object lane = getLane(manager, 0);
                if (laneSize(lane) == 0 || laneGet(lane, 0) != firstSong) {
                    // The queue is another one now.
                    singleSongQueue = false;
                    Log.d(TAG, "The queue changed");
                    return false;
                }
            }
            return true;
        } catch (Exception ex) {
            Log.e(TAG, "isSingleSongQueue failure", ex);
            singleSongQueue = false;
            return false;
        }
    }

    private static void startPolling() {
        giveUpAtMillis = SystemClock.uptimeMillis() + WAIT_FOR_MIX_MILLIS;
        stopCuttingAtMillis = 0;
        if (!polling) {
            polling = true;
            handler.postDelayed(SingleSongMixPatch::poll, POLL_INTERVAL_MILLIS);
        }
    }

    private static void poll() {
        try {
            long now = SystemClock.uptimeMillis();
            boolean mixArrived = firstSong != null;
            if (!singleSongQueue || (mixArrived ? now > stopCuttingAtMillis : now > giveUpAtMillis)) {
                polling = false;
                if (!mixArrived) singleSongQueue = false;
                Log.d(TAG, "Stopped cutting");
                return;
            }

            Object manager = queueManager;
            if (manager != null) {
                Object lane = getLane(manager, 0);
                int size = laneSize(lane);
                if (size > 1) {
                    if (firstSong == null) {
                        firstSong = laneGet(lane, 0);
                        stopCuttingAtMillis = now + KEEP_CUTTING_MILLIS;
                    }
                    for (int i = size - 1; i >= 1; i--) {
                        laneRemove(lane, i);
                    }
                    Log.d(TAG, "Cut " + (size - 1) + " songs of the mix off the queue");
                }
            }
        } catch (Exception ex) {
            Log.e(TAG, "poll failure", ex);
            polling = false;
            singleSongQueue = false;
            return;
        }
        handler.postDelayed(SingleSongMixPatch::poll, POLL_INTERVAL_MILLIS);
    }

    private static byte[] toByteArray(Object message) throws Exception {
        Method method = toByteArrayMethod;
        if (method == null || !method.getDeclaringClass().isInstance(message)) {
            method = message.getClass().getMethod("toByteArray");
            method.setAccessible(true);
            toByteArrayMethod = method;
        }
        return (byte[]) method.invoke(message);
    }

    /**
     * Returns the playlist id of a queue response, which is the text in its field 5, or an empty string.
     * Only reads the fields of the top level of the message, and skips the songs.
     */
    private static String getPlaylistId(byte[] bytes) {
        int i = 0;
        while (i < bytes.length) {
            long tag = 0;
            int shift = 0;
            while (i < bytes.length) {
                int b = bytes[i++] & 0xff;
                tag |= (long) (b & 0x7f) << shift;
                shift += 7;
                if ((b & 0x80) == 0) break;
            }
            int field = (int) (tag >>> 3);
            int wireType = (int) (tag & 7);

            if (wireType == WIRE_TYPE_VARINT) {
                while (i < bytes.length && (bytes[i++] & 0x80) != 0) {
                    // Skip the value.
                }
            } else if (wireType == WIRE_TYPE_LENGTH_DELIMITED) {
                int length = 0;
                shift = 0;
                while (i < bytes.length) {
                    int b = bytes[i++] & 0xff;
                    length |= (b & 0x7f) << shift;
                    shift += 7;
                    if ((b & 0x80) == 0) break;
                }
                if (length < 0 || i + length > bytes.length) return "";
                if (field == PLAYLIST_ID_FIELD) {
                    return new String(bytes, i, length, StandardCharsets.UTF_8);
                }
                i += length;
            } else if (wireType == WIRE_TYPE_FIXED32) {
                i += 4;
            } else if (wireType == WIRE_TYPE_FIXED64) {
                i += 8;
            } else {
                return "";
            }
        }
        return "";
    }

    /**
     * Replaced by the patch. Returns a lane of the queue: 0 is the songs, 1 is the autoplay songs.
     */
    private static Object getLane(Object queueManager, int lane) {
        throw new IllegalStateException("Not replaced by the patch");
    }

    /**
     * Replaced by the patch.
     */
    private static int laneSize(Object lane) {
        throw new IllegalStateException("Not replaced by the patch");
    }

    /**
     * Replaced by the patch.
     */
    private static Object laneGet(Object lane, int index) {
        throw new IllegalStateException("Not replaced by the patch");
    }

    /**
     * Replaced by the patch.
     */
    private static void laneRemove(Object lane, int index) {
        throw new IllegalStateException("Not replaced by the patch");
    }

    /**
     * The setting is stored once per account, as '[account id]_autoplay_enabled'.
     * Autoplay counts as off only if every stored value is off, so a mixed state of several accounts
     * keeps the app's behavior.
     */
    private static boolean isAutoplayOff() throws Exception {
        Application application = (Application) Class.forName("android.app.ActivityThread")
                .getMethod("currentApplication").invoke(null);
        SharedPreferences preferences = application.getSharedPreferences(PREFERENCES_NAME, 0);

        boolean found = false;
        for (Map.Entry<String, ?> entry : preferences.getAll().entrySet()) {
            String key = entry.getKey();
            if (!(key.equals(AUTOPLAY_KEY) || key.endsWith("_" + AUTOPLAY_KEY))) continue;
            if (!(entry.getValue() instanceof Boolean)) continue;

            if ((Boolean) entry.getValue()) return false;
            found = true;
        }

        Log.d(TAG, "Autoplay off: " + found);
        return found;
    }
}
