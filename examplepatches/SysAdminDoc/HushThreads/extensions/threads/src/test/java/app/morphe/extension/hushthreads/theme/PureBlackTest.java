/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.theme;

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

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PureBlackTest {
    /** Threads' dark gray as its theme loads it, and as the Compose color its dark scheme gets. */
    private static final long GRAY_ARGB = 0xff101010L;
    private static final long GRAY_COLOR = GRAY_ARGB << 32;

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /**
     * The patch is in Morphe Manager's default selection with its switch off; these tests turn it
     * on. Cleared first as well, so a test that stopped half way, or another class, leaves nothing
     * behind.
     */
    @Before public void turnTheSwitchOn() {
        restore();
        Settings.PURE_BLACK.save(true);
    }

    @After public void restore() {
        PauseForTests.resume();
        Settings.PURE_BLACK.resetToDefault();
        HookStatus.clear();
    }

    /** The switch starts off, so a default build keeps Threads' gray until it's turned on. */
    @Test public void theSwitchStartsOffAndOnTurnsTheGrayBlack() {
        assertFalse("the switch starts on", Settings.PURE_BLACK.defaultValue);
        assertTrue(Settings.PURE_BLACK.get());
        assertEquals(0xff000000L, PureBlack.argb(GRAY_ARGB));
        assertEquals(0xff00000000000000L, PureBlack.color(GRAY_COLOR));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(FamilyNames.PURE_BLACK + ": invoked 2"));
        assertTrue(report, report.contains(PureBlack.BLACKENED + " 2"));
    }

    /** The black handed back is the color Compose reads as opaque sRGB black, alpha included. */
    @Test public void blackIsOpaqueInBothForms() {
        assertEquals(0xff000000L, PureBlack.BLACK_ARGB);
        assertEquals(PureBlack.BLACK_ARGB, PureBlack.BLACK_COLOR >>> 32);
        assertEquals(0L, PureBlack.BLACK_COLOR & 0xffffffffL);
    }

    /** Off, Threads keeps its gray in both forms. */
    @Test public void offLeavesThreadsGray() {
        Settings.PURE_BLACK.save(false);
        assertEquals(GRAY_ARGB, PureBlack.argb(GRAY_ARGB));
        assertEquals(GRAY_COLOR, PureBlack.color(GRAY_COLOR));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(PureBlack.LEFT_TO_THREADS + "switch off 2"));
    }

    /** Paused or in safe mode, the saved switch stays on and Threads' gray goes back unchanged. */
    @Test public void pauseAndSafeModeLeaveTheGrayToThreads() {
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        assertEquals(GRAY_ARGB, PureBlack.argb(GRAY_ARGB));
        assertEquals(GRAY_COLOR, PureBlack.color(GRAY_COLOR));
        assertTrue(Settings.PURE_BLACK.savedValue());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(PureBlack.LEFT_TO_THREADS + "HushThreads paused 2"));
        PauseForTests.resume();

        // Safe mode is the pause a crash loop starts.
        PauseForTests.pause(HushThreadsPause.Reason.CRASH_LOOP);
        assertEquals(GRAY_COLOR, PureBlack.color(GRAY_COLOR));
        assertTrue(Settings.PURE_BLACK.savedValue());
    }

    /** Threads builds its colors once a start, so the switch asks for a restart when it changes. */
    @Test public void aChangeWaitsForARestart() {
        assertTrue(Settings.PURE_BLACK.rebootApp);
    }
}
