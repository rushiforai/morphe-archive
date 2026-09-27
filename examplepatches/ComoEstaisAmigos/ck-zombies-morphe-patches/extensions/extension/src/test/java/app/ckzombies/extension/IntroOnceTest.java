package app.ckzombies.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class IntroOnceTest {

    private static final long INSTALLED = 1_790_390_000_000L;
    private static final long REINSTALLED = 1_790_450_000_000L;

    @Test
    public void theFirstLaunchPlaysIt() {
        assertFalse(IntroOnce.seen(0, IntroOnce.stamp(31, INSTALLED)));
    }

    @Test
    public void onceSeenItIsSkipped() {
        long mark = IntroOnce.stamp(31, INSTALLED);
        assertTrue(IntroOnce.seen(mark, IntroOnce.stamp(31, INSTALLED)));
    }

    @Test
    public void anUpdateKeepsTheInstallTimeSoItStaysSkipped() {
        // An update over the old install, e.g. from Morphe Manager, keeps firstInstallTime.
        long mark = IntroOnce.stamp(31, INSTALLED);
        assertTrue(IntroOnce.seen(mark, IntroOnce.stamp(34, INSTALLED)));
    }

    @Test
    public void aFreshInstallPlaysItEvenWhenBackupRestoredTheMark() {
        // Auto backup brings the old install's preferences into the new one.
        long restored = IntroOnce.stamp(31, INSTALLED);
        assertFalse(IntroOnce.seen(restored, IntroOnce.stamp(31, REINSTALLED)));
    }

    @Test
    public void belowApi9TheMarkIsAPlainFlag() {
        assertEquals(IntroOnce.NO_INSTALL_TIME, IntroOnce.stamp(8, 0));
        assertEquals(IntroOnce.NO_INSTALL_TIME, IntroOnce.stamp(7, INSTALLED));
        assertFalse(IntroOnce.seen(0, IntroOnce.stamp(7, 0)));
        assertTrue(IntroOnce.seen(IntroOnce.NO_INSTALL_TIME, IntroOnce.stamp(7, 0)));
    }

    @Test
    public void anUnknownInstallTimeFallsBackToTheFlag() {
        assertEquals(IntroOnce.NO_INSTALL_TIME, IntroOnce.stamp(31, 0));
        assertEquals(IntroOnce.NO_INSTALL_TIME, IntroOnce.stamp(31, -5));
    }

    @Test
    public void whenAnythingFailsItPlaysAndNothingThrows() {
        // With the android.jar stubs every framework call fails or returns null.
        assertFalse(IntroOnce.skip(null));
        IntroOnce.markSeen(null);
    }
}
