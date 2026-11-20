package app.template.extension.fotmob;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.Test;

import app.template.extension.hevalcontrols.OptionIcons;

/** "Hidden competitions": keys, labels, logo URLs, picker icons and the hidden check. */
public class CompetitionFilterTest {
    private static Set<String> set(String... keys) {
        return new HashSet<>(Arrays.asList(keys));
    }

    @Test
    public void keyIsTheParentWhenThereIsOne() {
        assertEquals("47", CompetitionFilter.key(47, 0));
        assertEquals("42", CompetitionFilter.key(10611, 42)); // a stage of the Champions League
        assertNull(CompetitionFilter.key(0, 0));
        assertNull(CompetitionFilter.key(-99, 0)); // League.FAVORITE_LEAGUE_ID
    }

    @Test
    public void labelIsCountryDotName() {
        assertEquals("England · Premier League", CompetitionFilter.label("England", "Premier League"));
        assertEquals("England · Premier League", CompetitionFilter.label(" England ", " Premier League "));
        assertEquals("Premier League", CompetitionFilter.label(null, "Premier League"));
        assertEquals("Premier League", CompetitionFilter.label("  ", "Premier League"));
        assertNull(CompetitionFilter.label("England", null));
        assertNull(CompetitionFilter.label("England", "  "));
    }

    @Test
    public void countryLabelMatchesTheCountryPicker() {
        assertEquals("England", CompetitionFilter.countryLabel("ENG", "Something else"));
        assertEquals("International (clubs)", CompetitionFilter.countryLabel("INT-2", "International - clubs"));
        assertEquals("International (national teams)", CompetitionFilter.countryLabel("INT", "International"));
        assertEquals("Somewhere", CompetitionFilter.countryLabel("XYZ", "Somewhere"));
        assertEquals("XYZ", CompetitionFilter.countryLabel("XYZ", " "));
        assertNull(CompetitionFilter.countryLabel(null, null));
    }

    @Test
    public void imageUrlIsFotMobsLeagueLogo() {
        assertEquals("https://images.fotmob.com/image_resources/logo/leaguelogo/47.png", CompetitionFilter.imageUrl("47"));
        assertEquals("https://images.fotmob.com/image_resources/logo/leaguelogo/9227.png",
                CompetitionIcons.INSTANCE.imageUrlFor("9227"));
        assertNull(CompetitionFilter.imageUrl(null));
        assertNull(CompetitionFilter.imageUrl(""));
        assertNull(CompetitionFilter.imageUrl("ENG"));
        assertNull(CompetitionFilter.imageUrl("-47"));
        assertNull(CompetitionFilter.imageUrl("12345678901"));
    }

    @Test
    public void iconIsTheCountryFlagOrATrophy() {
        assertEquals(OptionIcons.ENGLAND, CompetitionIcons.icon("ENG"));
        assertEquals(OptionIcons.countryFlag("DE"), CompetitionIcons.icon("GER"));
        assertEquals(OptionIcons.GLOBE, CompetitionIcons.icon("INT"));
        assertEquals(OptionIcons.TROPHY, CompetitionIcons.icon("INT-2"));
        assertEquals(OptionIcons.TROPHY, CompetitionIcons.icon("ANT")); // no flag of its own
        assertEquals(OptionIcons.TROPHY, CompetitionIcons.icon(null));

        // The provider looks the league's country up by id (off Android: only what was learnt).
        CountryData.learn(900047, "ENG");
        assertEquals(OptionIcons.ENGLAND, CompetitionIcons.INSTANCE.iconFor("900047"));
        assertEquals(OptionIcons.TROPHY, CompetitionIcons.INSTANCE.iconFor("900048"));
        assertEquals(OptionIcons.TROPHY, CompetitionIcons.INSTANCE.iconFor("not a number"));
    }

    @Test
    public void hiddenByCompetitionStageOrLearntParent() {
        Set<String> championsLeague = set("42");
        assertTrue(CompetitionFilter.isHidden(championsLeague, 42, 0));
        assertTrue(CompetitionFilter.isHidden(championsLeague, 800001, 42)); // a stage in a match list
        assertFalse(CompetitionFilter.isHidden(championsLeague, 800002, 0)); // search: stage not known yet
        CompetitionFilter.learnParent(800002, 42);
        assertTrue(CompetitionFilter.isHidden(championsLeague, 800002, 0));
        assertFalse(CompetitionFilter.isHidden(championsLeague, 73, 0));

        // A league picked by its own id goes even where a match list names a parent.
        assertTrue(CompetitionFilter.isHidden(set("9173"), 9173, 260));
        assertFalse(CompetitionFilter.isHidden(set("9173"), 260, 0));

        assertFalse(CompetitionFilter.isHidden(Collections.<String>emptySet(), 42, 0));
        assertFalse(CompetitionFilter.isHidden(null, 42, 0));
        assertFalse(CompetitionFilter.isHidden(set("42"), -99, 42)); // the favourites pseudo league
    }

    @Test
    public void searchNameIsTheTextBeforeTheId() {
        assertEquals("Premier League", CountryFilter.nameOf("Premier League|47"));
        assertEquals("A|B", CountryFilter.nameOf("A|B|3"));
        assertEquals("Plain", CountryFilter.nameOf("Plain"));
        assertNull(CountryFilter.nameOf(null));
    }

    @Test
    public void unpatchedHooksAreStock() {
        // Neither list patch rewrote patched(): every hook hands back its argument.
        assertFalse(CountryFilter.patched());
        assertFalse(CompetitionFilter.patched());
        assertTrue(CompetitionFilter.hidden().isEmpty());
        List<Object> list = Arrays.<Object>asList("a", "b");
        assertSame(list, CountryFilter.filterLeagues(list));
        assertSame(list, CountryFilter.filterLeagueSuggestions(list));
        assertSame(list, CountryFilter.filterTeamSuggestions(list));
        assertSame(list, CountryFilter.filterMatchSuggestions(list));
        Object live = new Object();
        assertSame(live, CountryFilter.filterLiveMatches(live));
    }
}
