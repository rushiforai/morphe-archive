package app.spicetify.extension.spotify.settings;

import android.app.Activity;
import android.app.Dialog;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.WindowInsets;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import app.spicetify.extension.spotify.theme.ThemeBackground;
import app.spicetify.extension.spotify.theme.ThemeBackgroundTest;
import app.spicetify.extension.spotify.theme.ThemePresets;
import app.spicetify.extension.spotify.theme.ThemeRoleMap;
import app.spicetify.extension.spotify.theme.ThemeRuntime;
import app.spicetify.extension.spotify.theme.ThemeState;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowDialog;
import org.robolectric.shadows.ShadowLooper;
import static org.junit.Assert.*;

// Android 13 takes the resource table, which works in Robolectric.
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33, manifest = Config.NONE, shadows = ThemeSettingsTest.Capabilities.class)
public class ThemeSettingsTest {
    @Implements(value = InstalledPatches.class, isInAndroidSdk = false)
    public static class Capabilities {
        @Implementation public static boolean themeColors() { return true; }
    }

    /** The role table the theme patch injects, cut down to the page background. */
    @Implements(value = ThemeRoleMap.class, isInAndroidSdk = false)
    public static class Patched {
        @Implementation protected static String encoded() { return "main:gray_7"; }
    }

    @Before public void initialize() {
        var application = RuntimeEnvironment.getApplication();
        application.deleteSharedPreferences("spicetify_patch_settings");
        application.deleteSharedPreferences("spicetify_theme");
        new File(application.getFilesDir(), "spicetify_background").delete();
        PatchSettings.initialize(application);
    }

    @Test public void parsesOpaqueAndTranslucentHex() {
        assertEquals(Integer.valueOf(0xFF112233), ThemeSettings.parse("#112233"));
        assertEquals(Integer.valueOf(0xFF112233), ThemeSettings.parse(" 112233 "));
        assertEquals(Integer.valueOf(0x80112233), ThemeSettings.parse("#80112233"));
        assertNull(ThemeSettings.parse("#1122"));
        assertNull(ThemeSettings.parse("green"));
    }

    @Test @Config(shadows = Patched.class)
    public void choosingAThemeAppliesItAndOffersARestart() {
        try (var controller = appearance()) {
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            assertNotNull(row(root, "Spotify, selected"));
            assertNotNull(row(root, "Material You"));
            assertNull(row(root, "Background, #121212"));
            assertEquals(View.GONE, restartBar(root).getVisibility());
            row(root, "Midnight").performClick();
            Dialog prompt = ShadowDialog.getLatestDialog();
            assertTrue(hasText(prompt.getWindow().getDecorView(), "Restart Spotify to finish applying Midnight?"));
            button(prompt, "Later").performClick();
            assertFalse(prompt.isShowing());
            assertEquals(View.VISIBLE, restartBar(root).getVisibility());
            assertEquals("midnight", ThemeState.load(controller.get()).kind);
            // Spicetify's own screens follow the theme.
            assertEquals(0xFF0B1026, SpotifyStyle.background());
            assertEquals(0xFF1C2340, SpotifyStyle.surface());
            assertEquals(0xFF509BF5, SpotifyStyle.accent());
            assertNotNull(row(root, "Midnight, selected"));
            // Tapping the theme in use changes nothing.
            row(root, "Midnight, selected").performClick();
            assertSame(prompt, ShadowDialog.getLatestDialog());
            row(root, "Spotify").performClick();
            assertEquals(ThemePresets.STOCK, ThemeState.load(controller.get()).kind);
            assertEquals(0xFF121212, SpotifyStyle.background());
            assertEquals(0xFF282828, SpotifyStyle.surface());
            assertEquals(0xFF1ED760, SpotifyStyle.accent());
        }
    }

