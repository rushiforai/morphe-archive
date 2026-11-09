package app.hushmessenger.extension;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.robolectric.RuntimeEnvironment;

import java.util.Locale;
import java.util.concurrent.atomic.AtomicInteger;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class MountedBuildTest {
    private static final long STOCK_330 = 347215330L;
    private static final long PATCHED_348 = 347215348L;

    @After public void tearDown() {
        MountedBuild.reset();
    }

    /** #158: a patched 348 Root Mounted over an installed 330, with and without Spoof package version. */
    @Test public void aRootMountOverAnotherBuildIsCaught() {
        assertEquals(STOCK_330 + "|" + PATCHED_348, MountedBuild.compare(STOCK_330, PATCHED_348, () -> PATCHED_348));
        assertEquals(STOCK_330 + "|" + PATCHED_348, MountedBuild.compare(STOCK_330, PATCHED_348, () -> Integer.MAX_VALUE));
    }

    /** The same build mounted, a spoofed normal install and an unknown patched-from build all stay quiet. */
    @Test public void matchingSpoofedAndUnknownBuildsStayQuiet() {
        AtomicInteger reads = new AtomicInteger();
        // Root Mount over the build it was patched from: the APK isn't even opened.
        assertEquals("", MountedBuild.compare(PATCHED_348, PATCHED_348, () -> reads.incrementAndGet()));
        assertEquals(0, reads.get());
        // A normal install with Spoof package version: Android and the APK both say the raised code.
        assertEquals("", MountedBuild.compare(Integer.MAX_VALUE, PATCHED_348, () -> Integer.MAX_VALUE));
        assertEquals("", MountedBuild.compare(STOCK_330, 0, () -> PATCHED_348));
        // An APK that couldn't be read isn't proof of anything.
        assertEquals("", MountedBuild.compare(Integer.MAX_VALUE, PATCHED_348, () -> 0));
    }

    /** The warning names the patched-from build first and the installed one it should have been patched from. */
    @Test public void theNoticeNamesBothBuilds() {
        assertNull(MountedBuild.notice(new SettingsText(Locale.ENGLISH)));
        MountedBuild.result = STOCK_330 + "|" + PATCHED_348;
        assertEquals("This was patched from Messenger 347215348, but Android has 347215330 installed. Patch 347215330 for "
            + "Root Mount, or chat heads and other screens can crash.", MountedBuild.notice(new SettingsText(Locale.ENGLISH)));
        assertArrayEquals(new long[] {STOCK_330, PATCHED_348}, MountedBuild.find(RuntimeEnvironment.getApplication()));
    }

    /** The extension alone has no patched-from build, so a real check finds nothing to warn about. */
    @Test public void anUnpatchedExtensionFindsNoMismatch() {
        assertNull(MountedBuild.find(RuntimeEnvironment.getApplication()));
        assertEquals("", MountedBuild.result);
    }
}
