package nl.johninnl.deezer.lyrics;

import org.junit.Test;
import static org.junit.Assert.*;

public class LyricsStoreTest {
    private static TrackSignature track(String id) { return new TrackSignature(id, "Title " + id, "Artist", "Album", 120); }
    private static LrclibClient.Result lyrics() { return LrclibClient.Result.found(LyricsPayload.normalize(7, false, "Synthetic", null, 120)); }

    @Test public void nativeLyricsWinAndPendingOrMissingNeverExposeTheButton() {
        LyricsStore store = new LyricsStore();
        LyricsStore.Ticket ticket = store.select(track("A"), false);
        assertEquals(LyricsStore.Availability.PENDING, store.snapshot(0).availability);
        assertTrue(store.complete(ticket, LrclibClient.Result.missing(), 0));
        assertEquals(LyricsStore.Availability.MISSING, store.snapshot(1).availability);
        store.select(track("A"), true);
        assertFalse(store.complete(ticket, lyrics(), 2));
        assertEquals(LyricsStore.Availability.NATIVE, store.snapshot(3).availability);
    }

    @Test public void staleResultCannotChangeAnotherTrackOrARevisitedGeneration() {
        LyricsStore store = new LyricsStore();
        LyricsStore.Ticket a = store.select(track("A"), false);
        store.select(track("B"), false);
        assertFalse(store.complete(a, lyrics(), 0));
        assertNull(store.snapshot(0).payload);
        LyricsStore.Ticket b = store.select(track("B"), false);
        store.select(track("A"), false);
        store.select(track("B"), false);
        assertFalse(store.complete(b, lyrics(), 1));
    }

    @Test public void missingResultsExpireAndBoundedCacheEvictsOldPayloads() {
        LyricsStore store = new LyricsStore(1);
        LyricsStore.Ticket a = store.select(track("A"), false);
        store.complete(a, LrclibClient.Result.missing(), 0);
        assertFalse(store.needsLookup(a, 899999));
        assertTrue(store.needsLookup(a, 900000));
        store.complete(a, lyrics(), 900001);
        LyricsStore.Ticket b = store.select(track("B"), false);
        store.complete(b, lyrics(), 900002);
        store.select(track("A"), false);
        assertEquals(LyricsStore.Availability.PENDING, store.snapshot(900003).availability);
    }

    @Test public void rateLimitForAnOldTrackStillDelaysTheWholeClient() {
        LyricsStore store = new LyricsStore();
        LyricsStore.Ticket a = store.select(track("A"), false);
        LyricsStore.Ticket b = store.select(track("B"), false);
        assertFalse(store.complete(a, LrclibClient.Result.retry(120000), 1000));
        assertFalse(store.needsLookup(b, 120999));
        assertTrue(store.needsLookup(b, 121000));
        store.requestFinished(121000);
        assertFalse(store.needsLookup(b, 121349));
        assertTrue(store.needsLookup(b, 121350));
        store.clearSelection();
        assertFalse(store.owns(b));
        assertEquals(LyricsStore.Availability.MISSING, store.snapshot(122000).availability);
    }
}
