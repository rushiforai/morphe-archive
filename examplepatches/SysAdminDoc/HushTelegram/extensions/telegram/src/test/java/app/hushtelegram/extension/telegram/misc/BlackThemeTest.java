/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.util.SparseIntArray;
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
public class BlackThemeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stand-in ids, 1 to 16 in SURFACES order, as Telegram's lookup would hand them out. */
    private static final int[] IDS = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
    private static final int WINDOW = 1, ACTION_BAR = 5, WALLPAPER = 10, IN_BUBBLE = 100, TEXT = 101;
    private static final int BLACK = 0xFF000000;

    @Before public void reset() { restore(); BlackTheme.ids = IDS.clone(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.AMOLED_BLACK);
        Settings.AMOLED_BLACK.resetToDefault();
        BlackTheme.ids = null;
        HookStatus.clear();
    }

    @Test public void offByDefaultKeepsTheThemesColors() {
        assertFalse(Settings.AMOLED_BLACK.get());
        SparseIntArray night = night();
        BlackTheme.loaded("night.attheme", night);
        assertEquals(night().toString(), night.toString());
    }

    @Test public void onTurnsANightThemesSurfacesBlackAndLeavesTheRest() {
        Settings.AMOLED_BLACK.save(true);
        SparseIntArray night = night();
        BlackTheme.loaded("night.attheme", night);
        assertEquals(BLACK, night.get(WINDOW));
        assertEquals(BLACK, night.get(ACTION_BAR));
        assertEquals(BLACK, night.get(WALLPAPER));
        assertEquals(0xFF1F2123, night.get(IN_BUBBLE));
        assertEquals(0xFFFFFFFF, night.get(TEXT));
        // Keys the theme leaves out keep falling back the way Telegram decides.
        assertEquals(night().size(), night.size());
        assertTrue(String.join("\n", HookStatus.report()).contains("dark theme turned black 1"));
    }

    @Test public void aBuiltInPatternIsDrawnOverBlackOnlyOnAThemeTheSwitchTurnedBlack() {
        SparseIntArray night = night();
        assertEquals(40, BlackTheme.patternIntensity(night, null, 40));
        Settings.AMOLED_BLACK.save(true);
        assertEquals(40, BlackTheme.patternIntensity(night, null, 40));
        BlackTheme.loaded("night.attheme", night);
        assertEquals(-40, BlackTheme.patternIntensity(night, null, 40));
        // A picked wallpaper, and a pattern Telegram already draws over black, stay as they are.
        assertEquals(40, BlackTheme.patternIntensity(night, new Object(), 40));
        assertEquals(-35, BlackTheme.patternIntensity(night, null, -35));
    }

    @Test public void lightThemesAndThemeFilesKeepTheirColors() {
        Settings.AMOLED_BLACK.save(true);
        SparseIntArray day = night();
        day.put(WINDOW, 0xFFFFFFFF);
        BlackTheme.loaded("day.attheme", day);
        assertEquals(0xFFFFFFFF, day.get(WINDOW));
        assertEquals(0xFF232326, day.get(ACTION_BAR));

        SparseIntArray file = night();
        BlackTheme.loaded(null, file);
        assertEquals(night().toString(), file.toString());
        assertFalse(String.join("\n", HookStatus.report()).contains("dark theme turned black"));
    }

    @Test public void theWindowBackgroundDecidesWhetherAThemeIsDark() {
        assertEquals("windowBackgroundWhite", BlackTheme.SURFACES[0]);
        assertEquals(16, new java.util.HashSet<>(java.util.Arrays.asList(BlackTheme.SURFACES)).size());
    }

    @Test public void darkMeansOpaqueAndUnderAQuarterOfFullBrightness() {
        assertTrue(BlackTheme.dark(0xFF181819));
        assertTrue(BlackTheme.dark(0xFF1D2733));
        assertTrue(BlackTheme.dark(0xFF3F3F3F));
        assertFalse(BlackTheme.dark(0xFF404040));
        assertFalse(BlackTheme.dark(0xFFFFFFFF));
        assertFalse(BlackTheme.dark(0x80181819));
    }

    @Test public void anUnknownKeyIsSkippedAndAnUnknownWindowKeyChangesNothing() {
        int[] partial = IDS.clone();
        partial[4] = -1;
        SparseIntArray night = night();
        assertEquals(4, BlackTheme.blacken(night, partial));
        assertEquals(0xFF232326, night.get(ACTION_BAR));

        partial[0] = -1;
        SparseIntArray untouched = night();
        assertEquals(0, BlackTheme.blacken(untouched, partial));
        assertEquals(night().toString(), untouched.toString());
    }

    @Test public void anUnpatchedLookupReportsEveryKeyAsMissing() {
        Settings.AMOLED_BLACK.save(true);
        BlackTheme.ids = null;
        SparseIntArray night = night();
        BlackTheme.loaded("night.attheme", night);
        assertEquals(night().toString(), night.toString());
        assertEquals(BlackTheme.SURFACES.length, HookStatus.missing(FamilyNames.AMOLED_BLACK).size());
    }

    @Test public void pausingOrAnEarlyStartKeepsTheThemesColors() {
        Settings.AMOLED_BLACK.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            SparseIntArray paused = night();
            BlackTheme.loaded("night.attheme", paused);
            assertEquals(reason.name(), 0xFF181819, paused.get(WINDOW));
            assertTrue(Settings.AMOLED_BLACK.savedValue());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> {
            SparseIntArray early = night();
            BlackTheme.loaded("night.attheme", early);
            assertEquals(0xFF181819, early.get(WINDOW));
        });
    }

    @Test public void unreadableSwitchKeepsTheThemesColorsAndReportsIt() {
        Settings.AMOLED_BLACK.save(true);
        SettingReadsForTests.breakReads(Settings.AMOLED_BLACK);
        SparseIntArray night = night();
        BlackTheme.loaded("night.attheme", night);
        assertEquals(0xFF181819, night.get(WINDOW));
        assertFalse(HookStatus.missing(FamilyNames.AMOLED_BLACK).isEmpty());
    }

    /** Night's own values for a few surfaces, a bubble and a text color, without the surfaces Night leaves out. */
    private static SparseIntArray night() {
        SparseIntArray colors = new SparseIntArray();
        colors.put(WINDOW, 0xFF181819);
        colors.put(2, 0xFF000000);
        colors.put(3, 0xFF0B0B0C);
        colors.put(ACTION_BAR, 0xFF232326);
        colors.put(WALLPAPER, 0xFF0F0F10);
        colors.put(IN_BUBBLE, 0xFF1F2123);
        colors.put(TEXT, 0xFFFFFFFF);
        return colors;
    }
}
