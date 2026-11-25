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
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class StickerCacheTest {
    private static final String CACHE = "/storage/emulated/0/Android/data/org.telegram.messenger.web/cache/";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.KEEP_STICKER_CACHE);
        Settings.KEEP_STICKER_CACHE.resetToDefault();
        HookStatus.clear();
    }

    private static String report() { return String.join("\n", HookStatus.report()); }

    private static Set<String> inUse(String... paths) { return new HashSet<>(java.util.Arrays.asList(paths)); }

    @Test public void offByDefaultTheCleanupGetsTelegramsOwnAnswer() {
        assertFalse(Settings.KEEP_STICKER_CACHE.get());
        Set<String> using = inUse(CACHE + "2_1.webp");
        assertTrue(StickerCache.kept(using, CACHE + "2_1.webp"));
        assertFalse(StickerCache.kept(using, CACHE + "2_2.webp"));
        assertFalse(StickerCache.kept(using, CACHE + "4_3.tgs"));
        assertFalse(StickerCache.kept(using, CACHE + "1_4.jpg"));
        assertTrue(report().contains(FamilyNames.CHANGE_STICKER_SIZE));
        assertFalse(report().contains(StickerCache.KEPT));
    }

    @Test public void onStickerFilesOfEveryKindStayAndOtherMediaGoesAsBefore() {
        Settings.KEEP_STICKER_CACHE.save(true);
        Set<String> using = Collections.emptySet();
        for (String sticker : new String[] {"2_1.webp", "4_3.tgs", "5_9.webm", "1_7.WEBP", "acache/2_8.tgs"}) {
            assertTrue(sticker, StickerCache.kept(using, CACHE + sticker));
        }
        for (String other : new String[] {"1_4.jpg", "2_5.mp4", "3_6.ogg", "4_7.pdf", "2_8.webp.temp", ".nomedia"}) {
            assertFalse(other, StickerCache.kept(using, CACHE + other));
        }
        assertTrue(report().contains(StickerCache.KEPT));
        // A file in use stays whatever it is.
        assertTrue(StickerCache.kept(inUse(CACHE + "1_4.jpg"), CACHE + "1_4.jpg"));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchLetsTheCleanupGoOn() {
        Settings.KEEP_STICKER_CACHE.save(true);
        Set<String> using = Collections.emptySet();
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), StickerCache.kept(using, CACHE + "2_1.webp"));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(StickerCache.kept(using, CACHE + "2_1.webp")));
        SettingReadsForTests.breakReads(Settings.KEEP_STICKER_CACHE);
        assertFalse(StickerCache.kept(using, CACHE + "2_1.webp"));
        assertFalse(HookStatus.missing(FamilyNames.CHANGE_STICKER_SIZE).isEmpty());
        // Telegram's own set still answers.
        assertTrue(StickerCache.kept(inUse(CACHE + "2_1.webp"), CACHE + "2_1.webp"));
    }

    @Test(expected = NullPointerException.class)
    public void aMissingSetFailsTheWayTelegramsOwnCallWould() {
        StickerCache.kept(null, CACHE + "2_1.webp");
    }
}
