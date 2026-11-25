package org.ungoogled.waze;
import nl.johninnl.navigation.NavigationState;

import static org.junit.Assert.*;
import org.junit.Test;

public class NavigationStateTest {
    @Test public void nativeLimitIsNormalizedAndUnknownIsNotZero() {
        NavigationState s = new NavigationState();
        assertTrue(Double.isNaN(s.snapshot(0).limitKmh));
        s.speed("mph", 65, 1000);
        assertEquals(104.60736, s.snapshot(1000).limitKmh, 0.00001);
        s.speed("metric", 100, 1500); // nonlocalized native config fallback
        assertEquals(100, s.snapshot(1500).limitKmh, 0.00001);
        s.speed("km/h", 0, 2000);
        assertEquals("unknown", s.snapshot(2000).roadStatus);
        assertTrue(Double.isNaN(s.snapshot(2000).limitKmh));
    }

    @Test public void legacyProgressAndObservedAverageUseMonotonicSamples() {
        NavigationState s = new NavigationState();
        s.legacy(25, 3000, 1000);
        assertTrue(Double.isNaN(s.snapshot(1000).averageKmh));
        s.legacy(28, 2880, 5000);
        NavigationState.Snapshot n = s.snapshot(5000);
        assertEquals(28, n.progress, 0);
        assertFalse(n.progressEstimated);
        assertEquals(108, n.averageKmh, 0.001);
        assertEquals(120, n.observedMeters);
        assertEquals(108, s.snapshot(6000).averageKmh, 0.001); // no fabricated sample
    }

    @Test public void insightIdentityResetsAverageAndProgressIsAnEstimate() {
        NavigationState s = new NavigationState();
        s.insights("A", 1000, 0);
        s.insights("A", 900, 5000);
        assertEquals(72, s.snapshot(5000).averageKmh, 0.001);
        assertEquals(10, s.snapshot(5000).progress, 0.001);
        assertTrue(s.snapshot(5000).progressEstimated);
        long first = s.snapshot(5000).zoneSession;
        s.insights("B", 1700, 6000); // a longer stretch than was left: another control
        assertTrue(s.snapshot(6000).zoneSession > first);
        assertTrue(Double.isNaN(s.snapshot(6000).averageKmh));
    }

    @Test public void consecutiveSegmentsOfOneControlKeepOneSessionAndAverage() {
        NavigationState s = new NavigationState();
        s.insights("A", 1000, 0); s.insights("A", 100, 25_000);
        long session = s.snapshot(25_000).zoneSession;
        s.insights("B", 2000, 27_500); // next segment starts where A ended
        NavigationState.Snapshot n = s.snapshot(27_500);
        assertEquals(session, n.zoneSession);
        assertEquals(1000, n.observedMeters);
        assertEquals(1000 * 3600.0 / 27_500, n.averageKmh, 0.001);
        assertTrue(Double.isNaN(n.progress)); // total length unknown: no restarted bar
        s.insights("B", 1000, 52_500);
        assertEquals(2000 * 3600.0 / 52_500, s.snapshot(52_500).averageKmh, 0.001);
    }

    @Test public void segmentAfterClearAndShortGapContinuesButLongGapOrMidSegmentSwitchDoesNot() {
        NavigationState s = new NavigationState();
        s.insights("A", 500, 0); s.insights("A", 50, 15_000); s.clear("insights", 16_000);
        long session = s.snapshot(15_000).zoneSession;
        s.insights("B", 800, 20_000);
        assertEquals(session, s.snapshot(20_000).zoneSession);
        s.clear("insights", 21_000);
        s.insights("C", 800, 40_000); // 19 s later: a different control
        assertTrue(s.snapshot(40_000).zoneSession > session);
        NavigationState mid = new NavigationState();
        mid.insights("A", 1000, 0); mid.insights("A", 900, 4000);
        long first = mid.snapshot(4000).zoneSession;
        mid.insights("B", 2500, 5000); // left A 900 m before its end, B measures a longer stretch
        assertTrue(mid.snapshot(5000).zoneSession > first);
    }

    @Test public void segmentMeasuredToTheSameEndKeepsSessionLengthAndProgress() {
        NavigationState s = new NavigationState();
        s.insights("whole", 15_000, 0); s.insights("whole", 8_000, 60_000); s.insights("whole", 656, 110_000);
        NavigationState.Snapshot before = s.snapshot(110_000);
        s.insights("last", 596, 111_000); // Waze's last segment, counted to the same end
        NavigationState.Snapshot after = s.snapshot(111_000);
        assertEquals(before.zoneSession, after.zoneSession);
        assertEquals(15_000 - 596, after.observedMeters);
        assertEquals(100.0 * (15_000 - 596) / 15_000, after.progress, 0.001);
        assertEquals("last", after.segment);
    }

    @Test public void foreignClearCannotTerminateSelectedFeed() {
        NavigationState s = new NavigationState();
        s.legacy(10, 900, 1000);
        s.clear("insights", 2000);
        assertEquals("active", s.snapshot(2000).zoneStatus);
        s.clear("legacy", 3000);
        assertEquals("inactive", s.snapshot(3000).zoneStatus);
        assertTrue(Double.isNaN(s.snapshot(3000).averageKmh));
    }

    @Test public void expiryAndDisableRemoveUsableValues() {
        NavigationState s = new NavigationState();
        s.speed("km/h", 100, 0); s.legacy(0, 1000, 0);
        assertEquals("stale", s.snapshot(30001).roadStatus);
        assertTrue(Double.isNaN(s.snapshot(30001).limitKmh));
        assertEquals("stale", s.snapshot(90001).zoneStatus);
        s.reset(false);
        assertEquals("disabled", s.snapshot(90002).zoneStatus);
        s.reset(true);
        assertEquals("unknown", s.snapshot(90003).zoneStatus);
    }

    @Test public void backwardsSamplesAndLargeDistanceResetCannotCreateBadAverages() {
        NavigationState s = new NavigationState();
        s.legacy(10, 900, 1000); s.legacy(20, 800, 5000);
        s.legacy(5, 950, 4000); // delayed/out-of-order callback
        assertEquals(90, s.snapshot(5000).averageKmh, 0.001);
        s.legacy(0, 2000, 6000); // new segment/reroute without an ID
        assertTrue(Double.isNaN(s.snapshot(6000).averageKmh));
        s.legacy(100, 0, 7000);
        assertEquals("inactive", s.snapshot(7000).zoneStatus);
    }

    @Test public void acquiringAnIdentityAndRegressingNativeProgressResetTheObservation() {
        NavigationState s = new NavigationState();
        s.insights("", 1000, 0); s.insights("", 900, 4000);
        assertFalse(Double.isNaN(s.snapshot(4000).averageKmh));
        s.insights("identified", 850, 5000);
        assertEquals("identified", s.snapshot(5000).segment);
        assertTrue(Double.isNaN(s.snapshot(5000).averageKmh));
        NavigationState legacy = new NavigationState();
        legacy.legacy(90, 1000, 0); legacy.legacy(91, 900, 4000);
        legacy.legacy(10, 850, 5000);
        assertTrue(Double.isNaN(legacy.snapshot(5000).averageKmh));
    }
}
