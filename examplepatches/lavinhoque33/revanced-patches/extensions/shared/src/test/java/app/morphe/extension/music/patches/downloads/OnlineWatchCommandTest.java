/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

import java.util.Arrays;
import java.util.List;

public class OnlineWatchCommandTest {
    private static final String VIDEO = "abcdefghijk";
    private static final String PLAYLIST = "OLAK5uy_album";

    private static byte[] endpoint(byte[] command) throws Exception {
        assertEquals(List.of(48_687_757), ProtoFields.numbers(command));
        return ProtoFields.one(command, 48_687_757);
    }

    @Test public void theCommandIsTheWatchEndpointAlone() {
        byte[] command = OnlineWatchCommand.build(VIDEO, PLAYLIST, 4);

        assertArrayEquals(new byte[]{(byte) 0xea, (byte) 0xa8, (byte) 0xdd, (byte) 0xb9, 0x01},
                Arrays.copyOf(command, 5));
    }

    @Test public void theEndpointCarriesVideoPlaylistAndIndex() throws Exception {
        byte[] endpoint = endpoint(OnlineWatchCommand.build(VIDEO, PLAYLIST, 4));

        assertEquals(List.of(1, 2, 3), ProtoFields.numbers(endpoint));
        assertEquals(VIDEO, ProtoFields.string(endpoint, 1));
        assertEquals(PLAYLIST, ProtoFields.string(endpoint, 2));
        assertEquals(4, ProtoFields.varint(endpoint, 3));
    }

    @Test public void indexZeroIsWrittenWhenThereIsAPlaylist() throws Exception {
        byte[] endpoint = endpoint(OnlineWatchCommand.build(VIDEO, PLAYLIST, 0));

        assertEquals(0, ProtoFields.varint(endpoint, 3));
    }

    @Test public void withoutAPlaylistTheSongPlaysAlone() throws Exception {
        byte[] endpoint = endpoint(OnlineWatchCommand.build(VIDEO, null, 7));

        assertEquals(List.of(1), ProtoFields.numbers(endpoint));
        assertEquals(VIDEO, ProtoFields.string(endpoint, 1));
    }

    @Test public void anEmptyPlaylistCountsAsNone() throws Exception {
        byte[] endpoint = endpoint(OnlineWatchCommand.build(VIDEO, "", 7));

        assertEquals(List.of(1), ProtoFields.numbers(endpoint));
    }

    @Test public void itNeverWritesTheOfflineEndpoint() throws Exception {
        byte[] command = OnlineWatchCommand.build(VIDEO, PLAYLIST, 1);

        assertFalse(ProtoFields.has(command, 57_703_777));
    }

    @Test(expected = IllegalArgumentException.class)
    public void anEmptyVideoIdIsRejected() {
        OnlineWatchCommand.build("", PLAYLIST, 0);
    }

    @Test(expected = IllegalArgumentException.class)
    public void aNegativeIndexIsRejected() {
        OnlineWatchCommand.build(VIDEO, PLAYLIST, -1);
    }
}
