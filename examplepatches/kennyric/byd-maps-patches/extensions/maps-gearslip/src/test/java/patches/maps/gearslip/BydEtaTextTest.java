package patches.maps.gearslip;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

public class BydEtaTextTest {
    @Test public void appendsSocAndRangeToEtaText() {
        assertEquals("12 min · 5.2 km · 62% · 310 km",
                BydEtaText.decorate("12 min · 5.2 km", 62, 310, "km"));
    }

    @Test public void usesProviderUnitWithoutConverting() {
        assertEquals("8 min · 3.1 mi · 62% · 192 mi", BydEtaText.decorate("8 min · 3.1 mi", 62, 192, "mi"));
    }

    @Test public void showsOnlyRangeWhenSocUnknown() {
        assertEquals("12 min · 310 km", BydEtaText.decorate("12 min", -1, 310, "km"));
    }

    @Test public void showsNothingWhenBothUnknown() {
        assertEquals("12 min", BydEtaText.decorate("12 min", -1, -1, "km"));
    }

    @Test public void leavesNonNavigationStatusAlone() {
        assertEquals("Rerouting…", BydEtaText.decorate("Rerouting…", 62, 310, "km"));
        assertEquals("Searching for GPS…", BydEtaText.decorate("Searching for GPS…", 62, 310, "km"));
    }

    @Test public void leavesNullAndEmptyAlone() {
        assertNull(BydEtaText.decorate(null, 62, 310, "km"));
        assertEquals("", BydEtaText.decorate("", 62, 310, "km"));
    }

    @Test public void markerUsesFixedValues() {
        assertEquals("12 min · 62% · 310 km", BydEtaText.decorateMarker("12 min"));
    }
}
