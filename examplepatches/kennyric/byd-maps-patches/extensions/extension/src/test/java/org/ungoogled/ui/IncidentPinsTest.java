package org.ungoogled.ui;

import static org.junit.Assert.*;

import java.util.Collections;
import java.util.List;
import nl.johninnl.navigation.alerts.IndicatorContract;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** Our incident callouts: posted once per pin, kept per owner and key, removed only on change. */
@RunWith(RobolectricTestRunner.class) @Config(sdk = 33, manifest = Config.NONE)
public class IncidentPinsTest {
    static WarningPins.Pin pin(String key, String icon, double lat, double lng) {
        return new WarningPins.Pin(key, icon, lat, lng, "t");
    }
    static final Object PHONE = new Object(), CAR = new Object();

    @Test public void aNewPinIsPostedOnceAndKeptWhereItWasDrawn() {
        IncidentPins.Book book = new IncidentPins.Book();
        book.start(PHONE);
        WarningPins.Pin a = pin("a", "speed_camera", 52.1, 5.1);
        IncidentPins.Actions first = book.sync(List.of(a), 1000);
        assertEquals(List.of(a), first.posts);
        assertTrue("posted, not drawn yet: no second post", book.sync(List.of(a), 1500).posts.isEmpty());
        Object callout = new Object();
        assertFalse(book.added(PHONE, a, callout));
        assertEquals(1, book.shown(PHONE));
        IncidentPins.Actions again = book.sync(List.of(a), 9000);
        assertTrue(again.posts.isEmpty());
        assertTrue(again.drops.isEmpty());
    }

    @Test public void thePillsSwappingTwoWarningsChangesNothing() {
        IncidentPins.Book book = new IncidentPins.Book();
        book.start(PHONE);
        WarningPins.Pin a = pin("a", "speed_camera", 52.1, 5.1), b = pin("b", "speed_trap", 52.1, 5.1);
        book.sync(List.of(a, b), 1000);
        book.added(PHONE, a, new Object());
        book.added(PHONE, b, new Object());
        IncidentPins.Actions swapped = book.sync(List.of(b, a), 2000);
        assertTrue(swapped.posts.isEmpty());
        assertTrue(swapped.drops.isEmpty());
    }

    @Test public void aGonePinIsRemovedAndAMovedOneRemovedAndPostedAgain() {
        IncidentPins.Book book = new IncidentPins.Book();
        book.start(PHONE);
        WarningPins.Pin a = pin("a", "speed_camera", 52.1, 5.1), b = pin("b", "emergency", 52.2, 5.2);
        book.sync(List.of(a, b), 1000);
        Object ca = new Object(), cb = new Object();
        book.added(PHONE, a, ca);
        book.added(PHONE, b, cb);
        WarningPins.Pin moved = pin("b", "emergency", 52.25, 5.2);
        IncidentPins.Actions next = book.sync(List.of(moved), 2000);
        assertEquals(2, next.drops.size());
        assertSame(ca, next.drops.get(0)[1]);
        assertSame(cb, next.drops.get(1)[1]);
        assertEquals("the moved pin goes out again at once", List.of(moved), next.posts);
        assertEquals(0, book.shown(PHONE));
    }

    @Test public void aLateOrStaleCalloutIsRemovedAgain() {
        IncidentPins.Book book = new IncidentPins.Book();
        book.start(PHONE);
        WarningPins.Pin a = pin("a", "speed_camera", 52.1, 5.1);
        book.sync(List.of(a), 1000);
        assertFalse(book.added(PHONE, a, new Object()));
        assertTrue("a second callout for the same pin", book.added(PHONE, a, new Object()));
        book.sync(Collections.emptyList(), 2000);
        assertTrue("the pin went before Maps drew it", book.added(PHONE, a, new Object()));
        assertTrue("an owner that has stopped", book.added(CAR, a, new Object()));
    }

