package app.hushmessenger.extension;

import android.content.SharedPreferences;
import android.view.View;
import android.widget.Switch;
import android.widget.TextView;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class QuickSetupsTest {
    @Before public void reset() {
        CrashGuard.resetForTests();
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        OpenSections.all();
        forgetHeldAnswers();
    }

    @After public void forgetHeldAnswers() {
        Settings.metaAiTab = null;
        Settings.oldEmojiDrawer = null;
        Settings.customFont = null;
        Settings.bottomTabs.clear();
    }

    private static Set<String> controls() {
        Set<String> keys = new HashSet<>();
        for (String[] spec : SettingsActivity.CONTROLS) keys.add(spec[0]);
        return keys;
    }

    @Test public void everyChoiceNamesOnlyControlsAndHasItsText() {
        SettingsText text = new SettingsText(Locale.US);
        for (String name : QuickSetups.CHOICES) {
            Map<String, Boolean> values = QuickSetups.values(name);
            assertFalse(name, values.isEmpty());
            assertTrue(name, controls().containsAll(values.keySet()));
            assertFalse(text.get("quick_" + name).isEmpty());
            assertFalse(text.get("quick_" + name + "_help").isEmpty());
        }
        assertEquals(QuickSetups.QUIET.size(), new HashSet<>(QuickSetups.QUIET).size());
        assertEquals(QuickSetups.PRIVACY.size(), new HashSet<>(QuickSetups.PRIVACY).size());
        assertFalse(QuickSetups.values("quiet").containsValue(false));
        assertFalse(QuickSetups.values("privacy").containsValue(false));
        // Back to defaults is every control, off: no control is on until someone turns it on.
        assertEquals(controls(), QuickSetups.values("defaults").keySet());
        assertFalse(QuickSetups.values("defaults").containsValue(true));
        assertThrows(IllegalArgumentException.class, () -> QuickSetups.values("loud"));
    }

    @Test public void nothingThatChangesWhatOtherPeopleSeeIsInQuietOrPrivacy() {
        for (String key : List.of("typing", "hide_read_receipts", "anonymous_stories", "keep_unsent", "message_log", "auto_reply", "stories", "meta_ai")) {
            assertFalse(key, QuickSetups.QUIET.contains(key));
            assertFalse(key, QuickSetups.PRIVACY.contains(key));
        }
    }

    @Test public void onlyControlsItMaySetAndThatAreSavedAsSomethingElseChange() {
        SharedPreferences prefs = Settings.preferences;
        prefs.edit().putBoolean("growth", true).commit();
        Map<String, Boolean> changes = QuickSetups.changes(QuickSetups.values("quiet"), prefs, key -> !"people".equals(key));
        assertFalse(changes.containsKey("growth"));
        assertFalse(changes.containsKey("people"));
        assertEquals(QuickSetups.QUIET.size() - 2, changes.size());
        assertFalse(changes.containsValue(false));
    }

    @Test public void aChoiceSavesItsControlsInOneTapAndSaysHowManyChanged() {
        Settings.preferences.edit().putBoolean("analytics_uploads", true).putBoolean("paused", true).putBoolean("typing", true).commit();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            assertTrue(root.findViewWithTag("quick_setups").isShown());
            root.findViewWithTag("quick_privacy").performClick();
            assertEquals("Changed 3 controls", ShadowToast.getTextOfLatestToast());
            for (String key : QuickSetups.PRIVACY) {
                assertTrue(key, Settings.preferences.getBoolean(key, false));
                assertTrue(key, ((Switch) root.findViewWithTag(key)).isChecked());
            }
            root.findViewWithTag("quick_privacy").performClick();
            assertEquals("Nothing to change. Those controls were already set.", ShadowToast.getTextOfLatestToast());
            root.findViewWithTag("quick_defaults").performClick();
            assertEquals("Changed 5 controls", ShadowToast.getTextOfLatestToast());
            for (String key : controls()) assertFalse(key, Settings.preferences.getBoolean(key, false));
            // Pause isn't a control, so it stays as it was.
            assertTrue(Settings.preferences.getBoolean("paused", false));
            assertTrue(((Switch) root.findViewWithTag("paused")).isChecked());
        }
    }

    @Test public void backToDefaultsBringsUpTheRestartRowForAControlHeldUntilRestart() {
        Settings.preferences.edit().putBoolean("meta_ai", true).commit();
        // Messenger already hid its Meta AI tab for this run.
        Settings.metaAiTab = true;
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertEquals(View.GONE, root.findViewWithTag("restart_row").getVisibility());
            root.findViewWithTag("tab_app").performClick();
            root.findViewWithTag("quick_defaults").performClick();
            assertEquals("Changed 1 control", ShadowToast.getTextOfLatestToast());
            assertTrue(root.findViewWithTag("restart_row").isShown());
            assertEquals("1 change waits for a restart", ((TextView) root.findViewWithTag("restart_waiting")).getText().toString());
        }
    }

    /**
     * Undo puts back exactly what was saved before, so a switch that was never set goes back to never set, and leaves alone
     * one flipped again since.
     */
    @Test public void undoPutsBackWhatAQuickSetupChangedButNotASwitchFlippedSince() {
        Settings.preferences.edit().putBoolean("analytics_uploads", true).commit();
        List<String> changed = new java.util.ArrayList<>(QuickSetups.PRIVACY);
        changed.remove("analytics_uploads");
        String flipped = changed.get(0);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            SettingsText text = new SettingsText(screen.get());
            android.widget.Button undo = root.findViewWithTag("undo");
            assertEquals(View.GONE, undo.getVisibility());
            root.findViewWithTag("tab_app").performClick();
            root.findViewWithTag("quick_privacy").performClick();
            assertEquals(text.count("quick_changed", changed.size()), ShadowToast.getTextOfLatestToast());
            assertTrue(undo.isShown());
            assertEquals("Undo Privacy", undo.getText().toString());
            Settings.preferences.edit().putBoolean(flipped, false).commit();
            undo.performClick();
            assertEquals(text.count("quick_undone", changed.size() - 1), ShadowToast.getTextOfLatestToast());
            assertEquals(View.GONE, undo.getVisibility());
            assertTrue(Settings.preferences.getBoolean("analytics_uploads", false));
            assertTrue(Settings.preferences.contains(flipped));
            for (String key : changed) {
                if (!key.equals(flipped)) assertFalse(key, Settings.preferences.contains(key));
                assertFalse(key, ((Switch) root.findViewWithTag(key)).isChecked());
            }
        }
    }

    @Test public void backToDefaultsIsFinalOnceUndoRunsOutOrSettingsClose() {
        Settings.preferences.edit().putBoolean("growth", true).commit();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            View undo = root.findViewWithTag("undo");
            root.findViewWithTag("tab_app").performClick();
            // The bar's title draws a frame every 10 ms, and Robolectric moves its clock on by a frame delay at each
            // one, so the Undo window would seem to run out early. Hidden, the title only looks in every half second
            // through a plain handler, which leaves the clock to the test.
            root.findViewWithTag("wordmark").setVisibility(View.INVISIBLE);
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(50));
            root.findViewWithTag("quick_defaults").performClick();
            assertEquals("Undo Back to defaults", ((TextView) undo).getText().toString());
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(SettingsActivity.UNDO_MILLIS - 1));
            assertTrue(undo.isShown());
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(1));
            assertEquals(View.GONE, undo.getVisibility());
            // A hidden button still takes performClick, so these show the saved values are gone, not just the button.
            undo.performClick();
            assertFalse(Settings.preferences.getBoolean("growth", true));
            Settings.preferences.edit().putBoolean("growth", true).commit();
            root.findViewWithTag("quick_defaults").performClick();
            assertTrue(undo.isShown());
            screen.pause().stop();
            screen.start().resume();
            assertEquals(View.GONE, undo.getVisibility());
            undo.performClick();
            assertFalse(Settings.preferences.getBoolean("growth", true));
        }
    }

    private static void installedFeatures(String... keys) throws Exception {
        var app = RuntimeEnvironment.getApplication();
        var info = app.getPackageManager().getPackageInfo(app.getPackageName(), android.content.pm.PackageManager.GET_META_DATA);
        info.applicationInfo.metaData = new android.os.Bundle();
        for (String key : keys) info.applicationInfo.metaData.putBoolean("hush.feature." + key, true);
        org.robolectric.Shadows.shadowOf(app.getPackageManager()).installPackage(info);
        Settings.initialize(app);
    }

    @Test public void aChoiceWithNoneOfItsSwitchesInTheBundleSaysSoInsteadOfAlreadySet() throws Exception {
        installedFeatures("growth", "bubbles");
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            root.findViewWithTag("quick_privacy").performClick();
            assertEquals("Those controls aren't installed. Nothing changed.", ShadowToast.getTextOfLatestToast());
            root.findViewWithTag("quick_quiet").performClick();
            assertEquals("Changed 1 control", ShadowToast.getTextOfLatestToast());
            root.findViewWithTag("quick_quiet").performClick();
            assertEquals("Nothing to change. Those controls were already set.", ShadowToast.getTextOfLatestToast());
        }
    }

    /**
     * Bubbles installed without their host routes can't run on any Android version, but one saved on, say from a restored
     * file, still goes off with the rest.
     */
    @Test public void backToDefaultsAlsoTurnsOffAControlThisPhoneCantRun() throws Exception {
        installedFeatures("growth", "bubbles");
        Settings.preferences.edit().putBoolean("bubbles", true).commit();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            root.findViewWithTag("quick_defaults").performClick();
            assertEquals("Changed 1 control", ShadowToast.getTextOfLatestToast());
            assertFalse(Settings.preferences.getBoolean("bubbles", true));
        }
    }

    @Test public void theHelpLineSaysToPressAndHold() {
        assertTrue(new SettingsText(Locale.US).get("quick_setups_help").endsWith(" Press and hold to hide this section."));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            // The section is its header and then the card, whose first line is the help.
            android.view.ViewGroup card = (android.view.ViewGroup) ((android.view.ViewGroup) root.findViewWithTag("quick_setups")).getChildAt(1);
            assertTrue(((TextView) card.getChildAt(0)).getText().toString().endsWith("Press and hold to hide this section."));
            // Holding the header hides it too.
            assertTrue(root.findViewWithTag("section_quick_setups").performLongClick());
            assertFalse(root.findViewWithTag("quick_setups").isShown());
        }
    }

    @Test public void aLongPressHidesQuickSetupsAndTheRestoreButtonBringsItBack() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            TextView status = root.findViewWithTag("quick_setups_home_status");
            assertEquals("Shown. Tap to hide it.", status.getText().toString());
            assertFalse(Settings.preferences.getBoolean("hide_quick_setups", false));
            assertTrue(root.findViewWithTag("quick_privacy").performLongClick());
            assertTrue(Settings.preferences.getBoolean("hide_quick_setups", false));
            assertFalse(root.findViewWithTag("quick_setups").isShown());
            // The long press happens on the App tab, so the toast has to name the button there, not send you to App.
            TextView restore = root.findViewWithTag("quick_setups_home");
            assertTrue(restore.isShown());
            assertEquals("Hidden. Tap " + restore.getText() + " under Your choices.",
                ShadowToast.getTextOfLatestToast());
            assertEquals("Hidden. Tap to show it again.", status.getText().toString());
            root.findViewWithTag("quick_setups_home").performClick();
            assertFalse(Settings.preferences.getBoolean("hide_quick_setups", false));
            assertTrue(root.findViewWithTag("quick_setups").isShown());
            assertEquals("Shown. Tap to hide it.", status.getText().toString());
            root.findViewWithTag("quick_setups_home").performClick();
            assertFalse(root.findViewWithTag("quick_setups").isShown());
        }
    }

    @Test public void aHiddenSectionStaysHiddenOnTheNextOpenAndNoChoiceOrBackupCarriesIt() {
        Settings.preferences.edit().putBoolean("hide_quick_setups", true).commit();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            assertFalse(root.findViewWithTag("quick_setups").isShown());
            assertEquals("Hidden. Tap to show it again.",
                ((TextView) root.findViewWithTag("quick_setups_home_status")).getText().toString());
        }
        for (String name : QuickSetups.CHOICES) assertFalse(QuickSetups.values(name).containsKey("hide_quick_setups"));
        assertFalse(controls().contains("hide_quick_setups"));
        assertFalse(ChoiceCodec.encode(Settings.preferences, Settings.installed).contains("hide_quick_setups"));
    }

    @Test public void withNoControlsInstalledThereAreNoQuickSetups() throws Exception {
        var app = RuntimeEnvironment.getApplication();
        var info = app.getPackageManager().getPackageInfo(app.getPackageName(), android.content.pm.PackageManager.GET_META_DATA);
        info.applicationInfo.metaData = new android.os.Bundle();
        org.robolectric.Shadows.shadowOf(app.getPackageManager()).installPackage(info);
        Settings.initialize(app);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            assertNull(screen.get().getWindow().getDecorView().findViewWithTag("quick_setups"));
        }
    }
}
