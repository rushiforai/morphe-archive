package app.template.extension.extension;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/** Pure conversion and matching for the reflective native-map bridge. */
final class RouteMyListGeometry {
    private RouteMyListGeometry() {
    }

    static final class Poi {
        final String name;
        final String internalName;
        final double minX;
        final double maxX;
        final double minY;
        final double maxY;

        Poi(String name, String internalName, double minX, double maxX, double minY, double maxY) {
            this.name = name;
            this.internalName = internalName;
            this.minX = minX;
            this.maxX = maxX;
            this.minY = minY;
            this.maxY = maxY;
        }

        RouteOrderPlanner.Point center() {
            double x = (minX + maxX) / 2d;
            double y = (minY + maxY) / 2d;
            RouteOrderPlanner.Point point = new RouteOrderPlanner.Point(x, y);
            return point.isFinite() ? point : null;
        }
    }

    static final class Pin {
        final String zone;
        final String aisle;
        final String section;
        final RouteOrderPlanner.Point center;

        Pin(String zone, String aisle, String section, RouteOrderPlanner.Point center) {
            this.zone = zone;
            this.aisle = aisle;
            this.section = section;
            this.center = center;
        }
    }

    static final class ItemLocation {
        final int originalIndex;
        final String zone;
        final String aisle;
        final String section;

        ItemLocation(int originalIndex, String zone, String aisle, String section) {
            this.originalIndex = originalIndex;
            this.zone = zone;
            this.aisle = aisle;
            this.section = section;
        }
    }

    static List<RouteOrderPlanner.Entrance> entrancesFromPois(List<Poi> pois) {
        List<RouteOrderPlanner.Entrance> entrances = new ArrayList<>();
        if (pois == null) return entrances;
        for (Poi poi : pois) {
            if (poi == null || !isEntrance(poi) || isExitOnly(poi)) continue;
            RouteOrderPlanner.Point center = poi.center();
            if (center != null) entrances.add(new RouteOrderPlanner.Entrance(entranceId(poi), center));
        }
        return entrances;
    }

    static List<RouteOrderPlanner.Entrance> fallbackEntrances(List<Pin> pins) {
        List<RouteOrderPlanner.Entrance> entrances = new ArrayList<>();
        if (pins == null || pins.isEmpty()) return entrances;
        double minX = Double.POSITIVE_INFINITY;
        double maxX = Double.NEGATIVE_INFINITY;
        double maxY = Double.NEGATIVE_INFINITY;
        int validCount = 0;
        for (Pin pin : pins) {
            if (pin == null || pin.center == null || !pin.center.isFinite()) continue;
            validCount++;
            if (pin.center.x < minX) minX = pin.center.x;
            if (pin.center.x > maxX) maxX = pin.center.x;
            if (pin.center.y > maxY) maxY = pin.center.y;
        }
        if (validCount == 0) return entrances;
        // In Walmart store maps, entrances and checkouts are along the front (maximum Y).
        // Provide standard front entrances: Grocery entrance (left), GM entrance (right),
        // and Center entrance (midpoint).
        entrances.add(new RouteOrderPlanner.Entrance("grocery_entrance", new RouteOrderPlanner.Point(minX, maxY)));
        entrances.add(new RouteOrderPlanner.Entrance("main_entrance", new RouteOrderPlanner.Point((minX + maxX) / 2d, maxY)));
        entrances.add(new RouteOrderPlanner.Entrance("gm_entrance", new RouteOrderPlanner.Point(maxX, maxY)));
        return entrances;
    }

