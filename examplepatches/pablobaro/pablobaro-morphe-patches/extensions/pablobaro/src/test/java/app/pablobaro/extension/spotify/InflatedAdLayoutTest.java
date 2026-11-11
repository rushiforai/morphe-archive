package app.pablobaro.extension.spotify;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class InflatedAdLayoutTest {
    @Test
    public void detachedInflationHidesTheReturnedView() {
        assertEquals(InflatedAdLayout.RETURNED_VIEW, InflatedAdLayout.indexOfInflatedView(false, false, 0));
    }

    @Test
    public void detachedInflationIgnoresTheRootChildren() {
        assertEquals(InflatedAdLayout.RETURNED_VIEW, InflatedAdLayout.indexOfInflatedView(false, false, 3));
    }

    @Test
    public void attachedInflationWithoutRootHidesTheReturnedView() {
        // LayoutInflater returns the inflated view itself when there is no root to attach to.
        assertEquals(InflatedAdLayout.RETURNED_VIEW, InflatedAdLayout.indexOfInflatedView(true, false, 0));
    }

    @Test
    public void attachedInflationHidesTheLastChildOfTheRoot() {
        // The inflated view is appended to the root, which is returned instead of it.
        assertEquals(2, InflatedAdLayout.indexOfInflatedView(true, true, 3));
    }

    @Test
    public void attachedInflationIntoAnEmptyRootHidesNothing() {
        assertEquals(InflatedAdLayout.NONE, InflatedAdLayout.indexOfInflatedView(true, true, 0));
    }
}
