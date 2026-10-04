package app.hushtelegram.extension.telegram.settings;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.fuzz.BoundedJsonGrammar;
import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.Setting;

import java.io.ByteArrayInputStream;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Random;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

/** The real read/parse/apply path must reject the whole import before any switch changes. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SettingsBackupPropertyTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();

    @Before public void seedPreferences() {
        int i = 0;
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) setting.save(i++ % 2 == 0);
        BaseSettings.DEBUG.save(true);
        Setting.preferences.preferences.edit().putString("grammar_private_control", "caf\u00e9\u732bQ9").commit();
    }

    @After public void restorePreferences() {
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) setting.resetToDefault();
        BaseSettings.DEBUG.resetToDefault();
        Setting.preferences.preferences.edit().remove("grammar_private_control").commit();
    }

    @Test(timeout = 20_000) public void validGrammarImportsChangeExactlyTheirNamedSwitches() throws Exception {
        long started = System.nanoTime();
        for (long seed : BoundedJsonGrammar.seeds()) {
            Random random = new Random(seed);
            for (int sample = 0; sample < BoundedJsonGrammar.SAMPLES / 4; sample++) {
                Map<String, Object> expectedStore = new HashMap<>(Setting.preferences.preferences.getAll());
                Map<BooleanSetting, Boolean> expected = new LinkedHashMap<>();
                Map<String, Object> switches = new LinkedHashMap<>();
                for (BooleanSetting setting : SettingsBackup.ALLOWLIST) {
                    boolean value = !setting.savedValue();
                    switches.put(setting.key, value);
                    expected.put(setting, value);
                    if (value == setting.defaultValue) expectedStore.remove(setting.key);
                    else expectedStore.put(setting.key, value);
                }
                switches.put("futureSwitch", BoundedJsonGrammar.object(random, sample));
                Map<String, Object> root = root(switches);
                root.put("futureRoot", BoundedJsonGrammar.object(random, sample));
                String text = BoundedJsonGrammar.render(root, random);
                BoundedJsonGrammar.requireSize(text);
                if (sample % 2 == 0) text = '\uFEFF' + text;
                SettingsBackup.Snapshot snapshot = SettingsBackup.parse(read(text));
                assertEquals(expected, snapshot.values);
                assertEquals(2, snapshot.unknown);
                assertEquals(SettingsBackup.ALLOWLIST.size(), SettingsBackup.apply(snapshot));
                assertEquals(expectedStore, Setting.preferences.preferences.getAll());
                for (Map.Entry<BooleanSetting, Boolean> entry : expected.entrySet()) {
                    assertEquals(entry.getKey().key, entry.getValue(), entry.getKey().savedValue());
                }
                assertEquals(expected, SettingsBackup.parse(SettingsBackup.create()).values);
                BoundedJsonGrammar.requireTime(started);
            }
        }
    }

    @Test(timeout = 20_000) public void rejectedGrammarMutationsPreserveStoredAndLivePreferences() throws Exception {
        long started = System.nanoTime();
        Map<String, ?> stored = new HashMap<>(Setting.preferences.preferences.getAll());
        Map<Setting<?>, Object> live = new LinkedHashMap<>();
        for (Setting<?> setting : Setting.allLoadedSettings()) live.put(setting, setting.savedValue());
        for (long seed : BoundedJsonGrammar.seeds()) {
            Random random = new Random(seed);
            for (int sample = 0; sample < BoundedJsonGrammar.SAMPLES / 4; sample++) {
                BooleanSetting setting = SettingsBackup.ALLOWLIST.get(sample % SettingsBackup.ALLOWLIST.size());
                Map<String, Object> switches = new LinkedHashMap<>();
                switches.put(setting.key, !setting.savedValue());
                switches.put("futureSwitch", BoundedJsonGrammar.object(random, sample));
                Map<String, Object> root = root(switches);
                String good = BoundedJsonGrammar.render(root, random);
                BoundedJsonGrammar.requireSize(good);
                requireRejected(good.substring(0, good.length() - 1), SettingsBackup.Reason.DAMAGED, stored, live);
                requireRejected(good + " true", SettingsBackup.Reason.DAMAGED, stored, live);
                for (String invalid : new String[]{"\\q", "\\u12xz", "\\u123", "raw\nline", "raw\tline"}) {
                    requireRejected(fileWithSettings("{\"" + setting.key + "\":" + !setting.savedValue()
                            + ",\"future\":\"" + invalid + "\"}"), SettingsBackup.Reason.DAMAGED, stored, live);
                }
                requireRejected("{\"for" + "\\u006d" + "at\":\"hushtelegram-settings\"," + good.substring(1),
                        SettingsBackup.Reason.DUPLICATE, stored, live);
                String twice = "{\"" + setting.key + "\":false," + BoundedJsonGrammar.escapedName(setting.key, random) + ":true}";
                requireRejected(fileWithSettings(twice), SettingsBackup.Reason.DUPLICATE, stored, live);
                Map<String, Object> wrong = new LinkedHashMap<>(root);
                wrong.put("format", false);
                requireRejected(BoundedJsonGrammar.render(wrong, random), SettingsBackup.Reason.FORMAT, stored, live);
                wrong.put("format", SettingsBackup.FORMAT);
                wrong.put("schema", new BigDecimal("1.0"));
                requireRejected(BoundedJsonGrammar.render(wrong, random), SettingsBackup.Reason.FORMAT, stored, live);
                wrong.put("schema", 2);
                requireRejected(BoundedJsonGrammar.render(wrong, random), SettingsBackup.Reason.SCHEMA, stored, live);
                switches.put(setting.key, new Object[]{"false", 0, null, new BigDecimal("1.125")}[sample % 4]);
                requireRejected(BoundedJsonGrammar.render(root, random), SettingsBackup.Reason.VALUE, stored, live);
                String deep = "0";
                for (int i = 0; i < 9; i++) deep = "{\"field\":" + deep + "}";
                requireRejected(fileWithSettings("{\"" + setting.key + "\":false,\"future\":" + deep + "}"),
                        SettingsBackup.Reason.DAMAGED, stored, live);
                requireRejected(fileWithSettings("{\"" + setting.key + "\":false,\"future\":\"" + "x".repeat(1025) + "\"}"),
                        SettingsBackup.Reason.DAMAGED, stored, live);
                requireRejected(fileWithSettings("{\"" + setting.key + "\":false,\"future\":[" + "0,".repeat(256) + "0]}"),
                        SettingsBackup.Reason.DAMAGED, stored, live);
                requireRejected(good + " ".repeat(SettingsBackup.MAX_BYTES), SettingsBackup.Reason.SIZE, stored, live);
                byte[] bad = good.getBytes(StandardCharsets.UTF_8);
                bad[bad.length - 1] = (byte) 0xC0;
                try {
                    SettingsBackup.apply(SettingsBackup.parse(SettingsBackup.read(new ByteArrayInputStream(bad))));
                    fail("Malformed generated UTF-8 was imported");
                } catch (SettingsBackup.Rejected rejected) { assertEquals(SettingsBackup.Reason.ENCODING, rejected.reason); }
                requirePreferences(stored, live);
                BoundedJsonGrammar.requireTime(started);
            }
        }
    }

    private static Map<String, Object> root(Map<String, Object> switches) {
        Map<String, Object> root = new LinkedHashMap<>();
        root.put("format", SettingsBackup.FORMAT);
        root.put("schema", 1);
        root.put("settings", switches);
        return root;
    }

    private static String fileWithSettings(String settings) {
        return "{\"format\":\"hushtelegram-settings\",\"schema\":1,\"settings\":" + settings + "}";
    }

    private static String read(String text) throws SettingsBackup.Rejected {
        return SettingsBackup.read(new ByteArrayInputStream(text.getBytes(StandardCharsets.UTF_8)));
    }

    private static void requireRejected(String text, SettingsBackup.Reason reason, Map<String, ?> stored,
                                        Map<Setting<?>, Object> live) throws Exception {
        if (text.getBytes(StandardCharsets.UTF_8).length > SettingsBackup.MAX_BYTES + BoundedJsonGrammar.MAX_BYTES) {
            throw new AssertionError("A rejected-import mutation exceeded its size budget");
        }
        try {
            SettingsBackup.apply(SettingsBackup.parse(read(text)));
            fail("Generated rejected import was applied: " + reason);
        } catch (SettingsBackup.Rejected rejected) { assertEquals(reason, rejected.reason); }
        requirePreferences(stored, live);
    }

    private static void requirePreferences(Map<String, ?> stored, Map<Setting<?>, Object> live) {
        assertEquals(stored, Setting.preferences.preferences.getAll());
        for (Map.Entry<Setting<?>, Object> entry : live.entrySet()) {
            assertEquals(entry.getKey().key, entry.getValue(), entry.getKey().savedValue());
        }
        assertEquals(true, BaseSettings.DEBUG.savedValue());
    }
}
