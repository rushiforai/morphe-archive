/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.theme;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;

/**
 * The selected tab's one hook (#297): Material You's accent and a picked tab color both come
 * through it, and the picked color is the last word when both patches are in.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SelectedTabTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final int DARK_SELECTED = 0xFFF2F4F7;

    @Before
    public void usePalette() {
        DarkMode.answer(true);
        MaterialYouTheme.use(TonePalette.fallback(), false);
    }

    @After
    public void restore() {
        Settings.TAB_COLOR.resetToDefault();
        MaterialYouTheme.use(TonePalette.fallback(), false);
    }

    @Test
    public void thePickedColorWinsOverMaterialYou() {
        Settings.TAB_COLOR.save("#2ECC71");
        assertEquals(0xFF2ECC71, SelectedTab.colour(DARK_SELECTED, true, true));
        assertEquals(0xFF2ECC71, SelectedTab.colour(DARK_SELECTED, false, true));
    }

    @Test
    public void withoutAPickMaterialYouStillTakesTheTab() {
        int accent = MaterialYouTheme.tabBarSelected(DARK_SELECTED);
        assertEquals(accent, SelectedTab.colour(DARK_SELECTED, true, true));
        assertEquals(DARK_SELECTED, SelectedTab.colour(DARK_SELECTED, false, true));
        assertEquals(DARK_SELECTED, SelectedTab.colour(DARK_SELECTED, false, false));
    }

    @Test
    public void aPickWithoutBadgeAndLogoColorsInTheBuildChangesNothing() {
        Settings.TAB_COLOR.save("#2ECC71");
        assertEquals(DARK_SELECTED, SelectedTab.colour(DARK_SELECTED, false, false));
    }
}
