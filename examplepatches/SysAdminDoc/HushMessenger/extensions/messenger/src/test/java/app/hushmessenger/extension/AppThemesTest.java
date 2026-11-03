package app.hushmessenger.extension;

import java.util.Arrays;
import java.util.Collections;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class AppThemesTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void startsOffAndUnlocksOnlyWhileTheSwitchIsOn() {
        assertTrue(Settings.installed.contains("app_themes"));
        assertFalse(Settings.unlockAppThemes());
        assertEquals(0, Settings.lastActive("app_themes"));
        Settings.preferences.edit().putBoolean("app_themes", true).commit();
        assertTrue(Settings.unlockAppThemes());
        assertTrue(Settings.lastActive("app_themes") > 0);
        Settings.preferences.edit().putBoolean("app_themes", false).commit();
        assertFalse(Settings.unlockAppThemes());
    }

    @Test public void offPauseSafeModeAndMissingCapabilityKeepMessengersAnswer() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("app_themes", !state.equals("off"))
                    .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            assertFalse(state, Settings.unlockAppThemes());
        }
    }

    @Test public void theControlSitsUnderThemeNextToAppIcons() {
        int icons = -1, themes = -1;
        for (int i = 0; i < SettingsActivity.CONTROLS.length; i++) {
            if (SettingsActivity.CONTROLS[i][0].equals("app_icons")) icons = i;
            if (SettingsActivity.CONTROLS[i][0].equals("app_themes")) themes = i;
        }
        assertEquals(icons + 1, themes);
        String[] row = SettingsActivity.CONTROLS[themes];
        assertEquals("Unlock app themes", row[1]);
        assertEquals("theme", row[3]);
        assertTrue(row[2].contains("Messenger still decides which themes"));
        assertTrue(Arrays.stream(SettingsActivity.CONTROLS).filter(c -> c[0].equals("app_themes")).count() == 1);
    }
}
