package app.morphe.extension.tiktok.settings;

import static org.junit.Assert.*;

import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.os.Looper;
import android.preference.Preference;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import android.widget.TextView;
import java.util.Arrays;
import java.util.List;
import app.morphe.extension.shared.diagnostics.BuildDetails;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.preference.SettingsActionBanner;
import app.morphe.extension.tiktok.settings.preference.SettingsMenuPreference;
import app.morphe.extension.tiktok.settings.preference.SettingsSearchEntryPreference;
import app.morphe.extension.tiktok.settings.preference.TikTokPreferenceFragment;
import com.bytedance.ies.ugc.aweme.commercialize.compliance.personalization.AdPersonalizationActivity;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {23, 35}, qualifiers = "en-w480dp-h960dp-night-mdpi", fontScale = 1f)
@LooperMode(LooperMode.Mode.PAUSED)
@SuppressWarnings("deprecation")
public class SettingsActivityRecreationTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private boolean advancedDownloads, feedFilter;

    @Before public void enablePages() {
        advancedDownloads = SettingsStatus.advancedDownloadsEnabled;
        feedFilter = SettingsStatus.feedFilterEnabled;
        SettingsStatus.advancedDownloadsEnabled = true;
        SettingsStatus.feedFilterEnabled = true;
    }

    @After public void restorePages() {
        SettingsStatus.advancedDownloadsEnabled = advancedDownloads;
        SettingsStatus.feedFilterEnabled = feedFilter;
    }

    /** Matches the settings patch's initialize call immediately after the native super.onCreate. */
    public static class SettingsActivity extends AdPersonalizationActivity {
        boolean initialized, receivedSavedState;

        @Override public void onCreate(Bundle state) {
            setTheme(android.R.style.Theme_Material_NoActionBar);
            super.onCreate(state);
            receivedSavedState = state != null;
            initialized = TikTokActivityHook.initialize(this);
        }

        @Override public void onBackPressed() {
            if (!TikTokActivityHook.handleBackPressed(this)) super.onBackPressed();
        }
    }

    @Test public void fontScaleRecreationPreservesEveryExpandedCategoryWithoutABackStack() {
        try (var owner = Robolectric.buildActivity(SettingsActivity.class, settingsIntent()).setup().visible()) {
            SettingsActivity before = owner.get();
            settle(before);
            assertTrue(before.initialized);
            int containerId = currentPage(before).getId();
            TikTokPreferenceFragment home = currentPage(before);
            clickMenu(before, "Downloads");
            TikTokPreferenceFragment section = currentPage(before);
            assertSame(home, section);
            clickMenu(before, "Feed filter");
            assertTrue(group(section, "section_downloads").isExpanded());
            assertTrue(group(section, "section_feed_filter").isExpanded());
            assertNotNull(section.findPreference("download_video_quality"));
            assertEquals(0, before.getFragmentManager().getBackStackEntryCount());

            Configuration largerText = new Configuration(before.getResources().getConfiguration());
            largerText.fontScale = 1.5f;
            owner.configurationChange(largerText);
            SettingsActivity after = owner.get();
            settle(after);
            assertNotSame("the fixture did not recreate the activity", before, after);
            assertTrue("Android's saved fragment state never reached onCreate", after.receivedSavedState);
            assertEquals(1.5f, after.getResources().getConfiguration().fontScale, 0f);
            TikTokPreferenceFragment restored = currentPage(after);
            assertTrue("recreation collapsed Downloads", group(restored, "section_downloads").isExpanded());
            assertTrue("recreation collapsed Feed filter", group(restored, "section_feed_filter").isExpanded());
            assertEquals("restored fragments lost their container", containerId, restored.getId());
            assertNotSame(section, restored);
            assertNotNull(restored.findPreference("download_video_quality"));
            assertSame(container(after), restored.getView().getParent());
            assertEquals(0, after.getFragmentManager().getBackStackEntryCount());

            after.onBackPressed();
            assertTrue("expanded categories added a Back destination", after.isFinishing());
        }
    }

    @Test public void openingSettingsHandsTheRegisteredSwitchesToBuildDetails() {
        try {
            BuildDetails.setRegisteredSwitches(null);
            try (var owner = Robolectric.buildActivity(SettingsActivity.class, settingsIntent()).setup().visible()) {
                settle(owner.get());
                assertTrue(owner.get().initialized);
                String report = BuildDetails.report("");
                assertFalse(report, report.contains("registered_switches: unknown"));
                String line = report.substring(report.indexOf("registered_switches: "));
                line = line.substring(0, line.indexOf('\n'));
                List<String> names = Arrays.asList(line.substring("registered_switches: ".length()).split(","));
                assertTrue(line, names.contains("advancedDownloads") && names.contains("feedFilter"));
            }
        } finally {
            BuildDetails.setRegisteredSwitches(null);
        }
    }

    @Test public void coldStartOpensOneHomePageAndBackClosesIt() {
        try (var owner = Robolectric.buildActivity(SettingsActivity.class, settingsIntent()).setup().visible()) {
            SettingsActivity activity = owner.get();
            settle(activity);
            assertTrue(activity.initialized);
            assertFalse(activity.receivedSavedState);
            TikTokPreferenceFragment home = currentPage(activity);
            assertNull(requestedSection(home));
            assertNull(requestedHub(home));
            assertTrue(hasMenu(home, "Downloads"));
            assertSame(container(activity), home.getView().getParent());
            assertEquals(0, activity.getFragmentManager().getBackStackEntryCount());
            activity.onBackPressed();
            assertTrue(activity.isFinishing());
        }
    }

    @Test public void directSectionIntentExpandsItsCategoryOnTheWholeMainList() {
        Intent intent = settingsIntent().putExtra("morphe_settings_section", "FEED_FILTER");
        try (var owner = Robolectric.buildActivity(SettingsActivity.class, intent).setup().visible()) {
            SettingsActivity activity = owner.get();
            settle(activity);
            assertTrue(activity.initialized);
            TikTokPreferenceFragment page = currentPage(activity);
            assertTrue(group(page, "section_feed_filter").isExpanded());
            assertTrue(hasMenu(page, "Downloads"));
            assertSame(container(activity), page.getView().getParent());
            assertEquals(0, activity.getFragmentManager().getBackStackEntryCount());
            activity.onBackPressed();
            assertTrue(activity.isFinishing());
        }
    }

    @Test public void actionBannerStaysAboveAnExpandedAndCollapsedCategory() {
        try (var owner = Robolectric.buildActivity(SettingsActivity.class, settingsIntent()).setup().visible()) {
            SettingsActivity activity = owner.get();
            settle(activity);
            ViewGroup content = activity.findViewById(android.R.id.content);
            ViewGroup settingsSurface = (ViewGroup) content.findViewWithTag(
                    SettingsActionBanner.CONTENT_ROOT_TAG);
            ViewGroup pageContainer = container(activity);
            assertNotNull(settingsSurface);
            assertNotSame("feedback was mounted inside the fragment container",
                    pageContainer, settingsSurface);

            SettingsActionBanner.showUndo(activity, "Today starts again", () -> { });
            settle(activity);
            View banner = settingsSurface.getChildAt(settingsSurface.getChildCount() - 1);
            assertNotSame(pageContainer, banner);

            clickMenu(activity, "Downloads");
            assertSame("the opened section covered the live Undo action", banner,
                    settingsSurface.getChildAt(settingsSurface.getChildCount() - 1));

            clickMenu(activity, "Downloads");
            assertFalse(group(currentPage(activity), "section_downloads").isExpanded());
            assertSame("the collapsed category covered the live Undo action", banner,
                    settingsSurface.getChildAt(settingsSurface.getChildCount() - 1));

            TextView undo = banner.findViewWithTag("hushfeed_settings_action_button");
            assertNotNull(undo);
            assertTrue(undo.performClick());
            assertNull(banner.getParent());
        }
    }

    /** Category expansion never changes where the toolbar's Back goes. */
    @Test public void theBackArrowLeavesDirectAndRestoredExpandedCategories() {
        Intent direct = settingsIntent().putExtra("morphe_settings_section", "FEED_FILTER");
        try (var owner = Robolectric.buildActivity(SettingsActivity.class, direct).setup().visible()) {
            SettingsActivity activity = owner.get();
            settle(activity);
            assertTrue(group(currentPage(activity), "section_feed_filter").isExpanded());
            assertEquals(0, activity.getFragmentManager().getBackStackEntryCount());
            assertTrue(backArrow(currentPage(activity)).performClick());
            assertTrue("the Back arrow on the page settings opened onto did nothing", activity.isFinishing());
        }
        try (var owner = Robolectric.buildActivity(SettingsActivity.class, settingsIntent()).setup().visible()) {
            SettingsActivity before = owner.get();
            settle(before);
            clickMenu(before, "Downloads");
            Configuration largerText = new Configuration(before.getResources().getConfiguration());
            largerText.fontScale = 1.5f;
            owner.configurationChange(largerText);
            SettingsActivity after = owner.get();
            settle(after);
            assertTrue(group(currentPage(after), "section_downloads").isExpanded());
            assertTrue(backArrow(currentPage(after)).performClick());
            settle(after);
            assertTrue("the Back arrow treated expansion as navigation", after.isFinishing());
            assertEquals(0, after.getFragmentManager().getBackStackEntryCount());
        }
    }

    @Test public void hardwareBackClosesInlineSearchBeforeLeavingSettings() {
        try (var owner = Robolectric.buildActivity(SettingsActivity.class, settingsIntent()).setup().visible()) {
            SettingsActivity activity = owner.get();
            settle(activity);
            TikTokPreferenceFragment home = currentPage(activity);
            clickMenu(activity, "Downloads");
            Preference search = home.findPreference("action_search_settings");
            assertTrue(search.getOnPreferenceClickListener().onPreferenceClick(search));
            settle(activity);
            assertSame(home, currentPage(activity));
            assertNotNull(home.getView().findViewWithTag("settings_search_input"));
            activity.onBackPressed();
            settle(activity);
            assertFalse(activity.isFinishing());
            assertSame(home, currentPage(activity));
            assertTrue(home.findPreference("action_search_settings") instanceof SettingsSearchEntryPreference);
            assertTrue(group(home, "section_downloads").isExpanded());
            assertEquals(0, activity.getFragmentManager().getBackStackEntryCount());
            activity.onBackPressed();
            assertTrue(activity.isFinishing());
        }
    }

    @Test public void aLegacyRestartMarkerExpandsTheMainListWithoutPushingAReturnPage() {
        Intent intent = settingsIntent().putExtra("hushfeed_settings_page", "section:DOWNLOADS#download_video_quality");
        try (var owner = Robolectric.buildActivity(SettingsActivity.class, intent).setup().visible()) {
            SettingsActivity activity = owner.get();
            settle(activity);
            TikTokPreferenceFragment home = currentPage(activity);
            assertTrue(group(home, "section_downloads").isExpanded());
            assertTrue(hasMenu(home, "Feed filter"));
            assertEquals(0, activity.getFragmentManager().getBackStackEntryCount());
            ListView list = home.getView().findViewById(android.R.id.list);
            int target = -1;
            for (int position = 0; position < list.getCount(); position++) {
                Object row = list.getItemAtPosition(position);
                if (row instanceof Preference && "download_video_quality".equals(((Preference) row).getKey())) target = position;
            }
            assertTrue(target >= list.getFirstVisiblePosition() && target <= list.getLastVisiblePosition());
            activity.onBackPressed();
            assertTrue(activity.isFinishing());
        }
    }

    @Test public void anInlineRestartMarkerRestoresAllOpenCategoriesAndTheVisibleRow() {
        Intent intent = settingsIntent().putExtra("hushfeed_settings_page", "home:FEED_FILTER,DOWNLOADS#download_video_quality");
        try (var owner = Robolectric.buildActivity(SettingsActivity.class, intent).setup().visible()) {
            SettingsActivity activity = owner.get();
            settle(activity);
            TikTokPreferenceFragment home = currentPage(activity);
            assertTrue(group(home, "section_feed_filter").isExpanded());
            assertTrue(group(home, "section_downloads").isExpanded());
            assertEquals(0, activity.getFragmentManager().getBackStackEntryCount());
            ListView list = home.getView().findViewById(android.R.id.list);
            boolean visible = false;
            for (int position = list.getFirstVisiblePosition(); position <= list.getLastVisiblePosition(); position++) {
                Object row = list.getItemAtPosition(position);
                if (row instanceof Preference && "download_video_quality".equals(((Preference) row).getKey())) visible = true;
            }
            assertTrue("the restored row remained outside the viewport", visible);
        }
    }

    private static View backArrow(TikTokPreferenceFragment page) {
        ListView list = page.getView().findViewById(android.R.id.list);
        // The header is not selectable, so selection skips it outside touch mode.
        list.smoothScrollToPositionFromTop(0, 0, 0);
        settle((SettingsActivity) page.getActivity());
        ViewGroup toolbar = page.getView().findViewWithTag("hushfeed_toolbar");
        assertNotNull("the page has no toolbar", toolbar);
        return toolbar.getChildAt(0);
    }

    private static Intent settingsIntent() {
        return new Intent().setAction("morphe_settings").putExtra("morphe", true);
    }

    private static ViewGroup container(SettingsActivity activity) {
        ViewGroup content = activity.findViewById(android.R.id.content);
        ViewGroup background = (ViewGroup) content.getChildAt(0);
        return (ViewGroup) background.getChildAt(0);
    }

    private static TikTokPreferenceFragment currentPage(SettingsActivity activity) {
        var fragment = activity.getFragmentManager().findFragmentById(container(activity).getId());
        assertTrue("the current settings container has no preference page", fragment instanceof TikTokPreferenceFragment);
        return (TikTokPreferenceFragment) fragment;
    }

    private static String requestedSection(TikTokPreferenceFragment page) {
        return page.getArguments() == null ? null : page.getArguments().getString("morphe_settings_section");
    }

    private static String requestedHub(TikTokPreferenceFragment page) {
        return page.getArguments() == null ? null : page.getArguments().getString("morphe_settings_hub");
    }

    private static SettingsMenuPreference group(TikTokPreferenceFragment page, String key) {
        Preference row = page.findPreference(key);
        assertTrue("missing category " + key, row instanceof SettingsMenuPreference);
        return (SettingsMenuPreference) row;
    }

    private static boolean hasMenu(TikTokPreferenceFragment page, String title) {
        for (int i = 0; i < page.getPreferenceScreen().getPreferenceCount(); i++) {
            if (title.equals(String.valueOf(page.getPreferenceScreen().getPreference(i).getTitle()))) return true;
        }
        return false;
    }

    private static void clickMenu(SettingsActivity activity, String title) {
        ListView list = currentPage(activity).getView().findViewById(android.R.id.list);
        for (int position = 0; position < list.getAdapter().getCount(); position++) {
            Object item = list.getAdapter().getItem(position);
            if (item instanceof Preference && title.equals(String.valueOf(((Preference) item).getTitle()))) {
                list.setSelection(position);
                settle(activity);
                View row = list.getChildAt(position - list.getFirstVisiblePosition());
                assertNotNull("the native preference row was not laid out", row);
                assertTrue(list.performItemClick(row, position, list.getAdapter().getItemId(position)));
                settle(activity);
                return;
            }
        }
        fail("the installed home menu has no " + title + " row");
    }

    private static void settle(SettingsActivity activity) {
        activity.getFragmentManager().executePendingTransactions();
        View decor = activity.getWindow().getDecorView();
        // Scrolling and focus can request more work on the next animation frame.
        for (int frame = 0; frame < 4; frame++) {
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(16));
            decor.measure(View.MeasureSpec.makeMeasureSpec(480, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(960, View.MeasureSpec.EXACTLY));
            decor.layout(0, 0, 480, 960);
        }
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }
}
