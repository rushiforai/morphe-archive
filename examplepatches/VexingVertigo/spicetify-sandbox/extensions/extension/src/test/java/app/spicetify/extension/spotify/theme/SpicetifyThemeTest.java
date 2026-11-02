package app.spicetify.extension.spotify.theme;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import org.junit.Test;

public class SpicetifyThemeTest {
    private static final String CATPPUCCIN = "; Catppuccin-style file\n"
            + "[Mocha]\n"
            + "text               = cdd6f4\n"
            + "MAIN               = 1E1E2E   ; key names are case-insensitive\n"
            + "button: 7F849C\n"
            + "mauve              = #cba6f7\n"
            + "empty              =\n"
            + "\n"
            + "[latte]\n"
            + "main = eff1f5\n";

    @Test
    public void readsSectionsKeysAndValuesLikeTheSpicetifyCli() {
        List<SpicetifyTheme.Scheme> schemes = SpicetifyTheme.parse(CATPPUCCIN);
        assertEquals("mocha", schemes.get(0).name);
        assertEquals("latte", schemes.get(1).name);
        Map<String, Integer> mocha = schemes.get(0).colors;
        assertEquals(Integer.valueOf(0xFFCDD6F4), mocha.get("text"));
        assertEquals(Integer.valueOf(0xFF1E1E2E), mocha.get("main"));
        assertEquals(Integer.valueOf(0xFF7F849C), mocha.get("button"));
        assertEquals(Integer.valueOf(0xFFCBA6F7), mocha.get("mauve"));
        assertFalse(mocha.containsKey("empty"));
    }

    @Test
    public void skipsKeysBeforeTheFirstSection() {
        assertEquals(new HashSet<>(Arrays.asList("text")),
                SpicetifyTheme.parse("main = 000000\n[dark]\ntext = ffffff").get(0).colors.keySet());
    }

    @Test
    public void readsEightDigitsLikeTheCli() {
        assertEquals(Integer.valueOf(0x80FFFFFF), SpicetifyTheme.parse("[a]\nshadow = #80FFFFFF").get(0).colors.get("shadow"));
        // The CLI keeps the first six digits of a bare run and drops the rest.
        assertEquals(Integer.valueOf(0xFF80FFFF), SpicetifyTheme.parse("[a]\nshadow = 80FFFFFF").get(0).colors.get("shadow"));
        assertEquals(Integer.valueOf(0xFF000000), SpicetifyTheme.parse("[a]\nmain = 00000000").get(0).colors.get("main"));
    }

    @Test
    public void readsDecimalsIgnoringSpacesAroundChannels() {
        // The CLI doesn't trim channels, so it reads " 80" as 255; trimming keeps the color the author meant.
        assertEquals(Integer.valueOf(0xFF325078), SpicetifyTheme.parse("[a]\nmain = 50, 80,120").get(0).colors.get("main"));
    }

    @Test
    public void skipsValuesThePhoneCantUse() {
        // ${BACKGROUND} would read as #BBAACC from its first hex digits; the desktop reads it from the environment.
        for (String value : new String[] {"${xrdb:color0}", "${HOME}", "${BACKGROUND}", "red", "#12345", "rgb(1,2,3)", "fe", "300,0,0"}) {
            Map<String, Integer> colors = SpicetifyTheme.parse("[a]\nmain = " + value + "\ntext = ffffff").get(0).colors;
            assertEquals(value, Collections.singletonMap("text", 0xFFFFFFFF), colors);
        }
    }

    @Test
    public void endsValuesAtCommentsLikeGoIni() {
        Map<String, Integer> colors = SpicetifyTheme.parse("[a]\n"
                + "text = FFFFFF; Main field text; playlist names\n"
                + "dark-border = 1D1D1D;\n"
                + "main = 121212 #dark\n"
                + "player = 24,24,24; decimals\n"
                + "card = 30,30,46 # note\n"
                + "button = #1db954").get(0).colors;
        assertEquals(Integer.valueOf(0xFFFFFFFF), colors.get("text"));
        assertEquals(Integer.valueOf(0xFF1D1D1D), colors.get("dark-border"));
        assertEquals(Integer.valueOf(0xFF121212), colors.get("main"));
        assertEquals(Integer.valueOf(0xFF181818), colors.get("player"));
        assertEquals(Integer.valueOf(0xFF1E1E2E), colors.get("card"));
        assertEquals(Integer.valueOf(0xFF1DB954), colors.get("button"));
    }

