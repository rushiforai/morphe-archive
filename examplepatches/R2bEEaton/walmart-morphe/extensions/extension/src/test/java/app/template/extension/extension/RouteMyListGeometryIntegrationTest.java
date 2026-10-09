package app.template.extension.extension;

import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

public class RouteMyListGeometryIntegrationTest {
    @Test
    public void usesEntrancePoiCenterAndRejectsExitOnlyLabels() {
        List<RouteOrderPlanner.Entrance> entrances = RouteMyListGeometry.entrancesFromPois(Arrays.asList(
                new RouteMyListGeometry.Poi("Main Entrance", null, 0, 10, 10, 30),
                new RouteMyListGeometry.Poi("Exit", null, 100, 120, 5, 15)));

        assertEquals(1, entrances.size());
        assertEquals("Main Entrance", entrances.get(0).id);
        assertEquals(5d, entrances.get(0).point.x, 0.0001d);
        assertEquals(20d, entrances.get(0).point.y, 0.0001d);
    }

    @Test
    public void matchesPinsByZoneAisleAndSectionInOriginalDuplicateOrder() {
        List<Integer> indexes = RouteMyListGeometry.orderIndexes(
                Collections.singletonList(new RouteMyListGeometry.Poi("Entrance", null, 0, 0, 0, 0)),
                Arrays.asList(
                        new RouteMyListGeometry.Pin("zone", "A1", "1", new RouteOrderPlanner.Point(2, 0)),
                        new RouteMyListGeometry.Pin("zone", "A1", "1", new RouteOrderPlanner.Point(2, 0)),
                        new RouteMyListGeometry.Pin("zone", "A2", "1", new RouteOrderPlanner.Point(1, 0))),
                Arrays.asList(
                        new RouteMyListGeometry.ItemLocation(0, "zone", "A1", "1"),
                        new RouteMyListGeometry.ItemLocation(1, "zone", "A1", "1"),
                        new RouteMyListGeometry.ItemLocation(2, "zone", "A2", "1")));

        assertEquals(Arrays.asList(0, 1, 2), indexes);
    }

    @Test
    public void keepsItemsOfOneStoreAreaTogetherUsingTheAisleCodePrefix() {
        // Produce (AP-*) pins sit on both sides of a grocery (A-*) pin on the straight line.
        List<Integer> indexes = RouteMyListGeometry.orderIndexes(
                Collections.singletonList(new RouteMyListGeometry.Poi("Entrance", null, 0, 0, 0, 0)),
                Arrays.asList(
                        new RouteMyListGeometry.Pin("", "AP-3", "1", new RouteOrderPlanner.Point(10, 0)),
                        new RouteMyListGeometry.Pin("", "A-1", "1", new RouteOrderPlanner.Point(10, 10)),
                        new RouteMyListGeometry.Pin("", "AP-7", "1", new RouteOrderPlanner.Point(10, 20))),
                Arrays.asList(
                        new RouteMyListGeometry.ItemLocation(0, "", "AP-3", "1"),
                        new RouteMyListGeometry.ItemLocation(1, "", "A-1", "1"),
                        new RouteMyListGeometry.ItemLocation(2, "", "AP-7", "1")));

        assertNotNull(indexes);
        assertEquals(1, Math.abs(indexes.indexOf(0) - indexes.indexOf(2)));
    }

    @Test
    public void derivesStoreAreaFromZoneOtherwiseAisleCodeLetters() {
        assertEquals("FRESH", RouteMyListGeometry.storeArea("Fresh", "AP-3"));
        assertEquals("AP", RouteMyListGeometry.storeArea("", "AP-3"));
        assertEquals("AP", RouteMyListGeometry.storeArea(null, "ap3"));
        assertEquals("A", RouteMyListGeometry.storeArea("", "A-16"));
        assertEquals("", RouteMyListGeometry.storeArea("", "16"));
        assertEquals("", RouteMyListGeometry.storeArea(null, null));
    }

    @Test
    public void preservesAisleFallbackWhenEntranceOrPinGeometryIsMissing() {
        List<RouteMyListGeometry.ItemLocation> items = Arrays.asList(
                new RouteMyListGeometry.ItemLocation(0, "zone", "A1", "1"),
                new RouteMyListGeometry.ItemLocation(1, "zone", "A2", "1"));

        assertNull(RouteMyListGeometry.orderIndexes(Collections.<RouteMyListGeometry.Poi>emptyList(),
                Collections.<RouteMyListGeometry.Pin>emptyList(), items));
        assertNull(RouteMyListGeometry.orderIndexes(
                Collections.singletonList(new RouteMyListGeometry.Poi("Entrance", null, 0, 0, 0, 0)),
                Collections.singletonList(new RouteMyListGeometry.Pin("zone", "A1", "1",
                        new RouteOrderPlanner.Point(1, 1))), items));
    }

