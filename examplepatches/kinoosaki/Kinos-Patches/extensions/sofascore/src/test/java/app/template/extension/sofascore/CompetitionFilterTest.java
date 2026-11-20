package app.template.extension.sofascore;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.junit.Test;

import app.template.extension.hevalcontrols.OptionIcons;

/** The "Hidden competitions" keys, labels, logo URLs, fallback icons and the date-feed row check. */
public class CompetitionFilterTest {
    private static Set<String> set(String... keys) {
        return new HashSet<>(Arrays.asList(keys));
    }

    @Test
    public void keysAreUniqueTournamentIds() {
        assertEquals("17", CompetitionFilter.key(17));
        assertEquals("2147483647", CompetitionFilter.key(Integer.MAX_VALUE));
        assertNull(CompetitionFilter.key(0));
        assertNull(CompetitionFilter.key(-5));
        assertNull(CompetitionFilter.key("17"));
        assertNull(CompetitionFilter.key(17L));
        assertNull(CompetitionFilter.key(null));
    }

    @Test
    public void labelsGroupByCountry() {
        assertEquals("England · Premier League", CompetitionFilter.label("England", "Premier League"));
        assertEquals("England · Premier League", CompetitionFilter.label(" England ", " Premier League "));
        assertEquals("Premier League", CompetitionFilter.label(null, "Premier League"));
        assertEquals("Premier League", CompetitionFilter.label("  ", "Premier League"));
        assertNull(CompetitionFilter.label("England", null));
        assertNull(CompetitionFilter.label("England", "   "));
    }

    @Test
    public void logoUrlForNumericKeysOnly() {
        assertEquals("https://img.sofascore.com/api/v1/unique-tournament/17/image", CompetitionFilter.imageUrl("17"));
        assertEquals("https://img.sofascore.com/api/v1/unique-tournament/2147483647/image",
            CompetitionFilter.imageUrl("2147483647"));
        assertNull(CompetitionFilter.imageUrl("12345678901"));
        assertNull(CompetitionFilter.imageUrl("17a"));
        assertNull(CompetitionFilter.imageUrl("-17"));
        assertNull(CompetitionFilter.imageUrl("EN"));
        assertNull(CompetitionFilter.imageUrl(""));
        assertNull(CompetitionFilter.imageUrl(null));
        assertEquals(CompetitionFilter.imageUrl("17"), CompetitionIcons.INSTANCE.imageUrlFor("17"));
    }

    @Test
    public void iconIsTheCountryFlagOrATrophy() {
        assertEquals(OptionIcons.ENGLAND, CompetitionIcons.icon("EN"));
        assertEquals(OptionIcons.countryFlag("ES"), CompetitionIcons.icon("ES"));
        assertEquals(OptionIcons.countryFlag("EU"), CompetitionIcons.icon("slug:europe"));
        assertEquals(OptionIcons.GLOBE_EUROPE_AFRICA, CompetitionIcons.icon("slug:world"));
        assertEquals(OptionIcons.TROPHY, CompetitionIcons.icon("slug:atp"));   // tours have no flag
        assertEquals(OptionIcons.TROPHY, CompetitionIcons.icon(""));           // category without a key
        assertEquals(OptionIcons.TROPHY, CompetitionIcons.icon(null));         // not seen in this process
        assertEquals(OptionIcons.TROPHY, CompetitionIcons.INSTANCE.iconFor("999999"));
    }

    @Test
    public void aDateFeedRowGoesOnlyWhenEveryCompetitionIsHidden() {
        assertTrue(CompetitionFilter.allHidden(Arrays.asList(17, 18), set("17", "18", "8")));
        assertFalse(CompetitionFilter.allHidden(Arrays.asList(17, 18), set("17")));
        assertFalse(CompetitionFilter.allHidden(Arrays.asList(17, null), set("17")));
        assertFalse(CompetitionFilter.allHidden(Collections.emptyList(), set("17")));
        assertFalse(CompetitionFilter.allHidden(null, set("17")));
        assertFalse(CompetitionFilter.allHidden("17", set("17")));
        assertFalse(CompetitionFilter.allHidden(Arrays.asList(17), Collections.<String>emptySet()));
    }

    @Test
    public void unpatchedSourceHidesNothing() {
        // The patch rewrites patched() to true; the source answers false, so the hooks skip competitions.
        assertFalse(CompetitionFilter.patched());
        assertTrue(CompetitionFilter.hidden().isEmpty());
    }
}
