package app.ayham.extension.music.addons;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** §4a on a fake clock: 5 /stream calls a minute, 60 uncached an hour, the manifest's limits, a 429's lesson. */
public class StreamLimitsTest {
    private long t = 1_000_000;
    private final StreamLimits limits = new StreamLimits(() -> t);
    private static final String A = "https://h/a", B = "https://h/b";

    @Test
    public void fiveAMinuteThenTheSixthWaits() {
        for (int i = 0; i < 5; i++) {
            assertEquals(0, limits.tryStart(A, Protocol.DEFAULT_LIMITS));
            limits.answered(A, false);
            t += 1000;
        }
        long wait = limits.tryStart(A, Protocol.DEFAULT_LIMITS);
        assertEquals(60_000 - 5000, wait);   // the first call leaves the window then
        assertEquals("another addon has its own budget", 0, limits.tryStart(B, Protocol.DEFAULT_LIMITS));
        t += wait;
        assertEquals(0, limits.tryStart(A, Protocol.DEFAULT_LIMITS));
    }

    @Test
    public void sixtyUncachedAnHour() {
        for (int i = 0; i < 60; i++) {
            assertEquals("call " + i, 0, limits.tryStart(A, Protocol.DEFAULT_LIMITS));
            limits.answered(A, false);
            t += 30_000;   // 2 a minute: never the minute's limit
        }
        long wait = limits.tryStart(A, Protocol.DEFAULT_LIMITS);
        assertEquals(3_600_000 - 60 * 30_000, wait);
        t += wait;
        assertEquals(0, limits.tryStart(A, Protocol.DEFAULT_LIMITS));
    }

    @Test
    public void cachedAnswersDontCountAgainstTheHour() {
        Protocol.Limits l = new Protocol.Limits(30, 2, "fromCache");
        int ok = 0;
        boolean[] cached = {false, true, true, false, false};
        for (boolean c : cached) {
            if (limits.tryStart(A, l) == 0) {
                ok++;
                limits.answered(A, c);
            }
        }
        assertEquals(4, ok);
    }

    @Test
    public void theManifestsPerMinuteCountIsHonoured() {
        Protocol.Limits l = new Protocol.Limits(2, 60, "cached");
        assertEquals(0, limits.tryStart(A, l));
        assertEquals(0, limits.tryStart(A, l));
        assertTrue(limits.tryStart(A, l) > 0);
    }

    @Test
    public void a429TeachesThePerMinuteCountAndWaitsRetryAfter() {
        for (int i = 0; i < 3; i++) assertEquals(0, limits.tryStart(A, Protocol.DEFAULT_LIMITS));   // the third got a 429
        assertEquals(2, limits.rateLimited(A, 30.0));
        assertEquals(30_000, limits.waitMs(A, Protocol.DEFAULT_LIMITS));
        t += 31_000;
        assertTrue("the learnt 2 a minute holds", limits.waitMs(A, Protocol.DEFAULT_LIMITS) > 0);
        t += 30_000;
        assertEquals(0, limits.tryStart(A, Protocol.DEFAULT_LIMITS));
        assertEquals(0, limits.tryStart(A, Protocol.DEFAULT_LIMITS));
        assertTrue(limits.tryStart(A, Protocol.DEFAULT_LIMITS) > 0);
    }

    @Test
    public void a429WithoutRetryAfterWaitsAMinuteAndRetryAfterIsClamped() {
        limits.tryStart(A, Protocol.DEFAULT_LIMITS);
        assertEquals(1, limits.rateLimited(A, null));   // at least 1
        assertEquals(60_000, limits.waitMs(A, Protocol.DEFAULT_LIMITS));
        limits.tryStart(B, Protocol.DEFAULT_LIMITS);
        limits.rateLimited(B, 99_999.0);
        assertEquals(3_600_000, limits.waitMs(B, Protocol.DEFAULT_LIMITS));
        limits.rateLimited(B, 0.0);
        assertEquals(1000, limits.waitMs(B, Protocol.DEFAULT_LIMITS));
    }
}