    @Test
    public void skipsLinesWithoutADelimiterButNeedsASection() {
        assertEquals(Collections.singletonMap("main", 0xFF000000),
                SpicetifyTheme.parse("[a]\njust text\n; text = ffffff\n# card: 282828\nmain = 000000").get(0).colors);
        failsWith("; nothing here", "No color schemes found");
    }

    @Test
    public void skipsEmptyOrUnclosedSections() {
        List<SpicetifyTheme.Scheme> schemes = SpicetifyTheme.parse("[]\nmain = 000000\n[a\ntext = fff\n[b]\ntext = 000");
        assertEquals(1, schemes.size());
        assertEquals("b", schemes.get(0).name);
        assertEquals(Collections.singletonMap("text", 0xFF000000), schemes.get(0).colors);
    }

    @Test
    public void skipsALeadingByteOrderMarkLikeGoIni() {
        List<SpicetifyTheme.Scheme> schemes = SpicetifyTheme.parse("\ufeff[Dark]\nmain = 000000");
        assertEquals("dark", schemes.get(0).name);
        assertEquals(Collections.singletonMap("main", 0xFF000000), schemes.get(0).colors);
    }

    @Test
    public void endsASectionNameAtTheLastBracketLikeGoIni() {
        List<SpicetifyTheme.Scheme> schemes = SpicetifyTheme.parse("[Dark] ; note\nmain = 000000\n[a]b] extra\ntext = fff");
        assertEquals("dark", schemes.get(0).name);
        assertEquals(Collections.singletonMap("main", 0xFF000000), schemes.get(0).colors);
        assertEquals("a]b", schemes.get(1).name);
    }

    @Test
    public void keepsSchemesWhoseKeysWereAllSkipped() {
        List<SpicetifyTheme.Scheme> schemes = SpicetifyTheme.parse("[xrdb]\nmain = ${xrdb:color0}\n[dark]\nmain = 000");
        assertEquals(2, schemes.size());
        assertTrue(schemes.get(0).colors.isEmpty());
    }

    @Test
    public void readsSpiceVariablesFromCss() {
        List<SpicetifyTheme.Scheme> schemes = SpicetifyTheme.parse(":root {\n"
                + "  --spice-main: #121212;\n"
                + "  --spice-rgb-main: 18,18,18;\n"
                + "  --spice-button: rgb(30, 215, 96);\n"
                + "  --spice-shadow: rgba(0, 0, 0, 0.5);\n"
                + "  --spice-card: #28282880;\n"
                + "}\n.main-view { color: red; }");
        Map<String, Integer> colors = schemes.get(0).colors;
        assertEquals(1, schemes.size());
        assertEquals(Integer.valueOf(0xFF121212), colors.get("main"));
        assertEquals(Integer.valueOf(0xFF1ED760), colors.get("button"));
        assertEquals(Integer.valueOf(0x80000000), colors.get("shadow"));
        assertEquals(Integer.valueOf(0x80282828), colors.get("card"));
        assertEquals(4, colors.size());
    }

    @Test
    public void rejectsCssWithUnsupportedValues() {
        failsWith(":root { --spice-main: var(--x); }", "--spice-main");
        failsWith(":root { --spice-shadow: rgba(0, 0, 0, 1.2.3); }", "--spice-shadow");
        failsWith(":root { --spice-shadow: rgba(0, 0, 0, 2); }", "--spice-shadow");
    }

    private static void failsWith(String text, String messageStart) {
        try {
            SpicetifyTheme.parse(text);
            fail("Expected a ThemeException for: " + text);
        } catch (ThemeException expected) {
            assertTrue(expected.getMessage(), expected.getMessage().startsWith(messageStart)
                    || expected.getMessage().contains(messageStart));
        }
    }
}
