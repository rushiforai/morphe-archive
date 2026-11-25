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
public class StickerPanelTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** dp(72), dp(82) and dp(66) on a 2.625 density phone like the S22. */
    private static final int COLUMN = 189;
    private static final int HEIGHT = 215;
    private static final int CAP = 173;

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.STICKER_PANEL_SIZE);
        Settings.STICKER_PANEL_SIZE.resetToDefault();
        HookStatus.clear();
    }

    @Test public void byDefaultThePanelKeepsTelegramsSizes() {
        assertEquals(StickerPanel.TELEGRAM, (int) Settings.STICKER_PANEL_SIZE.get());
        Object cell = new Object();
        StickerPanel.cell(cell);
        assertEquals(COLUMN, StickerPanel.column(COLUMN));
        assertEquals(HEIGHT, StickerPanel.height(cell, HEIGHT));
        assertEquals(CAP, StickerPanel.cap(cell, CAP));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.CHANGE_STICKER_SIZE));
    }

    @Test public void aBiggerSizeWidensTheColumnsAndGrowsThePanelsCellsByTheSameShare() {
        Object cell = new Object();
        StickerPanel.cell(cell);
        Settings.STICKER_PANEL_SIZE.save(96);
        assertEquals("Large", 252, StickerPanel.column(COLUMN));
        assertEquals(287, StickerPanel.height(cell, HEIGHT));
        assertEquals(231, StickerPanel.cap(cell, CAP));
        Settings.STICKER_PANEL_SIZE.save(120);
        assertEquals("Larger", 315, StickerPanel.column(COLUMN));
        assertEquals(358, StickerPanel.height(cell, HEIGHT));
        assertEquals(288, StickerPanel.cap(cell, CAP));
        // A 1080 pixel wide panel: five columns at Telegram's size, three at Larger.
        assertEquals(5, 1080 / COLUMN);
        assertEquals(3, 1080 / StickerPanel.column(COLUMN));
    }

    @Test public void cellsThePanelDidntMakeKeepTelegramsSizes() {
        Settings.STICKER_PANEL_SIZE.save(120);
        Object masks = new Object();
        assertEquals("the masks sheet's cells share the class", HEIGHT, StickerPanel.height(masks, HEIGHT));
        assertEquals(CAP, StickerPanel.cap(masks, CAP));
        assertEquals(HEIGHT, StickerPanel.height(null, HEIGHT));
        assertEquals(CAP, StickerPanel.cap(null, CAP));
        StickerPanel.cell(null);
        assertEquals(HEIGHT, StickerPanel.height(null, HEIGHT));
    }

    @Test public void aSavedSizeThatIsntOneOfTheChoicesReadsAsTelegrams() {
        for (int choice : StickerPanel.CHOICES) assertEquals(choice, StickerPanel.choice(choice));
        for (int other : new int[]{0, 71, 73, 100, -96, Integer.MAX_VALUE}) {
            assertEquals(String.valueOf(other), StickerPanel.TELEGRAM, StickerPanel.choice(other));
        }
        Settings.STICKER_PANEL_SIZE.save(100);
        assertEquals(COLUMN, StickerPanel.column(COLUMN));
        Settings.STICKER_PANEL_SIZE.save(1000);
        assertEquals("kept within its range when saved", 120, (int) Settings.STICKER_PANEL_SIZE.get());
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSizeKeepsTelegramsSizes() {
        Object cell = new Object();
        StickerPanel.cell(cell);
        Settings.STICKER_PANEL_SIZE.save(120);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertEquals(reason.name(), COLUMN, StickerPanel.column(COLUMN));
            assertEquals(reason.name(), HEIGHT, StickerPanel.height(cell, HEIGHT));
            assertEquals(reason.name(), CAP, StickerPanel.cap(cell, CAP));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertEquals(COLUMN, StickerPanel.column(COLUMN)));
        SettingReadsForTests.breakReads(Settings.STICKER_PANEL_SIZE);
        assertEquals(COLUMN, StickerPanel.column(COLUMN));
        assertEquals(HEIGHT, StickerPanel.height(cell, HEIGHT));
        assertFalse(HookStatus.missing(FamilyNames.CHANGE_STICKER_SIZE).isEmpty());
    }
}
