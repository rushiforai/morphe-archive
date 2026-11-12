/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.List;

public class OnlineQueueCommandTest {
    private static final List<String> SONGS = List.of("a", "b", "c", "d");

    @Test public void songsAfterTheTappedOneComeFirstThenTheOnesBefore() {
        assertEquals(List.of("c", "d", "a"), OnlineQueueCommand.following(SONGS, 1));
    }

    @Test public void firstAndLastRows() {
        assertEquals(List.of("b", "c", "d"), OnlineQueueCommand.following(SONGS, 0));
        assertEquals(List.of("a", "b", "c"), OnlineQueueCommand.following(SONGS, 3));
    }

    @Test public void outOfRangeTapQueuesNothing() {
        assertTrue(OnlineQueueCommand.following(SONGS, -1).isEmpty());
        assertTrue(OnlineQueueCommand.following(SONGS, 4).isEmpty());
        assertTrue(OnlineQueueCommand.following(List.of(), 0).isEmpty());
    }

    @Test public void playNextCommandsRunLastSongFirst() {
        List<String> following = OnlineQueueCommand.following(SONGS, 1);

        assertEquals(List.of("a", "d", "c"), OnlineQueueCommand.commandOrder(following));
    }

    @Test public void playNextCommandIsTheQueueAddEndpointAfterTheCurrentSong() throws Exception {
        byte[] command = OnlineQueueCommand.playNext("abcdefghijk");

        assertEquals(List.of(163_162_354), ProtoFields.numbers(command));
        byte[] endpoint = ProtoFields.one(command, 163_162_354);
        assertEquals(List.of(1, 2), ProtoFields.numbers(endpoint));
        assertEquals("abcdefghijk", ProtoFields.string(ProtoFields.one(endpoint, 1), 1));
        assertEquals(1, ProtoFields.varint(endpoint, 2));
    }

    @Test(expected = IllegalArgumentException.class)
    public void emptyIdIsRejected() {
        OnlineQueueCommand.playNext("");
    }
}
