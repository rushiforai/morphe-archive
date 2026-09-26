package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * The game's own building rules table (bootstrapData.buildings): per building type its maximum level,
 * how many may stand in one village, which tribes and village kinds may have it, what must already be
 * built, and per level the exact resource cost and effect numbers. Everything here is read from the
 * game's response; nothing is typed in from outside. Pure logic (no Android APIs) so it can be checked
 * against real sample data off-device.
 */
final class BuildingRules {

    /** SharedPreferences file that holds the downloaded table (kept apart because it is large). */
    static final String PREFS = "travian_building_rules";
    static final String KEY_JSON = "bootstrap_json";
    static final String KEY_VERSION = "release_version";
    /** The query text the saved table was downloaded with; a newer app asking for more fields downloads again. */
    static final String KEY_QUERY = "query_text";

    /** True when a saved table exists and was downloaded with the query this app version uses. */
    static boolean cacheUsable(String savedJson, String savedQuery) {
        return savedJson != null && QUERY.equals(savedQuery);
    }

    /** Cheap check of which game version the table belongs to. */
    static final String VERSION_QUERY = "query { bootstrapData { releaseVersion } }";

    /** One request for the whole table; every field name here was seen in a live response. */
    static final String QUERY = "query { bootstrapData { releaseVersion serverConfiguration { speed } "
            + "buildings { type maxLevel maxPerVillage baseBuildingTime buildingTimeFactor additionalBuildingTime "
            + "validTribes validVillageTypes requiredBuildings { buildingTypeId level } restrictions "
            + "levels { level cropUsage producedCulture producedPopulation effectValue "
            + "buildingCost { lumber clay iron crop } } extension { maxLevel } } } }";

    /** One alternative inside a requirement group. A negative buildingTypeId means "must not have that building". */
    static final class Requirement {
        final int buildingTypeId;
        final int level;

        Requirement(int buildingTypeId, int level) {
            this.buildingTypeId = buildingTypeId;
            this.level = level;
        }
    }

    /** What the game lists for one level of one building. */
    static final class Level {
        final int level;
        final long lumber, clay, iron, crop;
        final long effectValue, producedPopulation, producedCulture, cropUsage;

        Level(int level, long lumber, long clay, long iron, long crop,
              long effectValue, long producedPopulation, long producedCulture, long cropUsage) {
            this.level = level;
            this.lumber = lumber;
            this.clay = clay;
            this.iron = iron;
            this.crop = crop;
            this.effectValue = effectValue;
            this.producedPopulation = producedPopulation;
            this.producedCulture = producedCulture;
            this.cropUsage = cropUsage;
        }
    }

    /** The game's rules for one building type. */
    static final class Rule {
        final int type;
        final int maxLevel;
        /** 0 means as many as you like. */
        final int maxPerVillage;
        final long baseBuildingTime;
        final double buildingTimeFactor;
        final long additionalBuildingTime;
        final List<Integer> validTribes;
        final List<Integer> validVillageTypes;
        /** AND of OR-groups: every group needs at least one alternative met. An empty group asks for nothing. */
        final List<List<Requirement>> requirements;
        final List<String> restrictions;
        final List<Level> levels;
        /** The game gives walls an "extension" block; true when this type has one. */
        boolean hasExtension;

        Rule(int type, int maxLevel, int maxPerVillage, long baseBuildingTime, double buildingTimeFactor,
             long additionalBuildingTime, List<Integer> validTribes, List<Integer> validVillageTypes,
             List<List<Requirement>> requirements, List<String> restrictions, List<Level> levels) {
            this.type = type;
            this.maxLevel = maxLevel;
            this.maxPerVillage = maxPerVillage;
            this.baseBuildingTime = baseBuildingTime;
            this.buildingTimeFactor = buildingTimeFactor;
            this.additionalBuildingTime = additionalBuildingTime;
            this.validTribes = validTribes;
            this.validVillageTypes = validVillageTypes;
            this.requirements = requirements;
            this.restrictions = restrictions;
            this.levels = levels;
        }

        /** The entry the game lists for exactly this level, or null if the table has none. */
        Level levelData(int level) {
            for (Level l : levels) {
                if (l.level == level) {
                    return l;
                }
            }
            return null;
        }
    }

