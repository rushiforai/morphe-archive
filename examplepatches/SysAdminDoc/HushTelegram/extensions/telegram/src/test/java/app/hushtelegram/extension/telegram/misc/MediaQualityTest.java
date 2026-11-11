/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MediaQualityTest {
    /** Telegram's own limit, the 1000 MB the patch passes in. */
    private static final long STOCK = 0x3e800000L;

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        Settings.BEST_QUALITY_MEDIA.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.BEST_QUALITY_MEDIA);
        Settings.BEST_QUALITY_MEDIA.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultSoTelegramKeepsItsOwnQuality() {
        assertFalse(Settings.BEST_QUALITY_MEDIA.get());
        assertFalse(MediaQuality.hdPhoto(false));
        assertEquals(STOCK, MediaQuality.videoLimit(STOCK));
    }

    @Test public void anHdChoiceTelegramRemembersStaysHdWithTheSwitchOff() {
        assertTrue(MediaQuality.hdPhoto(true));
    }

    @Test public void switchedOnPhotosStartInHdAndEveryVideoKeepsItsOwnSize() {
        Settings.BEST_QUALITY_MEDIA.save(true);
        assertTrue(MediaQuality.hdPhoto(false));
        // Below any file's length, so Telegram's own-size branch takes even an empty file.
        long limit = MediaQuality.videoLimit(STOCK);
        assertTrue(limit < 0);
        assertTrue(MediaQuality.videoLimit(STOCK) < 0);
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("photo started in HD 1"));
        assertTrue(report, report.contains("video kept at its own size 2"));
    }

    @Test public void everyPauseReasonKeepsTelegramsQuality() {
        Settings.BEST_QUALITY_MEDIA.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), MediaQuality.hdPhoto(false));
            assertEquals(reason.name(), STOCK, MediaQuality.videoLimit(STOCK));
            PauseForTests.resume();
        }
        assertTrue(MediaQuality.hdPhoto(false));
    }

    @Test public void unavailableSettingsKeepTelegramsQuality() {
        Settings.BEST_QUALITY_MEDIA.save(true);
        SettingsContextRule.withoutContext(() -> {
            assertFalse(MediaQuality.hdPhoto(false));
            assertEquals(STOCK, MediaQuality.videoLimit(STOCK));
        });
    }

    @Test public void anUnreadableSwitchKeepsTelegramsQualityAndSaysSo() {
        Settings.BEST_QUALITY_MEDIA.save(true);
        SettingReadsForTests.breakReads(Settings.BEST_QUALITY_MEDIA);
        assertFalse(MediaQuality.hdPhoto(false));
        assertEquals(STOCK, MediaQuality.videoLimit(STOCK));
        assertEquals(Arrays.asList("a working 'best quality switch' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.FASTER_DOWNLOADS));
    }
}
