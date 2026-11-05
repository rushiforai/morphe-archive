package app.template.extension.sofascore;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

import app.template.extension.hevalcontrols.HevalSettings;
import app.template.extension.hevalcontrols.OptionIcons;

/** The "Hidden countries" picker flags for Sofascore's alpha2 and slug keys. */
public class CountryIconsTest {
    @Test
    public void isoCodesGetTheirRegionalIndicators() {
        assertEquals("🇪🇸", CountryIcons.icon("ES"));
        assertEquals(OptionIcons.countryFlag("DE"), CountryIcons.icon("DE"));
        assertEquals(OptionIcons.countryFlag("XK"), CountryIcons.icon("XK"));
        assertNull(CountryIcons.icon("E"));
        assertNull(CountryIcons.icon("ESP"));
        assertNull(CountryIcons.icon("E1"));
        assertNull(CountryIcons.icon(""));
        assertNull(CountryIcons.icon(null));
    }

    @Test
    public void sofascoresOwnCodes() {
        assertEquals(OptionIcons.ENGLAND, CountryIcons.icon("EN"));
        assertEquals(OptionIcons.SCOTLAND, CountryIcons.icon("SX"));   // ISO SX is Sint Maarten
        assertEquals(OptionIcons.WALES, CountryIcons.icon("WA"));
        assertEquals(OptionIcons.countryFlag("GB"), CountryIcons.icon("NX"));
        assertEquals(OptionIcons.countryFlag("TV"), CountryIcons.icon("TU")); // Tuvalu
        assertEquals(OptionIcons.countryFlag("SX"), CountryIcons.icon("SW")); // Sint Maarten
    }

    @Test
    public void slugGroups() {
        assertEquals(OptionIcons.GLOBE_EUROPE_AFRICA, CountryIcons.icon("slug:world"));
        assertEquals(OptionIcons.countryFlag("EU"), CountryIcons.icon("slug:europe"));
        assertEquals(OptionIcons.GLOBE, CountryIcons.icon("slug:international"));
        assertEquals(OptionIcons.GLOBE_EUROPE_AFRICA, CountryIcons.icon("slug:africa"));
        assertEquals(OptionIcons.GLOBE_ASIA_AUSTRALIA, CountryIcons.icon("slug:asia"));
        assertEquals(OptionIcons.GLOBE_ASIA_AUSTRALIA, CountryIcons.icon("slug:oceania"));
        assertEquals(OptionIcons.GLOBE_AMERICAS, CountryIcons.icon("slug:south-america"));
        assertEquals(OptionIcons.GLOBE_AMERICAS, CountryIcons.icon("slug:north-america"));
        assertEquals(OptionIcons.GLOBE_AMERICAS, CountryIcons.icon("slug:north-central-america"));
        assertEquals(OptionIcons.countryFlag("EU"), CountryIcons.icon("slug:europe-amateur"));
        assertEquals(OptionIcons.GLOBE, CountryIcons.icon("slug:women"));
        assertEquals(OptionIcons.GLOBE, CountryIcons.icon("slug:international-youth"));
        assertNull(CountryIcons.icon("slug:atp"));
        assertNull(CountryIcons.icon("slug:"));
    }

    @Test
    public void alpha2KeysNameSofascoresFlagImage() {
        assertEquals("https://img.sofascore.com/api/v1/country/EN/flag", CountryIcons.INSTANCE.imageUrlFor("EN"));
        assertEquals("https://img.sofascore.com/api/v1/country/ES/flag", CountryIcons.imageUrl("ES"));
        assertEquals("https://img.sofascore.com/api/v1/country/SX/flag", CountryIcons.imageUrl("SX")); // Scotland here
        assertEquals("https://img.sofascore.com/api/v1/country/XK/flag", CountryIcons.imageUrl("xk"));
        assertNull(CountryIcons.imageUrl("slug:world"));
        assertNull(CountryIcons.imageUrl("slug:atp"));
        assertNull(CountryIcons.imageUrl("ESP"));
        assertNull(CountryIcons.imageUrl("E1"));
        assertNull(CountryIcons.imageUrl("E"));
        assertNull(CountryIcons.imageUrl(""));
        assertNull(CountryIcons.imageUrl(null));
    }

    @Test
    public void theImageUrlPassesThePickersFilter() {
        HevalSettings.setOptionIconProvider("test.flags", CountryIcons.INSTANCE);
        try {
            assertEquals("https://img.sofascore.com/api/v1/country/DE/flag", HevalSettings.optionImageUrl("test.flags", "DE"));
            assertNull(HevalSettings.optionImageUrl("test.flags", "slug:europe"));
        } finally {
            HevalSettings.setOptionIconProvider("test.flags", null);
        }
    }
}
