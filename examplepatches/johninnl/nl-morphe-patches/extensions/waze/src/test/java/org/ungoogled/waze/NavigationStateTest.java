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
        s.insights("B", 700, 6000);
        assertTrue(s.snapshot(6000).zoneSession > first);
        assertTrue(Double.isNaN(s.snapshot(6000).averageKmh));
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
