/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.shared.settings.preference;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Application;
import android.content.pm.ApplicationInfo;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Map;

import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.Setting;

/**
 * A process of Facebook's other than the main one never opens the settings file as
 * SharedPreferences: with a {@code .bak} copy there and a half-written file, both stay byte for
 * byte, the values are the copy's, and nothing can be written through it.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReadOnlyPreferencesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private String mainProcess;
    private File file;
    private File backup;

    private static final String WHOLE = "<?xml version='1.0' encoding='utf-8' standalone='yes' ?>\n<map>\n"
            + "    <boolean name=\"flag\" value=\"true\" />\n"
            + "    <string name=\"text\">hello &amp; bye</string>\n"
            + "    <int name=\"count\" value=\"7\" />\n"
            + "    <long name=\"big\" value=\"9000000000\" />\n"
            + "    <float name=\"ratio\" value=\"0.5\" />\n"
            + "    <set name=\"words\">\n        <string>a</string>\n        <string>b</string>\n    </set>\n"
            + "</map>\n";

    private static byte[] bytes(String text) {
        return text.getBytes(StandardCharsets.UTF_8);
    }

    @Before
    public void sideProcess() {
        Application app = RuntimeEnvironment.getApplication();
        ApplicationInfo info = app.getApplicationInfo();
        mainProcess = info.processName;
        File folder = new File(app.getDataDir(), "shared_prefs");
        assertTrue(folder.isDirectory() || folder.mkdirs());
        file = new File(folder, "side_test.xml");
        backup = new File(file.getPath() + ".bak");
        info.processName = app.getPackageName() + ":quicksilver";
    }

    @After
    public void restore() {
        RuntimeEnvironment.getApplication().getApplicationInfo().processName = mainProcess;
        file.delete();
        backup.delete();
    }

    @Test
    public void aSideProcessStartingMidSaveLeavesBothFilesAloneAndReadsTheCopy() throws IOException {
        Files.write(backup.toPath(), bytes(WHOLE));
        byte[] half = bytes(WHOLE.substring(0, WHOLE.indexOf("<string")));
        Files.write(file.toPath(), half);

        SharedPrefCategory category = new SharedPrefCategory("side_test");
        assertTrue(category.preferences instanceof ReadOnlyPreferences);

        assertTrue(category.getBoolean("flag", false));
        assertEquals("hello & bye", category.getString("text", ""));
        assertEquals(7, category.preferences.getInt("count", 0));
        assertEquals(9_000_000_000L, category.preferences.getLong("big", 0));
        assertEquals(0.5f, category.preferences.getFloat("ratio", 0), 0);
        assertEquals(new HashSet<>(Arrays.asList("a", "b")), category.preferences.getStringSet("words", null));
        assertTrue(category.preferences.contains("flag"));
        assertFalse(category.preferences.contains("missing"));

        assertTrue("the backup was consumed", backup.exists());
        assertArrayEquals("the backup changed", bytes(WHOLE), Files.readAllBytes(backup.toPath()));
        assertArrayEquals("the file being written changed", half, Files.readAllBytes(file.toPath()));
    }

    @Test
    public void nothingCanBeWrittenThroughIt() throws IOException {
        Files.write(file.toPath(), bytes(WHOLE));
        SharedPrefCategory category = new SharedPrefCategory("side_test");
        assertFalse(category.preferences.edit().putBoolean("flag", false).commit());
        category.preferences.edit().remove("flag").clear().apply();
        category.saveBoolean("flag", false);
        assertTrue(category.getBoolean("flag", false));
        assertArrayEquals(bytes(WHOLE), Files.readAllBytes(file.toPath()));
    }

    @Test
    public void theParseIsKeptUntilTheFilesChangeAndAFileCutShortKeepsTheLastValues() throws IOException {
        Files.write(file.toPath(), bytes(WHOLE));
        ReadOnlyPreferences preferences = new ReadOnlyPreferences(RuntimeEnvironment.getApplication(), "side_test");
        Map<String, Object> first = preferences.snapshot();
        assertSame("an unchanged file was parsed again", first, preferences.snapshot());

        Files.write(file.toPath(), bytes(WHOLE.replace("value=\"7\"", "value=\"8\" ")));
        Map<String, Object> second = preferences.snapshot();
        assertNotSame(first, second);
        assertEquals(8, second.get("count"));

        Files.write(file.toPath(), bytes(WHOLE.substring(0, 80)));
        assertEquals("a cut file replaced the last values", 8, preferences.snapshot().get("count"));
    }

    @Test
    public void noFileAndNoCopyMeansNothingWasSaved() {
        ReadOnlyPreferences preferences = new ReadOnlyPreferences(RuntimeEnvironment.getApplication(), "side_test");
        assertTrue(preferences.snapshot().isEmpty());
        assertEquals("fallback", preferences.getString("text", "fallback"));
    }

    @Test
    public void theMainProcessStillGetsAndroidsOwnPreferences() {
        RuntimeEnvironment.getApplication().getApplicationInfo().processName = mainProcess;
        assertFalse(new SharedPrefCategory(Setting.PREFERENCES_NAME).preferences instanceof ReadOnlyPreferences);
    }
}
