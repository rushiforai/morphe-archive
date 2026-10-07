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
public class AppIconsTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void startsOffAndUnlocksOnlyWhileTheSwitchIsOn() {
        assertTrue(Settings.installed.contains("app_icons"));
        assertFalse(Settings.unlockAppIcons());
        assertEquals(0, Settings.lastActive("app_icons"));
        Settings.preferences.edit().putBoolean("app_icons", true).commit();
        assertTrue(Settings.unlockAppIcons());
        assertTrue(Settings.lastActive("app_icons") > 0);
        Settings.preferences.edit().putBoolean("app_icons", false).commit();
        assertFalse(Settings.unlockAppIcons());
    }

    @Test public void offPauseSafeModeAndMissingCapabilityKeepMessengersAnswer() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("app_icons", !state.equals("off"))
                    .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            assertFalse(state, Settings.unlockAppIcons());
        }
    }

    @Test public void theControlSitsUnderThemeWithAnHonestDescription() {
        String[] row = Arrays.stream(SettingsActivity.CONTROLS).filter(c -> c[0].equals("app_icons")).findFirst().orElseThrow();
        assertEquals("Unlock app icons", row[1]);
        assertEquals("theme", row[3]);
        assertTrue(row[2].contains("Messenger still decides whether that setting appears"));
        assertTrue(row[2].contains("default icon back"));
    }
}
