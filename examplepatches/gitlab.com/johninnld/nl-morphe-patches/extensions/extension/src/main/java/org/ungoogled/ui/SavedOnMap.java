package org.ungoogled.ui;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * The places kept on the phone, on Maps' own map (issue #36). Signed in, Maps draws the account's
 * personal places through one label generator: Home and Work, labels, and each saved place with
 * its list's icon -- a heart for Favorites, a flag for Want to go, a suitcase for Travel plans, a
 * star for Starred places, a pin for any other list. The patch routes that generator's place list
 * through withLocal(), so Local saved is drawn the same way, among the map's own labels, and asks
 * it to draw again whenever Local saved changes. A list set to "Hide on map" is left out.
 *
 * The speed cameras', Flock cameras' and Waze alerts' pins go the same way, in microG Maps too
 * (issue #55) -- where the account's own places are Maps' to draw, so Local saved's copies of them
 * are not added there.
 *
 * Every live generator is kept (the phone's map and, where Maps makes one, the car's), and each is
 * drawn again on a change. Drawing again rebuilds the labels of every visible tile, so redraws are
 * coalesced and held to one a second (WarningPins.MIN_REDRAW_MS).
 *
 * Maps hides the generator whenever a route is on the map, in preview and in navigation, on the phone
 * and in the car. While warning pins can be drawn, visible() keeps it shown and withLocal() hands it
 * only the pins: Maps' own places and Local saved stay off the route map, as Maps intends.
 */
public final class SavedOnMap {
    private SavedOnMap() {}

    private static final int NONE = 0, HOME = 1, WORK = 2, LABEL = 3;

    /** The generators turned on now, weakly: generators are compared by identity (they keep equals). */
    private static final Set<Object> generators = Collections.newSetFromMap(new WeakHashMap<>());
    private static final WarningPins.Throttle throttle = new WarningPins.Throttle(WarningPins.MIN_REDRAW_MS);
    private static boolean pending;
    /**
     * Our places in each generator's list now: taken out before the next ones go in. Kept per generator,
     * so another map's earlier pins are still recognised as ours and never pile up.
     */
    private static final Map<Object, Set<Object>> ours = new WeakHashMap<>();
    private static final Handler main = new Handler(Looper.getMainLooper());
    /** The generators Maps wants hidden now (a route is on the map), weakly, by identity. */
    private static final Set<Object> hiddenByMaps = Collections.newSetFromMap(new WeakHashMap<>());

    /**
     * From the start of the generator's place setter: [places] (the account's) with the phone's added --
     * only the warning pins while Maps wants the generator hidden.
     */
    public static Object withLocal(Object labels, Object places) {
        try {
            synchronized (generators) {
                generators.add(labels);
            }
            boolean routeOnly = hiddenByMaps(labels);
            List<Object> added = new ArrayList<>();
            if (!routeOnly && Shapes.localSavedPatched()) added.addAll(localPlaces());
            if (Shapes.speedCamerasPatched()) added.addAll(SpeedCameras.mapItems());
            if (Shapes.wazeAlertsPatched()) added.addAll(WazeAlerts.mapItems());
            List<Object> out;
            synchronized (ours) {
                out = compose(places, ours.get(labels), added, routeOnly);
                Set<Object> current = Collections.newSetFromMap(new IdentityHashMap<>());
                current.addAll(added);
                ours.put(labels, current);
            }
            return immutable(out);
        } catch (Throwable t) {
            android.util.Log.w("UA", "saved places on the map", t);
            return places;
        }
    }

    /**
     * The list a generator draws: Maps' [places] less our [previous] ones, then [added]; with [routeOnly]
     * (Maps wants it hidden for a route) Maps' places are left out and only [added] is drawn.
     */
    static List<Object> compose(Object places, Set<Object> previous, List<Object> added, boolean routeOnly) {
        List<Object> out = new ArrayList<>();
        if (!routeOnly && places instanceof Iterable) {
            for (Object o : (Iterable<?>) places) if (previous == null || !previous.contains(o)) out.add(o);
        }
        out.addAll(added);
        return out;
    }

    /**
     * From the start of the controller's visibility toggle, with its [labels] generator (null while the
     * controller is not created): Maps [wanted] it shown or hidden -- hidden whenever a route is drawn.
     * The answer is what the toggle does: shown still, while warning pins can be drawn.
     */
    public static boolean visible(Object labels, boolean wanted) {
        if (labels == null) return wanted;
        try {
            boolean changed;
            synchronized (hiddenByMaps) {
                changed = wanted ? hiddenByMaps.remove(labels) : hiddenByMaps.add(labels);
            }
            boolean shown = keepShown(wanted, pinsPossible());
            // Maps' places go or come back with the route: the next draw, coalesced as always.
            if (changed && shown) refresh();
            return shown;
        } catch (Throwable t) {
            android.util.Log.w("UA", "saved places on the map", t);
            return wanted;
        }
    }

    /** What the visibility toggle does when Maps [wanted] it, while [pins] can be drawn. */
    static boolean keepShown(boolean wanted, boolean pins) {
        return wanted || pins;
    }

    /** Whether a warning pin can be drawn now: a pin patch included and its map pins turned on. */
    static boolean pinsPossible() {
        // Short-circuit: the pin classes' settings are read only where their patch is included.
        return (Shapes.speedCamerasPatched() && (SpeedCameras.MAP || SpeedCameras.FLOCK_MAP))
            || (Shapes.wazeAlertsPatched() && WazeAlerts.MAP);
    }

    static boolean hiddenByMaps(Object labels) {
        synchronized (hiddenByMaps) {
            return hiddenByMaps.contains(labels);
        }
    }

    /** From the generator turning on or off, with the map: on, it draws the phone's places too. */
    public static void shown(Object labels, boolean on) {
        synchronized (generators) {
            if (!on) {
                generators.remove(labels);
                // Off for real (destroyed, or hidden with no pins to draw): it comes back with everything.
                synchronized (hiddenByMaps) {
                    hiddenByMaps.remove(labels);
                }
                return;
            }
            generators.add(labels);
        }
        refresh();
    }

    /**
     * Draws our places again on every generator: after any change to Local saved or to the pins. Calls
     * while one is waiting fold into it; the first after a quiet second runs at once.
     */
    static void refresh() {
        long delay;
        synchronized (generators) {
            if (pending || generators.isEmpty()) return;
            pending = true;
            delay = throttle.delay(SystemClock.elapsedRealtime());
        }
        main.postDelayed(SavedOnMap::redrawAll, delay);
    }

    private static void redrawAll() {
        List<Object> live;
        synchronized (generators) {
            pending = false;
            throttle.ran(SystemClock.elapsedRealtime());
            live = new ArrayList<>(generators);
        }
        for (Object labels : live) {
            try {
                redraw(labels);
            } catch (Throwable t) {
                android.util.Log.w("UA", "saved places on the map", t);
            }
        }
    }

    /** Rewritten by the patch: the generator draws its place list again (through withLocal). */
    static void redraw(Object labels) {}

    /** Rewritten by the patch: Maps' own immutable list of [places]. */
    static Object immutable(List<Object> places) { return places; }

    /**
     * Rewritten by the patch: Maps' description of the list [id] -- [type] is its kind's name (FAVORITES,
     * CUSTOM, ...); a CUSTOM list with an [emoji] is drawn with it.
     */
    static Object listInfo(String id, String type, String name, String emoji) { return null; }

    /**
     * Rewritten by the patch: one of Maps' personal places at [lat],[lng] with feature id [high]:[low]
     * (0:0 for a bare spot), named [title]; [alias] Home, Work or a label, [list] a listInfo or null,
     * [starred] for Starred places.
     */
    static Object item(long high, long low, double lat, double lng, String title, String subtitle, int alias, Object list, boolean starred) {
        return null;
    }

    /** Home, Work, the labels and every saved place in a list shown on the map, once each. */
    private static List<Object> localPlaces() {
        List<Object> out = new ArrayList<>();
        Context c = Shapes.appContext();
        if (c == null) return out;
        SavedStore.load(c);
        Set<String> drawn = new HashSet<>();
        synchronized (SavedStore.class) {
            if (SavedStore.home != null) add(out, drawn, SavedStore.home, "Home", HOME, null, null, null, false);
            if (SavedStore.work != null) add(out, drawn, SavedStore.work, "Work", WORK, null, null, null, false);
            for (Map.Entry<String, SavedStore.Place> e : SavedStore.labels.entrySet()) {
                add(out, drawn, e.getValue(), e.getKey(), LABEL, null, null, null, false);
            }
            for (SavedStore.Place p : SavedStore.places.values()) {
                // One icon a place, picked the way Maps' Save button picks: Favorites, Want to go,
                // Travel plans, Starred, then any other list -- of the lists shown on the map.
                String list = shownList(p);
                if (list == null) continue;
                String name = SavedStore.lists.get(list);
                if (SavedStore.FAVOURITES.equals(list)) add(out, drawn, p, p.name, NONE, list, "FAVORITES", name, false);
                else if (SavedStore.WANT_TO_GO.equals(list)) add(out, drawn, p, p.name, NONE, list, "WANT_TO_GO", name, false);
                else if (SavedStore.TRAVEL.equals(list)) add(out, drawn, p, p.name, NONE, list, "TRAVEL_PLANS", name, false);
                else if (SavedStore.STARRED.equals(list)) add(out, drawn, p, p.name, NONE, null, null, null, true);
                else if (list.isEmpty()) add(out, drawn, p, p.name, NONE, "saved", "JUST_SAVE", "Saved", false);
                else add(out, drawn, p, p.name, NONE, list, "CUSTOM", name, false);
            }
        }
        return out;
    }

    /** The list [p] is drawn with: "" when it is saved in no list, null when all its lists are hidden. */
    private static String shownList(SavedStore.Place p) {
        if (p.lists.isEmpty()) return "";
        for (String l : new String[]{SavedStore.FAVOURITES, SavedStore.WANT_TO_GO, SavedStore.TRAVEL, SavedStore.STARRED}) {
            if (p.lists.contains(l) && !SavedStore.hiddenOnMap.contains(l)) return l;
        }
        for (String l : p.lists) if (!SavedStore.hiddenOnMap.contains(l) && SavedStore.lists.containsKey(l)) return l;
        return null;
    }

    private static void add(List<Object> out, Set<String> drawn, SavedStore.Place p, String title, int alias,
            String listId, String listType, String listName, boolean starred) {
        if (p == null || !p.located() || !drawn.add(p.key())) return;
        long high = 0, low = 0;
        // The feature id "0x89b7b7bce3d77213:0xbd541016f552a256": two hex longs.
        int colon = p.ftid == null ? -1 : p.ftid.indexOf(':');
        if (colon > 2 && p.ftid.startsWith("0x") && p.ftid.startsWith("0x", colon + 1)) {
            high = Long.parseUnsignedLong(p.ftid.substring(2, colon), 16);
            low = Long.parseUnsignedLong(p.ftid.substring(colon + 3), 16);
        }
        String name = title != null && !title.isEmpty() ? title : p.name != null ? p.name : "";
        Object list = listType == null ? null : listInfo("ungoogled:" + listId, listType, listName != null ? listName : "", null);
        Object item = item(high, low, p.lat, p.lng, name, name, alias, list, starred);
        if (item != null) out.add(item);
    }
}