    @Test @Config(shadows = Patched.class)
    public void customStartsFromTheCurrentThemeAndEditsOneColor() {
        try (var controller = appearance()) {
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            row(root, "Midnight").performClick();
            button(ShadowDialog.getLatestDialog(), "Later").performClick();
            row(root, "Custom").performClick();
            button(ShadowDialog.getLatestDialog(), "Later").performClick();
            ThemeState.Selection custom = ThemeState.load(controller.get());
            assertEquals(ThemeState.CUSTOM, custom.kind);
            assertEquals(Integer.valueOf(0xFF1C2340), custom.colors.get("card"));
            row(root, "Background, #0B1026").performClick();
            Dialog sheet = ShadowDialog.getLatestDialog();
            EditText hex = first(sheet.getWindow().getDecorView(), EditText.class);
            hex.setText("nope");
            button(sheet, "Save").performClick();
            assertTrue(sheet.isShowing());
            hex.setText("#000000");
            button(sheet, "Save").performClick();
            assertFalse(sheet.isShowing());
            custom = ThemeState.load(controller.get());
            assertEquals(Integer.valueOf(0xFF000000), custom.colors.get("main"));
            assertEquals(Integer.valueOf(0xFF1C2340), custom.colors.get("card"));
            assertEquals(Integer.valueOf(0xFF509BF5), custom.colors.get("button"));
            assertNotNull(row(root, "Surface, #1C2340"));
        }
    }

    @Test @Config(shadows = Patched.class)
    public void pastingAThemeAppliesItAndListsItAsTheThemeInUse() {
        try (var controller = appearance()) {
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            row(root, "Paste a Spicetify theme").performClick();
            Dialog sheet = ShadowDialog.getLatestDialog();
            assertFalse(shown(sheet.getWindow().getDecorView(), "Color scheme"));
            List<EditText> fields = all(sheet.getWindow().getDecorView(), EditText.class);
            fields.get(0).setText("[Mocha]\nmain = 1E1E2E\ncard = 313244\nbutton = 7F849C\nmauve = cba6f7\n");
            // One scheme needs no choice.
            assertFalse(shown(sheet.getWindow().getDecorView(), "Color scheme"));
            assertTrue(all(sheet.getWindow().getDecorView(), RadioButton.class).isEmpty());
            fields.get(1).setText("Mauve");
            button(sheet, "Apply").performClick();
            assertFalse(sheet.isShowing());
            Dialog prompt = ShadowDialog.getLatestDialog();
            assertTrue(hasText(prompt.getWindow().getDecorView(), "Restart Spotify to finish applying the pasted theme?"));
            button(prompt, "Later").performClick();
            assertEquals(View.VISIBLE, restartBar(root).getVisibility());
            ThemeState.Selection pasted = ThemeState.load(controller.get());
            assertEquals(ThemeState.SCHEME, pasted.kind);
            assertEquals("Pasted theme (mocha)", pasted.label);
            assertEquals(Integer.valueOf(0xFF1E1E2E), pasted.colors.get("main"));
            assertEquals(Integer.valueOf(0xFFCBA6F7), pasted.colors.get("button"));
            assertEquals(0xFF1E1E2E, SpotifyStyle.background());
            assertEquals(0xFF313244, SpotifyStyle.surface());
            assertEquals(0xFFCBA6F7, SpotifyStyle.accent());
            assertNotNull(row(root, "Pasted theme (mocha), selected"));
            assertNotNull(row(root, "Spotify"));
            assertFalse(hasTextContaining(root, "contrast"));
        }
    }

    @Test @Config(shadows = Patched.class)
    public void aFileWithTwoSchemesOffersAChoice() {
        try (var controller = appearance()) {
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            row(root, "Paste a Spicetify theme").performClick();
            Dialog sheet = ShadowDialog.getLatestDialog();
            View view = sheet.getWindow().getDecorView();
            EditText text = all(view, EditText.class).get(0);
            text.setText("[Mocha]\nmain = 1E1E2E\n\n[latte]\nmain = EFF1F5\ntext = 4C4F69\n");
            assertTrue(shown(view, "Color scheme"));
            List<RadioButton> schemes = all(view, RadioButton.class);
            assertEquals(2, schemes.size());
            assertEquals("mocha", schemes.get(0).getText().toString());
            assertEquals("latte", schemes.get(1).getText().toString());
            // Desktop Spicetify takes the first scheme unless one is chosen.
            assertTrue(schemes.get(0).isChecked());
            schemes.get(1).performClick();
            // Editing the file keeps the scheme chosen, as long as the file still has it.
            text.append("; edited\n");
            assertTrue(all(view, RadioButton.class).get(1).isChecked());
            text.setText("[dark]\nmain = 000000\n[light]\nmain = FFFFFF\n");
            assertTrue(all(view, RadioButton.class).get(0).isChecked());
            text.setText("[Mocha]\nmain = 1E1E2E\n\n[latte]\nmain = EFF1F5\ntext = 4C4F69\n");
            all(view, RadioButton.class).get(1).performClick();
            button(sheet, "Apply").performClick();
            assertFalse(sheet.isShowing());
            button(ShadowDialog.getLatestDialog(), "Later").performClick();
            ThemeState.Selection pasted = ThemeState.load(controller.get());
            assertEquals("Pasted theme (latte)", pasted.label);
            assertEquals(Integer.valueOf(0xFFEFF1F5), pasted.colors.get("main"));
            assertNotNull(row(root, "Pasted theme (latte), selected"));
            // Spotify keeps some text white, so a light scheme is applied with a warning on the page.
            assertTrue(hasTextContaining(root, "The background is light."));
        }
    }

