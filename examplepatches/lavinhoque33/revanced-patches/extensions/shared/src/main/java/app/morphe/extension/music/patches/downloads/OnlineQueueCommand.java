/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * The queue of No Playlist while online. The app starts a song from the app's own watch of it, which builds the
 * song's radio, and a list of loose songs has no playlist the server knows. So the songs of the list are put in front
 * of that radio with the app's own Play next command (the queue add endpoint of the song menu, inserted after the
 * current song), in the order the list shows them from the tapped song.
 */
final class OnlineQueueCommand {
    private static final int QUEUE_ADD_ENDPOINT = 163_162_354;
    private static final int QUEUE_TARGET_FIELD = 1;
    private static final int QUEUE_TARGET_VIDEO_ID = 1;
    private static final int INSERT_POSITION_FIELD = 2;
    /** QueueInsertPosition.INSERT_AFTER_CURRENT_VIDEO, the position of Play next. */
    private static final int INSERT_AFTER_CURRENT = 1;

    private OnlineQueueCommand() {}

    /** The command that puts the song right after the one playing, as Play next of the song menu does. */
    static byte[] playNext(String videoId) {
        if (videoId == null || videoId.isEmpty()) throw new IllegalArgumentException("videoId is empty");

        byte[] target = new ProtoWriter().string(QUEUE_TARGET_VIDEO_ID, videoId).toByteArray();
        byte[] endpoint = new ProtoWriter()
                .message(QUEUE_TARGET_FIELD, target)
                .int32(INSERT_POSITION_FIELD, INSERT_AFTER_CURRENT)
                .toByteArray();
        return new ProtoWriter().message(QUEUE_ADD_ENDPOINT, endpoint).toByteArray();
    }

    /**
     * The songs that follow the tapped one, in the order they play: the songs after it as the list shows them, then
     * the songs before it, as the list plays on from its end to its start.
     *
     * @param songs  The ids of the list in its shown order.
     * @param tapped The position of the tapped song; out of range gives no songs.
     */
    static List<String> following(List<String> songs, int tapped) {
        List<String> order = new ArrayList<>();
        if (tapped < 0 || tapped >= songs.size()) return order;

        order.addAll(songs.subList(tapped + 1, songs.size()));
        order.addAll(songs.subList(0, tapped));
        return order;
    }

    /**
     * The order the Play next commands run in. Each one lands right after the playing song, in front of the earlier
     * ones, so the last song of the order goes first.
     */
    static List<String> commandOrder(List<String> following) {
        List<String> order = new ArrayList<>(following);
        Collections.reverse(order);
        return order;
    }
}
