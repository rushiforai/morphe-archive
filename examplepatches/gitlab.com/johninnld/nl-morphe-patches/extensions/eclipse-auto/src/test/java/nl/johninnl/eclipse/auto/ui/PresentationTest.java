package nl.johninnl.eclipse.auto.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import java.util.Map;
import org.junit.Test;

public class PresentationTest {
    @Test public void everyEntryHasAnApi8FallbackThatIsNotAnApi9Format() {
        for (Map.Entry<String, Presentation.Entry> entry : Presentation.table().entrySet()) {
            assertFalse(entry.getKey() + " must fall back to an API 8 format", entry.getValue().api8.api9Only);
            assertTrue(entry.getKey() + " needs a positive cap", entry.getValue().cap > 0);
        }
    }

    @Test public void anApi9OnlyFormatCanNeverBeRequestedBelowApi9() {
        for (Presentation.Entry entry : Presentation.table().values()) {
            assertFalse(Presentation.resolve(entry, false).format.api9Only);
        }
        assertFalse(Presentation.resolve(Presentation.LIBRARY_FACETS, false).format.api9Only);
    }

    @Test public void facetsAreCondensedOnApi9AndSmallTilesBelow() {
        assertEquals(Presentation.Format.CONDENSED, Presentation.resolve(Presentation.LIBRARY_FACETS, true).format);
        assertEquals(Presentation.Format.GRID_SMALL, Presentation.resolve(Presentation.LIBRARY_FACETS, false).format);
        assertEquals(Presentation.Format.CONDENSED, Presentation.resolve(Presentation.RADIO_CATEGORIES, true).format);
        assertEquals(Presentation.Format.GRID_SMALL, Presentation.resolve(Presentation.RADIO_CATEGORIES, false).format);
    }

    @Test public void theHomeTableMatchesThePhone() {
        Presentation.Entry recent = Presentation.forKey("home.recently_played");
        assertEquals("two untitled columns of small tiles", Presentation.Format.CONDENSED, recent.api9);
        assertEquals(Presentation.Format.GRID_SMALL, recent.api8);
        assertEquals(Presentation.Format.SPOTLIGHT, Presentation.forKey("home.featured_artist").api9);
        assertEquals(Presentation.Format.GRID_CIRCLE, Presentation.forKey("home.featured_artist").api8);
        assertEquals(1, Presentation.forKey("home.featured_artist").cap);
        // Songs rows and the stations are large tiles at both levels (they used to be rows).
        for (String key : new String[] {"home.tracks", "home.stations", "home.made_for_you", "home.shows"}) {
            assertEquals(key, Presentation.Format.GRID_LARGE, Presentation.forKey(key).api9);
            assertEquals(key, Presentation.Format.GRID_LARGE, Presentation.forKey(key).api8);
        }
        assertEquals(Presentation.Format.GRID_CIRCLE, Presentation.forKey("home.artists").api9);
        assertEquals("the Umbra card is a banner on API 9", Presentation.Format.BANNER, Presentation.forKey("home.dj").api9);
        assertEquals(Presentation.Format.ROWS, Presentation.forKey("home.dj").api8);
    }

    @Test public void everyHomeAndDiscoverSectionHasOnlyTheOneSilentSafetyCap() {
        assertEquals(30, Presentation.SECTION_CAP);
        for (Map.Entry<String, Presentation.Entry> entry : Presentation.table().entrySet()) {
            String key = entry.getKey();
            if (key.startsWith("library.") || key.startsWith("radio.")) continue;
            if (key.equals("home.featured_artist")) assertEquals(1, entry.getValue().cap);
            else if (key.equals("home.dj")) assertEquals(1, entry.getValue().cap);
            else assertEquals(key + ": no per-row cap of 5, 8 or 12", Presentation.SECTION_CAP, entry.getValue().cap);
        }
        assertEquals("unknown keys are large tiles under the same cap", Presentation.SECTION_CAP, Presentation.forKey("daily_mixes").cap);
        assertEquals("Library facet screens keep their own cap", 300, Presentation.FACET_GRID.cap);
        assertEquals(300, Presentation.FACET_ARTISTS.cap);
    }

    @Test public void discoverUsesALargeCardGridAndAHeroSpotlightWithARowFallback() {
        Presentation.Entry cards = Presentation.forKey("discover.cards");
        assertEquals(Presentation.Format.GRID_LARGE, cards.api9);
        Presentation.Entry hero = Presentation.forKey("discover.hero");
        assertEquals(Presentation.Format.SPOTLIGHT, hero.api9);
        assertEquals(Presentation.Format.ROWS, hero.api8);
    }

    @Test public void unknownKeysRenderAsLargeTiles() {
        assertEquals(Presentation.Format.GRID_LARGE, Presentation.resolve(Presentation.forKey("daily_mixes"), true).format);
    }

    @Test public void anApi9FormatAsFallbackIsRejected() {
        assertThrows(IllegalArgumentException.class,
            () -> new Presentation.Entry(Presentation.Format.CONDENSED, Presentation.Format.CONDENSED, 4));
        assertThrows(IllegalArgumentException.class,
            () -> new Presentation.Entry(Presentation.Format.GRID_LARGE, Presentation.Format.SPOTLIGHT, 4));
    }

    @Test public void theMediaPlaybackActionIsOnAtBothLevelsUntilADeviceSaysOtherwise() {
        assertTrue(Presentation.showPlaybackAction(false));
        assertTrue(Presentation.showPlaybackAction(true));
    }
}