    @Test @Config(shadows = Patched.class)
    public void theFirstSchemeAppliesUnlessAnotherIsChosen() {
        try (var controller = appearance()) {
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            row(root, "Paste a Spicetify theme").performClick();
            Dialog sheet = ShadowDialog.getLatestDialog();
            all(sheet.getWindow().getDecorView(), EditText.class).get(0)
                    .setText("[Mocha]\nmain = 1E1E2E\n\n[latte]\nmain = EFF1F5\n");
            button(sheet, "Apply").performClick();
            ThemeState.Selection pasted = ThemeState.load(controller.get());
            assertEquals("Pasted theme (mocha)", pasted.label);
            assertEquals(Integer.valueOf(0xFF1E1E2E), pasted.colors.get("main"));
        }
    }

    @Test @Config(qualifiers = "w360dp-h480dp", fontScale = 1.3f, shadows = Patched.class)
    public void onAShortScreenTheFieldsScrollAndApplyStaysOnTheSheet() {
        try (var controller = appearance()) {
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            row(root, "Paste a Spicetify theme").performClick();
            Dialog sheet = ShadowDialog.getLatestDialog();
            View window = sheet.getWindow().getDecorView();
            EditText text = all(window, EditText.class).get(0);
            text.setText("[a]\nmain = 000000\n[b]\nmain = 111111\n[c]\nmain = 222222\n[d]\nmain = 333333\n"
                    + "[e]\nmain = 444444\n[f]\nmain = 555555\n");
            ShadowLooper.idleMainLooper();
            ScrollView fields = ancestor(text, ScrollView.class);
            assertNotNull(fields);
            assertTrue(fields.getHeight() < fields.getChildAt(0).getHeight());
            Button apply = button(sheet, "Apply");
            int[] location = new int[2];
            apply.getLocationInWindow(location);
            assertTrue(apply.getHeight() > 0);
            assertTrue(location[1] + apply.getHeight() <= window.getHeight());
            // The sheet keeps above the keyboard, so Apply stays reachable while typing.
            assertNotEquals(0, sheet.getWindow().getAttributes().getFitInsetsTypes() & WindowInsets.Type.ime());
        }
    }

    @Test @Config(shadows = Patched.class)
    public void problemsShowInTheSheetAndKeepItOpen() {
        try (var controller = appearance()) {
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            row(root, "Paste a Spicetify theme").performClick();
            Dialog sheet = ShadowDialog.getLatestDialog();
            List<EditText> fields = all(sheet.getWindow().getDecorView(), EditText.class);
            EditText text = fields.get(0);
            EditText accent = fields.get(1);
            accent.requestFocus();
            button(sheet, "Apply").performClick();
            assertEquals("No color schemes found.", String.valueOf(text.getError()));
            // The field with the problem takes the focus, which is when Android shows its message.
            assertTrue(text.isFocused());
            // A new paste clears the error.
            text.setText(":root { --spice-main: var(--base); }");
            assertNull(text.getError());
            button(sheet, "Apply").performClick();
            assertEquals("--spice-main has unsupported color \"var(--base)\".", String.valueOf(text.getError()));
            text.setText("[mocha]\nmain = 1e1e2e\n");
            accent.setText("peach");
            button(sheet, "Apply").performClick();
            assertEquals("Accent key \"peach\" is not in this color scheme.", String.valueOf(accent.getError()));
            assertTrue(accent.isFocused());
            accent.setText("");
            text.setText("[turntable]\nmain = ${xrdb:color0}\n");
            button(sheet, "Apply").performClick();
            assertEquals("Pasted theme (turntable) has no colors Spotify can use.", String.valueOf(text.getError()));
            assertTrue(text.isFocused());
            // Only the current problem shows.
            assertNull(accent.getError());
            assertTrue(sheet.isShowing());
            assertSame(sheet, ShadowDialog.getLatestDialog());
            assertEquals(ThemePresets.STOCK, ThemeState.load(controller.get()).kind);
            assertEquals(View.GONE, restartBar(root).getVisibility());
        }
    }

