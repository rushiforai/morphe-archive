/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.*;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.SwitchPreference;
import android.view.View;
import android.widget.ListView;

import java.io.File;
import java.io.FileOutputStream;

import java.util.EnumSet;
import java.util.Collections;
import java.util.Map;

import app.morphe.extension.facebook.navigation.MarketplaceOnly;
import app.morphe.extension.facebook.navigation.MarketplaceOnlyForTests;
import app.morphe.extension.facebook.navigation.StartTab;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
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
            assertNotNull(ShadowToast.getTextOfLatestToast());
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
    @Config(sdk = 30, qualifiers = "w360dp-h780dp-night-xxhdpi")
    public void renderMarketplaceChoicesAndRecoveryOffscreen() throws Exception {
        File directory = new File("build/reports/marketplace");
        assertTrue(directory.isDirectory() || directory.mkdirs());
        for (boolean active : new boolean[]{false, true}) {
            MarketplaceOnlyForTests.resetState();
            Settings.MARKETPLACE_ONLY.save(active);
            MarketplaceOnlyForTests.hidesHome();
            try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
                HushfacebookPreferenceFragment page = open(controller.get());
                View root = page.getView();
                assertNotNull(root);
                int width = 1080, height = 4200;
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
                // Render the actual Opening Facebook group. The header's build strings are
                // filled by the patcher and are intentionally absent from this unit-test app.
                int first = -1, last = -1;
                for (int i = 0; i < list.getAdapter().getCount(); i++) {
                    Object row = list.getAdapter().getItem(i);
                    if (!(row instanceof Preference)) continue;
                    Preference preference = (Preference) row;
                    if ("Opening Facebook".contentEquals(String.valueOf(preference.getTitle()))) first = i;
                    if (Settings.START_TAB.key.equals(preference.getKey())) last = i;
                }
                assertTrue(first >= 0 && last > first);
                View firstRow = list.getChildAt(first - list.getFirstVisiblePosition());
                View lastRow = list.getChildAt(last - list.getFirstVisiblePosition());
                assertNotNull(firstRow);
                assertNotNull(lastRow);
                int top = list.getTop() + firstRow.getTop();
                int bottom = list.getTop() + lastRow.getBottom();
                Bitmap image = Bitmap.createBitmap(width, bottom - top, Bitmap.Config.ARGB_8888);
                Canvas canvas = new Canvas(image);
                canvas.translate(0, -top);
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
