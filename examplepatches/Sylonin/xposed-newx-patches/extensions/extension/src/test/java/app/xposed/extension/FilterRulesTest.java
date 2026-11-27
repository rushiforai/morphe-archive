package app.xposed.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;

public class FilterRulesTest {
    private static FilterRules full() {
        FilterRules.Builder b = new FilterRules.Builder();
        b.addLocation("Germany");
        b.addLocation("South Asia");
        b.setRegionCountries("South Asia", Arrays.asList("India", "Pakistan"));
        b.putAccount(12345, "@Someone");
        b.addName("\uD83D\uDEA8");
        b.addBio("airdrop");
        b.addAffiliation("@ExampleOrg");
        b.addLink("t.me");
        b.addLink("example.com/channel");
        b.addLabel(FilterRules.PARODY);
        b.addLabel(FilterRules.GOVERNMENT);
        b.addLanguage("ja");
        b.setMinFollowing(5000);
        b.setMinPosts(100000);
        b.setMinHandleDigits(5);
        b.setMinNameDigits(4);
        b.warnedAccounts = true;
        b.bioMatchesLocation = true;
        b.linksMatchLocation = true;
        b.addAlwaysShow("@XaiTax");
        b.alwaysShowFollowing = true;
        b.highlight = false;
        b.highlightInLists = true;
        b.hideRelatedPosts = true;
        return b.build();
    }

    @Test
    public void jsonRoundTripKeepsEveryRule() {
        FilterRules rules = full();
        FilterRules copy = FilterRules.fromJson(rules.toJson());
        assertEquals(rules.toJson(), copy.toJson());
        assertEquals(16, copy.size());
        assertEquals(Collections.singleton("xaitax"), copy.alwaysShow);
        assertTrue(copy.alwaysShowFollowing);
        assertEquals(Collections.singletonMap(12345L, "someone"), copy.accounts);
        assertEquals(Arrays.asList("india", "pakistan"), copy.regionCountries.get("south asia"));
        assertTrue(copy.coveredCountries.contains("india"));
        assertTrue(copy.domains.contains("t.me"));
        assertTrue(copy.urls.contains("https://example.com/channel"));
        assertEquals("exampleorg", copy.affiliationTerms[0]);
        assertFalse(copy.highlight);
        assertTrue(copy.highlightInLists);
        assertTrue(copy.hideRelatedPosts);
        FilterRules defaults = FilterRules.fromJson("{}");
        assertTrue(defaults.highlight);
        assertFalse(defaults.highlightInLists || defaults.hideRelatedPosts);
    }

    @Test
    public void onlyFiltersOnProfileOnlyDetailsAskTimelinesForThem() {
        assertTrue(full().needsProfileDetails());
        assertFalse(rules(b -> b.addBio("airdrop")).needsProfileDetails());
        assertTrue(rules(b -> {
            b.addBio("airdrop");
            b.bioMatchesLocation = true;
        }).needsProfileDetails());
        assertTrue(rules(b -> b.setMinPosts(10)).needsProfileDetails());
        assertTrue(rules(b -> b.addLink("t.me")).needsProfileDetails());
        assertFalse(rules(b -> b.setMinFollowing(10)).needsProfileDetails());
    }

    private static FilterRules rules(java.util.function.Consumer<FilterRules.Builder> edit) {
        FilterRules.Builder b = new FilterRules.Builder();
        edit.accept(b);
        return b.build();
    }

    @Test
    public void invalidSavedEntriesAreDroppedOneByOne() throws Exception {
        JSONObject o = new JSONObject(full().toJson());
        o.put("links", new JSONArray(Arrays.asList("not a link", "example.org")));
        o.put("labels", new JSONArray(Arrays.asList("bot", "fan")));
        o.put("languages", new JSONArray(Arrays.asList("und", "EN", 7)));
        o.put("regionCountries", new JSONObject().put("south asia", new JSONArray(Arrays.asList("India", "Japan")))
                .put("atlantis", new JSONArray(Collections.singletonList("India"))));
        o.put("minHandleDigits", 99);
        o.put("alwaysShow", new JSONArray(Arrays.asList("@Friend", "not a handle", "waytoolonghandle1")));
        FilterRules rules = FilterRules.fromJson(o.toString());
        assertEquals(Collections.singletonList("example.org"), rules.links);
        assertEquals(Collections.singleton("fan"), rules.labels);
        assertEquals(Collections.singleton("en"), rules.languages);
        assertEquals(Collections.singletonMap("south asia", Collections.singletonList("india")), rules.regionCountries);
        assertEquals(FilterRules.MAX_HANDLE_DIGITS, rules.minHandleDigits);
        assertTrue(rules.locationKeys.contains("germany"));
        assertEquals(Collections.singleton("friend"), rules.alwaysShow);
    }

    @Test
    public void unreadableJsonGivesNoFilters() {
        assertTrue(FilterRules.fromJson("{not json").isEmpty());
        assertTrue(FilterRules.fromJson(null).isEmpty());
    }

    @Test
    public void alwaysShowAloneFiltersNothing() {
        FilterRules.Builder b = new FilterRules.Builder();
        b.addAlwaysShow("xaitax");
        b.alwaysShowFollowing = true;
        FilterRules rules = b.build();
        assertTrue(rules.isEmpty());
        assertEquals(0, rules.size());
    }

    @Test
    public void locationsAreSavedOncePerCountryUnderTheirEnglishName() {
        FilterRules.Builder b = new FilterRules.Builder();
        assertTrue(b.addLocation("Macedonia"));
        assertFalse(b.addLocation("North Macedonia"));
        assertTrue(b.addLocation("Myanmar (Burma)"));
        assertEquals(Arrays.asList("North Macedonia", "Myanmar"), b.build().locations);
    }

    @Test
    public void removingARegionDropsItsCountries() {
        FilterRules.Builder b = full().toBuilder();
        b.removeLocation("south asia");
        FilterRules rules = b.build();
        assertFalse(rules.regionCountries.containsKey("south asia"));
        assertFalse(rules.coveredCountries.contains("india"));
    }

    @Test
    public void regionCountriesOnlyCoverWhileTheRegionIsFiltered() {
        FilterRules.Builder b = new FilterRules.Builder();
        b.setRegionCountries("South Asia", Collections.singletonList("India"));
        assertFalse(b.build().coveredCountries.contains("india"));
        b.addLocation("South Asia");
        assertTrue(b.build().coveredCountries.contains("india"));
    }

    @Test
    public void termsAreDeduplicatedByMeaning() {
        FilterRules.Builder b = new FilterRules.Builder();
        assertTrue(b.addBio("Airdrop"));
        assertFalse(b.addBio("  AIRDROP "));
        assertFalse(b.addBio("   "));
        b.removeBio("airdrop");
        assertTrue(b.build().isEmpty());
    }
}
