package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Collections;

import org.junit.Test;

public class EffectSessionsTest {
    private static EffectSessions.Event open(int s) {
        return new EffectSessions.Event(true, s);
    }

    private static EffectSessions.Event close(int s) {
        return new EffectSessions.Event(false, s);
    }

    @Test
    public void aDeckIsOpenedOnceAndClosedOnce() {
        EffectSessions e = new EffectSessions();
        Object deck = new Object();
        assertEquals(Collections.singletonList(open(41)), e.open(deck, 41));
        assertEquals(Collections.emptyList(), e.open(deck, 41));
        assertTrue(e.ours(41));
        assertEquals(41, e.sessionOf(deck));
        assertEquals(Collections.singletonList(close(41)), e.close(deck));
        assertEquals(Collections.emptyList(), e.close(deck));
        assertFalse(e.ours(41));
        assertEquals(0, e.sessionOf(deck));
    }

    @Test
    public void noSessionYetIsNotAnnounced() {
        EffectSessions e = new EffectSessions();
        Object player = new Object();
        assertEquals(Collections.emptyList(), e.open(player, 0));
        assertEquals(Collections.emptyList(), e.open(player, -1));
        assertEquals(Collections.emptyList(), e.close(player));
    }

    @Test
    public void aPlayerWhoseSessionChangesClosesItsOldOne() {
        // the addon player: ExoPlayer made a new audio session, the old one never closed
        EffectSessions e = new EffectSessions();
        Object player = new Object();
        e.open(player, 57);
        assertEquals(Arrays.asList(close(57), open(73)), e.open(player, 73));
        assertFalse(e.ours(57));
        assertTrue(e.ours(73));
        assertEquals(Collections.singletonList(close(73)), e.close(player));
    }

    @Test
    public void anIdTakenOverByAnotherOwnerClosesItForTheOldOne() {
        // a deck whose close was missed, its id handed to the next deck
        EffectSessions e = new EffectSessions();
        Object a = new Object(), b = new Object();
        e.open(a, 89);
        assertEquals(Arrays.asList(close(89), open(89)), e.open(b, 89));
        // the old owner's late close doesn't close the new owner's session
        assertEquals(Collections.emptyList(), e.close(a));
        assertTrue(e.ours(89));
        assertEquals(Collections.singletonList(close(89)), e.close(b));
    }

    @Test
    public void ownersAreKeptApart() {
        EffectSessions e = new EffectSessions();
        e.open(1, 100);
        e.open(2, 200);
        assertEquals(Collections.singletonList(close(100)), e.close(1));
        assertTrue(e.ours(200));
    }
}
