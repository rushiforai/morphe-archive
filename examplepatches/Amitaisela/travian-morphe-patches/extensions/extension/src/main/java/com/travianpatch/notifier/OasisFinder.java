package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Oases around a village, read from the game: which cells hold an oasis, the animals in it (FreeOasis
 * troops), and the animals' attack/defence from the game's unit table (tribe 4). Also the hero's fighting
 * strength. Sorting is by straight-line distance on the map grid, shown as "about"; the game's own travel
 * time comes from the game. There is no win/loss prediction: the game doesn't give its fight formula.
 * Pure logic (no Android APIs).
 */
final class OasisFinder {

    /** The game's animals are tribe 4 (TribeName: ROMANS=1, TEUTONS, GAULS, NATURE, NATARS; tribe 4 has 10 units). */
    static final int NATURE_TRIBE = 4;
    /** Cells read in each direction around the village. */
    static final int RADIUS = 3;

    private OasisFinder() {
    }

    static final class Oasis {
        final int id, x, y, type;
        /** The map cell's id (MapCell.id): what a troop send targets. 0 when not read. */
        final int cellId;
        /** Animals by unit code ("t1".."t10"); null when the game didn't say. */
        final Map<String, Integer> animals;
        final double distance;

        Oasis(int id, int cellId, int x, int y, int type, Map<String, Integer> animals, double distance) {
            this.id = id;
            this.cellId = cellId;
            this.x = x;
            this.y = y;
            this.type = type;
            this.animals = animals;
            this.distance = distance;
        }

        int animalCount() {
            int n = 0;
            if (animals != null) {
                for (Integer v : animals.values()) {
                    n += v == null ? 0 : v;
                }
            }
            return n;
        }

        /** True only when the game said there are no animals. */
        boolean empty() {
            return animals != null && animalCount() == 0;
        }
    }

    /** One animal's stats from the game: attack, defence against infantry, defence against cavalry. */
    static final class Stats {
        final int attack, defInfantry, defCavalry;

        Stats(int attack, int defInfantry, int defCavalry) {
            this.attack = attack;
            this.defInfantry = defInfantry;
            this.defCavalry = defCavalry;
        }
    }

    /** The read for the cells around (x|y): every cell with its oasis and animals, one alias per cell. */
    static String gridQuery(int x, int y) {
        StringBuilder b = new StringBuilder("query {");
        int n = 0;
        for (int dy = -RADIUS; dy <= RADIUS; dy++) {
            for (int dx = -RADIUS; dx <= RADIUS; dx++) {
                b.append(" c").append(n++).append(": mapCell(coordinates: { x: ").append(x + dx).append(", y: ")
                        .append(y + dy).append(" }) { id x y oasis { id x y type ... on FreeOasis { troops "
                        + "{ t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 } } } }");
            }
        }
        return b.append(" }").toString();
    }

    static final String NATURE_QUERY = "query { bootstrapData { tribes { id units { id attackPower "
            + "defencePowerAgainstInfantry defencePowerAgainstCavalry } } } }";

    static final String HERO_QUERY = "query { ownPlayer { hero { health isAlive status { status arrivalAt } "
            + "attributes { code value } } } }";

    /** The oases in a gridQuery answer's "data", nearest first. */
    static List<Oasis> parseGrid(JSONObject data, int fromX, int fromY) {
        List<Oasis> out = new ArrayList<Oasis>();
        if (data == null) {
            return out;
        }
        Iterator<String> keys = data.keys();
        while (keys.hasNext()) {
            JSONObject cell = data.optJSONObject(keys.next());
            JSONObject o = cell == null ? null : cell.optJSONObject("oasis");
            if (o == null) {
                continue;
            }
            int x = o.optInt("x", cell.optInt("x")), y = o.optInt("y", cell.optInt("y"));
            Map<String, Integer> animals = null;
            JSONObject troops = o.optJSONObject("troops");
            if (troops != null) {
                animals = new LinkedHashMap<String, Integer>();
                for (int i = 1; i <= 10; i++) {
                    int n = troops.optInt("t" + i, 0);
                    if (n > 0) {
                        animals.put("t" + i, n);
                    }
                }
            }
            out.add(new Oasis(o.optInt("id"), cell.optInt("id", 0), x, y, o.optInt("type"), animals,
                    distance(fromX, fromY, x, y)));
        }
        Collections.sort(out, new Comparator<Oasis>() {
            @Override
            public int compare(Oasis a, Oasis b) {
                return Double.compare(a.distance, b.distance);
            }
        });
        return out;
    }

    /** The animals' stats from a NATURE_QUERY answer's "data"; empty when tribe 4 is missing. */
    static Map<String, Stats> parseNature(JSONObject data) {
        Map<String, Stats> out = new LinkedHashMap<String, Stats>();
        JSONObject boot = data == null ? null : data.optJSONObject("bootstrapData");
        JSONArray tribes = boot == null ? null : boot.optJSONArray("tribes");
        for (int i = 0; tribes != null && i < tribes.length(); i++) {
            JSONObject t = tribes.optJSONObject(i);
            if (t == null || t.optInt("id") != NATURE_TRIBE) {
                continue;
            }
            JSONArray units = t.optJSONArray("units");
            for (int k = 0; units != null && k < units.length(); k++) {
                JSONObject u = units.optJSONObject(k);
                if (u != null) {
                    out.put(u.optString("id"), new Stats(u.optInt("attackPower"),
                            u.optInt("defencePowerAgainstInfantry"), u.optInt("defencePowerAgainstCavalry")));
                }
            }
        }
        return out;
    }

    /** Total animal defence {against infantry, against cavalry}; null when animals or stats are unknown. */
    static long[] defence(Oasis o, Map<String, Stats> nature) {
        if (o.animals == null || nature == null || nature.isEmpty()) {
            return null;
        }
        long inf = 0, cav = 0;
        for (Map.Entry<String, Integer> e : o.animals.entrySet()) {
            Stats s = nature.get(e.getKey());
            if (s == null) {
                return null;
            }
            inf += (long) s.defInfantry * e.getValue();
            cav += (long) s.defCavalry * e.getValue();
        }
        return new long[]{inf, cav};
    }

    /** The hero's "Fighting strength" (attribute code "power") from a HERO_QUERY answer's "data", or -1. */
    static int heroPower(JSONObject data) {
        JSONObject hero = hero(data);
        JSONArray attrs = hero == null ? null : hero.optJSONArray("attributes");
        for (int i = 0; attrs != null && i < attrs.length(); i++) {
            JSONObject a = attrs.optJSONObject(i);
            if (a != null && "power".equals(a.optString("code"))) {
                return (int) Math.round(a.optDouble("value", -1));
            }
        }
        return -1;
    }

    static JSONObject hero(JSONObject data) {
        JSONObject player = data == null ? null : data.optJSONObject("ownPlayer");
        return player == null ? null : player.optJSONObject("hero");
    }

    /** "t5 ×9, t6 ×4" (the game's unit codes; animal names aren't in its data we read). */
    static String animalsText(Oasis o) {
        if (o.animals == null) {
            return "animals not known";
        }
        if (o.animals.isEmpty()) {
            return "no animals";
        }
        StringBuilder b = new StringBuilder();
        for (Map.Entry<String, Integer> e : o.animals.entrySet()) {
            if (b.length() > 0) {
                b.append(", ");
            }
            b.append(e.getKey()).append(" ×").append(e.getValue());
        }
        return b.toString();
    }

    static double distance(int x1, int y1, int x2, int y2) {
        double dx = x2 - x1, dy = y2 - y1;
        return Math.sqrt(dx * dx + dy * dy);
    }
}