    @Test
    public void usesFallbackFrontEntrancesWhenPoisDoNotContainEntrances() {
        // Pins from live Walmart store capture
        List<RouteMyListGeometry.Pin> pins = Arrays.asList(
                new RouteMyListGeometry.Pin("", "A-16", "14", new RouteOrderPlanner.Point(117.0, 507.5)),
                new RouteMyListGeometry.Pin("", "A-25", "9", new RouteOrderPlanner.Point(140.5, 464.0)),
                new RouteMyListGeometry.Pin("", "A-28", "7", new RouteOrderPlanner.Point(149.5, 446.5)),
                new RouteMyListGeometry.Pin("", "A-33", "30", new RouteOrderPlanner.Point(124.0, 380.5)),
                new RouteMyListGeometry.Pin("", "J-31", "22", new RouteOrderPlanner.Point(684.5, 443.0)),
                new RouteMyListGeometry.Pin("", "K-4", "4", new RouteOrderPlanner.Point(226.5, 461.0)),
                new RouteMyListGeometry.Pin("", "M-19", "4", new RouteOrderPlanner.Point(672.5, 450.5)));

        List<RouteMyListGeometry.ItemLocation> items = Arrays.asList(
                new RouteMyListGeometry.ItemLocation(0, "", "A-16", "14"),
                new RouteMyListGeometry.ItemLocation(1, "", "A-25", "9"),
                new RouteMyListGeometry.ItemLocation(2, "", "A-28", "7"),
                new RouteMyListGeometry.ItemLocation(3, "", "A-33", "30"),
                new RouteMyListGeometry.ItemLocation(4, "", "J-31", "22"),
                new RouteMyListGeometry.ItemLocation(5, "", "K-4", "4"),
                new RouteMyListGeometry.ItemLocation(6, "", "M-19", "4"));

        List<Integer> indexes = RouteMyListGeometry.orderIndexes(
                Collections.<RouteMyListGeometry.Poi>emptyList(), pins, items);

        assertNotNull(indexes);
        assertEquals(7, indexes.size());
        // Starts at front grocery (A-16), progresses up grocery to back (A-33), loops through GM (J-31, M-19) and center (K-4)
        assertEquals(Arrays.asList(0, 1, 2, 3, 4, 6, 5), indexes);
    }

    @Test
    public void rejectsIncompletePermutationBeforeMutatingNativeRouteState() {
        assertNull(RouteMyListGeometry.reorder(Arrays.asList("first", "second"),
                Collections.singletonList(1)));
        assertEquals(Arrays.asList("second", "first"), RouteMyListGeometry.reorder(
                Arrays.asList("first", "second"), Arrays.asList(1, 0)));
    }

    @Test
    public void ordersStartingAtClosestToFrontEntranceRegardlessOfOriginalItemOrder() {
        // Front entrance is at max Y (507.5) and grocery entrance is at (117.0, 507.5).
        // Original item order starts with Purolator (M-19 at 672.5, 450.5), but A-16 is closest to entrance.
        List<RouteMyListGeometry.Pin> pins = Arrays.asList(
                new RouteMyListGeometry.Pin("", "M-19", "4", new RouteOrderPlanner.Point(672.5, 450.5)),
                new RouteMyListGeometry.Pin("", "A-16", "14", new RouteOrderPlanner.Point(117.0, 507.5)),
                new RouteMyListGeometry.Pin("", "A-25", "9", new RouteOrderPlanner.Point(140.5, 464.0)),
                new RouteMyListGeometry.Pin("", "A-28", "7", new RouteOrderPlanner.Point(149.5, 446.5)),
                new RouteMyListGeometry.Pin("", "A-33", "30", new RouteOrderPlanner.Point(124.0, 380.5)),
                new RouteMyListGeometry.Pin("", "J-31", "22", new RouteOrderPlanner.Point(684.5, 443.0)),
                new RouteMyListGeometry.Pin("", "K-4", "4", new RouteOrderPlanner.Point(226.5, 461.0)));

        List<RouteMyListGeometry.ItemLocation> items = Arrays.asList(
                new RouteMyListGeometry.ItemLocation(0, "", "M-19", "4"),
                new RouteMyListGeometry.ItemLocation(1, "", "A-16", "14"),
                new RouteMyListGeometry.ItemLocation(2, "", "A-25", "9"),
                new RouteMyListGeometry.ItemLocation(3, "", "A-28", "7"),
                new RouteMyListGeometry.ItemLocation(4, "", "A-33", "30"),
                new RouteMyListGeometry.ItemLocation(5, "", "J-31", "22"),
                new RouteMyListGeometry.ItemLocation(6, "", "K-4", "4"));

        List<Integer> indexes = RouteMyListGeometry.orderIndexes(
                Collections.<RouteMyListGeometry.Poi>emptyList(), pins, items);

        assertNotNull(indexes);
        assertEquals(7, indexes.size());
        // First index in the ordered tour MUST be 1 (A-16, closest to grocery entrance), NOT 0 (M-19)
        assertEquals(Integer.valueOf(1), indexes.get(0));
    }


    @Test
    public void buildsConnectorSvgPathWithDeduplication() {
        assertEquals("", RouteMyListGeometry.buildConnectorSvgPath(null));
        assertEquals("", RouteMyListGeometry.buildConnectorSvgPath(Collections.emptyList()));
        assertEquals("", RouteMyListGeometry.buildConnectorSvgPath(Collections.singletonList(
                new RouteOrderPlanner.Point(100.0, 200.0))));

        // Consecutive duplicates are skipped
        List<RouteOrderPlanner.Point> points = Arrays.asList(
                new RouteOrderPlanner.Point(100.0, 200.0),
                new RouteOrderPlanner.Point(100.0, 200.0),
                new RouteOrderPlanner.Point(150.5, 250.2),
                new RouteOrderPlanner.Point(300.0, 400.0));

        String svgPath = RouteMyListGeometry.buildConnectorSvgPath(points);
        assertEquals("M 100.0 200.0 L 150.5 250.2 L 300.0 400.0", svgPath);
    }

}
