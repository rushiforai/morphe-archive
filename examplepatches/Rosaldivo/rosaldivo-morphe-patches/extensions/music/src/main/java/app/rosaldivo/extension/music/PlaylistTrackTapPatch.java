/*
 * Copyright 2026 Rosaldivo.
 * https://github.com/Rosaldivo/rosaldivo-morphe-patches
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.rosaldivo.extension.music;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;

/**
 * Changes what tapping a track inside a playlist or album does.
 *
 * <p>Tapping a track sends a watch endpoint carrying the playlist id, and the app replaces the
 * queue with the whole playlist. The command is swapped before it is resolved, either for the same
 * watch endpoint without the playlist, or for the queue add endpoint the long press
 * 'Add to queue' menu item sends.
 */
@SuppressWarnings("unused")
public final class PlaylistTrackTapPatch {

    private static final String TAG = "RosaldivoPatches";

    /**
     * Field numbers of the WatchEndpoint proto.
     */
    private static final int WATCH_ENDPOINT_VIDEO_ID_FIELD = 1;
    private static final int WATCH_ENDPOINT_PLAYLIST_ID_FIELD = 2;
    private static final int WATCH_ENDPOINT_PARAMS_FIELD = 5;
    private static final int WATCH_ENDPOINT_PLAYLIST_SET_VIDEO_ID_FIELD = 13;

    /**
     * Field numbers of the QueueAddEndpoint and QueueTarget protos.
     */
    private static final int QUEUE_ADD_ENDPOINT_QUEUE_TARGET_FIELD = 1;
    private static final int QUEUE_ADD_ENDPOINT_INSERT_POSITION_FIELD = 2;
    private static final int QUEUE_TARGET_VIDEO_ID_FIELD = 1;
    /**
     * QueueInsertPosition.INSERT_AT_END
     */
    private static final int QUEUE_INSERT_POSITION_AT_END = 2;

    private static final int WIRE_TYPE_VARINT = 0;
    private static final int WIRE_TYPE_FIXED64 = 1;
    private static final int WIRE_TYPE_LENGTH_DELIMITED = 2;
    private static final int WIRE_TYPE_FIXED32 = 5;

    private static volatile Method toByteArrayMethod;

    /**
     * The fields of a watch endpoint that tell what was tapped.
     */
    private static final class WatchEndpointFields {
        String videoId = "";
        String playlistId = "";
        String params = "";
        String playlistSetVideoId = "";
    }

    /**
     * Injection point.
     *
     * @param command Command about to be resolved.
     * @return The command to resolve instead, or the original command.
     */
    public static Object overrideCommand(Object command) {
        try {
            if (command == null) return null;

            Object watchEndpoint = getWatchEndpoint(command);
            if (watchEndpoint == null) return command;

            WatchEndpointFields fields = parseWatchEndpoint(serialize(watchEndpoint));
            if (!isPlaylistTrackTap(fields)) return command;

            if (!addToQueue()) {
                return createSingleTrackCommand(command, watchEndpoint);
            }

            Object queueAddCommand = createQueueAddCommand(buildQueueAddEndpoint(fields.videoId));
            showToast("Added to queue");
            return queueAddCommand;
        } catch (Exception ex) {
            Log.e(TAG, "overrideCommand failure", ex);
            return command;
        }
    }

    /**
     * A track listed on a playlist or album page carries the id of its entry in the playlist,
     * and no params. The play and shuffle buttons of the page and mixes carry params and no entry id.
     * A track tapped in the queue carries both, as the queue jumps to the track instead.
     */
    private static boolean isPlaylistTrackTap(WatchEndpointFields fields) {
        return !fields.videoId.isEmpty()
                && !fields.playlistId.isEmpty()
                && !fields.playlistSetVideoId.isEmpty()
                && fields.params.isEmpty();
    }

    /**
     * Uses the unobfuscated {@code MessageLite.toByteArray()} of the proto.
     */
    private static byte[] serialize(Object message) throws Exception {
        Method method = toByteArrayMethod;
        if (method == null) {
            method = message.getClass().getMethod("toByteArray");
            toByteArrayMethod = method;
        }
        return (byte[]) method.invoke(message);
    }

