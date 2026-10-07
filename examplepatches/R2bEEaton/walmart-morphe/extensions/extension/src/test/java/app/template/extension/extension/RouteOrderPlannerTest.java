package app.template.extension.extension;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

public class RouteOrderPlannerTest {
    @Test
    public void replacesZigZagAisleOrderWithShorterClosedCoordinateRoute() {
        RouteOrderPlanner.Result result = RouteOrderPlanner.optimize(
                Arrays.asList(new RouteOrderPlanner.Entrance("main", new RouteOrderPlanner.Point(0, 0))),
                Arrays.asList(
                        new RouteOrderPlanner.Stop(0, new RouteOrderPlanner.Point(9, 0)),
                        new RouteOrderPlanner.Stop(1, new RouteOrderPlanner.Point(1, 0)),
                        new RouteOrderPlanner.Stop(2, new RouteOrderPlanner.Point(2, 0))));

        assertNotNull(result);
        assertNotEquals(Arrays.asList(0, 1, 2), result.orderedOriginalIndexes);
        assertTrue(result.totalDistance < 20d);
    }

    @Test
    public void choosesEntranceWithLowestCompleteLoopCost() {
        RouteOrderPlanner.Result result = RouteOrderPlanner.optimize(
                Arrays.asList(
                        new RouteOrderPlanner.Entrance("left", new RouteOrderPlanner.Point(0, 0)),
                        new RouteOrderPlanner.Entrance("right", new RouteOrderPlanner.Point(10, 0))),
                Arrays.asList(
                        new RouteOrderPlanner.Stop(0, new RouteOrderPlanner.Point(8, 0)),
                        new RouteOrderPlanner.Stop(1, new RouteOrderPlanner.Point(9, 0))));

        assertNotNull(result);
        assertEquals("right", result.entranceId);
        assertEquals(4d, result.totalDistance, 0.0001d);
    }

    @Test
    public void retainsOriginalIndexOrderForDuplicateCenters() {
        RouteOrderPlanner.Result result = RouteOrderPlanner.optimize(
                Arrays.asList(new RouteOrderPlanner.Entrance("main", new RouteOrderPlanner.Point(0, 0))),
                Arrays.asList(
                        new RouteOrderPlanner.Stop(4, new RouteOrderPlanner.Point(1, 1)),
                        new RouteOrderPlanner.Stop(5, new RouteOrderPlanner.Point(1, 1)),
                        new RouteOrderPlanner.Stop(6, new RouteOrderPlanner.Point(2, 1))));

        assertNotNull(result);
        assertTrue(result.orderedOriginalIndexes.indexOf(4) < result.orderedOriginalIndexes.indexOf(5));
    }

    @Test
    public void usesDeterministicCompleteOutputPastExactLimit() {
        List<RouteOrderPlanner.Stop> stops = new ArrayList<>();
        for (int index = 0; index <= RouteOrderPlanner.EXACT_STOP_LIMIT; index++) {
            stops.add(new RouteOrderPlanner.Stop(index,
                    new RouteOrderPlanner.Point((index * 7) % 19, (index * 11) % 17)));
        }
        List<RouteOrderPlanner.Entrance> entrances = Arrays.asList(
                new RouteOrderPlanner.Entrance("main", new RouteOrderPlanner.Point(0, 0)));

        RouteOrderPlanner.Result first = RouteOrderPlanner.optimize(entrances, stops);
        RouteOrderPlanner.Result second = RouteOrderPlanner.optimize(entrances, stops);

        assertNotNull(first);
        assertEquals(first.orderedOriginalIndexes, second.orderedOriginalIndexes);
        assertEquals(stops.size(), first.orderedOriginalIndexes.size());
        Set<Integer> indexes = new HashSet<>(first.orderedOriginalIndexes);
        assertEquals(stops.size(), indexes.size());
        for (int index = 0; index < stops.size(); index++) {
            assertTrue(indexes.contains(index));
        }
    }
}
