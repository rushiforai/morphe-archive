/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;

import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;

import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

/** Quick setups update the launcher as soon as their switches change. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class QuickSetupsTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    @After public void restore() throws Exception {
        Utils.awaitBackgroundTasksForTests();
        Settings.SAVED_SHORTCUT.resetToDefault();
        Settings.WATCH_HISTORY_SHORTCUT.resetToDefault();
        Settings.FREE_STUFF_SHORTCUT.resetToDefault();
        Settings.SETTINGS_SHORTCUT.resetToDefault();
        PatchFamily.inBuildForTests = null;
        ScreenColors.shown = null;
    }

    @Test public void backToDefaultsRemovesPublishedRouteShortcutsWithoutARestart() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        ShortcutManager manager = context.getSystemService(ShortcutManager.class);
        Settings.SAVED_SHORTCUT.save(true);
        Settings.WATCH_HISTORY_SHORTCUT.save(true);
        Settings.FREE_STUFF_SHORTCUT.save(true);
        assertTrue(SavedShortcutTest.aStartPublishes());
        assertTrue(WatchHistoryShortcutTest.aStartPublishes());
        assertTrue(FreeStuffShortcutTest.aStartPublishes());
        manager.addDynamicShortcuts(Collections.singletonList(new ShortcutInfo.Builder(context, "friends")
                .setShortLabel("Friends")
                .setIntent(new Intent(Intent.ACTION_MAIN).setPackage(context.getPackageName())).build()));

        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.MENU_SETTINGS_ROW);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            assertTrue("defaults changed no switches", page.applyQuickSetup(QuickSetupKeys.defaults()) >= 3);
            ShadowLooper.idleMainLooper();
            Utils.awaitBackgroundTasksForTests();
            assertFalse(Settings.SAVED_SHORTCUT.savedValue());
            assertFalse(Settings.WATCH_HISTORY_SHORTCUT.savedValue());
            assertFalse(Settings.FREE_STUFF_SHORTCUT.savedValue());
            for (String id : Arrays.asList(SavedShortcut.ID, WatchHistoryShortcut.ID, FreeStuffShortcut.ID)) {
                assertNull(id + " stayed in the launcher after its switch was reset", shortcut(manager, id));
            }
            assertNotNull("defaults removed Facebook's own shortcut", shortcut(manager, "friends"));
        }
    }

    @Test public void backToDefaultsRestoresTheSettingsShortcutWithoutARestart() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        ShortcutManager manager = context.getSystemService(ShortcutManager.class);
        Settings.SETTINGS_SHORTCUT.save(false);
        SettingsEntry.publishShortcutNow(context);
        assertNull(shortcut(manager, SettingsEntry.SHORTCUT_ID));

        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.MENU_SETTINGS_ROW);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            assertTrue("defaults changed no switches", page.applyQuickSetup(QuickSetupKeys.defaults()) >= 1);
            ShadowLooper.idleMainLooper();
            Utils.awaitBackgroundTasksForTests();
            assertTrue(Settings.SETTINGS_SHORTCUT.savedValue());
            assertNotNull("defaults did not put the settings shortcut back", shortcut(manager, SettingsEntry.SHORTCUT_ID));
        }
    }

    private static ShortcutInfo shortcut(ShortcutManager manager, String id) {
        for (ShortcutInfo shortcut : manager.getDynamicShortcuts()) {
            if (id.equals(shortcut.getId())) return shortcut;
        }
        return null;
    }
}
