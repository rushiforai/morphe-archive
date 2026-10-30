package app.hushmessenger.extension;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.TextView;
import java.util.List;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;

/** #115: a colors-only theme, pasted in settings as text, that Material You uses in place of the wallpaper's. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class ThemeFileTest {
    private static final String SUNSET = "{\"hushmessenger_theme\": 1, \"name\": \"Sunset\", \"accent\": \"#E1306C\", \"neutral\": \"#1A1418\", \"pure_black\": true}";

    @Before public void reset() {
        CrashGuard.resetForTests();
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().putBoolean(MaterialYouTheme.KEY, true).commit();
        OpenSections.all();
        org.robolectric.util.ReflectionHelpers.setStaticField(MaterialYouTheme.class, "bound", false);
        MaterialYouTheme.use(TonePalette.fallback());
        MaterialYouTheme.darkModeAnswer(true);
    }

    @After public void restore() {
        Settings.preferences.edit().clear().commit();
        MaterialYouTheme.use(TonePalette.fallback());
        CrashGuard.resetForTests();
    }

    private static void copy(String text) {
        RuntimeEnvironment.getApplication().getSystemService(ClipboardManager.class).setPrimaryClip(ClipData.newPlainText("theme", text));
    }

    private static String clipboard() {
        ClipData clip = RuntimeEnvironment.getApplication().getSystemService(ClipboardManager.class).getPrimaryClip();
        return clip.getItemAt(0).getText().toString();
    }

    private static void idle() {
        Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
    }

    @Test public void aThemeReadsItsNameColorsAndPureBlack() {
        ThemeFile theme = ThemeFile.parse(SUNSET);
        assertEquals("Sunset", theme.name);
        assertEquals(Integer.valueOf(0xFFE1306C), theme.accent);
        assertEquals(Integer.valueOf(0xFF1A1418), theme.neutral);
        assertEquals(Boolean.TRUE, theme.pureBlack);
    }

    @Test public void shortHexMissingHashesAndTextAroundTheThemeAllRead() {
        ThemeFile theme = ThemeFile.parse("Try this one:\n```json\n{\"accent\": \"f0a\", \"extra\": [1, 2], \"neutral\": \" #123456 \"}\n```");
        assertEquals(Integer.valueOf(0xFFFF00AA), theme.accent);
        assertEquals(Integer.valueOf(0xFF123456), theme.neutral);
        assertEquals("", theme.name);
        assertNull(theme.pureBlack);
        // Either color alone is a theme.
        assertNull(ThemeFile.parse("{\"accent\": \"#E1306C\"}").neutral);
        assertNull(ThemeFile.parse("{\"neutral\": \"#1A1418\", \"pure_black\": null}").accent);
        // A null version is a missing one, like every other null.
        assertEquals(Integer.valueOf(0xFFE1306C), ThemeFile.parse("{\"hushmessenger_theme\": null, \"accent\": \"#E1306C\"}").accent);
    }

    @Test public void textThatIsNotAThemeIsRefused() {
        StringBuilder huge = new StringBuilder("{\"accent\": \"#E1306C\", \"name\": \"");
        while (huge.length() <= ThemeFile.MAX_TEXT) huge.append('x');
        huge.append("\"}");
        for (String text : List.of("", "   ", "#E1306C", "{", "{\"accent\": }", "{}", "{\"name\": \"Only a name\"}",
                "{\"accent\": \"#E1306\"}", "{\"accent\": \"#E1306C80\"}", "{\"accent\": \"red\"}", "{\"accent\": 14757996}",
                "{\"accent\": \"#E1306C\", \"neutral\": \"grey\"}", "{\"accent\": \"#E1306C\", \"pure_black\": \"yes\"}",
                "{\"hushmessenger_theme\": 2, \"accent\": \"#E1306C\"}", "{\"hushmessenger_theme\": \"1\", \"accent\": \"#E1306C\"}",
                huge.toString())) {
            try {
                ThemeFile.parse(text);
                fail("read " + text);
            } catch (IllegalArgumentException expected) {
                // refused
            }
        }
        try {
            ThemeFile.parse(null);
            fail("read null");
        } catch (IllegalArgumentException expected) {
            // refused
        }
    }

    @Test public void theNameLosesControlCharactersAndStopsAtFortyCharacters() throws Exception {
        String controls = new JSONObject().put("name", "  Sun" + (char) 0 + " set\n ").put("accent", "#E1306C").toString();
        assertEquals("Sun set", ThemeFile.parse(controls).name);
        // Forty emoji are eighty chars; none is cut in half.
        String sunrise = new String(Character.toChars(0x1F305));
        String kept = ThemeFile.parse("{\"name\": \"" + sunrise.repeat(45) + "\", \"accent\": \"#E1306C\"}").name;
        assertEquals(sunrise.repeat(40), kept);
        assertEquals("", ThemeFile.parse("{\"name\": 7, \"accent\": \"#E1306C\"}").name);
        // Bidi overrides and isolates and line separators go; the joiner inside a family emoji stays.
        String flipped = "Sun" + (char) 0x202E + "set" + (char) 0x2069 + (char) 0x2028 + "!" + (char) 0x2029;
        assertEquals("Sunset!", ThemeFile.parse(new JSONObject().put("name", flipped).put("accent", "#E1306C").toString()).name);
        String family = new String(Character.toChars(0x1F468)) + (char) 0x200D + new String(Character.toChars(0x1F469));
        assertEquals(family, ThemeFile.parse(new JSONObject().put("name", family).put("accent", "#E1306C").toString()).name);
    }

    @Test public void encodeWritesTheVersionAndOnlyWhatTheThemeHas() throws Exception {
        ThemeFile theme = ThemeFile.parse(SUNSET);
        JSONObject json = new JSONObject(theme.encode());
        assertEquals(1, json.getInt(ThemeFile.VERSION_KEY));
        assertEquals("Sunset", json.getString("name"));
        assertEquals("#E1306C", json.getString("accent"));
        assertEquals("#1A1418", json.getString("neutral"));
        assertTrue(json.getBoolean("pure_black"));
        assertTrue(theme.encode().startsWith("{\"hushmessenger_theme\":1,"));
        JSONObject bare = new JSONObject(ThemeFile.parse("{\"accent\": \"#abc\"}").encode());
        assertEquals(2, bare.length());
        assertEquals("#AABBCC", bare.getString("accent"));
        // What encode writes reads back the same.
        ThemeFile again = ThemeFile.parse(theme.encode());
        assertEquals(theme.name, again.name);
        assertEquals(theme.accent, again.accent);
        assertEquals(theme.neutral, again.neutral);
        assertEquals(theme.pureBlack, again.pureBlack);
    }

    @Test public void aSavedThemeIsTheMaterialYouPalette() {
        MaterialYouTheme.bind();
        int wallpaper = MaterialYouTheme.DARK_333334;
        Settings.preferences.edit().putString(ThemeFile.KEY, ThemeFile.parse(SUNSET).encode()).commit();
        idle();
        TonePalette sunset = TonePalette.fromSeeds(0xFFE1306C, 0xFF1A1418);
        assertEquals(sunset.sameLightness(TonePalette.NEUTRAL, 0xFF333334), MaterialYouTheme.DARK_333334);
        assertNotEquals(wallpaper, MaterialYouTheme.DARK_333334);
        // Messenger's blue turns to the theme's pink at the same lightness.
        int blue = MaterialYouTheme.fds(0xFF0866FF);
        assertEquals(sunset.sameLightness(TonePalette.ACCENT, 0xFF0866FF), blue);
        assertTrue("red over blue", ((blue >> 16) & 0xFF) > (blue & 0xFF));

        Settings.preferences.edit().remove(ThemeFile.KEY).commit();
        idle();
        assertEquals(wallpaper, MaterialYouTheme.DARK_333334);
    }

    @Test public void aThemeSavedBeforeTheFirstColorIsUsedFromTheStart() {
        Settings.preferences.edit().putString(ThemeFile.KEY, "{\"accent\": \"#E1306C\"}").commit();
        MaterialYouTheme.bind();
        assertEquals(TonePalette.fromAccent(0xFFE1306C).sameLightness(TonePalette.NEUTRAL, 0xFF333334), MaterialYouTheme.DARK_333334);
        // A saved value that no longer reads leaves the wallpaper's colors.
        Settings.preferences.edit().putString(ThemeFile.KEY, "{\"accent\": \"pink\"}").commit();
        idle();
        assertNull(ThemeFile.saved());
        assertEquals(TonePalette.of(RuntimeEnvironment.getApplication()).sameLightness(TonePalette.NEUTRAL, 0xFF333334), MaterialYouTheme.DARK_333334);
    }

    @Test public void aNeutralAloneKeepsMessengersBlueAccent() {
        TonePalette palette = ThemeFile.parse("{\"neutral\": \"#1A1418\"}").palette();
        assertEquals(TonePalette.fromSeeds(ThemeFile.MESSENGER_BLUE, 0xFF1A1418).tone(TonePalette.ACCENT, 40), palette.tone(TonePalette.ACCENT, 40));
    }

    @Test public void settingsPasteCopyAndDropATheme() throws Exception {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            TextView status = root.findViewWithTag("theme_status");
            assertEquals("Material You takes its colors from your wallpaper. Paste a theme to pick your own.", status.getText().toString());
            assertEquals(View.GONE, root.findViewWithTag("theme_clear").getVisibility());

            copy("not a theme");
            root.findViewWithTag("theme_paste").performClick();
            assertEquals("That isn't a theme. Your colors didn't change.", ShadowToast.getTextOfLatestToast());
            assertNull(Settings.preferences.getString(ThemeFile.KEY, null));

            copy("  ");
            root.findViewWithTag("theme_paste").performClick();
            assertEquals("Nothing to paste. Copy a theme first.", ShadowToast.getTextOfLatestToast());

            copy(SUNSET);
            root.findViewWithTag("theme_paste").performClick();
            assertEquals("Theme saved", ShadowToast.getTextOfLatestToast());
            assertEquals("Your Sunset theme is saved. It colors dark mode while Material You is on.", status.getText().toString());
            assertEquals(View.VISIBLE, root.findViewWithTag("theme_clear").getVisibility());
            // The pure black choice sets its switch and isn't kept with the colors.
            assertTrue(Settings.preferences.getBoolean(MaterialYouTheme.BLACK_KEY, false));
            assertTrue(((CompoundButton) root.findViewWithTag(MaterialYouTheme.BLACK_KEY)).isChecked());
            assertFalse(new JSONObject(Settings.preferences.getString(ThemeFile.KEY, "")).has("pure_black"));

            // Copy gives the saved colors with the switch as it is now.
            ((CompoundButton) root.findViewWithTag(MaterialYouTheme.BLACK_KEY)).setChecked(false);
            root.findViewWithTag("theme_copy").performClick();
            JSONObject copied = new JSONObject(clipboard());
            assertEquals("Sunset", copied.getString("name"));
            assertEquals("#E1306C", copied.getString("accent"));
            assertEquals("#1A1418", copied.getString("neutral"));
            assertFalse(copied.getBoolean("pure_black"));

            root.findViewWithTag("theme_clear").performClick();
            assertEquals("Back to your wallpaper colors", ShadowToast.getTextOfLatestToast());
            assertNull(Settings.preferences.getString(ThemeFile.KEY, null));
            assertEquals(View.GONE, root.findViewWithTag("theme_clear").getVisibility());
            assertTrue(status.getText().toString().startsWith("Material You takes its colors"));

            // With no theme saved, Copy gives the colors in use as a theme that reads back.
            root.findViewWithTag("theme_copy").performClick();
            ThemeFile wallpaper = ThemeFile.parse(clipboard());
            assertEquals("", wallpaper.name);
            assertEquals(Integer.valueOf(MaterialYouTheme.palette().tone(TonePalette.ACCENT, 40)), wallpaper.accent);
            assertEquals(Integer.valueOf(MaterialYouTheme.palette().tone(TonePalette.NEUTRAL, 50)), wallpaper.neutral);

            // A theme without a name still says it's saved.
            copy("{\"accent\": \"#E1306C\"}");
            root.findViewWithTag("theme_paste").performClick();
            assertEquals("Your theme is saved. It colors dark mode while Material You is on.", status.getText().toString());
        }
    }
}
