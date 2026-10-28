/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.*;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.SwitchPreference;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import java.io.File;
import java.io.FileOutputStream;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import app.morphe.extension.facebook.navigation.MarketplaceOnly;
import app.morphe.extension.facebook.navigation.MarketplaceOnlyForTests;
import app.morphe.extension.facebook.navigation.StartTab;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.Setting;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

/** The choices a person makes in Marketplace settings, including a restored settings file. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class MarketplaceSettingsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void setUp() {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.START_TAB, PatchFamily.MARKETPLACE_ONLY);
        MarketplaceOnlyForTests.inBuild(true);
        MarketplaceOnlyForTests.resetState();
        HookStatus.clear();
        Settings.MARKETPLACE_ONLY.resetToDefault();
        Settings.EVENTS_ONLY.resetToDefault();
        Settings.OPEN_ON_CHOSEN_TAB.save(true);
        Settings.START_TAB.save(StartTab.FRIENDS);
    }

    @After
    public void restore() {
        PatchFamily.inBuildForTests = null;
        MarketplaceOnlyForTests.inBuild(null);
        MarketplaceOnlyForTests.resetState();
        HookStatus.clear();
        Settings.MARKETPLACE_ONLY.resetToDefault();
        Settings.EVENTS_ONLY.resetToDefault();
        Settings.OPEN_ON_CHOSEN_TAB.resetToDefault();
        Settings.START_TAB.resetToDefault();
        ScreenColors.shown = null;
    }

    private static HushfacebookPreferenceFragment open(Activity activity) {
        HushfacebookPreferenceFragment page = new HushfacebookPreferenceFragment();
        activity.getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
        ShadowLooper.idleMainLooper();
        return page;
    }

    private static Preference titled(PreferenceGroup group, String title) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference row = group.getPreference(i);
            if (title.contentEquals(String.valueOf(row.getTitle()))) return row;
            if (row instanceof PreferenceGroup) {
                Preference found = titled((PreferenceGroup) row, title);
                if (found != null) return found;
            }
        }
        return null;
    }

    @Test
    public void includingThePatchDoesNotRemoveTheFeedUntilThePersonOptsIn() {
        assertFalse(Settings.MARKETPLACE_ONLY.defaultValue);
        assertFalse(Settings.OPEN_ON_CHOSEN_TAB.defaultValue);
        assertFalse(MarketplaceOnlyForTests.hidesHome());
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = open(controller.get());
            assertFalse(((SwitchPreference) page.findPreference(Settings.MARKETPLACE_ONLY.key)).isChecked());
            assertTrue(page.findPreference(Settings.START_TAB.key).isEnabled());
        }
    }

    @Test
    public void theModeExplainsItsOverrideAndRestoresTheSavedStartTab() throws Exception {
        Settings.MARKETPLACE_ONLY.save(true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = open(controller.get());
            Preference chosen = page.findPreference(Settings.OPEN_ON_CHOSEN_TAB.key);
            Preference tab = page.findPreference(Settings.START_TAB.key);
            assertFalse(chosen.isEnabled());
            assertFalse(tab.isEnabled());
            assertTrue(String.valueOf(tab.getSummary()), tab.getSummary().toString().contains("Marketplace"));

            Setting.saveAll(Map.of(Settings.MARKETPLACE_ONLY, false));
            page.refreshSwitches();
            ShadowLooper.idleMainLooper();
            assertTrue(chosen.isEnabled());
            assertTrue(tab.isEnabled());
            assertEquals(StartTab.FRIENDS, Settings.START_TAB.savedValue());
            assertTrue(Settings.OPEN_ON_CHOSEN_TAB.savedValue());
            assertEquals(HushfacebookPreferenceFragment.startTabSummary(StartTab.FRIENDS), tab.getSummary());
        }
    }

    @Test
    public void returnToRegularFacebookKeepsEveryOtherChoice() {
        Settings.MARKETPLACE_ONLY.save(true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = open(controller.get());
            Preference back = titled(page.getPreferenceScreen(), "Return to regular Facebook");
            assertNotNull(back);
            assertTrue(back.isEnabled());
            assertTrue(back.getOnPreferenceClickListener().onPreferenceClick(back));
            ShadowLooper.idleMainLooper();
            assertFalse(Settings.MARKETPLACE_ONLY.savedValue());
            assertFalse(((SwitchPreference) page.findPreference(Settings.MARKETPLACE_ONLY.key)).isChecked());
            assertTrue(Settings.OPEN_ON_CHOSEN_TAB.savedValue());
            assertEquals(StartTab.FRIENDS, Settings.START_TAB.savedValue());
            assertFalse(back.isEnabled());
            // Greyed out, it says what it's for instead of offering the tabs back again.
            assertEquals("For when Marketplace only or Events only is on. Neither is on now.",
                    String.valueOf(back.getSummary()));
            assertNotNull(ShadowToast.getTextOfLatestToast());
        }
    }

    /** A row's summary without the marks that keep a switch's name in its own direction. */
    private static String plain(Preference row) {
        return String.valueOf(row.getSummary()).replace("⁨", "").replace("⁩", "");
    }

    @Test
    public void aSwitchAnotherOverridesNamesTheSwitchToTurnOff() throws Exception {
        Settings.MARKETPLACE_ONLY.save(true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = open(controller.get());
            Preference events = page.findPreference(Settings.EVENTS_ONLY.key);
            assertFalse(events.isEnabled());
            assertTrue(plain(events),
                    plain(events).endsWith("Turn off Marketplace only to use this."));

            Setting.saveAll(Map.of(Settings.MARKETPLACE_ONLY, false));
            page.refreshSwitches();
            ShadowLooper.idleMainLooper();
            assertTrue(events.isEnabled());
            assertFalse(plain(events), plain(events).contains("Turn off"));
        }
    }

    /**
     * The two tab bar pairs are one row of three choices each. An older file with both switches
     * on still reads the way it always worked, and a choice saves both switches at once.
     */
    @Test
    public void eachTabBarPairIsOneChoiceThatSavesBothSwitchesAndOwesARestart() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.BOTTOM_TAB_BAR);
        Setting.saveAll(Map.of(Settings.BOTTOM_TAB_BAR, true, Settings.TOP_TAB_BAR, true,
                Settings.TAB_BAR_SCROLL_AWAY, true, Settings.KEEP_TAB_BAR, true));
        HushfacebookPreferenceFragment.restartPending.clear();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = open(controller.get());
            for (BooleanSetting merged : new BooleanSetting[]{Settings.BOTTOM_TAB_BAR, Settings.TOP_TAB_BAR,
                    Settings.TAB_BAR_SCROLL_AWAY, Settings.KEEP_TAB_BAR}) {
                assertNull(merged.key + " kept a row of its own", page.findPreference(merged.key));
            }
            Preference position = page.findPreference(TabBarChoices.POSITION_ROW);
            Preference scrolling = page.findPreference(TabBarChoices.SCROLLING_ROW);
            assertEquals("Tab bar position", String.valueOf(position.getTitle()));
            assertEquals("Tab bar while scrolling", String.valueOf(scrolling.getTitle()));
            // Bottom over Top and Hide over Keep, as the switches always worked.
            assertEquals(TabBarChoices.FIRST, TabBarChoices.Pair.POSITION.choice());
            assertEquals(TabBarChoices.Pair.POSITION.summary(TabBarChoices.FIRST), position.getSummary());
            assertEquals(TabBarChoices.Pair.SCROLLING.summary(TabBarChoices.FIRST), scrolling.getSummary());
            // Search and the guides still find the row by the switches' own names and keys.
            List<CharSequence> aliases = List.of(SettingsRows.aliases(position));
            assertTrue(aliases.toString(), aliases.contains(SwitchLabels.title(Settings.TOP_TAB_BAR)));
            assertEquals(TabBarChoices.Pair.POSITION, TabBarChoices.Pair.forKey(Settings.TOP_TAB_BAR.key));
            assertEquals(TabBarChoices.Pair.SCROLLING, TabBarChoices.Pair.forKey(Settings.KEEP_TAB_BAR.key));
            assertNull(TabBarChoices.Pair.forKey(Settings.EVENTS_ONLY.key));

            assertTrue(position.getOnPreferenceClickListener().onPreferenceClick(position));
            ShadowLooper.idleMainLooper();
            android.app.AlertDialog chooser = (android.app.AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
            assertEquals(3, chooser.getListView().getAdapter().getCount());
            assertEquals("As Facebook has it", String.valueOf(chooser.getListView().getAdapter().getItem(0)));
            org.robolectric.Shadows.shadowOf(chooser).clickOnItem(TabBarChoices.SECOND);
            ShadowLooper.idleMainLooper();
            assertFalse(Settings.BOTTOM_TAB_BAR.savedValue());
            assertTrue(Settings.TOP_TAB_BAR.savedValue());
            assertEquals(TabBarChoices.Pair.POSITION.summary(TabBarChoices.SECOND), position.getSummary());
            assertTrue(HushfacebookPreferenceFragment.restartPending.contains(Settings.BOTTOM_TAB_BAR.key));

            assertTrue(TabBarChoices.save(page, TabBarChoices.Pair.SCROLLING, TabBarChoices.FACEBOOK));
            assertFalse(Settings.TAB_BAR_SCROLL_AWAY.savedValue());
            assertFalse(Settings.KEEP_TAB_BAR.savedValue());
            assertEquals(TabBarChoices.FACEBOOK, TabBarChoices.Pair.SCROLLING.choice());
            assertTrue(HushfacebookPreferenceFragment.restartPending.contains(Settings.KEEP_TAB_BAR.key));
        } finally {
            HushfacebookPreferenceFragment.restartPending.clear();
            Settings.BOTTOM_TAB_BAR.resetToDefault();
            Settings.TOP_TAB_BAR.resetToDefault();
            Settings.TAB_BAR_SCROLL_AWAY.resetToDefault();
            Settings.KEEP_TAB_BAR.resetToDefault();
        }
    }

    @Test
    public void backToDefaultsPutsEachTabBarChoiceBackAndOwesARestart() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.BOTTOM_TAB_BAR);
        Setting.saveAll(Map.of(Settings.BOTTOM_TAB_BAR, false, Settings.TOP_TAB_BAR, true,
                Settings.TAB_BAR_SCROLL_AWAY, false, Settings.KEEP_TAB_BAR, true));
        HushfacebookPreferenceFragment.restartPending.clear();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = open(controller.get());
            // The pairs have no switch rows, so Back to defaults reaches them through their choice rows.
            assertTrue(page.applyQuickSetup(QuickSetupKeys.defaults()) >= 2);
            ShadowLooper.idleMainLooper();
            for (BooleanSetting setting : new BooleanSetting[]{Settings.BOTTOM_TAB_BAR, Settings.TOP_TAB_BAR,
                    Settings.TAB_BAR_SCROLL_AWAY, Settings.KEEP_TAB_BAR}) {
                assertEquals(setting.key, setting.defaultValue, setting.savedValue());
            }
            assertEquals(TabBarChoices.Pair.POSITION.summary(TabBarChoices.Pair.POSITION.choice()),
                    page.findPreference(TabBarChoices.POSITION_ROW).getSummary());
            assertEquals(TabBarChoices.Pair.SCROLLING.summary(TabBarChoices.Pair.SCROLLING.choice()),
                    page.findPreference(TabBarChoices.SCROLLING_ROW).getSummary());
            assertTrue(HushfacebookPreferenceFragment.restartPending.contains(Settings.TOP_TAB_BAR.key));
            assertTrue(HushfacebookPreferenceFragment.restartPending.contains(Settings.KEEP_TAB_BAR.key));
            // Already back where they started, so a second run changes nothing.
            assertEquals(0, TabBarChoices.apply(page, QuickSetupKeys.defaults()));
        } finally {
            HushfacebookPreferenceFragment.restartPending.clear();
            Settings.BOTTOM_TAB_BAR.resetToDefault();
            Settings.TOP_TAB_BAR.resetToDefault();
            Settings.TAB_BAR_SCROLL_AWAY.resetToDefault();
            Settings.KEEP_TAB_BAR.resetToDefault();
        }
    }

    @Test
    public void marketplaceOnlysOwnRowsSitUnderItBeforeEventsOnly() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = open(controller.get());
            PreferenceGroup opening = page.findPreference(Settings.MARKETPLACE_ONLY.key).getParent();
            List<String> keys = new ArrayList<>();
            for (int i = 0; i < opening.getPreferenceCount(); i++) keys.add(opening.getPreference(i).getKey());
            int marketplace = keys.indexOf(Settings.MARKETPLACE_ONLY.key);
            assertEquals(keys.toString(), Settings.MARKETPLACE_QUIET_NOTIFICATIONS.key, keys.get(marketplace + 1));
            assertEquals(keys.toString(), Settings.MARKETPLACE_SKIP_FEED_PREFETCH.key, keys.get(marketplace + 2));
            assertEquals(keys.toString(), Settings.EVENTS_ONLY.key, keys.get(marketplace + 3));
            assertEquals(keys.toString(), "action_regular_facebook", keys.get(marketplace + 4));
        }
    }

    @Test
    public void eventsOnlyHasItsOwnRowAndSummaryAndReturnToRegularTurnsBothOff() {
        assertFalse(Settings.EVENTS_ONLY.defaultValue);
        Settings.EVENTS_ONLY.save(true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = open(controller.get());
            SwitchPreference row = (SwitchPreference) page.findPreference(Settings.EVENTS_ONLY.key);
            assertNotNull(row);
            assertTrue(row.isChecked());
            assertEquals("Events only", String.valueOf(row.getTitle()));
            assertEquals(HushfacebookPreferenceFragment.eventsSummary(), String.valueOf(row.getSummary()));
            // The single-tab state is Events' now, so Marketplace only's row doesn't take it as its own.
            assertFalse(HushfacebookPreferenceFragment.eventsSummary().startsWith("Off."));
            CharSequence marketplace = page.findPreference(Settings.MARKETPLACE_ONLY.key).getSummary();
            assertTrue(String.valueOf(marketplace), String.valueOf(marketplace).startsWith("Off."));
            Preference tab = page.findPreference(Settings.START_TAB.key);
            assertFalse(tab.isEnabled());
            assertEquals("Events only chooses the opening tab. Your previous choice stays saved.",
                    String.valueOf(tab.getSummary()));
            assertFalse(page.findPreference(Settings.MARKETPLACE_SKIP_FEED_PREFETCH.key).isEnabled());
            // Events isn't one of the opening tab choices.
            for (CharSequence value : ((android.preference.ListPreference) tab).getEntryValues()) {
                assertFalse(String.valueOf(value), "EVENTS".contentEquals(value));
            }

            Preference back = titled(page.getPreferenceScreen(), "Return to regular Facebook");
            assertTrue(back.isEnabled());
            assertTrue(back.getOnPreferenceClickListener().onPreferenceClick(back));
            ShadowLooper.idleMainLooper();
            assertFalse(Settings.EVENTS_ONLY.savedValue());
            assertFalse(Settings.MARKETPLACE_ONLY.savedValue());
            assertFalse(row.isChecked());
            assertFalse(back.isEnabled());
            assertTrue(tab.isEnabled());
        }
    }

    @Test
    public void restartFeedbackFollowsTheBuiltBarInsteadOfAnUnavailableChoice() {
        Settings.MARKETPLACE_ONLY.save(true);
        MarketplaceOnly.hidesTab(false, new Object(), Collections.emptyList(), Collections.emptySet());
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = open(controller.get());
            Settings.MARKETPLACE_ONLY.save(false);
            assertFalse(page.noteRestartPending(Settings.MARKETPLACE_ONLY, true));
            assertFalse(HushfacebookPreferenceFragment.restartPending.contains(Settings.MARKETPLACE_ONLY.key));
            Settings.MARKETPLACE_ONLY.save(true);
            MarketplaceOnlyForTests.hidesHome();
            Settings.MARKETPLACE_ONLY.save(false);
            assertTrue(page.noteRestartPending(Settings.MARKETPLACE_ONLY, true));
            assertTrue(HushfacebookPreferenceFragment.restartPending.contains(Settings.MARKETPLACE_ONLY.key));
        }
    }

    /** Real Android rows rendered in memory. No phone or desktop display receives input. */
    @Test
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(sdk = 30, qualifiers = "w390dp-h844dp-night-xhdpi")
    public void renderMarketplaceChoicesAndRecoveryOffscreen() throws Exception {
        File directory = new File("build/reports/marketplace");
        assertTrue(directory.isDirectory() || directory.mkdirs());
        for (boolean active : new boolean[]{false, true}) {
            MarketplaceOnlyForTests.resetState();
            Settings.MARKETPLACE_ONLY.save(active);
            MarketplaceOnlyForTests.hidesHome();
            try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
                SettingsDialog dialog = SettingsL10nTest.show(controller.get());
                HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(dialog);
                assertNotNull(page.navigation);
                page.navigation.navigate("Opening Facebook");
                View root = dialog.getView();
                assertNotNull(root);
                int width = 780, height = 4200;
                root.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
                root.layout(0, 0, width, height);
                ListView list = root.findViewById(android.R.id.list);
                assertNotNull(list);
                ShadowLooper.idleMainLooper();
                root.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
                root.layout(0, 0, width, height);
                assertTrue(list.getChildCount() > 4);
                assertEquals(!active, page.findPreference(Settings.START_TAB.key).isEnabled());
                assertEquals(active, page.findPreference(Settings.MARKETPLACE_SKIP_FEED_PREFETCH.key).isEnabled());
                // Capture the current dialog host, with enough height to show both saved choices.
                int last = list.getCount() - 1;
                assertEquals(last, list.getLastVisiblePosition());
                View lastRow = list.getChildAt(last - list.getFirstVisiblePosition());
                assertNotNull(lastRow);
                Rect lastBounds = new Rect();
                lastRow.getDrawingRect(lastBounds);
                ((ViewGroup) root).offsetDescendantRectToMyCoords(lastRow, lastBounds);
                int bottom = lastBounds.bottom + 32;
                Bitmap image = Bitmap.createBitmap(width, bottom, Bitmap.Config.ARGB_8888);
                Canvas canvas = new Canvas(image);
                root.draw(canvas);
                File file = new File(directory, active ? "marketplace-active.png" : "marketplace-off.png");
                try (FileOutputStream out = new FileOutputStream(file)) {
                    assertTrue(image.compress(Bitmap.CompressFormat.PNG, 100, out));
                }
                assertTrue("rendered screen is empty", file.length() > 20000);
                image.recycle();
            }
        }
    }
}
