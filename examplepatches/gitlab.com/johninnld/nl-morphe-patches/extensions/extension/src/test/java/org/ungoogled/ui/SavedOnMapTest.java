package org.ungoogled.ui;

import static org.junit.Assert.*;

import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Set;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** Maps hides its personal place generator for a route; the warning pins stay. */
@RunWith(RobolectricTestRunner.class) @Config(sdk = 33, manifest = Config.NONE)
public class SavedOnMapTest {
    static Set<Object> identity(Object... items) {
        Set<Object> s = Collections.newSetFromMap(new IdentityHashMap<>());
        Collections.addAll(s, items);
        return s;
    }

    @Test public void theToggleStaysShownOnlyWhilePinsCanBeDrawn() {
        assertTrue(SavedOnMap.keepShown(true, false));
        assertTrue(SavedOnMap.keepShown(true, true));
        assertTrue("a route hides Maps' places, not the pins", SavedOnMap.keepShown(false, true));
        assertFalse("no pins: Maps' own hiding stands", SavedOnMap.keepShown(false, false));
    }

    @Test public void aRouteMapDrawsOnlyThePins() {
        Object home = "home", work = "work", pin = "pin";
        List<Object> drawn = SavedOnMap.compose(List.of(home, work), null, List.of(pin), true);
        assertEquals(List.of(pin), drawn);
    }

    @Test public void browsingDrawsMapsPlacesLessOurEarlierOnesThenOurs() {
        Object home = "home", oldPin = new Object(), newPin = new Object();
        List<Object> drawn = SavedOnMap.compose(List.of(home, oldPin), identity(oldPin), List.of(newPin), false);
        assertEquals(2, drawn.size());
        assertSame(home, drawn.get(0));
        assertSame(newPin, drawn.get(1));
    }

    @Test public void noAccountListStillDrawsThePins() {
        Object pin = "pin";
        assertEquals(List.of(pin), SavedOnMap.compose(null, null, List.of(pin), false));
        assertEquals(List.of(pin), SavedOnMap.compose(null, null, List.of(pin), true));
    }

    @Test public void anUncreatedControllerIsLeftAlone() {
        assertTrue(SavedOnMap.visible(null, true));
        assertFalse(SavedOnMap.visible(null, false));
    }

    @Test public void mapsHidingIsRecordedUntilItShowsAgain() {
        Object generator = new Object();
        // Unpatched, no pin patch is included: Maps' answer stands, and is remembered.
        assertFalse(SavedOnMap.visible(generator, false));
        assertTrue(SavedOnMap.hiddenByMaps(generator));
        List<?> places = List.of("home", "work");
        assertEquals("hidden for a route: none of Maps' places", List.of(), SavedOnMap.withLocal(generator, places));
        assertTrue(SavedOnMap.visible(generator, true));
        assertFalse(SavedOnMap.hiddenByMaps(generator));
        assertEquals(places, SavedOnMap.withLocal(generator, places));
    }

    @Test public void turningOffForRealForgetsTheRoute() {
        Object generator = new Object();
        SavedOnMap.visible(generator, false);
        SavedOnMap.shown(generator, false);
        assertFalse("created again later, Maps draws everything", SavedOnMap.hiddenByMaps(generator));
    }
}
