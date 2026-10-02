/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.misc;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;

import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;

/** Open developer options' answer to a long press of Home. */
@RunWith(RobolectricTestRunner.class)
public class DeveloperOptionsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        Settings.OPEN_DEVELOPER_OPTIONS.resetToDefault();
    }

    @Test
    public void onTheLongPressOpensTheOptions() {
        Settings.OPEN_DEVELOPER_OPTIONS.save(true);
        assertEquals(1, DeveloperOptions.open());
    }

    @Test
    public void offTheLongPressDoesWhatItDid() {
        Settings.OPEN_DEVELOPER_OPTIONS.save(false);
        assertEquals(0, DeveloperOptions.open());
    }
}