    @Test @Config(shadows = Patched.class) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void whileAThemeHasAnImageItsBlurSwitchShowsAndAThemeWithoutOneClearsIt() {
        // The Marketplace applies a theme's image with its scheme.
        assertTrue(ThemeRuntime.select(RuntimeEnvironment.getApplication(), new ThemeState.Selection(ThemeState.SCHEME,
                "Galaxy V2 (base)", Collections.singletonMap("main", 0xFF000000)), ThemeBackgroundTest.png(8, 4)));
        try (var controller = appearance()) {
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            Switch blur = toggle(root, "Blur background image");
            assertNotNull(blur);
            assertFalse(blur.isChecked());
            assertEquals(View.GONE, restartBar(root).getVisibility());
            blur.performClick();
            assertTrue(ThemeBackground.blurEnabled(controller.get()));
            // Spotify draws the image again, blurred, when it restarts.
            assertEquals(View.VISIBLE, restartBar(root).getVisibility());

            row(root, "Midnight").performClick();
            button(ShadowDialog.getLatestDialog(), "Later").performClick();
            assertFalse(ThemeBackground.hasImage(controller.get()));
            assertNull(toggle(root, "Blur background image"));
        }
    }

    @Test @Config(shadows = Patched.class) public void withoutAnImageThereIsNoBlurSwitch() {
        try (var controller = appearance()) {
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            row(root, "Midnight").performClick();
            button(ShadowDialog.getLatestDialog(), "Later").performClick();
            assertNull(toggle(root, "Blur background image"));
        }
    }

    @Test public void aThemeThatCannotApplyIsNotSaved() {
        // Without the patch's role table, no theme can take effect.
        try (var controller = appearance()) {
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            row(root, "OLED").performClick();
            Dialog sheet = ShadowDialog.getLatestDialog();
            assertTrue(hasText(sheet.getWindow().getDecorView(), "Colors not applied"));
            assertEquals(ThemePresets.STOCK, ThemeState.load(controller.get()).kind);
            assertEquals(View.GONE, restartBar(root).getVisibility());
        }
    }

    @Test @Config(sdk = 30) public void materialYouNeedsAndroid12() {
        try (var controller = appearance()) {
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            assertNotNull(row(root, "OLED"));
            assertNull(row(root, "Material You"));
        }
    }

    @Test @Config(sdk = 29) public void androidTenKeepsSpotifysColorsWithANote() {
        try (var controller = appearance()) {
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            assertNull(row(root, "OLED"));
            assertNull(row(root, "Custom"));
            assertTrue(hasTextContaining(root, "Themes need Android 11 or later."));
        }
    }

    private org.robolectric.android.controller.ActivityController<Activity> appearance() {
        var controller = Robolectric.buildActivity(Activity.class).setup();
        SpicetifySettingsScreen.open(controller.get(), SpicetifySettingsScreen.PAGE_APPEARANCE);
        return controller;
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

    /** A switch row's switch, which carries the row's title. */
    private Switch toggle(View view, String title) {
        for (Switch toggle : all(view, Switch.class)) {
            if (toggle.getContentDescription() != null && toggle.getContentDescription().toString().startsWith(title + ". ")) return toggle;
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

    private <T extends View> T ancestor(View view, Class<T> kind) {
        for (Object parent = view.getParent(); parent != null; parent = ((ViewParent) parent).getParent()) {
            if (kind.isInstance(parent)) return kind.cast(parent);
        }
        return null;
    }

    private <T extends View> List<T> all(View view, Class<T> kind) {
        List<T> found = new ArrayList<>();
        if (kind.isInstance(view)) found.add(kind.cast(view));
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) found.addAll(all(group.getChildAt(i), kind));
        }
        return found;
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

    /** Whether a text is on screen: in a view that, with all its parents, is visible. */
    private boolean shown(View view, String text) {
        if (view instanceof TextView && text.contentEquals(((TextView) view).getText())) return view.isShown();
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) if (shown(group.getChildAt(i), text)) return true;
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
