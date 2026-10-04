/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import android.os.Bundle;

import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.Setting;

import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Map;

import static org.junit.Assert.*;

/** Legacy files supply both choices, while sparse and new files preserve independent choices. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, manifest = Config.NONE)
public class StoriesSettingsBackupTest {
    private static final String LEGACY = "hushfacebook_hide_stories_tray";
    private static final String TOP = "hushfacebook_hide_top_stories_tray";
    private static final String BETWEEN = "hushfacebook_hide_stories_between_posts";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void loadSettings() {
        Settings.HIDE_STORIES_YOU_MIGHT_LIKE.get();
    }

    @After public void resetSettings() {
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) setting.resetToDefault();
    }

    @Test public void exportCarriesOnlyTheIndependentKeys() throws Exception {
        JSONObject values = new JSONObject(SettingsBackup.create()).getJSONObject("settings");
        assertFalse("the obsolete combined key was exported", values.has(LEGACY));
        assertTrue(values.getBoolean(TOP));
        assertTrue(values.getBoolean(BETWEEN));
    }

    @Test public void anExplicitLegacyChoiceSuppliesBothIndependentChoices() throws Exception {
        for (boolean value : new boolean[]{false, true}) {
            SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file(LEGACY, value));
            assertEquals(2, snapshot.values.size());
            assertEquals(value, incoming(snapshot, TOP));
            assertEquals(value, incoming(snapshot, BETWEEN));
            assertEquals(0, snapshot.unknown);
        }
    }

    @Test public void explicitIndependentKeysOverrideOnlyTheirOwnLegacyValue() throws Exception {
        for (boolean value : new boolean[]{false, true}) {
            for (boolean legacyFirst : new boolean[]{false, true}) {
                String file = legacyFirst ? file(LEGACY, value, TOP, !value)
                        : file(TOP, !value, LEGACY, value);
                SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
                assertEquals(!value, incoming(snapshot, TOP));
                assertEquals(value, incoming(snapshot, BETWEEN));
                assertEquals(0, snapshot.unknown);

                snapshot = SettingsBackup.parse(file(LEGACY, value, BETWEEN, !value));
                assertEquals(value, incoming(snapshot, TOP));
                assertEquals(!value, incoming(snapshot, BETWEEN));
            }
        }
    }

    @Test public void omittingTheLegacyAndIndependentKeysLeavesBothChoicesAlone() throws Exception {
        setting(TOP).save(false);
        setting(BETWEEN).save(true);
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file(Settings.HIDE_SUGGESTED_POSTS.key, false));
        assertEquals(1, SettingsBackup.apply(snapshot));
        assertFalse(setting(TOP).savedValue());
        assertTrue(setting(BETWEEN).savedValue());
        assertEquals(1, snapshot.values.size());
    }

    @Test public void anIndependentSparseFileLeavesTheOtherChoiceAlone() throws Exception {
        setting(TOP).save(false);
        setting(BETWEEN).save(false);
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file(TOP, true));
        assertEquals(1, SettingsBackup.apply(snapshot));
        assertTrue(setting(TOP).savedValue());
        assertFalse(setting(BETWEEN).savedValue());
    }

    @Test public void allFourIndependentChoicesRoundTripThroughFileAndPreviewState() throws Exception {
        for (boolean top : new boolean[]{false, true}) {
            for (boolean between : new boolean[]{false, true}) {
                setting(TOP).save(top);
                setting(BETWEEN).save(between);
                SettingsBackup.Snapshot snapshot = SettingsBackup.parse(SettingsBackup.create());
                Bundle state = snapshot.toBundle();
                snapshot = SettingsBackup.Snapshot.fromBundle(state);
                assertNotNull(snapshot);
                assertEquals(top, incoming(snapshot, TOP));
                assertEquals(between, incoming(snapshot, BETWEEN));
                setting(TOP).save(!top);
                setting(BETWEEN).save(!between);
                assertEquals(2, SettingsBackup.apply(snapshot));
                assertEquals(top, setting(TOP).savedValue());
                assertEquals(between, setting(BETWEEN).savedValue());
            }
        }
    }

    @Test public void malformedLegacyValuesRefuseTheWholeFile() throws Exception {
        for (Object value : new Object[]{"false", 0, JSONObject.NULL, new JSONObject()}) {
            try {
                SettingsBackup.parse(file(TOP, false, LEGACY, value));
                fail("the malformed legacy choice was accepted");
            } catch (SettingsBackup.Rejected rejected) {
                assertEquals(SettingsBackup.Reason.VALUE, rejected.reason);
            }
        }
    }

    private static BooleanSetting setting(String key) {
        Setting<?> setting = Setting.getSettingFromPath(key);
        assertNotNull("the independent setting is missing: " + key, setting);
        assertTrue(setting instanceof BooleanSetting);
        return (BooleanSetting) setting;
    }

    private static boolean incoming(SettingsBackup.Snapshot snapshot, String key) {
        for (Map.Entry<BooleanSetting, Boolean> entry : snapshot.values.entrySet()) {
            if (key.equals(entry.getKey().key)) return entry.getValue();
        }
        throw new AssertionError("the independent incoming value is missing: " + key);
    }

    private static String file(Object... pairs) throws Exception {
        JSONObject settings = new JSONObject();
        for (int i = 0; i < pairs.length; i += 2) settings.put((String) pairs[i], pairs[i + 1]);
        return new JSONObject().put("format", SettingsBackup.FORMAT).put("schema", 1)
                .put("settings", settings).toString();
    }
}
