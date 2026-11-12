/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 * Modified by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

import java.util.Arrays;
import java.util.List;

public class OfflineWatchCommandTest {
    private static final String VIDEO = "abcdefghijk";
    private static final String PLAYLIST = "PPSVrvx:songs";

    private static byte[] endpoint(byte[] command) throws Exception {
        assertEquals(List.of(57_703_777), ProtoFields.numbers(command));
        return ProtoFields.one(command, 57_703_777);
    }

    @Test public void theCommandIsTheOfflineWatchEndpointAlone() throws Exception {
        byte[] command = OfflineWatchCommand.build(VIDEO, PLAYLIST, 2);

        assertEquals(List.of(57_703_777), ProtoFields.numbers(command));
    }

    @Test public void theEndpointTagIsTheOneTheSpecWrites() {
        byte[] command = OfflineWatchCommand.build(VIDEO, PLAYLIST, 2);

        assertArrayEquals(new byte[]{(byte) 0x8a, (byte) 0xd6, (byte) 0x8f, (byte) 0xdc, 0x01},
                Arrays.copyOf(command, 5));
    }

    @Test public void theEndpointCarriesVideoPlaylistIndexAndConfigOnly() throws Exception {
        byte[] endpoint = endpoint(OfflineWatchCommand.build(VIDEO, PLAYLIST, 5));

        assertEquals(List.of(1, 2, 3, 10), ProtoFields.numbers(endpoint));
        assertEquals(VIDEO, ProtoFields.string(endpoint, 1));
        assertEquals(PLAYLIST, ProtoFields.string(endpoint, 2));
        assertEquals(5, ProtoFields.varint(endpoint, 3));
    }

    @Test public void theConfigOnlySaysSongAndNeverTheFlagsOrTheStartTime() throws Exception {
        byte[] endpoint = endpoint(OfflineWatchCommand.build(VIDEO, PLAYLIST, 0));
        byte[] config = ProtoFields.one(endpoint, 10);

        assertEquals(List.of(6), ProtoFields.numbers(config));
        assertEquals(1, ProtoFields.varint(config, 6));
        assertFalse(ProtoFields.has(endpoint, 7));
        assertFalse(ProtoFields.has(config, 5));
        assertFalse(ProtoFields.has(config, 7));
    }

    @Test public void indexZeroIsWrittenExplicitly() throws Exception {
        byte[] endpoint = endpoint(OfflineWatchCommand.build(VIDEO, PLAYLIST, 0));

        assertEquals(0, ProtoFields.varint(endpoint, 3));
    }

    @Test public void aLargeIndexSurvives() throws Exception {
        byte[] endpoint = endpoint(OfflineWatchCommand.build(VIDEO, PLAYLIST, 70_000));

        assertEquals(70_000, ProtoFields.varint(endpoint, 3));
    }

    @Test public void theExactBytesAreStable() {
        byte[] command = OfflineWatchCommand.build("v", "p", 1);

        // 8a d6 8f dc 01 | len 12 | 0a 01 'v' | 12 01 'p' | 18 01 | 52 02 30 01
        assertArrayEquals(new byte[]{(byte) 0x8a, (byte) 0xd6, (byte) 0x8f, (byte) 0xdc, 0x01, 0x0c,
                0x0a, 0x01, 'v', 0x12, 0x01, 'p', 0x18, 0x01, 0x52, 0x02, 0x30, 0x01}, command);
    }

    @Test(expected = IllegalArgumentException.class)
    public void anEmptyVideoIdIsRejected() {
        OfflineWatchCommand.build("", PLAYLIST, 0);
    }

    @Test(expected = IllegalArgumentException.class)
    public void aMissingPlaylistIsRejected() {
        OfflineWatchCommand.build(VIDEO, null, 0);
    }

    @Test(expected = IllegalArgumentException.class)
    public void aNegativeIndexIsRejected() {
        OfflineWatchCommand.build(VIDEO, PLAYLIST, -1);
    }

    @Test public void theMusicVideoTypeOfAVideoCommandIsTheVideosOnly() throws Exception {
        byte[] endpoint = endpoint(OfflineWatchCommand.build(VIDEO, PLAYLIST, 3, 2));
        byte[] config = ProtoFields.one(endpoint, 10);

        assertEquals(List.of(1, 2, 3, 10), ProtoFields.numbers(endpoint));
        assertEquals(2, ProtoFields.varint(config, 6));
        assertEquals(VIDEO, ProtoFields.string(endpoint, 1));
    }
}
