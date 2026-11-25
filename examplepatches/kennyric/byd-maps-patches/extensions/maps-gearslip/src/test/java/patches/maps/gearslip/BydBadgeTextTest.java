package patches.maps.gearslip;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

/** The card shows only the expected charge on arrival, like the native automotive ETA card. */
public class BydBadgeTextTest {

    @Test
    public void showsOnlyTheArrivalCharge() {
        assertEquals("27%", BydVehicle.badgeText(27).toString());
    }

    @Test
    public void unknownArrivalRendersNothing() {
        assertEquals("", BydVehicle.badgeText(-1).toString());
    }
}
