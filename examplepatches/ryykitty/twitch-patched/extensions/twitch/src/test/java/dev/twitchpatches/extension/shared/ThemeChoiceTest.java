package dev.twitchpatches.extension.shared;

import org.junit.Test;
import static org.junit.Assert.*;

public class ThemeChoiceTest {
    @Test public void explicitThemeOverridesSystemTheme() {
        assertTrue(ThemeChoice.light("LIGHT", true));
        assertFalse(ThemeChoice.light("DARK", false));
    }

    @Test public void defaultThemeFollowsConfigurationChanges() {
        assertTrue(ThemeChoice.light("SYSTEM_DEFAULT", false));
        assertFalse(ThemeChoice.light("SYSTEM_DEFAULT", true));
        assertTrue(ThemeChoice.light(null, false));
    }
}