    static List<Integer> orderIndexes(List<Poi> pois, List<Pin> pins, List<ItemLocation> items) {
        if (items == null || items.size() < 2) return null;
        List<RouteOrderPlanner.Entrance> entrances = entrancesFromPois(pois);
        if (entrances.isEmpty()) {
            entrances = fallbackEntrances(pins);
        }
        if (entrances.isEmpty()) return null;
        Map<String, ArrayDeque<RouteOrderPlanner.Point>> pinsByLocation = new HashMap<>();
        if (pins != null) {
            for (Pin pin : pins) {
                if (pin == null || pin.center == null || !pin.center.isFinite()) continue;
                String key = key(pin.zone, pin.aisle, pin.section);
                ArrayDeque<RouteOrderPlanner.Point> centers = pinsByLocation.get(key);
                if (centers == null) {
                    centers = new ArrayDeque<>();
                    pinsByLocation.put(key, centers);
                }
                centers.addLast(pin.center);
            }
        }
        List<RouteOrderPlanner.Stop> stops = new ArrayList<>();
        for (ItemLocation item : items) {
            if (item == null) return null;
            ArrayDeque<RouteOrderPlanner.Point> centers = pinsByLocation.get(key(item.zone, item.aisle, item.section));
            if (centers == null || centers.isEmpty()) return null;
            RouteOrderPlanner.Point point = centers.size() > 1 ? centers.removeFirst() : centers.peekFirst();
            stops.add(new RouteOrderPlanner.Stop(item.originalIndex, point,
                    storeArea(item.zone, item.aisle)));
        }
        RouteOrderPlanner.Result result = RouteOrderPlanner.optimize(entrances, stops);
        return result == null ? null : result.orderedOriginalIndexes;
    }

    /**
     * Store area used to keep a route inside one part of the store (produce, frozen, ...): the
     * zone when Walmart supplies one, otherwise the letters that start the aisle code
     * ("AP-3" -> "AP"). Empty when neither is known, which disables grouping for that item.
     */
    static String storeArea(String zone, String aisle) {
        String trimmedZone = safe(zone).trim();
        if (!trimmedZone.isEmpty()) return trimmedZone.toUpperCase(Locale.US);
        String code = safe(aisle).trim();
        int end = 0;
        while (end < code.length() && Character.isLetter(code.charAt(end))) end++;
        return code.substring(0, end).toUpperCase(Locale.US);
    }

    /** Applies a complete, validated permutation or returns null without changing the input list. */
    static <T> List<T> reorder(List<T> source, List<Integer> indexes) {
        if (source == null || indexes == null || source.size() != indexes.size()) return null;
        boolean[] used = new boolean[source.size()];
        List<T> reordered = new ArrayList<>();
        for (Integer index : indexes) {
            if (index == null || index < 0 || index >= source.size() || used[index]) return null;
            used[index] = true;
            reordered.add(source.get(index));
        }
        return reordered;
    }

    private static boolean isEntrance(Poi poi) {
        String label = normalizedLabel(poi);
        return label.contains("entrance") || label.contains(" entry") || label.startsWith("entry ");
    }

    private static boolean isExitOnly(Poi poi) {
        String label = normalizedLabel(poi);
        return label.contains("exit") && !label.contains("entrance");
    }

    private static String entranceId(Poi poi) {
        if (poi.name != null && !poi.name.trim().isEmpty()) return poi.name.trim();
        return poi.internalName == null ? "entrance" : poi.internalName.trim();
    }

    private static String normalizedLabel(Poi poi) {
        return ((poi.name == null ? "" : poi.name) + " "
                + (poi.internalName == null ? "" : poi.internalName)).toLowerCase(Locale.US);
    }

    private static String key(String zone, String aisle, String section) {
        return safe(zone) + "\u001f" + safe(aisle) + "\u001f" + safe(section);
    }

    private static String safe(String value) {
        return value == null ? "" : value;
    }

    static String buildConnectorSvgPath(List<RouteOrderPlanner.Point> points) {
        if (points == null || points.size() < 2) {
            return "";
        }
        List<RouteOrderPlanner.Point> distinct = new ArrayList<>(points.size());
        for (RouteOrderPlanner.Point pt : points) {
            if (pt == null || !pt.isFinite()) continue;
            if (distinct.isEmpty() || Math.hypot(pt.x - distinct.get(distinct.size() - 1).x,
                                                 pt.y - distinct.get(distinct.size() - 1).y) > 0.5) {
                distinct.add(pt);
            }
        }
        if (distinct.size() < 2) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < distinct.size(); i++) {
            RouteOrderPlanner.Point p = distinct.get(i);
            if (i == 0) {
                sb.append("M ");
            } else {
                sb.append(" L ");
            }
            sb.append(String.format(Locale.US, "%.1f %.1f", p.x, p.y));
        }
        return sb.toString();
    }

}
