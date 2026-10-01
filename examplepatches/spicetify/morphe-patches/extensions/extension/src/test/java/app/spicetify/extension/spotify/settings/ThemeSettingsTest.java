package app.spicetify.extension.spotify.settings;

import android.app.Dialog;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowDialog;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE, shadows = ThemeSettingsTest.Capabilities.class)
public class ThemeSettingsTest {
    @Implements(value = InstalledPatches.class, isInAndroidSdk = false)
    public static class Capabilities {
        @Implementation public static boolean themeColors() { return true; }
    }

    @Before public void initialize() {
        var application = RuntimeEnvironment.getApplication();
        application.deleteSharedPreferences("spicetify_patch_settings");
        PatchSettings.initialize(application);
    }

    @Test public void parsesOpaqueAndTranslucentHex() {
        assertEquals(Integer.valueOf(0xFF112233), ThemeSettings.parse("#112233"));
        assertEquals(Integer.valueOf(0xFF112233), ThemeSettings.parse(" 112233 "));
        assertEquals(Integer.valueOf(0x80112233), ThemeSettings.parse("#80112233"));
        assertNull(ThemeSettings.parse("#1122"));
        assertNull(ThemeSettings.parse("green"));
    }

    @Test public void choosingAThemeSavesItsColorsAndSpotifyClearsThem() {
        try (var controller = appearance()) {
            View root = controller.get().getWindow().getDecorView();
            assertNotNull(row(root, "Spotify, selected"));
            assertNull(row(root, "Background, #121212"));
            assertEquals(View.GONE, restartBar(root).getVisibility());
            row(root, "OLED").performClick();
            Dialog prompt = ShadowDialog.getLatestDialog();
            assertTrue(hasText(prompt.getWindow().getDecorView(), "Restart Spotify to apply OLED?"));
            button(prompt, "Later").performClick();
            assertFalse(prompt.isShowing());
            assertEquals(View.VISIBLE, restartBar(root).getVisibility());
            assertEquals("oled", PatchSettings.themePreset());
            assertEquals(Integer.valueOf(0xFF000000), PatchSettings.themeBackground());
            assertEquals(Integer.valueOf(0xFF121212), PatchSettings.themeSurface());
            assertEquals(Integer.valueOf(0xFF1ED760), PatchSettings.themeAccent());
            assertNotNull(row(root, "OLED, selected"));
            row(root, "Spotify").performClick();
            assertNull(PatchSettings.themePreset());
            assertNull(PatchSettings.themeBackground());
            assertNull(PatchSettings.themeSurface());
            assertNull(PatchSettings.themeAccent());
        }
    }

    @Test public void customStartsFromTheCurrentThemeAndEditsOneColor() {
        try (var controller = appearance()) {
            View root = controller.get().getWindow().getDecorView();
            row(root, "OLED").performClick();
            row(root, "Custom").performClick();
            assertEquals(ThemeSettings.CUSTOM, PatchSettings.themePreset());
            row(root, "Background, #000000").performClick();
            Dialog sheet = ShadowDialog.getLatestDialog();
            EditText hex = first(sheet.getWindow().getDecorView(), EditText.class);
            hex.setText("nope");
            button(sheet, "Save").performClick();
            assertTrue(sheet.isShowing());
            hex.setText("#0B1026");
            button(sheet, "Save").performClick();
            assertFalse(sheet.isShowing());
            assertEquals(Integer.valueOf(0xFF0B1026), PatchSettings.themeBackground());
            assertEquals(Integer.valueOf(0xFF121212), PatchSettings.themeSurface());
            assertEquals(ThemeSettings.CUSTOM, PatchSettings.themePreset());
            assertNotNull(row(root, "Surface, #121212"));
        }
    }

    @Test public void colorsSavedWithoutAThemeNameCountAsCustom() {
        RuntimeEnvironment.getApplication().getSharedPreferences("spicetify_patch_settings", 0).edit()
                .putInt("theme_background", 0xFF0B1026).commit();
        assertEquals(ThemeSettings.CUSTOM, PatchSettings.themePreset());
        try (var controller = appearance()) {
            assertNotNull(row(controller.get().getWindow().getDecorView(), "Custom, selected"));
        }
    }

    @Test @Config(sdk = 29) public void androidTenOffersThemesWithANote() {
        try (var controller = appearance()) {
            View root = controller.get().getWindow().getDecorView();
            assertNotNull(row(root, "OLED"));
            assertTrue(hasTextContaining(root, "fewer screens change"));
        }
    }

    private org.robolectric.android.controller.ActivityController<SpicetifySettingsActivity> appearance() {
        return Robolectric.buildActivity(SpicetifySettingsActivity.class,
                SpicetifySettingsActivity.page(RuntimeEnvironment.getApplication(), SpicetifySettingsActivity.PAGE_APPEARANCE)).setup();
    }

    private View restartBar(View root) {
        Button restart = find(root, "Restart");
        assertNotNull(restart);
        return (View) restart.getParent().getParent();
    }

    private View row(View view, String description) {
        if (view.isClickable() && view.getContentDescription() != null && description.contentEquals(view.getContentDescription())) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = row(group.getChildAt(i), description);
                if (found != null) return found;
            }
        }
        return null;
    }

    private Button button(Dialog dialog, String label) {
        Button found = find(dialog.getWindow().getDecorView(), label);
        if (found == null) throw new AssertionError("Missing button: " + label);
        return found;
    }

    private Button find(View view, String label) {
        if (view instanceof Button && label.contentEquals(((Button) view).getText())) return (Button) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                Button found = find(group.getChildAt(i), label);
                if (found != null) return found;
            }
        }
        return null;
    }

    private <T extends View> T first(View view, Class<T> kind) {
        if (kind.isInstance(view)) return kind.cast(view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                T found = first(group.getChildAt(i), kind);
                if (found != null) return found;
            }
        }
        return null;
    }

    private boolean hasTextContaining(View view, String text) {
        if (view instanceof TextView && ((TextView) view).getText().toString().contains(text)) return true;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) if (hasTextContaining(group.getChildAt(i), text)) return true;
        }
        return false;
    }

    private boolean hasText(View view, String text) {
        if (view instanceof TextView && text.contentEquals(((TextView) view).getText())) return true;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) if (hasText(group.getChildAt(i), text)) return true;
        }
        return false;
    }
}
