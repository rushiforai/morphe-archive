package app.template.extension.extension;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Store-layout-neutral route ordering over coordinates supplied by Walmart's in-store map.
 * Routes start and finish at the same entrance; this deliberately models a shopping trip, not
 * turn-by-turn walking directions around shelves.
 */
public final class RouteOrderPlanner {
    public static final int EXACT_STOP_LIMIT = 12;
    private static final double EPSILON = 0.0000001d;
    /**
     * Extra cost, as a fraction of the stops' bounding-box diagonal, for each walk between two
     * stops in different store areas. It makes the route finish an area before leaving it
     * instead of cutting across a neighbouring area and coming back.
     */
    static final double GROUP_SWITCH_FRACTION = 0.15d;

    private RouteOrderPlanner() {
    }

    public static final class Point {
        public final double x;
        public final double y;

        public Point(double x, double y) {
            this.x = x;
            this.y = y;
        }

        boolean isFinite() {
            return !Double.isNaN(x) && !Double.isInfinite(x)
                    && !Double.isNaN(y) && !Double.isInfinite(y);
        }
    }

    public static final class Stop {
        public final int originalIndex;
        public final Point point;

        /** Store area this stop belongs to; empty when unknown (never penalised). */
        public final String group;

        public Stop(int originalIndex, Point point) {
            this(originalIndex, point, "");
        }

        public Stop(int originalIndex, Point point, String group) {
            this.originalIndex = originalIndex;
            this.point = point;
            this.group = group == null ? "" : group;
        }
    }

    public static final class Entrance {
        public final String id;
        public final Point point;

        public Entrance(String id, Point point) {
            this.id = id == null ? "" : id;
            this.point = point;
        }
    }

    public static final class Result {
        public final String entranceId;
        public final List<Integer> orderedOriginalIndexes;
        public final double totalDistance;

        Result(String entranceId, List<Integer> orderedOriginalIndexes, double totalDistance) {
            this.entranceId = entranceId;
            this.orderedOriginalIndexes = Collections.unmodifiableList(
                    new ArrayList<>(orderedOriginalIndexes));
            this.totalDistance = totalDistance;
        }
    }

    /** Returns null when the supplied geometry cannot describe a valid entrance-returning route. */
    public static Result optimize(List<Entrance> entrances, List<Stop> stops) {
        if (entrances == null || stops == null || entrances.isEmpty() || stops.isEmpty()) return null;
        List<Stop> validStops = new ArrayList<>();
        for (Stop stop : stops) {
            if (stop == null || stop.point == null || !stop.point.isFinite()) return null;
            validStops.add(stop);
        }
        Collections.sort(validStops, new Comparator<Stop>() {
            @Override
            public int compare(Stop left, Stop right) {
                return Integer.compare(left.originalIndex, right.originalIndex);
            }
        });

        double penalty = groupSwitchPenalty(validStops);
        Result best = null;
        for (Entrance entrance : entrances) {
            if (entrance == null || entrance.point == null || !entrance.point.isFinite()) continue;
            List<Integer> route = validStops.size() <= EXACT_STOP_LIMIT
                    ? exactOrder(entrance.point, validStops, penalty)
                    : heuristicOrder(entrance.point, validStops, penalty);
            double cost = routeCost(entrance.point, validStops, route, penalty);
            Result candidate = new Result(entrance.id, route, cost);
            if (isBetter(candidate, best)) best = candidate;
        }
        return best;
    }

    private static List<Integer> exactOrder(Point entrance, List<Stop> stops, double penalty) {
        int size = stops.size();
        int fullMask = (1 << size) - 1;
        ExactState[][] states = new ExactState[1 << size][size];
        for (int end = 0; end < size; end++) {
            states[1 << end][end] = new ExactState(distance(entrance, stops.get(end).point),
                    Collections.singletonList(end));
        }
        for (int mask = 1; mask <= fullMask; mask++) {
            for (int end = 0; end < size; end++) {
                ExactState current = states[mask][end];
                if (current == null) continue;
                for (int next = 0; next < size; next++) {
                    if ((mask & (1 << next)) != 0) continue;
                    List<Integer> order = new ArrayList<>(current.order);
                    order.add(next);
                    ExactState candidate = new ExactState(current.cost
                            + leg(stops.get(end), stops.get(next), penalty), order);
                    int nextMask = mask | (1 << next);
                    if (isBetter(candidate, states[nextMask][next], stops)) {
                        states[nextMask][next] = candidate;
                    }
                }
            }
        }
        ExactState best = null;
        for (int end = 0; end < size; end++) {
            ExactState state = states[fullMask][end];
            if (state == null) continue;
            ExactState completed = new ExactState(state.cost + distance(stops.get(end).point, entrance),
                    state.order);
            if (isBetter(completed, best, stops)) best = completed;
        }
        return originalIndexes(best.order, stops);
    }

    private static List<Integer> heuristicOrder(Point entrance, List<Stop> stops, double penalty) {
        List<Integer> remaining = new ArrayList<>();
        for (int i = 0; i < stops.size(); i++) remaining.add(i);
        List<Integer> order = new ArrayList<>();
        Point current = entrance;
        Stop currentStop = null;
        while (!remaining.isEmpty()) {
            int chosenOffset = 0;
            for (int candidateOffset = 1; candidateOffset < remaining.size(); candidateOffset++) {
                int candidate = remaining.get(candidateOffset);
                int chosen = remaining.get(chosenOffset);
                double candidateDistance = distance(current, stops.get(candidate).point)
                        + switchCost(currentStop, stops.get(candidate), penalty);
                double chosenDistance = distance(current, stops.get(chosen).point)
                        + switchCost(currentStop, stops.get(chosen), penalty);
                if (candidateDistance < chosenDistance - EPSILON ||
                        (approximatelyEqual(candidateDistance, chosenDistance)
                                && stops.get(candidate).originalIndex < stops.get(chosen).originalIndex)) {
                    chosenOffset = candidateOffset;
                }
            }
            int chosen = remaining.remove(chosenOffset);
            order.add(chosen);
            current = stops.get(chosen).point;
            currentStop = stops.get(chosen);
        }
        improveTwoOpt(entrance, stops, order, penalty);
        return originalIndexes(order, stops);
    }

