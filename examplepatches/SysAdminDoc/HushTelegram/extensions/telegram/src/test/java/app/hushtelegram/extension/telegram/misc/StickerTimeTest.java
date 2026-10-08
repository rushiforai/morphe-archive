/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
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
public class StickerTimeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_STICKER_TIME);
        Settings.HIDE_STICKER_TIME.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultEveryMessageKeepsItsTime() {
        assertFalse(Settings.HIDE_STICKER_TIME.get());
        assertFalse(StickerTime.on());
        assertFalse(StickerTime.hidden(new Object()));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.HIDE_STICKER_TIME));
    }

    @Test public void onOnlyAStickerSkipsItsTime() {
        Settings.HIDE_STICKER_TIME.save(true);
        assertTrue(StickerTime.on());
        // The unpatched stub calls nothing a sticker, and an empty bubble asks with no message.
        assertFalse(StickerTime.hidden(new Object()));
        assertFalse(StickerTime.hidden(null));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTheTime() {
        Settings.HIDE_STICKER_TIME.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), StickerTime.on());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(StickerTime.on()));
        SettingReadsForTests.breakReads(Settings.HIDE_STICKER_TIME);
        assertFalse(StickerTime.on());
        assertFalse(HookStatus.missing(FamilyNames.HIDE_STICKER_TIME).isEmpty());
    }
}
