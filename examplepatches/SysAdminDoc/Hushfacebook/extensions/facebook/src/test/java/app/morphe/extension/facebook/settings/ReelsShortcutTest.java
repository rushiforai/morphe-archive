/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.Collections;

import app.morphe.extension.facebook.navigation.ReelsTabForTests;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Hide the Reels tab over Facebook's launcher shortcuts: with the switch on, Facebook's Reels
 * shortcut stays out of its icon's long-press menu whichever call Facebook sends it in, one it
 * published before goes at the next start, and its other shortcuts are left as Facebook sends them.
 * Off, paused, or without the patch, Facebook's shortcuts are its own.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReelsShortcutTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final Context context = RuntimeEnvironment.getApplication();
    private final ShortcutManager manager = context.getSystemService(ShortcutManager.class);

    @Before
    public void inBuild() {
        ReelsTabForTests.inBuild(Boolean.TRUE);
        ReelsTabForTests.forget();
        HookStatus.clear();
    }

    @After
    public void restore() throws Exception {
        // SettingsEntry's shortcut checks run on background threads, and Robolectric's
        // ShortcutManager isn't thread-safe the way the real one is: each call in these tests
        // waits for them before the next one touches it, and so does the next test.
        Utils.awaitBackgroundTasksForTests();
        ReelsTabForTests.inBuild(null);
        ReelsTabForTests.forget();
        PauseForTests.resume();
        Settings.HIDE_REELS_TAB.resetToDefault();
        HookStatus.clear();
    }

    private ShortcutInfo facebooks(String id) {
        return ReelsTabForTests.facebookShortcut(context, id);
    }

    private ShortcutInfo published(String id) {
        for (ShortcutInfo shortcut : manager.getDynamicShortcuts()) {
            if (id.equals(shortcut.getId())) return shortcut;
        }
        return null;
    }

    /** How many times the report counts the shortcut kept out, or 0. */
    private static int counted() {
        String held = ReelsTabForTests.SHORTCUT_HELD + " ";
        for (String line : HookStatus.report()) {
            if (!line.startsWith(FamilyNames.REELS_TAB + ":") || !line.contains(held)) continue;
            String rest = line.substring(line.indexOf(held) + held.length());
            return Integer.parseInt(rest.split("\\D", 2)[0]);
        }
        return 0;
    }

    @Test
    public void facebooksReelsShortcutStaysOutWhicheverCallSendsIt() throws Exception {
        assertTrue("the switch doesn't start on", Settings.HIDE_REELS_TAB.get());
        manager.pushDynamicShortcut(facebooks(ReelsTabForTests.SHORTCUT_ID));

        SettingsEntry.pushDynamicShortcut(manager, facebooks(ReelsTabForTests.SHORTCUT_ID));
        Utils.awaitBackgroundTasksForTests();
        SettingsEntry.pushDynamicShortcut(manager, facebooks("shortcut_notification_tab"));
        Utils.awaitBackgroundTasksForTests();
        assertNull("the Reels shortcut published before stayed", published(ReelsTabForTests.SHORTCUT_ID));
        assertNotNull("Facebook's Notifications shortcut was lost", published("shortcut_notification_tab"));

        assertTrue(SettingsEntry.addDynamicShortcuts(manager,
                Arrays.asList(facebooks(ReelsTabForTests.SHORTCUT_ID), facebooks("shortcut_friending_tab"))));
        Utils.awaitBackgroundTasksForTests();
        assertNull("an add put the Reels shortcut back", published(ReelsTabForTests.SHORTCUT_ID));
        assertNotNull("Facebook's Friends shortcut was lost", published("shortcut_friending_tab"));

        assertTrue(SettingsEntry.setDynamicShortcuts(manager,
                Arrays.asList(facebooks("shortcut_games"), facebooks(ReelsTabForTests.SHORTCUT_ID))));
        Utils.awaitBackgroundTasksForTests();
        assertNull("a replacement put the Reels shortcut back", published(ReelsTabForTests.SHORTCUT_ID));
        assertNotNull("Facebook's replacement lost its other shortcut", published("shortcut_games"));
        assertNotNull("the Hushfacebook shortcut wasn't published again", published(SettingsEntry.SHORTCUT_ID));

        assertTrue(SettingsEntry.updateShortcuts(manager, Collections.singletonList(facebooks(ReelsTabForTests.SHORTCUT_ID))));
        Utils.awaitBackgroundTasksForTests();
        assertNull("an update put the Reels shortcut back", published(ReelsTabForTests.SHORTCUT_ID));
        assertEquals("pushes held back, counted", 4, counted());
    }

    @Test
    public void aStartTakesOffAReelsShortcutPublishedBefore() throws Exception {
        manager.pushDynamicShortcut(facebooks(ReelsTabForTests.SHORTCUT_ID));
        manager.pushDynamicShortcut(facebooks("shortcut_friending_tab"));

        SettingsEntry.publishShortcut(context);
        Utils.awaitBackgroundTasksForTests();

        assertNull("the Reels shortcut stayed after a start", published(ReelsTabForTests.SHORTCUT_ID));
        assertNotNull(published("shortcut_friending_tab"));
        assertNotNull(published(SettingsEntry.SHORTCUT_ID));
    }

    @Test
    public void offPausedOrLeftOutFacebooksReelsShortcutIsItsOwn() throws Exception {
        Settings.HIDE_REELS_TAB.save(false);
        SettingsEntry.pushDynamicShortcut(manager, facebooks(ReelsTabForTests.SHORTCUT_ID));
        Utils.awaitBackgroundTasksForTests();
        assertNotNull("the switch off held the shortcut back", published(ReelsTabForTests.SHORTCUT_ID));

        Settings.HIDE_REELS_TAB.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
            PauseForTests.pause(reason);
            assertTrue(SettingsEntry.setDynamicShortcuts(manager,
                    Collections.singletonList(facebooks(ReelsTabForTests.SHORTCUT_ID))));
            Utils.awaitBackgroundTasksForTests();
            SettingsEntry.publishShortcut(context);
            Utils.awaitBackgroundTasksForTests();
            assertNotNull("a Hushfacebook paused by " + reason + " held the shortcut back",
                    published(ReelsTabForTests.SHORTCUT_ID));
            PauseForTests.resume();
        }

        ReelsTabForTests.inBuild(Boolean.FALSE);
        SettingsEntry.publishShortcut(context);
        Utils.awaitBackgroundTasksForTests();
        assertNotNull("a build without the patch took the shortcut off", published(ReelsTabForTests.SHORTCUT_ID));
        assertEquals("nothing counted", 0, counted());
    }
}