    private static void improveTwoOpt(Point entrance, List<Stop> stops, List<Integer> order,
            double penalty) {
        boolean improved = true;
        while (improved) {
            improved = false;
            double before = routeCostByPositions(entrance, stops, order, penalty);
            for (int left = 0; left < order.size() - 1 && !improved; left++) {
                for (int right = left + 1; right < order.size(); right++) {
                    List<Integer> candidate = new ArrayList<>(order);
                    Collections.reverse(candidate.subList(left, right + 1));
                    double after = routeCostByPositions(entrance, stops, candidate, penalty);
                    if (after < before - EPSILON ||
                            (approximatelyEqual(after, before) && isPositionOrderEarlier(candidate, order, stops))) {
                        order.clear();
                        order.addAll(candidate);
                        improved = true;
                        break;
                    }
                }
            }
        }
    }

    private static boolean isBetter(Result candidate, Result current) {
        if (current == null) return true;
        if (candidate.totalDistance < current.totalDistance - EPSILON) return true;
        if (!approximatelyEqual(candidate.totalDistance, current.totalDistance)) return false;
        int entranceComparison = candidate.entranceId.compareTo(current.entranceId);
        return entranceComparison < 0 || (entranceComparison == 0
                && compareIndexes(candidate.orderedOriginalIndexes, current.orderedOriginalIndexes) < 0);
    }

    private static boolean isBetter(ExactState candidate, ExactState current, List<Stop> stops) {
        if (current == null) return true;
        if (candidate.cost < current.cost - EPSILON) return true;
        return approximatelyEqual(candidate.cost, current.cost)
                && isPositionOrderEarlier(candidate.order, current.order, stops);
    }

    private static boolean isPositionOrderEarlier(List<Integer> candidate, List<Integer> current,
            List<Stop> stops) {
        for (int index = 0; index < candidate.size(); index++) {
            int candidateOriginal = stops.get(candidate.get(index)).originalIndex;
            int currentOriginal = stops.get(current.get(index)).originalIndex;
            if (candidateOriginal != currentOriginal) return candidateOriginal < currentOriginal;
        }
        return false;
    }

    private static int compareIndexes(List<Integer> left, List<Integer> right) {
        for (int index = 0; index < left.size(); index++) {
            int comparison = Integer.compare(left.get(index), right.get(index));
            if (comparison != 0) return comparison;
        }
        return 0;
    }

    private static List<Integer> originalIndexes(List<Integer> positions, List<Stop> stops) {
        List<Integer> indexes = new ArrayList<>();
        for (int position : positions) indexes.add(stops.get(position).originalIndex);
        return indexes;
    }

    private static double routeCost(Point entrance, List<Stop> stops, List<Integer> originalIndexes,
            double penalty) {
        List<Integer> positions = new ArrayList<>();
        for (int originalIndex : originalIndexes) {
            for (int position = 0; position < stops.size(); position++) {
                if (stops.get(position).originalIndex == originalIndex) {
                    positions.add(position);
                    break;
                }
            }
        }
        return routeCostByPositions(entrance, stops, positions, penalty);
    }

    private static double routeCostByPositions(Point entrance, List<Stop> stops, List<Integer> positions,
            double penalty) {
        if (positions.isEmpty()) return 0d;
        double cost = distance(entrance, stops.get(positions.get(0)).point);
        for (int index = 1; index < positions.size(); index++) {
            cost += leg(stops.get(positions.get(index - 1)), stops.get(positions.get(index)), penalty);
        }
        return cost + distance(stops.get(positions.get(positions.size() - 1)).point, entrance);
    }

    /** Walking distance between two stops plus the penalty for changing store area. */
    private static double leg(Stop from, Stop to, double penalty) {
        return distance(from.point, to.point) + switchCost(from, to, penalty);
    }

    /** Penalty for walking between two known, different store areas; the entrance has none. */
    private static double switchCost(Stop from, Stop to, double penalty) {
        if (from == null || to == null || from.group.isEmpty() || to.group.isEmpty()) return 0d;
        return from.group.equals(to.group) ? 0d : penalty;
    }

    private static double groupSwitchPenalty(List<Stop> stops) {
        double minX = Double.POSITIVE_INFINITY;
        double maxX = Double.NEGATIVE_INFINITY;
        double minY = Double.POSITIVE_INFINITY;
        double maxY = Double.NEGATIVE_INFINITY;
        for (Stop stop : stops) {
            minX = Math.min(minX, stop.point.x);
            maxX = Math.max(maxX, stop.point.x);
            minY = Math.min(minY, stop.point.y);
            maxY = Math.max(maxY, stop.point.y);
        }
        return GROUP_SWITCH_FRACTION * Math.hypot(maxX - minX, maxY - minY);
    }

    private static double distance(Point left, Point right) {
        return Math.hypot(left.x - right.x, left.y - right.y);
    }

    private static boolean approximatelyEqual(double left, double right) {
        return Math.abs(left - right) <= EPSILON;
    }

    private static final class ExactState {
        final double cost;
        final List<Integer> order;

        ExactState(double cost, List<Integer> order) {
            this.cost = cost;
            this.order = order;
        }
    }
}
