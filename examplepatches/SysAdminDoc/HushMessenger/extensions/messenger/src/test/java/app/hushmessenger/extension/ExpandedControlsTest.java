package app.hushmessenger.extension;

import android.content.pm.PackageManager;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import com.facebook.messaging.business.inboxads.common.InboxAdsItem;
import java.util.Arrays;
import java.util.List;
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
    }

    @Test public void everyControlIsIndependentAndPauseKeepsItsChoice() {
        assertEquals(29, SettingsActivity.CONTROLS.length);
        assertEquals(29, Settings.installed.size());
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

    @Test public void adFilterPreservesOrdinaryRowsTheirOrderAndTheInput() {
        Settings.preferences.edit().putBoolean("ads", true).commit();
        Object businessConversation = new Object();
        Object safetyNotice = new Object();
        List<?> original = Arrays.asList(businessConversation, new InboxAdsItem(), "Sponsored is ordinary text", null,
            safetyNotice, new InboxAdsItem() { });
        List<?> filtered = Settings.filterInboxAds(original);
        assertEquals(Arrays.asList(businessConversation, "Sponsored is ordinary text", null, safetyNotice), filtered);
        assertEquals(6, original.size());
        assertSame(businessConversation, filtered.get(0));
        assertSame(safetyNotice, filtered.get(3));
        assertEquals(List.of(), Settings.filterInboxAds(List.of(new InboxAdsItem(), new InboxAdsItem())));
    }

    @Test public void inactivePausedUnavailableAndNoAdsReturnTheUnchangedSentinel() {
        List<?> ads = List.of(new InboxAdsItem());
        assertNull(Settings.filterInboxAds(ads));
        Settings.preferences.edit().putBoolean("ads", true).putBoolean("paused", true).commit();
        assertNull(Settings.filterInboxAds(ads));
        Settings.preferences.edit().putBoolean("paused", false).commit();
        assertNull(Settings.filterInboxAds(List.of("ordinary", "ad")));
        assertNull(Settings.filterInboxAds(List.of()));
        assertNull(Settings.filterInboxAds(null));
        Settings.installed = Set.of();
        assertNull(Settings.filterInboxAds(ads));
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
            assertTrue(((TextView) root.findViewWithTag("search_status")).getText().toString().startsWith("No optional controls installed."));
            assertNotNull(root.findViewWithTag("open_messenger"));
            // Nothing to search, and no "try another search" panel contradicting the status line.
            assertEquals(View.GONE, root.findViewWithTag("find_control").getVisibility());
            assertEquals(View.GONE, ((View) root.findViewWithTag("category_all").getParent()).getVisibility());
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
            search.setText("  PEOPLE YOU  ");
            assertEquals("1 of 29 installed controls", status.getText().toString());
            assertEquals(View.VISIBLE, ((View) root.findViewWithTag("people").getParent()).getVisibility());
            assertEquals(View.GONE, ((View) root.findViewWithTag("stories").getParent()).getVisibility());
            search.setText("Stickers");
            assertEquals("2 of 29 installed controls", status.getText().toString());
            search.setText("missing control xyz");
            assertEquals("No matching controls. Try another search.", status.getText().toString());
            search.setText("");
            assertEquals("29 of 29 installed controls", status.getText().toString());
        }
    }
}
