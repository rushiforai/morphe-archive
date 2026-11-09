/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.Settings;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SecretChatsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        Settings.DISABLE_SECRET_CHATS.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        Settings.DISABLE_SECRET_CHATS.resetToDefault();
        HookStatus.clear();
    }

    @Test public void requestsAreAcceptedUntilTheSwitchIsOn() {
        assertFalse(Settings.DISABLE_SECRET_CHATS.get());
        assertFalse(SecretChats.refuse());
    }

    @Test public void switchOnIgnoresTheRequest() {
        Settings.DISABLE_SECRET_CHATS.save(true);
        assertTrue(SecretChats.refuse());
        Settings.DISABLE_SECRET_CHATS.save(false);
        assertFalse(SecretChats.refuse());
    }
}
