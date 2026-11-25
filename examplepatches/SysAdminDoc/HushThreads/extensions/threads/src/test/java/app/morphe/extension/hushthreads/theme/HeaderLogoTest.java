/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.theme;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.graphics.Rect;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Collections;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class HeaderLogoTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final HeaderLogoForTests.Logo logo = new HeaderLogoForTests.Logo();
    private HeaderLogoForTests.FakeCanvas canvas;

    /** The patch is in Manager's default selection with its switch off; these tests turn it on. */
    @Before public void turnTheSwitchOn() {
        restore();
        Settings.HEADER_LOGO.save(true);
        canvas = HeaderLogoForTests.install(logo, 120, 48);
    }

    @After public void restore() {
        PauseForTests.resume();
        Settings.HEADER_LOGO.resetToDefault();
        HeaderLogoForTests.reset();
        HookStatus.clear();
    }

    private static String report() {
        return String.join("\n", HookStatus.report());
    }

    /** On, the logo goes in the middle of Threads' canvas at the largest square that fits, and Threads' own is skipped. */
    @Test public void onTheLogoIsDrawnCenteredAtTheShortSide() {
        Object scope = new Object();
        assertTrue(HeaderLogo.draw(scope));
        assertEquals(Collections.singletonList(new Rect(36, 0, 84, 48)), logo.drawn);
        assertEquals(Collections.singletonList(scope), canvas.asked);

        canvas.size = HeaderLogoForTests.size(40.6f, 90f);
        assertTrue(HeaderLogo.draw(scope));
        assertEquals(new Rect(0, 25, 40, 65), logo.drawn.get(1));
        assertTrue(report(), report().contains(FamilyNames.HEADER_LOGO + ": invoked 2"));
        assertTrue(report(), report().contains(HeaderLogo.DRAWN + " 2"));
    }

    /** The switch starts off, and off Threads draws its own logo. */
    @Test public void offThreadsDrawsItsOwn() {
        Settings.HEADER_LOGO.resetToDefault();
        assertFalse("the switch starts on", Settings.HEADER_LOGO.defaultValue);
        assertFalse(HeaderLogo.draw(new Object()));
        assertTrue(logo.drawn.isEmpty());
        assertTrue("an off switch shouldn't even measure", canvas.asked.isEmpty());
        assertTrue(report(), report().contains(HeaderLogo.LEFT_TO_THREADS + "switch off 1"));
    }

    @Test public void pausedThreadsDrawsItsOwn() {
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        assertFalse(HeaderLogo.draw(new Object()));
        assertTrue(logo.drawn.isEmpty());
        assertTrue(report(), report().contains(HeaderLogo.LEFT_TO_THREADS + "HushThreads paused 1"));
    }

    /** A canvas Compose hasn't measured yet, or measured at nothing, gets Threads' own drawing. */
    @Test public void anUnmeasuredCanvasIsLeftToThreads() {
        canvas.size = 0L;
        assertFalse(HeaderLogo.draw(new Object()));
        canvas.size = HeaderLogoForTests.size(120f, 0f);
        assertFalse(HeaderLogo.draw(new Object()));
        canvas.size = HeaderLogoForTests.size(Float.NaN, 48f);
        assertFalse(HeaderLogo.draw(new Object()));
        assertTrue(logo.drawn.isEmpty());
        assertTrue(report(), report().contains(HeaderLogo.LEFT_TO_THREADS + "nothing to draw into 3"));
    }

    /** A build whose settings patch left out the logo keeps Threads' logo. */
    @Test public void withoutTheBundledLogoThreadsDrawsItsOwn() {
        HeaderLogo.logo = null;
        assertFalse(HeaderLogo.draw(new Object()));
        assertTrue(report(), report().contains(HeaderLogo.LEFT_TO_THREADS + "no logo in this build 1"));
    }

    /** A failure reaching the canvas leaves the logo to Threads and is reported, never thrown. */
    @Test public void aFailureReachingTheCanvasIsReported() {
        canvas.fails = new ClassCastException("not a draw scope");
        assertFalse(HeaderLogo.draw(new Object()));
        assertTrue(logo.drawn.isEmpty());
        assertEquals(Collections.singletonList("a working 'header logo' hook (it threw "
                + ClassCastException.class.getName() + ")"), HookStatus.missing(FamilyNames.HEADER_LOGO));
    }

    /**
     * Before the patch writes them, the size is zero and the canvas throws, so an unpatched
     * extension never draws.
     */
    @Test public void theUnwrittenStubsDrawNothing() {
        HeaderLogoForTests.reset();
        HeaderLogo.logo = logo;
        assertEquals(0L, HeaderLogo.PATCHED.size(new Object()));
        assertFalse(HeaderLogo.draw(new Object()));
        assertTrue(logo.drawn.isEmpty());
        assertTrue(report(), report().contains(HeaderLogo.LEFT_TO_THREADS + "nothing to draw into 1"));
    }

    @Test public void aChangeWaitsForARestart() {
        assertTrue(Settings.HEADER_LOGO.rebootApp);
    }
}
