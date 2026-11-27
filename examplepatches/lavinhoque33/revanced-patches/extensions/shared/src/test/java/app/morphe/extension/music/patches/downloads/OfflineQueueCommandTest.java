/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-26.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class OfflineQueueCommandTest {
    private static final int QUEUE_ENDPOINT = 163_162_354;
    private static final String SONG = "abcdefghijk";
    private static final String OTHER = "ABCDEFGHIJKLMNOP";

    @Test public void parsesStockSingleSongAndItsNestedWatchWithoutFollowingPostClickCommands() throws Exception {
        byte[] watch = OnlineWatchCommand.build(SONG, null, 0);
        byte[] postClick = OnlineWatchCommand.build(OTHER, null, 0);
        byte[] target = new ProtoWriter().string(1, SONG).message(4, watch).toByteArray();
        byte[] endpoint = new ProtoWriter().message(1, target).int32(2, 2).message(3, postClick).toByteArray();
        byte[] command = new ProtoWriter().string(2, "tracking").message(QUEUE_ENDPOINT, endpoint).toByteArray();

        OfflineQueueCommand parsed = OfflineQueueCommand.parse(command);
        assertEquals(SONG, parsed.videoId());
        assertEquals(2, parsed.position());
        assertArrayEquals(watch, parsed.watch());
        assertFalse(parsed.playerOnly());
        assertEquals(1, OfflineQueueCommand.parse(OnlineQueueCommand.playNext(SONG)).position());
    }

    @Test public void acceptsOnlyTheDirectPlayerMarker() throws Exception {
        ProtoWriter target = new ProtoWriter().string(1, SONG);
        int marker = OfflineQueueCommand.PLAYER_ONLY_FIELD;
        assertTrue(OfflineQueueCommand.parse(root(target, 1, marker)).playerOnly());
        assertTrue(OfflineQueueCommand.parse(root(target, 2, marker)).playerOnly());
        assertFalse(OfflineQueueCommand.parse(root(target.bool(marker, true), 1, 0)).playerOnly());
    }

    @Test public void rejectsPlaylistUnrelatedWatchUnknownPositionAndMultipleTargets() throws Exception {
        assertNull(OfflineQueueCommand.parse(root(new ProtoWriter().string(1, SONG).string(2, "PLid"), 2, 0)));
        byte[] unrelatedWatch = OnlineWatchCommand.build(OTHER, null, 0);
        assertNull(OfflineQueueCommand.parse(root(new ProtoWriter().string(1, SONG).message(4, unrelatedWatch), 2, 0)));
        assertNull(OfflineQueueCommand.parse(root(new ProtoWriter().string(1, SONG).string(1, OTHER), 1, 0)));
        assertNull(OfflineQueueCommand.parse(root(new ProtoWriter().string(1, SONG), 3, 0)));
        assertNull(OfflineQueueCommand.parse(OnlineWatchCommand.build(SONG, null, 0)));
    }

    private static byte[] root(ProtoWriter target, int position, int marker) {
        ProtoWriter endpoint = new ProtoWriter().message(1, target.toByteArray()).int32(2, position);
        if (marker != 0) endpoint.bool(marker, true);
        return new ProtoWriter().message(QUEUE_ENDPOINT, endpoint.toByteArray()).toByteArray();
    }
}