    private static WatchEndpointFields parseWatchEndpoint(byte[] data) {
        WatchEndpointFields fields = new WatchEndpointFields();
        int[] position = {0};
        while (position[0] < data.length) {
            long key = readVarint(data, position);
            int field = (int) (key >>> 3);
            int wireType = (int) (key & 0x7);

            switch (wireType) {
                case WIRE_TYPE_VARINT:
                    readVarint(data, position);
                    break;
                case WIRE_TYPE_FIXED64:
                    position[0] += 8;
                    break;
                case WIRE_TYPE_FIXED32:
                    position[0] += 4;
                    break;
                case WIRE_TYPE_LENGTH_DELIMITED:
                    int length = (int) readVarint(data, position);
                    String value = field == WATCH_ENDPOINT_VIDEO_ID_FIELD
                            || field == WATCH_ENDPOINT_PLAYLIST_ID_FIELD
                            || field == WATCH_ENDPOINT_PARAMS_FIELD
                            || field == WATCH_ENDPOINT_PLAYLIST_SET_VIDEO_ID_FIELD
                            ? new String(data, position[0], length, StandardCharsets.UTF_8)
                            : null;
                    if (field == WATCH_ENDPOINT_VIDEO_ID_FIELD) fields.videoId = value;
                    else if (field == WATCH_ENDPOINT_PLAYLIST_ID_FIELD) fields.playlistId = value;
                    else if (field == WATCH_ENDPOINT_PARAMS_FIELD) fields.params = value;
                    else if (field == WATCH_ENDPOINT_PLAYLIST_SET_VIDEO_ID_FIELD) fields.playlistSetVideoId = value;
                    position[0] += length;
                    break;
                default:
                    throw new IllegalArgumentException("Unsupported wire type: " + wireType);
            }
        }
        return fields;
    }

    private static long readVarint(byte[] data, int[] position) {
        long result = 0;
        for (int shift = 0; shift < 64; shift += 7) {
            byte b = data[position[0]++];
            result |= (long) (b & 0x7F) << shift;
            if ((b & 0x80) == 0) return result;
        }
        throw new IllegalArgumentException("Malformed varint");
    }

    /**
     * @return Serialized QueueAddEndpoint that appends the video to the end of the queue.
     */
    private static byte[] buildQueueAddEndpoint(String videoId) {
        ByteArrayOutputStream queueTarget = new ByteArrayOutputStream();
        writeLengthDelimited(queueTarget, QUEUE_TARGET_VIDEO_ID_FIELD,
                videoId.getBytes(StandardCharsets.UTF_8));

        ByteArrayOutputStream queueAddEndpoint = new ByteArrayOutputStream();
        writeLengthDelimited(queueAddEndpoint, QUEUE_ADD_ENDPOINT_QUEUE_TARGET_FIELD,
                queueTarget.toByteArray());
        writeVarint(queueAddEndpoint, (QUEUE_ADD_ENDPOINT_INSERT_POSITION_FIELD << 3) | WIRE_TYPE_VARINT);
        writeVarint(queueAddEndpoint, QUEUE_INSERT_POSITION_AT_END);
        return queueAddEndpoint.toByteArray();
    }

    private static void writeLengthDelimited(ByteArrayOutputStream stream, int field, byte[] value) {
        writeVarint(stream, (field << 3) | WIRE_TYPE_LENGTH_DELIMITED);
        writeVarint(stream, value.length);
        stream.write(value, 0, value.length);
    }

    private static void writeVarint(ByteArrayOutputStream stream, int value) {
        while ((value & ~0x7F) != 0) {
            stream.write((value & 0x7F) | 0x80);
            value >>>= 7;
        }
        stream.write(value);
    }

    private static void showToast(String text) {
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                Context context = (Context) Class.forName("android.app.ActivityThread")
                        .getMethod("currentApplication").invoke(null);
                Toast.makeText(context, text, Toast.LENGTH_SHORT).show();
            } catch (Exception ex) {
                Log.e(TAG, "showToast failure", ex);
            }
        });
    }

    // The methods below are implemented by the patch.

    /**
     * @return Whether the tapped track is added to the queue instead of played alone.
     */
    private static boolean addToQueue() {
        return false;
    }

    /**
     * @return The watch endpoint of the command, or null if the command is not a watch endpoint.
     */
    private static Object getWatchEndpoint(Object command) {
        return null;
    }

    /**
     * @return Copy of the command, with the playlist id and index cleared from its watch endpoint.
     */
    private static Object createSingleTrackCommand(Object command, Object watchEndpoint) {
        return command;
    }

    /**
     * @param queueAddEndpoint Serialized QueueAddEndpoint.
     * @return Command holding the queue add endpoint.
     */
    private static Object createQueueAddCommand(byte[] queueAddEndpoint) {
        throw new IllegalStateException("Not patched");
    }
}
