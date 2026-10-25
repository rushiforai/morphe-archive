/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.font;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.graphics.Typeface;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.settings.Settings;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * Issue #7: the device font stands in for TikTok's, at the same weight, only when the switch is on.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class SystemFontTest {
    @Before public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        HookStatus.clear();
        Settings.SYSTEM_FONT.save(false);
    }

    @After public void tearDown() {
        ImportedFont.remove(RuntimeEnvironment.getApplication());
        ImportedFont.forget();
        Settings.IMPORTED_FONT.resetToDefault();
        Settings.SYSTEM_FONT.resetToDefault();
        HookStatus.clear();
    }

    @Test public void withTheSwitchOffTheTikTokTypefaceIsUntouched() {
        Typeface tiktok = Typeface.create(Typeface.SERIF, Typeface.BOLD);
        assertSame("the font was swapped with the switch off", tiktok, SystemFont.systemize(tiktok));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("system font"));
    }

    @Test public void withTheSwitchOnADeviceTypefaceIsReturned() {
        Settings.SYSTEM_FONT.save(true);
        Typeface tiktok = Typeface.create(Typeface.SERIF, Typeface.BOLD);
        Typeface replaced = SystemFont.systemize(tiktok);
        assertTrue("no typeface came back with the switch on", replaced != null);
        // The device font is a family of Typeface.DEFAULT, never the SERIF stand-in for TikTok's.
        assertTrue("the TikTok typeface was handed straight back", replaced != tiktok);
    }

    @Test public void nullIsPassedThroughWithoutAnImportedFont() {
        assertNull(SystemFont.systemize(null));
        Settings.SYSTEM_FONT.save(true);
        assertNull(SystemFont.systemize(null));
    }

    /**
     * Issue #243: PineDrama has none of TikTok's font files, so its engine answers null. With an
     * imported font on, that empty answer becomes the imported font, at the weight asked for.
     */
    @Test public void anEmptyAnswerBecomesTheImportedFont() throws IOException {
        byte[] trueType = {0, 1, 0, 0, 0, 12, 0, (byte) 0x80};
        ImportedFont.receive(RuntimeEnvironment.getApplication(), new ByteArrayInputStream(trueType), "Inter.ttf").install();
        ImportedFont.forget();
        SystemFont.askedFile("font/TikTok-Text-Bold.otf");
        assertNull("an imported font was used with its switch off", SystemFont.systemize(null));

        Settings.IMPORTED_FONT.save(true);
        Typeface built = SystemFont.systemize(null);
        assertNotNull("the empty answer stayed empty with an imported font on", built);
        assertTrue("the device font came back instead of the imported one", built != Typeface.DEFAULT);
        SystemFont.askedWeight(500, false);
        assertNotNull("the variable builder's empty answer stayed empty", SystemFont.systemize(null));
    }

    @Test public void anAssetsFileNameGivesItsWeight() {
        assertEquals(400, SystemFont.weightOf("font/TikTok-Text-Regular.otf"));
        assertEquals(500, SystemFont.weightOf("font/TikTok-Display-Medium.otf"));
        assertEquals(600, SystemFont.weightOf("font/TikTok-Text-SemiBold.otf"));
        assertEquals(700, SystemFont.weightOf("font/TikTok-Text-Bold.otf"));
        assertEquals(800, SystemFont.weightOf("TikTokSans-ExtraBold.otf"));
        assertEquals(900, SystemFont.weightOf("TikTokSans36pt-Black.otf"));
        assertEquals(400, SystemFont.weightOf(null));
    }

    @Test public void theExportNamesTheStateWhicheverWayTheSwitchIsSet() {
        SystemFont.systemize(Typeface.DEFAULT);
        assertTrue(HookStatus.report().toString().contains("system font"));
    }
}
