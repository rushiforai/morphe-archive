package app.template.extension.fotmob;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import org.junit.Test;

import app.template.extension.hevalcontrols.HevalSettings;
import app.template.extension.hevalcontrols.OptionIcons;

/** The "Hidden countries" picker flags: every seeded FIFA code has one, except the documented ANT. */
public class CountryIconsTest {
    /** Seed codes without a flag on purpose (see CountryIcons). */
    private static final Set<String> NO_FLAG = new HashSet<>(Arrays.asList("ANT"));

    @Test
    public void everySeedCodeHasAFlagOrIsADocumentedException() {
        List<String> missing = new ArrayList<>();
        for (String code : CountrySeeds.NAMES.keySet()) {
            String icon = CountryIcons.icon(code);
            if (NO_FLAG.contains(code)) {
                assertNull(code, icon);
            } else if (icon == null) {
                missing.add(code);
            }
        }
        assertTrue("No flag for " + missing, missing.isEmpty());
        assertEquals(219, CountrySeeds.NAMES.size()); // 217 codes plus INT and INT-2
    }

    @Test
    public void everyFlagIsARealRegion() {
        Set<String> iso = new HashSet<>(Arrays.asList(Locale.getISOCountries()));
        iso.add("XK");
        Set<String> special = new HashSet<>(Arrays.asList(
                OptionIcons.ENGLAND, OptionIcons.SCOTLAND, OptionIcons.WALES, OptionIcons.GLOBE, OptionIcons.TROPHY));
        for (String code : CountrySeeds.NAMES.keySet()) {
            String icon = CountryIcons.icon(code);
            if (icon == null || special.contains(icon)) continue;
            assertEquals(code, 4, icon.length());
            String region = new String(new char[] {
                    (char) ('A' + icon.codePointAt(0) - 0x1F1E6), (char) ('A' + icon.codePointAt(2) - 0x1F1E6)});
            assertTrue(code + " -> " + region, iso.contains(region));
        }
    }

    @Test
    public void fifaCodesThatAreNotIsoAlpha3() {
        assertEquals(OptionIcons.countryFlag("DE"), CountryIcons.icon("GER"));
        assertEquals(OptionIcons.countryFlag("NL"), CountryIcons.icon("NED"));
        assertEquals(OptionIcons.countryFlag("CH"), CountryIcons.icon("SUI"));
        assertEquals(OptionIcons.countryFlag("PT"), CountryIcons.icon("POR"));
        assertEquals(OptionIcons.countryFlag("HR"), CountryIcons.icon("CRO"));
        assertEquals(OptionIcons.countryFlag("DK"), CountryIcons.icon("DEN"));
        assertEquals(OptionIcons.countryFlag("ZA"), CountryIcons.icon("RSA"));
        assertEquals(OptionIcons.countryFlag("SA"), CountryIcons.icon("KSA"));
        assertEquals(OptionIcons.countryFlag("AE"), CountryIcons.icon("UAE"));
        assertEquals(OptionIcons.countryFlag("CL"), CountryIcons.icon("CHI"));
        assertEquals(OptionIcons.countryFlag("UY"), CountryIcons.icon("URU"));
        assertEquals(OptionIcons.countryFlag("PY"), CountryIcons.icon("PAR"));
        assertEquals(OptionIcons.countryFlag("DZ"), CountryIcons.icon("ALG"));
        assertEquals(OptionIcons.countryFlag("AO"), CountryIcons.icon("ANG"));
        assertEquals(OptionIcons.countryFlag("BG"), CountryIcons.icon("BUL"));
        assertEquals(OptionIcons.countryFlag("MC"), CountryIcons.icon("MON"));
        assertEquals(OptionIcons.countryFlag("WS"), CountryIcons.icon("SAM"));
        assertEquals(OptionIcons.countryFlag("NE"), CountryIcons.icon("NIG"));
        assertEquals(OptionIcons.countryFlag("NG"), CountryIcons.icon("NGA"));
        assertEquals(OptionIcons.countryFlag("ES"), CountryIcons.icon("ESP"));
        assertEquals(OptionIcons.countryFlag("ES"), CountryIcons.icon("esp"));
    }

    @Test
    public void specialCodes() {
        assertEquals(OptionIcons.ENGLAND, CountryIcons.icon("ENG"));
        assertEquals(OptionIcons.SCOTLAND, CountryIcons.icon("SCO"));
        assertEquals(OptionIcons.WALES, CountryIcons.icon("WAL"));
        assertEquals(OptionIcons.countryFlag("GB"), CountryIcons.icon("NIR"));
        assertEquals(OptionIcons.countryFlag("XK"), CountryIcons.icon("KVX"));
        assertEquals(OptionIcons.countryFlag("XK"), CountryIcons.icon("KOS"));
        assertEquals(OptionIcons.GLOBE, CountryIcons.icon(CountrySeeds.INTERNATIONAL));
        assertEquals(OptionIcons.TROPHY, CountryIcons.icon(CountrySeeds.INTERNATIONAL_CLUBS));
        assertNotNull(CountryIcons.INSTANCE.iconFor("FRA"));
        assertNull(CountryIcons.icon("ANT"));
        assertNull(CountryIcons.icon("XYZ"));
        assertNull(CountryIcons.icon(""));
        assertNull(CountryIcons.icon(null));
    }

    @Test
    public void countryCodesNameFotMobsImage() {
        String base = "https://images.fotmob.com/image_resources/logo/teamlogo/";
        assertEquals(base + "eng.png", CountryIcons.INSTANCE.imageUrlFor("ENG"));
        assertEquals(base + "ger.png", CountryIcons.imageUrl("GER"));
        assertEquals(base + "esp.png", CountryIcons.imageUrl("esp"));
        assertEquals(base + "ant.png", CountryIcons.imageUrl("ANT")); // an image even without an emoji
        assertNull(CountryIcons.imageUrl(CountrySeeds.INTERNATIONAL));
        assertNull(CountryIcons.imageUrl(CountrySeeds.INTERNATIONAL_CLUBS));
        assertNull(CountryIcons.imageUrl("int"));
        assertNull(CountryIcons.imageUrl("E"));
        assertNull(CountryIcons.imageUrl("ENGLA"));
        assertNull(CountryIcons.imageUrl("E/G"));
        assertNull(CountryIcons.imageUrl(""));
        assertNull(CountryIcons.imageUrl(null));
        // Every seeded country has one, through the picker's filter too.
        HevalSettings.setOptionIconProvider("test.flags", CountryIcons.INSTANCE);
        try {
            for (String code : CountrySeeds.NAMES.keySet()) {
                boolean country = !code.equals(CountrySeeds.INTERNATIONAL) && !code.equals(CountrySeeds.INTERNATIONAL_CLUBS);
                String url = HevalSettings.optionImageUrl("test.flags", code);
                if (country) assertEquals(code, base + code.toLowerCase(Locale.ROOT) + ".png", url);
                else assertNull(code, url);
            }
        } finally {
            HevalSettings.setOptionIconProvider("test.flags", null);
        }
    }
}
