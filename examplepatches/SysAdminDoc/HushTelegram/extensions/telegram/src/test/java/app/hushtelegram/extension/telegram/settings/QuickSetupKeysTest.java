/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at 44fb933 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.Setting;

/** Quick setups' lists name real switches, none twice, and only the feature switches a settings file carries. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class QuickSetupKeysTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Test
    public void everyKeyIsASwitchInSettingsAndNoListIsEmpty() throws Exception {
        Set<BooleanSetting> declared = new HashSet<>();
        for (Field field : Settings.class.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) && Modifier.isPublic(field.getModifiers())
                    && field.getType() == BooleanSetting.class) {
                declared.add((BooleanSetting) field.get(null));
            }
        }
        assertTrue("found too few switches to compare against: " + declared.size(), declared.size() > 20);
        for (List<BooleanSetting> list : Arrays.asList(QuickSetupKeys.QUIET, QuickSetupKeys.PRIVACY, QuickSetupKeys.DEFAULTS)) {
            assertFalse(list.isEmpty());
            assertEquals("a switch is listed twice: " + list, list.size(), new HashSet<>(list).size());
            for (BooleanSetting setting : list) {
                assertTrue(setting.key + " isn't one of Settings' switches", declared.contains(setting));
                assertSame(setting, Setting.getSettingFromPath(setting.key));
            }
        }
    }

    @Test
    public void quietAndPrivacyOnlyTurnFeatureSwitchesOn() {
        for (List<BooleanSetting> list : Arrays.asList(QuickSetupKeys.QUIET, QuickSetupKeys.PRIVACY)) {
            assertTrue("a choice reaches past the feature switches: " + list, SettingsBackup.ALLOWLIST.containsAll(list));
        }
        for (Map<BooleanSetting, Boolean> choice : Arrays.asList(QuickSetupKeys.quiet(), QuickSetupKeys.privacy())) {
            for (Boolean value : choice.values()) assertTrue(value);
        }
        Map<BooleanSetting, Boolean> defaults = QuickSetupKeys.defaults();
        assertEquals(SettingsBackup.ALLOWLIST.size(), defaults.size());
        for (Map.Entry<BooleanSetting, Boolean> value : defaults.entrySet()) {
            assertEquals(value.getKey().key, value.getKey().defaultValue, value.getValue());
        }
        // Pause, debug, the release check, UnifiedPush and chat type folders are nobody's quick setup.
        for (BooleanSetting kept : Arrays.asList(BaseSettings.PAUSED, BaseSettings.DEBUG, Settings.CHECK_FOR_RELEASES,
                Settings.UNIFIED_PUSH, Settings.CHAT_TYPE_FOLDERS)) {
            assertFalse(kept.key, defaults.containsKey(kept));
        }
    }

    /**
     * Neither choice that turns switches on asks for a restart on a fresh install: Quick setups changes
     * them at once, and a restart-gated switch that starts off would make every use of it a restart.
     * One that starts on, like Hide Stories, asks only where someone turned it off themselves.
     */
    @Test
    public void quietAndPrivacyNeedNoRestartFromTheDefaults() {
        for (List<BooleanSetting> list : Arrays.asList(QuickSetupKeys.QUIET, QuickSetupKeys.PRIVACY)) {
            for (BooleanSetting setting : list) {
                if (setting.rebootApp) assertTrue(setting.key + " needs a restart from its default", setting.defaultValue);
            }
        }
        assertTrue(QuickSetupKeys.QUIET.contains(Settings.HIDE_STORIES));
        assertTrue(Settings.HIDE_STORIES.rebootApp);
    }
}
