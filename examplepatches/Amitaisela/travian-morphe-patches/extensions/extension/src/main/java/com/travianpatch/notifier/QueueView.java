package com.travianpatch.notifier;

import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Turns the queue entries the background check keeps (buildings being upgraded, troops in training) into
 * what the Queues screen shows: grouped by village, soonest first, with the time left. Pure logic (no
 * Android APIs) so it can be checked against sample data off-device.
 *
 * Reads the stored state of NotifierWorker: an object keyed by event id, each entry with kind, villageName,
 * villageX, villageY, buildingTypeId, aspiredLevel, initialUnitsLeft and finishMs.
 */
final class QueueView {

    /** One thing in a queue. */
    static final class Item {
        final String label;
        /** When it finishes (epoch ms), 0 if unknown. */
        final long finishMs;

        Item(String label, long finishMs) {
            this.label = label;
            this.finishMs = finishMs;
        }
    }

    /** All the queue entries of one village. */
    static final class Group {
        final String title;
        final List<Item> items = new ArrayList<Item>();

        Group(String title) {
            this.title = title;
        }

        /** Soonest known finish time, or Long.MAX_VALUE if none of the entries has one. */
        long earliest() {
            long best = Long.MAX_VALUE;
            for (Item item : items) {
                if (item.finishMs > 0 && item.finishMs < best) {
                    best = item.finishMs;
                }
            }
            return best;
        }
    }

    private QueueView() {
    }

    /** Villages ordered by their soonest finish, each with its entries soonest first; empty for null or unreadable input. */
    static List<Group> parse(String json) {
        Map<String, Group> byVillage = new LinkedHashMap<String, Group>();
        if (json != null) {
            try {
                JSONObject root = new JSONObject(json);
                Iterator<String> keys = root.keys();
                while (keys.hasNext()) {
                    JSONObject e = root.getJSONObject(keys.next());
                    String title = e.getString("villageName") + " (" + e.getInt("villageX") + "|" + e.getInt("villageY") + ")";
                    Group group = byVillage.get(title);
                    if (group == null) {
                        group = new Group(title);
                        byVillage.put(title, group);
                    }
                    group.items.add(new Item(label(e), e.optLong("finishMs", 0)));
                }
            } catch (Exception ex) {
                return new ArrayList<Group>(); // unreadable: show nothing rather than half of it
            }
        }
        List<Group> groups = new ArrayList<Group>(byVillage.values());
        for (Group group : groups) {
            Collections.sort(group.items, new Comparator<Item>() {
                @Override
                public int compare(Item a, Item b) {
                    return Long.compare(sortKey(a), sortKey(b));
                }
            });
        }
        Collections.sort(groups, new Comparator<Group>() {
            @Override
            public int compare(Group a, Group b) {
                return Long.compare(a.earliest(), b.earliest());
            }
        });
        return groups;
    }

    /** Unknown finish times go last. */
    private static long sortKey(Item item) {
        return item.finishMs > 0 ? item.finishMs : Long.MAX_VALUE;
    }

    private static String label(JSONObject e) {
        String kind = e.optString("kind", "");
        if ("build".equals(kind)) {
            String name = GameData.buildingName(e.optInt("buildingTypeId", -1));
            int level = e.optInt("aspiredLevel", -1);
            return level >= 0 ? name + " to level " + level : name + " upgrade";
        }
        String base = "train".equals(kind) ? "Troop training"
                : "stable".equals(kind) ? "Stable training"
                : "Barracks training";
        int units = e.optInt("initialUnitsLeft", 0);
        return units > 0 ? base + " (" + units + " units)" : base;
    }

    /** "in 10 min 0 s (22:23)", "finishing now" or "time unknown". */
    static String when(Item item, long nowMs) {
        if (item.finishMs <= 0) {
            return "time unknown";
        }
        if (item.finishMs <= nowMs) {
            return "finishing now";
        }
        String clock = new SimpleDateFormat("HH:mm", Locale.US).format(new Date(item.finishMs));
        return "in " + AlertStatus.duration(item.finishMs - nowMs) + " (" + clock + ")";
    }
}
