package me.dyskal.ytmrpc;

import org.junit.Test;
import static org.junit.Assert.*;
import static me.dyskal.ytmrpc.DiscordNativeMetadataTest.nativeTrack;

public class DiscordMetadataStateTest {
    private static final String FIRST = "dQw4w9WgXcQ", NEXT = "9itENA7hVe0";
    private static DiscordTrack projected(String title) { return new DiscordTrack(title, "Artist", "Album", null, null); }
    private static DiscordMetadataState playingFirst() throws Exception {
        DiscordMetadataState state = new DiscordMetadataState();
        state.videoId(FIRST); state.nativeMetadata(nativeTrack(FIRST, "First")); state.metadata(projected("First"));
        assertTrue(state.isCurrent());
        return state;
    }

    @Test public void metadataBeforeVideoIdRecoversWithoutASecondMetadataCallback() throws Exception {
        DiscordMetadataState state = playingFirst();
        state.metadata(projected("Next"));
        state.videoId(NEXT);
        assertFalse(state.isCurrent());
        state.nativeMetadata(nativeTrack(NEXT, "Next"));
        assertTrue(state.isCurrent()); assertEquals(NEXT, state.snapshot().videoId);
        assertEquals("Next", state.snapshot().title);
    }

    @Test public void allThreeEventOrdersAssociateTheNewTrack() throws Exception {
        for (String order : new String[]{"MVQ", "MQV", "VMQ", "VQM", "QMV", "QVM"}) {
            DiscordMetadataState state = playingFirst();
            for (char event : order.toCharArray()) switch (event) {
                case 'M' -> state.metadata(projected("Next"));
                case 'V' -> state.videoId(NEXT);
                case 'Q' -> state.nativeMetadata(nativeTrack(NEXT, "Next"));
            }
            assertTrue(order, state.isCurrent()); assertEquals(order, NEXT, state.snapshot().videoId);
            assertEquals(order, "Next", state.snapshot().title);
        }
    }

    @Test public void newPlayerAndQueueDoNotRelabelOldMediaSessionMetadata() throws Exception {
        DiscordMetadataState state = playingFirst();
        state.videoId(NEXT); state.nativeMetadata(nativeTrack(NEXT, "Next"));
        assertFalse(state.isCurrent());
        state.nativeMetadata(nativeTrack(FIRST, "First")); // Late old queue event cannot rescue the mismatch.
        assertFalse(state.isCurrent());
        state.metadata(projected("Next"));
        assertTrue(state.isCurrent());
        state.nativeMetadata(nativeTrack(FIRST, "First"));
        assertEquals(NEXT, state.snapshot().videoId); assertEquals("Next", state.snapshot().title);
    }

    @Test public void matchingTitleCannotOverrideAnExplicitDifferentMediaId() throws Exception {
        DiscordMetadataState state = playingFirst();
        state.videoId(NEXT); state.nativeMetadata(nativeTrack(NEXT, "First"));
        state.metadata(new DiscordTrack("First", "Artist", "Album", FIRST, null));
        assertFalse(state.isCurrent());
        state.metadata(null); assertFalse(state.isCurrent()); assertNull(state.snapshot());
    }
}