    @Test public void oneOwnerMissingAPinPostsItAgainAfterAWhile() {
        IncidentPins.Book book = new IncidentPins.Book();
        book.start(PHONE);
        WarningPins.Pin a = pin("a", "roadworks", 52.1, 5.1);
        book.sync(List.of(a), 1000);
        book.added(PHONE, a, new Object());
        book.start(CAR);
        assertEquals("the car started: post for it", List.of(a), book.sync(List.of(a), 2000).posts);
        assertTrue(book.sync(List.of(a), 3000).posts.isEmpty());
        assertEquals("never drawn: tried again", List.of(a), book.sync(List.of(a), 2000 + IncidentPins.REPOST_MS).posts);
        assertTrue("the phone already shows it: the repeat is removed", book.added(PHONE, a, new Object()));
        assertFalse(book.added(CAR, a, new Object()));
    }

    @Test public void clearedByMapsPostsEverythingAgainAndStopForgetsTheOwner() {
        IncidentPins.Book book = new IncidentPins.Book();
        book.start(PHONE);
        WarningPins.Pin a = pin("a", "traffic_jam", 52.1, 5.1);
        book.sync(List.of(a), 1000);
        book.added(PHONE, a, new Object());
        book.cleared(PHONE);
        assertEquals(0, book.shown(PHONE));
        IncidentPins.Actions after = book.sync(List.of(a), 1500);
        assertTrue("Maps removed them itself", after.drops.isEmpty());
        assertEquals(List.of(a), after.posts);
        book.stop(PHONE);
        assertFalse(book.hasOwners());
        assertTrue("no owner: nothing to post to", book.sync(List.of(a), 9000).posts.isEmpty());
    }

    @Test public void nothingWithoutNavigationOrAWarningsProvider() {
        List<WarningPins.Pin> pins = List.of(pin("a", "speed_camera", 52.1, 5.1));
        assertEquals(pins, IncidentPins.wanted(true, true, pins));
        assertEquals("navigation ended", Collections.emptyList(), IncidentPins.wanted(false, true, pins));
        assertEquals("provider disconnected or legacy", Collections.emptyList(), IncidentPins.wanted(true, false, pins));
        assertEquals(Collections.emptyList(), IncidentPins.wanted(true, true, null));
    }

    @Test public void everyKindHasOneOfGooglesIncidentTypes() {
        List<String> types = List.of(IncidentPins.TYPES);
        for (IndicatorContract.Kind kind : IndicatorContract.Kind.values()) {
            assertTrue(kind.icon, types.contains(IncidentPins.type(kind.icon)));
        }
        assertEquals("SPEED_CAMERA", IncidentPins.type("speed_camera"));
        assertEquals("JAM", IncidentPins.type("traffic_jam"));
        assertEquals("OBJECT_ON_ROAD", IncidentPins.type("something_new"));
    }

    @Test public void withoutThePatchNothingIsPosted() {
        assertNull(IncidentPins.uaEvent(null, 52.1, 5.1, "JAM"));
        IncidentPins.uaSend(new Object(), new Object());   // no-op without the patch
        assertFalse(IncidentPins.ours(new Object()));
        assertFalse(IncidentPins.drawing());
    }
    /** acc28: the hand-over cannot read the handler's event register at its end, so entry records it once. */
    @Test public void theHandOverUsesTheEventRecordedAtTheHandlersEntryOnce() {
        IncidentPins.handed(new Object());   // nothing recorded: no-op
        assertFalse(IncidentPins.handOverPending());
        IncidentPins.handling(new Object());
        IncidentPins.handlingOwner(PHONE);
        assertTrue(IncidentPins.handOverPending());
        IncidentPins.handed(new Object());   // Google's own report: not ours, nothing to keep
        assertFalse("consumed by the hand-over", IncidentPins.handOverPending());
        IncidentPins.handling(new Object()); // an early exit leaves it; the next entry replaces it
        IncidentPins.handling(new Object());
        IncidentPins.handlingOwner(CAR);
        IncidentPins.handed(null);
        assertFalse(IncidentPins.handOverPending());
    }
}
