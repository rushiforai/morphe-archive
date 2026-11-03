package app.morphe.extension.pinedrama.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import app.morphe.extension.pinedrama.SettingsContextRule;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** Hide the HushPine row (#264): the patched Settings and privacy list asks this before adding it. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class SettingsRowVisibilityTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void reset() {
        Settings.HIDE_SETTINGS_ROW.resetToDefault();
    }

    @Test
    public void theRowShowsUntilTheSwitchIsOn() {
        assertFalse(Settings.HIDE_SETTINGS_ROW.defaultValue);
        assertTrue(PineDramaActivityHook.showSettingsRow());

        Settings.HIDE_SETTINGS_ROW.save(true);
        assertFalse(PineDramaActivityHook.showSettingsRow());

        Settings.HIDE_SETTINGS_ROW.save(false);
        assertTrue(PineDramaActivityHook.showSettingsRow());
    }

    @Test
    public void theRowGoesFirstOnlyWhileItShows() {
        Object row = new Object();
        List<Object> rows = new ArrayList<>(Arrays.asList("a", "b"));
        PineDramaActivityHook.addSettingsRowFirst(rows, row);
        assertEquals(Arrays.asList(row, "a", "b"), rows);

        Settings.HIDE_SETTINGS_ROW.save(true);
        rows = new ArrayList<>(Arrays.asList("a", "b"));
        PineDramaActivityHook.addSettingsRowFirst(rows, row);
        PineDramaActivityHook.addSettingsRowLast(rows, row);
        assertEquals(Arrays.asList("a", "b"), rows);

        Settings.HIDE_SETTINGS_ROW.save(false);
        PineDramaActivityHook.addSettingsRowLast(rows, row);
        assertEquals(Arrays.asList("a", "b", row), rows);
    }

    @Test
    public void theSwitchTravelsWithBackups() {
        assertTrue(Settings.HIDE_SETTINGS_ROW.includeWithImportExport);
    }
}
