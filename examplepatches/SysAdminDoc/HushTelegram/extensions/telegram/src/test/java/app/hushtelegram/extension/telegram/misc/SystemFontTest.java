/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.graphics.Typeface;
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
import org.robolectric.annotation.GraphicsMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
// Real font weights need Robolectric's native graphics; the legacy shadows report 0.
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class SystemFontTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String[] ROBOTO = {"fonts/rmedium.ttf", "fonts/rmediumitalic.ttf", "fonts/ritalic.ttf",
            "fonts/rextrabold.ttf", "fonts/rcondensedbold.ttf", "fonts/rmono.ttf"};

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.USE_SYSTEM_FONT);
        Settings.USE_SYSTEM_FONT.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultKeepsTelegramsFiles() {
        assertFalse(Settings.USE_SYSTEM_FONT.get());
        for (String asset : ROBOTO) assertNull(asset, SystemFont.typeface(asset));
    }

    @Test public void onAnswersEveryRobotoFileWithThePhonesFace() {
        Settings.USE_SYSTEM_FONT.save(true);
        for (String asset : ROBOTO) assertNotNull(asset, SystemFont.typeface(asset));
        assertSame(Typeface.MONOSPACE, SystemFont.typeface("fonts/rmono.ttf"));
        assertTrue(String.join("\n", HookStatus.report()).contains("system font used 7"));
    }

    @Test public void weightsAndStylesFollowTheFileTheyReplace() {
        assertFace("fonts/rmedium.ttf", 500, false);
        assertFace("fonts/rmediumitalic.ttf", 500, true);
        assertFace("fonts/ritalic.ttf", 400, true);
        assertFace("fonts/rextrabold.ttf", 800, false);
        assertFace("fonts/rcondensedbold.ttf", 700, false);
    }

    @Test public void digitsInstantViewAndUnknownFilesKeepTelegramsOwn() {
        Settings.USE_SYSTEM_FONT.save(true);
        for (String asset : new String[]{"fonts/num.otf", "fonts/mw_bold.ttf", "fonts/mw_bolditalic.ttf", "fonts/custom.ttf", ""}) {
            assertNull(asset, SystemFont.typeface(asset));
        }
        assertNull(SystemFont.typeface(null));
        assertFalse(String.join("\n", HookStatus.report()).contains("system font used"));
    }

    @Test public void pausingOrAnEarlyStartKeepsTelegramsFiles() {
        Settings.USE_SYSTEM_FONT.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertNull(reason.name(), SystemFont.typeface("fonts/rmedium.ttf"));
            assertTrue(Settings.USE_SYSTEM_FONT.savedValue());
            PauseForTests.resume();
            assertNotNull(reason.name(), SystemFont.typeface("fonts/rmedium.ttf"));
        }
        SettingsContextRule.withoutContext(() -> assertNull(SystemFont.typeface("fonts/rmedium.ttf")));
    }

    @Test public void unreadableSwitchKeepsTelegramsFilesAndReportsIt() {
        Settings.USE_SYSTEM_FONT.save(true);
        assertNotNull(SystemFont.typeface("fonts/rmedium.ttf"));
        SettingReadsForTests.breakReads(Settings.USE_SYSTEM_FONT);
        assertNull(SystemFont.typeface("fonts/rmedium.ttf"));
        assertFalse(HookStatus.missing(FamilyNames.USE_SYSTEM_FONT).isEmpty());
    }

    private static void assertFace(String asset, int weight, boolean italic) {
        Typeface face = SystemFont.forAsset(asset);
        assertNotNull(asset, face);
        assertEquals(asset + " weight", weight, face.getWeight());
        assertEquals(asset + " italic", italic, face.isItalic());
    }
}
