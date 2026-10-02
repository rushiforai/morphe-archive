/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.SwitchPreference;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.Setting;

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

import java.util.Collections;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.Set;

/**
 * Opening the settings screen stores nothing. Each row stored the value it was shown when its key
 * was missing, so one look stored every default, and a later release that changed a default never
 * reached anyone who had opened the screen.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class SettingsScreenDefaultsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PatchFamily.inBuildForTests = null;
        Settings.HIDE_ADS.resetToDefault();
        Settings.CHECK_FOR_RELEASES.resetToDefault();
    }

    private static SharedPreferences store() {
        return RuntimeEnvironment.getApplication().getSharedPreferences(Setting.preferences.name, Context.MODE_PRIVATE);
    }

    private static HushTelegramPreferenceFragment open(ActivityController<Activity> controller) {
        HushTelegramPreferenceFragment fragment = new HushTelegramPreferenceFragment();
        controller.get().getFragmentManager().beginTransaction()
                .add(android.R.id.content, fragment)
                .commitNow();
        return fragment;
    }

    @Test
    public void openingTheScreenStoresNoDefault() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        Set<String> before = new HashSet<>(store().getAll().keySet());
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment fragment = open(controller);
            ShadowLooper.idleMainLooper();

            Set<String> added = new HashSet<>(store().getAll().keySet());
            added.removeAll(before);
            assertEquals("opening the screen stored " + added, Collections.emptySet(), added);
            // The release check starts off, and a later default change has to reach everyone who
            // only looked.
            assertNotNull("no row for the release check",
                    find(fragment.getPreferenceScreen(), Settings.CHECK_FOR_RELEASES.key));
            assertFalse(added.contains(Settings.CHECK_FOR_RELEASES.key));
        }
    }

    /** The mutation control: a switch the person turns is still stored, and the setting follows it. */
    @Test
    public void aSwitchThePersonTurnsIsStored() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        String key = Settings.HIDE_ADS.key;
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            SwitchPreference row = find(open(controller).getPreferenceScreen(), key);
            assertNotNull("no row for " + key, row);

            row.setChecked(!row.isChecked());
            ShadowLooper.idleMainLooper();

            assertTrue("the turned switch wasn't stored", store().contains(key));
            assertEquals(row.isChecked(), store().getBoolean(key, !row.isChecked()));
            assertEquals(row.isChecked(), Settings.HIDE_ADS.get());
        }
    }

    private static SwitchPreference find(PreferenceGroup group, String key) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference preference = group.getPreference(i);
            if (preference instanceof SwitchPreference && key.equals(preference.getKey())) {
                return (SwitchPreference) preference;
            }
            if (preference instanceof PreferenceGroup) {
                SwitchPreference found = find((PreferenceGroup) preference, key);
                if (found != null) return found;
            }
        }
        return null;
    }
}
