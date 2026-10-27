package app.hushmessenger.extension;

import android.content.pm.PackageManager;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import java.util.Set;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35)
public class ExpandedControlsTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        OpenSections.all();
    }

    @Test public void everyControlIsIndependentAndPauseKeepsItsChoice() {
        assertEquals(ExpectedTotals.CONTROLS, SettingsActivity.CONTROLS.length);
        assertEquals(ExpectedTotals.CONTROLS, Settings.installed.size());
        for (String[] spec : SettingsActivity.CONTROLS) {
            String key = spec[0];
            assertTrue(Settings.installed.contains(key));
            assertFalse(Settings.enabled(key));
            Settings.preferences.edit().putBoolean(key, true).commit();
            assertTrue(Settings.enabled(key));
            for (String other : Settings.installed) if (!other.equals(key)) assertFalse(Settings.enabled(other));
            Settings.preferences.edit().putBoolean("paused", true).commit();
            assertFalse(Settings.enabled(key));
            assertTrue(Settings.preferences.getBoolean(key, false));
            Settings.preferences.edit().clear().commit();
        }
    }

    @Test public void saveAnyStoryFollowsItsSwitchPauseAndInstall() {
        assertFalse(Settings.saveAnyStory());
        Settings.preferences.edit().putBoolean("save_stories", true).commit();
        assertTrue(Settings.saveAnyStory());
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertFalse(Settings.saveAnyStory());
        Settings.preferences.edit().putBoolean("paused", false).commit();
        Settings.installed = Set.of("anonymous_stories");
        assertFalse(Settings.saveAnyStory());
    }

    private void installedFeatures(String... keys) throws Exception {
        var app = RuntimeEnvironment.getApplication();
        var info = app.getPackageManager().getPackageInfo(app.getPackageName(), PackageManager.GET_META_DATA);
        info.applicationInfo.metaData = new Bundle();
        for (String key : keys) info.applicationInfo.metaData.putBoolean("hush.feature." + key, true);
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);
    }

    @Test public void onlyInstalledFeaturesAppearAndOldPreferencesRemainSaved() throws Exception {
        Settings.preferences.edit().putBoolean("stories", true).putBoolean("people", true).commit();
        installedFeatures("people");
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertNull(root.findViewWithTag("stories"));
            assertNotNull(root.findViewWithTag("people"));
            assertFalse(Settings.hideStories());
            assertTrue(Settings.preferences.getBoolean("stories", false));
            assertTrue(Settings.enabled("people"));
            assertEquals("1 of 1 installed control", ((TextView) root.findViewWithTag("search_status")).getText().toString());
        }
        installedFeatures("stories");
        Settings.initialize(RuntimeEnvironment.getApplication());
        assertTrue(Settings.hideStories());
    }

    @Test public void emptyInstallationShowsRecoveryAndNoIneffectiveSwitches() throws Exception {
        installedFeatures();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            for (String[] spec : SettingsActivity.CONTROLS) assertNull(root.findViewWithTag(spec[0]));
            assertTrue(((TextView) root.findViewWithTag("search_status")).getText().toString().startsWith("No controls are installed."));
            assertNotNull(root.findViewWithTag("open_messenger"));
            // Nothing to search, and no "try another search" panel contradicting the status line.
            assertEquals(View.GONE, root.findViewWithTag("find_control").getVisibility());
            // No empty section headers either.
            assertNull(root.findViewWithTag("section_inbox"));
            assertEquals(View.GONE, root.findViewWithTag("empty_state").getVisibility());
        }
    }

    @Test public void searchFieldReadsTypedTextAndCapsPastedLength() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            EditText search = screen.get().getWindow().getDecorView().findViewWithTag("find_control");
            assertNull(search.getContentDescription());
            assertEquals("Find a control", search.getHint().toString());
            search.setText("x".repeat(5000));
            assertEquals(100, search.length());
        }
    }

    @Test public void searchFiltersByTitleDescriptionAndCategoryAndRecoversFromNoMatch() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            EditText search = root.findViewWithTag("find_control");
            TextView status = root.findViewWithTag("search_status");
            search.setText("  PEOPLE YOU MAY  ");
            assertEquals(ExpectedTotals.shown(1), status.getText().toString());
            assertEquals(View.VISIBLE, ((View) root.findViewWithTag("people").getParent()).getVisibility());
            assertEquals(View.GONE, ((View) root.findViewWithTag("stories").getParent()).getVisibility());
            search.setText("Stickers");
            assertEquals(ExpectedTotals.shown(4), status.getText().toString());
            search.setText("missing control xyz");
            assertEquals("No matching controls.", status.getText().toString());
            search.setText("");
            assertEquals(ExpectedTotals.shown(ExpectedTotals.CONTROLS), status.getText().toString());
        }
    }
}
