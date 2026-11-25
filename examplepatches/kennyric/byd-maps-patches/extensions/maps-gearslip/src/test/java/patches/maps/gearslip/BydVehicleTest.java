package patches.maps.gearslip;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class BydVehicleTest {
    private static final long NOW = 1_700_000_000_000L;

    @Before
    public void clear() {
        BydVehicle.reset();
        BydVehicle.DEMO = false;
    }

    @Test public void nothingKnownLeavesTheTextUntouched() {
        assertEquals("17 min · 14 mi", BydVehicle.decorate("17 min · 14 mi"));
    }

    @Test public void hiddenEstimateLeavesTheTextUntouched() {
        BydVehicle.setShowEstimateForTesting(false);
        BydVehicle.onStatus(62, 310, System.currentTimeMillis(), "km");
        assertEquals("17 min · 14 mi", BydVehicle.decorate("17 min · 14 mi"));
    }

    @Test public void shownEstimateStillDecorates() {
        BydVehicle.setShowEstimateForTesting(true);
        BydVehicle.onStatus(62, 310, System.currentTimeMillis(), "km");
        assertEquals("17 min · 14 mi · 62%", BydVehicle.decorate("17 min · 14 mi"));
    }

    @Test public void freshReadingWithoutADistanceShowsTheCurrentCharge() {
        BydVehicle.onStatus(62, 310, System.currentTimeMillis(), "km");
        assertEquals("17 min · 14 mi · 62%", BydVehicle.decorate("17 min · 14 mi"));
    }

    @Test public void freshReadingWithADistanceShowsTheArrivalCharge() {
        BydVehicle.onStatus(62, 310, System.currentTimeMillis(), "km");
        BydVehicle.setRemainingKm(15);
        assertEquals("17 min · 14 mi · arrive 59%", BydVehicle.decorate("17 min · 14 mi"));
    }

    @Test public void staleReadingIsNotShown() {
        BydVehicle.onStatus(62, 310, NOW - BydVehicle.MAX_AGE_MS - 1, "km");
        assertEquals("17 min · 14 mi", BydVehicle.decorate("17 min · 14 mi"));
    }

    @Test public void readingJustInsideTheWindowIsShown() {
        assertTrue(BydVehicle.fresh(NOW - BydVehicle.MAX_AGE_MS + 1, NOW));
    }

    @Test public void routeProgressAccumulatesWhileTheRemainingDistanceFalls() {
        BydVehicle.setRemainingKm(30);
        BydVehicle.setRemainingKm(24);
        BydVehicle.setRemainingKm(24);
        BydVehicle.setRemainingKm(18.5);

        assertEquals(11.5, BydVehicle.travelledKm(), 0.001);
    }

    @Test public void aRerouteDiscardsTheOldProgress() {
        BydVehicle.setRemainingKm(30);
        BydVehicle.setRemainingKm(24);
        assertEquals(6, BydVehicle.travelledKm(), 0.001);

        BydVehicle.setRemainingKm(35);
        assertEquals(0, BydVehicle.travelledKm(), 0.001);
    }

    @Test public void outOfRangeSocIsRejected() {
        BydVehicle.onStatus(140, 310, System.currentTimeMillis(), "km");
        assertEquals("17 min", BydVehicle.decorate("17 min"));
    }

    @Test public void negativeRangeIsRejected() {
        BydVehicle.onStatus(62, -5, System.currentTimeMillis(), "km");
        assertEquals("17 min", BydVehicle.decorate("17 min"));
    }

    @Test public void unknownValuesRenderNothing() {
        BydVehicle.onStatus(-1, -1, System.currentTimeMillis(), "km");
        assertEquals("17 min", BydVehicle.decorate("17 min"));
    }

    @Test public void milesAreConvertedBeforeEstimating() {
        BydVehicle.onStatus(62, 192, System.currentTimeMillis(), "mi");
        BydVehicle.setRemainingKm(15);
        assertEquals("17 min · arrive 59%", BydVehicle.decorate("17 min"));
    }

    @Test public void blankUnitFallsBackToKilometres() {
        BydVehicle.onStatus(62, 310, System.currentTimeMillis(), "");
        assertEquals("17 min · 62%", BydVehicle.decorate("17 min"));
    }

    @Test public void secondsStampsAreStillFresh() {
        long nowMillis = System.currentTimeMillis();
        // The cloud payload carries seconds; a consumer must not read that as years old.
        assertTrue(BydVehicle.fresh(nowMillis / 1000L, nowMillis));
    }

    @Test public void stampOfZeroIsNeverFresh() {
        assertFalse(BydVehicle.fresh(0, NOW));
    }

    @Test public void nonNavigationMessageIsLeftAlone() {
        BydVehicle.onStatus(62, 310, System.currentTimeMillis(), "km");
        assertEquals("Rerouting…", BydVehicle.decorate("Rerouting…"));
    }

    @Test public void demoModeRendersFixedValuesForVerification() {
        BydVehicle.DEMO = true;
        BydVehicle.setRemainingKm(15);
        assertEquals("18 min · arrive 59%", BydVehicle.decorate("18 min"));
    }
}
