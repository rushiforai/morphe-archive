/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.drawable.Icon;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SavedShortcutTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    @After public void restore() {
        Settings.SAVED_SHORTCUT.resetToDefault();
        PauseForTests.resume();
    }

    static boolean aStartPublishes() {
        Context context = RuntimeEnvironment.getApplication();
        ShortcutManager manager = context.getSystemService(ShortcutManager.class);
        manager.removeDynamicShortcuts(Collections.singletonList(SavedShortcut.ID));
        addRoute(context);
        SavedShortcut.refreshNow(context);
        return shortcut(manager) != null;
    }

    private static void addRoute(Context context) {
        ResolveInfo info = new ResolveInfo();
        info.activityInfo = new ActivityInfo();
        info.activityInfo.packageName = context.getPackageName();
        info.activityInfo.name = context.getPackageName() + ".IntentUriHandler";
        shadowOf(context.getPackageManager()).addResolveInfoForIntent(SavedShortcut.intent(context), info);
    }

    private static ShortcutInfo shortcut(ShortcutManager manager) {
        for (ShortcutInfo shortcut : manager.getDynamicShortcuts()) {
            if (SavedShortcut.ID.equals(shortcut.getId())) return shortcut;
        }
        return null;
    }

    private static ShortcutInfo stock(Context context, String id, int rank) {
        return new ShortcutInfo.Builder(context, id).setShortLabel(id)
                .setIntent(new Intent(Intent.ACTION_MAIN).setPackage(context.getPackageName()))
                .setRank(rank).build();
    }

    @Test public void defaultOffLeavesFacebooksEntriesAlone() {
        Context context = RuntimeEnvironment.getApplication();
        ShortcutManager manager = context.getSystemService(ShortcutManager.class);
        ShortcutInfo entry = stock(context, "notifications", 2);
        manager.addDynamicShortcuts(Collections.singletonList(entry));
        assertFalse(Settings.SAVED_SHORTCUT.savedValue());
        assertEquals(SavedShortcut.Result.OFF, SavedShortcut.refreshNow(context));
        assertEquals(Collections.singletonList(entry), manager.getDynamicShortcuts());
    }

    @Test public void publishedEntryKeepsTheDeepLinkAndCurrentInstallIdentity() {
        Settings.SAVED_SHORTCUT.save(true);
        assertTrue(aStartPublishes());
        Context context = RuntimeEnvironment.getApplication();
        ShortcutInfo saved = shortcut(context.getSystemService(ShortcutManager.class));
        assertEquals("fb://saved", saved.getIntent().getDataString());
        assertEquals(Intent.ACTION_VIEW, saved.getIntent().getAction());
        assertEquals(context.getPackageName(), saved.getIntent().getComponent().getPackageName());
        assertFalse(saved.getIntent().getBooleanExtra(SettingsEntry.EXTRA_OPEN_SETTINGS, false));
        assertEquals(Intent.FLAG_ACTIVITY_NEW_TASK,
                saved.getIntent().getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK);
    }

    @Test public void launcherIconDoesNotBorrowAnotherPackagesResource() {
        Settings.SAVED_SHORTCUT.save(true);
        assertTrue(aStartPublishes());
        Context context = RuntimeEnvironment.getApplication();
        Icon icon = ReflectionHelpers.callInstanceMethod(
                shortcut(context.getSystemService(ShortcutManager.class)), "getIcon");
        assertNotNull(icon);
        assertTrue("Android rejects resource icons outside the shortcut owner package",
                icon.getType() != Icon.TYPE_RESOURCE
                        || context.getPackageName().equals(icon.getResPackage()));
    }

    @Test public void fullLauncherNeverEvictsOrReordersFacebooksEntries() {
        Context context = RuntimeEnvironment.getApplication();
        ShortcutManager manager = context.getSystemService(ShortcutManager.class);
        int capacity = manager.getMaxShortcutCountPerActivity();
        assertTrue(capacity > 0);
        List<ShortcutInfo> entries = new ArrayList<>();
        for (int i = 0; i < capacity; i++) entries.add(stock(context, "stock" + i, i));
        manager.addDynamicShortcuts(entries);
        List<ShortcutInfo> before = new ArrayList<>(manager.getDynamicShortcuts());
        addRoute(context);
        Settings.SAVED_SHORTCUT.save(true);
        assertEquals(SavedShortcut.Result.NO_ROOM, SavedShortcut.refreshNow(context));
        assertEquals(before, manager.getDynamicShortcuts());
        for (ShortcutInfo entry : before) {
            int originalRank = Integer.parseInt(entry.getId().substring("stock".length()));
            assertEquals(originalRank, entry.getRank());
        }
        assertNull(shortcut(manager));
    }

    @Test public void disablingRemovesOnlyOurSavedEntry() {
        Context context = RuntimeEnvironment.getApplication();
        ShortcutManager manager = context.getSystemService(ShortcutManager.class);
        ShortcutInfo entry = stock(context, "friends", 0);
        manager.addDynamicShortcuts(Collections.singletonList(entry));
        Settings.SAVED_SHORTCUT.save(true);
        assertTrue(aStartPublishes());
        Settings.SAVED_SHORTCUT.save(false);
        assertEquals(SavedShortcut.Result.OFF, SavedShortcut.refreshNow(context));
        assertEquals(Collections.singletonList(entry), manager.getDynamicShortcuts());
    }

    @Test public void missingPublicRouteLeavesNavigationAndOtherShortcutsIntact() {
        Context context = RuntimeEnvironment.getApplication();
        ShortcutManager manager = context.getSystemService(ShortcutManager.class);
        ShortcutInfo entry = stock(context, "notifications", 0);
        manager.addDynamicShortcuts(Collections.singletonList(entry));
        Settings.SAVED_SHORTCUT.save(true);
        assertEquals(SavedShortcut.Result.UNAVAILABLE, SavedShortcut.refreshNow(context));
        assertEquals(Collections.singletonList(entry), manager.getDynamicShortcuts());
    }

    @Test public void pauseRemovesTheEntryAndResumeKeepsTheSavedChoice() {
        Context context = RuntimeEnvironment.getApplication();
        ShortcutManager manager = context.getSystemService(ShortcutManager.class);
        Settings.SAVED_SHORTCUT.save(true);
        assertTrue(aStartPublishes());
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertEquals(SavedShortcut.Result.OFF, SavedShortcut.refreshNow(context));
        assertNull(shortcut(manager));
        assertTrue(Settings.SAVED_SHORTCUT.savedValue());
        PauseForTests.resume();
        assertTrue(aStartPublishes());
    }

    @Test public void languageChangeRelabelsOnlyTheExistingSavedEntry() {
        Context context = RuntimeEnvironment.getApplication();
        ShortcutManager manager = context.getSystemService(ShortcutManager.class);
        Settings.SAVED_SHORTCUT.save(true);
        assertTrue(aStartPublishes());
        RuntimeEnvironment.setQualifiers("+de");
        assertEquals(SavedShortcut.Result.PUBLISHED, SavedShortcut.refreshNow(context));
        assertEquals("Gespeichert", String.valueOf(shortcut(manager).getShortLabel()));
        assertEquals(1, manager.getDynamicShortcuts().size());
    }
}
