/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.List;

import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.Utils;

/**
 * The launcher shortcut on every Android Instagram 449 runs on. Android 11 added
 * pushDynamicShortcut, and Instagram's floor is Android 9, so on 9 and 10 the shortcut has to be
 * published without it: one copy, at rank 0, with the last of Instagram's own making room when
 * they fill the limit.
 */
@RunWith(RobolectricTestRunner.class)
public class SettingsEntryShortcutTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Context context;
    private ShortcutManager manager;

    @Before
    public void setUp() throws Exception {
        // A shortcut check another class queued on a background thread would race this one's.
        Utils.awaitBackgroundTasksForTests();
        context = RuntimeEnvironment.getApplication();
        manager = context.getSystemService(ShortcutManager.class);
        Shadows.shadowOf(manager).setMaxShortcutCountPerActivity(5);
    }

    @Config(sdk = 28)
    @Test
    public void android9PublishesOneCopyInFront() {
        SettingsEntry.publishShortcutNow(context);
        SettingsEntry.publishShortcutNow(context);
        assertEquals(1, ids().size());
        ShortcutInfo ours = ours();
        assertEquals(0, ours.getRank());
        assertTrue(ours.getIntent().getBooleanExtra(SettingsEntry.EXTRA_OPEN_SETTINGS, false));
    }

    @Config(sdk = 28)
    @Test
    public void android9MakesRoomByDroppingTheLastRankedWhenInstagramFillsTheLimit() {
        List<ShortcutInfo> instagrams = new ArrayList<>();
        for (int rank = 0; rank < 5; rank++) instagrams.add(instagram("ig" + rank, rank));
        manager.addDynamicShortcuts(instagrams);

        SettingsEntry.publishShortcutNow(context);

        List<String> ids = ids();
        assertEquals(ids.toString(), 5, ids.size());
        assertTrue(ids.contains(SettingsEntry.SHORTCUT_ID));
        assertFalse("the last-ranked shortcut is the one a push evicts", ids.contains("ig4"));
        assertTrue(ids.contains("ig0"));
    }

    @Config(sdk = 28)
    @Test
    public void android9KeepsInstagramsOwnWhenThereIsRoom() {
        manager.addDynamicShortcuts(List.of(instagram("ig0", 0), instagram("ig1", 1)));
        SettingsEntry.publishShortcutNow(context);
        List<String> ids = ids();
        assertEquals(ids.toString(), 3, ids.size());
        assertTrue(ids.contains("ig0") && ids.contains("ig1"));
    }

    @Config(sdk = 30)
    @Test
    public void android11PushesThroughThePlatform() {
        SettingsEntry.publishShortcutNow(context);
        assertEquals(List.of(SettingsEntry.SHORTCUT_ID), ids());
    }

    private ShortcutInfo instagram(String id, int rank) {
        return new ShortcutInfo.Builder(context, id)
                .setShortLabel(id)
                .setIntent(new Intent(Intent.ACTION_VIEW).setPackage(context.getPackageName()))
                .setRank(rank)
                .build();
    }

    private List<String> ids() {
        List<String> ids = new ArrayList<>();
        for (ShortcutInfo shortcut : manager.getDynamicShortcuts()) ids.add(shortcut.getId());
        return ids;
    }

    private ShortcutInfo ours() {
        for (ShortcutInfo shortcut : manager.getDynamicShortcuts()) {
            if (SettingsEntry.SHORTCUT_ID.equals(shortcut.getId())) return shortcut;
        }
        throw new AssertionError("no HushGram shortcut in " + ids());
    }
}
