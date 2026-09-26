package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * The player's tribe and, per village, every building slot (type and level) plus the build queue, as the
 * game reports them. Slot type 0 means an empty slot. Pure logic (no Android APIs) so it can be checked
 * against real sample data off-device.
 */
final class PlayerBuildings {

    /** One request for everything this class reads; every name was seen in a live response. */
    static final String QUERY = "query { ownPlayer { tribeId villages { id type "
            + "buildings { slotId buildingTypeId level } "
            + "buildEvents { slotId buildingTypeId aspiredLevel isActive } } } }";

    static final class Slot {
        final int slotId;
        final int typeId;
        final int level;

        Slot(int slotId, int typeId, int level) {
            this.slotId = slotId;
            this.typeId = typeId;
            this.level = level;
        }

        boolean isEmpty() {
            return typeId == 0;
        }
    }

    /** A queued build or upgrade. */
    static final class Pending {
        final int slotId;
        final int typeId;
        final int aspiredLevel;
        final boolean active;

        Pending(int slotId, int typeId, int aspiredLevel, boolean active) {
            this.slotId = slotId;
            this.typeId = typeId;
            this.aspiredLevel = aspiredLevel;
            this.active = active;
        }
    }

    static final class Village {
        final String id;
        /** 1 = capital, 0 = other (deduced from the game's own restriction data). */
        final int type;
        final List<Slot> slots;
        final List<Pending> pending;

        Village(String id, int type, List<Slot> slots, List<Pending> pending) {
            this.id = id;
            this.type = type;
            this.slots = slots;
            this.pending = pending;
        }

        /** Highest built level among slots of this type; 0 if none. */
        int levelOf(int typeId) {
            int best = 0;
            for (Slot s : slots) {
                if (s.typeId == typeId && s.level > best) {
                    best = s.level;
                }
            }
            return best;
        }

        /** Slots of this type, plus queued builds of it on a slot that isn't already that type. */
        int countOf(int typeId) {
            int count = 0;
            for (Slot s : slots) {
                if (s.typeId == typeId) {
                    count++;
                }
            }
            for (Pending p : pending) {
                if (p.typeId == typeId && !slotHasType(p.slotId, typeId)) {
                    count++;
                }
            }
            return count;
        }

        /** Highest queued target level for this slot; 0 if nothing is queued for it. */
        int queuedLevel(int slotId) {
            int best = 0;
            for (Pending p : pending) {
                if (p.slotId == slotId && p.aspiredLevel > best) {
                    best = p.aspiredLevel;
                }
            }
            return best;
        }

        boolean hasEmptySlot() {
            for (Slot s : slots) {
                if (s.isEmpty()) {
                    return true;
                }
            }
            return false;
        }

        private boolean slotHasType(int slotId, int typeId) {
            for (Slot s : slots) {
                if (s.slotId == slotId) {
                    return s.typeId == typeId;
                }
            }
            return false;
        }
    }

    final int tribeId;
    final List<Village> villages;

    private PlayerBuildings(int tribeId, List<Village> villages) {
        this.tribeId = tribeId;
        this.villages = villages;
    }

    Village findVillage(String id) {
        for (Village v : villages) {
            if (v.id.equals(id)) {
                return v;
            }
        }
        return null;
    }

    /** Reads the ownPlayer object's JSON text; null for null, unreadable or village-less input. Never throws. */
    static PlayerBuildings parse(String json) {
        if (json == null) {
            return null;
        }
        try {
            JSONObject root = new JSONObject(json);
            JSONArray array = root.optJSONArray("villages");
            if (array == null) {
                return null;
            }
            List<Village> villages = new ArrayList<Village>();
            for (int i = 0; i < array.length(); i++) {
                JSONObject v = array.optJSONObject(i);
                if (v == null || !v.has("id")) {
                    continue;
                }
                villages.add(parseVillage(v));
            }
            return new PlayerBuildings(root.optInt("tribeId", 0), villages);
        } catch (Exception e) {
            return null;
        }
    }

    private static Village parseVillage(JSONObject v) {
        List<Slot> slots = new ArrayList<Slot>();
        JSONArray buildings = v.optJSONArray("buildings");
        if (buildings != null) {
            for (int i = 0; i < buildings.length(); i++) {
                JSONObject b = buildings.optJSONObject(i);
                if (b != null) {
                    slots.add(new Slot(b.optInt("slotId"), b.optInt("buildingTypeId"), b.optInt("level")));
                }
            }
        }
        List<Pending> pending = new ArrayList<Pending>();
        JSONArray events = v.optJSONArray("buildEvents");
        if (events != null) {
            for (int i = 0; i < events.length(); i++) {
                JSONObject e = events.optJSONObject(i);
                if (e != null) {
                    pending.add(new Pending(e.optInt("slotId"), e.optInt("buildingTypeId"),
                            e.optInt("aspiredLevel"), e.optBoolean("isActive")));
                }
            }
        }
        return new Village(String.valueOf(v.opt("id")), v.optInt("type"), slots, pending);
    }
}
