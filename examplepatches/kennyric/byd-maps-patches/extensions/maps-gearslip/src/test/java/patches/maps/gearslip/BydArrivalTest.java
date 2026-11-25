package patches.maps.gearslip;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class BydArrivalTest {
    @Test public void arrivalUsesTheCarsOwnRate() {
        // 62% gives 310 km, so 1% is 5 km; a 15 km hop costs 3%.
        assertEquals(59, BydEtaText.arrivalPercent(62, 310, 15));
    }

    @Test public void arrivalNeverExceedsTheCurrentCharge() {
        assertEquals(62, BydEtaText.arrivalPercent(62, 310, 0));
    }

    @Test public void arrivalNeverGoesBelowZero() {
        assertEquals(0, BydEtaText.arrivalPercent(10, 50, 5000));
    }

    @Test public void arrivalIsUnknownWithoutACharge() {
        assertEquals(-1, BydEtaText.arrivalPercent(0, 310, 15));
        assertEquals(-1, BydEtaText.arrivalPercent(-1, 310, 15));
    }

    @Test public void arrivalIsUnknownWithoutARange() {
        assertEquals(-1, BydEtaText.arrivalPercent(62, 0, 15));
        assertEquals(-1, BydEtaText.arrivalPercent(62, -1, 15));
    }

    @Test public void arrivalIsUnknownWithoutADistance() {
        assertEquals(-1, BydEtaText.arrivalPercent(62, 310, -5));
        assertEquals(-1, BydEtaText.arrivalPercent(62, 310, Double.NaN));
    }

    @Test public void suffixReadsAsAnArrival() {
        assertEquals(" · arrive 41%", BydEtaText.arrivalSuffix(41));
    }

    @Test public void unknowableArrivalAddsNothing() {
        assertEquals("", BydEtaText.arrivalSuffix(-1));
    }

    @Test public void milesConvertToKilometres() {
        assertEquals(16.09344, BydEtaText.kilometres(10, "mi"), 0.00001);
        assertEquals(10, BydEtaText.kilometres(10, "km"), 0.00001);
        assertEquals(1.5, BydEtaText.kilometres(1500, "m"), 0.00001);
    }

    @Test public void beyondRangeIsRecognised() {
        assertTrue(BydEtaText.beyondRange(84, 90));
        assertTrue(BydEtaText.beyondRange(84, 84));
        assertFalse(BydEtaText.beyondRange(84, 83.9));
        assertFalse(BydEtaText.beyondRange(0, 10));
    }

    @Test public void unknownUnitsAreRejected() {
        assertEquals(-1, BydEtaText.kilometres(10, "parsecs"), 0.00001);
    }
}
