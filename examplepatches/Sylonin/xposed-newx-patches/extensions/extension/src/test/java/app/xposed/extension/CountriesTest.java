package app.xposed.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class CountriesTest {
    @Test
    public void everyRegionMemberIsAKnownCountryWithAFlag() {
        assertEquals(16, Countries.regions().size());
        for (Countries.Region region : Countries.regions()) {
            assertFalse(region.name, region.members.isEmpty());
            for (String member : region.members) {
                assertTrue(region.name + " member " + member, Countries.isKnownKey(member));
                assertNotNull(region.name + " member " + member, Countries.flagFor(member));
                assertTrue(member + " lists " + region.key, Countries.regionsOf(member).contains(region.key));
            }
        }
    }

    @Test
    public void aliasesAndSpellingsShareOneKey() {
        assertEquals(Countries.canonicalKey("North Macedonia"), Countries.canonicalKey("Macedonia"));
        assertEquals(Countries.canonicalKey("Turkey"), Countries.canonicalKey("T\u00fcrkiye"));
        assertEquals(Countries.canonicalKey("Ivory Coast"), Countries.canonicalKey("C\u00f4te d\u2019Ivoire"));
        assertEquals(Countries.canonicalKey("United States"), Countries.canonicalKey("  united   STATES "));
    }

    @Test
    public void platformCountryNamesMapToTheSameKey() {
        // The JDK calls Myanmar "Myanmar (Burma)", a spelling X-Posed's table doesn't have.
        assertEquals(Countries.canonicalKey("Myanmar"), Countries.canonicalKey("Myanmar (Burma)"));
    }

    @Test
    public void connectionSourcesNameTheLongestCountryAtTheStart() {
        assertEquals("switzerland", Countries.sourceCountry("Switzerland App Store"));
        assertEquals("united states", Countries.sourceCountry("United States Android App"));
        assertEquals(Countries.canonicalKey("Russia"), Countries.sourceCountry("Russian Federation App Store"));
        assertNull(Countries.sourceCountry("Web"));
        assertNull(Countries.sourceCountry("Android App"));
        assertNull(Countries.sourceCountry(null));
    }

    @Test
    public void regionsAndTheirCountries() {
        Countries.Region southAsia = Countries.region("South Asia");
        assertNotNull(southAsia);
        assertTrue(southAsia.members.contains(Countries.canonicalKey("India")));
        assertFalse(southAsia.members.contains(Countries.canonicalKey("Japan")));
        assertTrue(Countries.regionsOf(Countries.canonicalKey("India")).contains(southAsia.key));
        assertNull(Countries.region("India"));
        assertTrue(Countries.regionsOf("south asia").isEmpty());
    }

    @Test
    public void regionLabelsAreKnownEnglishSoTheyAreShared() {
        assertTrue(Countries.isKnownEnglish("South Asia"));
        assertTrue(Countries.isKnownEnglish("Macedonia"));
        assertFalse(Countries.isKnownEnglish("Atlantis"));
    }

    @Test
    public void displayNamesKeepAccents() {
        assertEquals("R\u00e9union", Countries.displayName(Countries.canonicalKey("Reunion")));
        assertEquals("Eastern Europe (Non-EU)", Countries.displayName(Countries.canonicalKey("eastern europe (non-eu)")));
    }

    @Test
    public void countryListHasNoRegionsAndNoAliases() {
        assertFalse(Countries.countryKeys().contains("south asia"));
        assertFalse(Countries.countryKeys().contains("macedonia"));
        assertTrue(Countries.countryKeys().contains(Countries.canonicalKey("North Macedonia")));
    }
}