    final String releaseVersion;
    /** The world's speed as the game reports it; 0 when the response had none. */
    final double speed;
    final List<Rule> rules;

    private BuildingRules(String releaseVersion, double speed, List<Rule> rules) {
        this.releaseVersion = releaseVersion;
        this.speed = speed;
        this.rules = rules;
    }

    Rule find(int type) {
        for (Rule r : rules) {
            if (r.type == type) {
                return r;
            }
        }
        return null;
    }

    /** Reads the bootstrapData object's JSON text; null for null, unreadable or empty input. Never throws. */
    static BuildingRules parse(String json) {
        if (json == null) {
            return null;
        }
        try {
            JSONObject root = new JSONObject(json);
            JSONArray buildings = root.optJSONArray("buildings");
            if (buildings == null || buildings.length() == 0) {
                return null;
            }
            List<Rule> rules = new ArrayList<Rule>();
            for (int i = 0; i < buildings.length(); i++) {
                JSONObject b = buildings.optJSONObject(i);
                if (b == null || !b.has("type")) {
                    continue;
                }
                rules.add(parseRule(b));
            }
            if (rules.isEmpty()) {
                return null;
            }
            JSONObject config = root.optJSONObject("serverConfiguration");
            return new BuildingRules(root.optString("releaseVersion", ""),
                    config == null ? 0 : config.optDouble("speed", 0), rules);
        } catch (Exception e) {
            return null;
        }
    }

    private static Rule parseRule(JSONObject b) {
        List<List<Requirement>> requirements = new ArrayList<List<Requirement>>();
        JSONArray groups = b.optJSONArray("requiredBuildings");
        if (groups != null) {
            for (int g = 0; g < groups.length(); g++) {
                List<Requirement> group = new ArrayList<Requirement>();
                JSONArray alternatives = groups.optJSONArray(g);
                if (alternatives != null) {
                    for (int a = 0; a < alternatives.length(); a++) {
                        JSONObject alt = alternatives.optJSONObject(a);
                        if (alt != null) {
                            group.add(new Requirement(alt.optInt("buildingTypeId", 0), alt.optInt("level", 0)));
                        }
                    }
                }
                requirements.add(group);
            }
        }
        List<Level> levels = new ArrayList<Level>();
        JSONArray levelArray = b.optJSONArray("levels");
        if (levelArray != null) {
            for (int l = 0; l < levelArray.length(); l++) {
                JSONObject lv = levelArray.optJSONObject(l);
                if (lv == null || !lv.has("level")) {
                    continue;
                }
                JSONObject cost = lv.optJSONObject("buildingCost");
                levels.add(new Level(lv.optInt("level"),
                        cost == null ? 0 : cost.optLong("lumber", 0), cost == null ? 0 : cost.optLong("clay", 0),
                        cost == null ? 0 : cost.optLong("iron", 0), cost == null ? 0 : cost.optLong("crop", 0),
                        lv.optLong("effectValue", 0), lv.optLong("producedPopulation", 0),
                        lv.optLong("producedCulture", 0), lv.optLong("cropUsage", 0)));
            }
        }
        Rule rule = new Rule(b.optInt("type"), b.optInt("maxLevel", 0), b.optInt("maxPerVillage", 0),
                b.optLong("baseBuildingTime", 0), b.optDouble("buildingTimeFactor", 0),
                b.optLong("additionalBuildingTime", 0), intList(b.optJSONArray("validTribes")),
                intList(b.optJSONArray("validVillageTypes")), requirements,
                stringList(b.optJSONArray("restrictions")), levels);
        rule.hasExtension = b.optJSONObject("extension") != null;
        return rule;
    }

    private static List<Integer> intList(JSONArray array) {
        List<Integer> out = new ArrayList<Integer>();
        if (array != null) {
            for (int i = 0; i < array.length(); i++) {
                out.add(array.optInt(i));
            }
        }
        return out;
    }

    private static List<String> stringList(JSONArray array) {
        List<String> out = new ArrayList<String>();
        if (array != null) {
            for (int i = 0; i < array.length(); i++) {
                out.add(array.optString(i));
            }
        }
        return out;
    }
}
