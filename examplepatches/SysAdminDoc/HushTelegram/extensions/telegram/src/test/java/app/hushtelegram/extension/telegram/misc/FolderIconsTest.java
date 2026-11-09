/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
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
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class FolderIconsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.FOLDER_ICON_PACK);
        Settings.FOLDER_ICON_PACK.resetToDefault();
    }

    @Test public void noIconsIsTheDefaultAndTheOnlyOffChoice() {
        assertEquals("", Settings.FOLDER_ICON_PACK.defaultValue);
        assertEquals("", FolderIcons.pack());
        assertNull(FolderIcons.drawable(FolderIcons.pack(), "folder", 24, Color.WHITE));
        assertNull(FolderIcons.forFolder("", "Work", 24, Color.WHITE));
        assertNull(FolderIcons.preview("", 24, 4, Color.WHITE));
    }

    @Test public void aSavedPackIsUsedAndPauseOrAnUnknownValueMeansNone() {
        Settings.FOLDER_ICON_PACK.save(FolderIcons.BOLD);
        assertEquals(FolderIcons.BOLD, FolderIcons.pack());
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertEquals("a paused HushTelegram draws none", "", FolderIcons.pack());
        PauseForTests.resume();
        Settings.FOLDER_ICON_PACK.save("neon");
        assertEquals("", FolderIcons.pack());
        assertFalse(FolderIcons.allowed("neon"));
        assertFalse(FolderIcons.allowed(null));
        for (String choice : FolderIcons.CHOICES) assertTrue(choice, FolderIcons.allowed(choice));
    }

    @Test public void namesPickTheirIcons() {
        assertEquals("briefcase", FolderIcons.iconFor("Work"));
        assertEquals("briefcase", FolderIcons.iconFor("work stuff"));
        assertEquals("users", FolderIcons.iconFor("Friends"));
        assertEquals("users", FolderIcons.iconFor("Family & friends"));
        assertEquals("robot", FolderIcons.iconFor("Bots"));
        assertEquals("robot", FolderIcons.iconFor("bot"));
        assertEquals("megaphone", FolderIcons.iconFor("Channels"));
        assertEquals("user", FolderIcons.iconFor("Personal"));
        assertEquals("airplane", FolderIcons.iconFor("Travel"));
        assertEquals("graduation-cap", FolderIcons.iconFor("School"));
        assertEquals("currency-dollar", FolderIcons.iconFor("Crypto"));
        assertEquals("archive", FolderIcons.iconFor("Archive"));
        assertEquals("envelope", FolderIcons.iconFor("Unread"));
    }

    @Test public void anUnknownOrLookalikeNameGetsAPlainFolder() {
        assertEquals("folder", FolderIcons.iconFor("Xyzzy"));
        assertEquals("folder", FolderIcons.iconFor(""));
        assertEquals("folder", FolderIcons.iconFor(null));
        assertEquals("folder", FolderIcons.iconFor("Робота"));
        // A short word only counts whole, so "bottles" isn't a bot and "main" isn't "ai".
        assertEquals("folder", FolderIcons.iconFor("Bottles"));
        assertEquals("folder", FolderIcons.iconFor("Main"));
    }

    @Test public void everyNamedIconIsInThePacks() {
        for (String[] rule : FolderIcons.rulesForTests()) {
            assertTrue(rule[0], FolderIcons.icons().contains(rule[0]));
        }
        assertTrue(FolderIcons.icons().contains("folder"));
    }

    @Test public void everyIconBuildsInEveryPack() {
        for (String pack : new String[] {FolderIcons.REGULAR, FolderIcons.BOLD, FolderIcons.FILL}) {
            for (String icon : FolderIcons.icons()) {
                assertNotNull(pack + "/" + icon, FolderIcons.drawable(pack, icon, 24, Color.WHITE));
            }
        }
        assertNull(FolderIcons.drawable(FolderIcons.REGULAR, "not-an-icon", 24, Color.WHITE));
    }

    @Test public void anIconDrawsInItsColorAndTheWeightsDiffer() {
        int regular = coverage(FolderIcons.drawable(FolderIcons.REGULAR, "folder", 64, Color.RED));
        int bold = coverage(FolderIcons.drawable(FolderIcons.BOLD, "folder", 64, Color.RED));
        int fill = coverage(FolderIcons.drawable(FolderIcons.FILL, "folder", 64, Color.RED));
        assertTrue("regular draws something: " + regular, regular > 100);
        assertTrue("bold covers more than regular: " + bold + " vs " + regular, bold > regular);
        assertTrue("fill covers more than regular: " + fill + " vs " + regular, fill > regular);
        Bitmap bitmap = Bitmap.createBitmap(64, 64, Bitmap.Config.ARGB_8888);
        FolderIcons.drawable(FolderIcons.FILL, "folder", 64, Color.RED).draw(new Canvas(bitmap));
        assertEquals(Color.RED, bitmap.getPixel(32, 40));
    }

    @Test public void thePreviewHoldsFourIconsInARow() {
        Drawable strip = FolderIcons.preview(FolderIcons.REGULAR, 20, 6, Color.WHITE);
        assertNotNull(strip);
        assertEquals(4 * 20 + 3 * 6, strip.getIntrinsicWidth());
        assertEquals(20, strip.getIntrinsicHeight());
        Bitmap bitmap = Bitmap.createBitmap(strip.getIntrinsicWidth(), 20, Bitmap.Config.ARGB_8888);
        strip.draw(new Canvas(bitmap));
        boolean drawnInLast = false;
        for (int x = 3 * 26; x < bitmap.getWidth(); x++) {
            for (int y = 0; y < 20; y++) drawnInLast |= Color.alpha(bitmap.getPixel(x, y)) > 0;
        }
        assertTrue("the fourth icon is drawn", drawnInLast);
    }

    private static int coverage(Drawable icon) {
        Bitmap bitmap = Bitmap.createBitmap(64, 64, Bitmap.Config.ARGB_8888);
        icon.draw(new Canvas(bitmap));
        int count = 0;
        for (int x = 0; x < 64; x++) {
            for (int y = 0; y < 64; y++) if (Color.alpha(bitmap.getPixel(x, y)) > 128) count++;
        }
        return count;
    }
}
