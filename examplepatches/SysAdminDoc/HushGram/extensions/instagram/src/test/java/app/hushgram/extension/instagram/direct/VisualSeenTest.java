/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.direct;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.lang.reflect.Field;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;
import app.hushgram.extension.shared.settings.Setting;

/** Runtime decisions only. A sender's receipt still requires a two-account device check. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
public class VisualSeenTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();

    @Before public void start() {
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        Settings.VIEW_DM_MEDIA_ANONYMOUSLY.resetToDefault();
        HookStatus.clear();
    }

    @After public void restore() {
        Settings.VIEW_DM_MEDIA_ANONYMOUSLY.resetToDefault();
        Settings.VIEW_STORIES_ANONYMOUSLY.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        HookStatus.clear();
    }

    @Test public void defaultsOffUntilExplicitlyEnabled() {
        assertFalse(Settings.VIEW_DM_MEDIA_ANONYMOUSLY.defaultValue);
        assertFalse(VisualSeen.hold());
        Settings.VIEW_DM_MEDIA_ANONYMOUSLY.save(true);
        assertTrue(VisualSeen.hold());
        assertTrue(HookStatus.missing(FamilyNames.DM_MEDIA_SEEN).isEmpty());
        Settings.VIEW_DM_MEDIA_ANONYMOUSLY.save(false);
        assertFalse(VisualSeen.hold());
    }

    @Test public void storyViewsAreAnIndependentChoice() {
        Settings.VIEW_STORIES_ANONYMOUSLY.save(true);
        assertFalse(VisualSeen.hold());
        Settings.VIEW_STORIES_ANONYMOUSLY.save(false);
        Settings.VIEW_DM_MEDIA_ANONYMOUSLY.save(true);
        assertTrue(VisualSeen.hold());
    }

    @Test public void pausedAndUnreadyKeepTheNativeReceiptPath() {
        Settings.VIEW_DM_MEDIA_ANONYMOUSLY.save(true);
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertFalse(VisualSeen.hold());
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        SettingsContextRule.withoutContext(() -> assertFalse(VisualSeen.hold()));
        SettingsContextRule.beforeThePauseIsDecided(() -> assertFalse(VisualSeen.hold()));
        assertTrue(VisualSeen.hold());
    }

    @Test public void anUnreadableSettingNeverEscapesIntoInstagram() throws Exception {
        Field value = Setting.class.getDeclaredField("value");
        value.setAccessible(true);
        Object saved = value.get(Settings.VIEW_DM_MEDIA_ANONYMOUSLY);
        try {
            value.set(Settings.VIEW_DM_MEDIA_ANONYMOUSLY, "invalid boolean");
            assertFalse(VisualSeen.hold());
        } finally {
            value.set(Settings.VIEW_DM_MEDIA_ANONYMOUSLY, saved);
        }
    }
}
