package com.travianpatch.notifier;

import java.util.HashMap;
import java.util.Map;

/**
 * Static lookup table turning Travian's numeric building/field type ids into
 * names for notifications. These are the classic Travian building ids that
 * have stayed stable across Travian versions for years and are widely reused
 * by community tools. Confidence is high for ids 1-11 and 15-26 (1-4 are
 * your own resource fields, so they're self-verifiable at a glance); entries
 * past that are filled in best-effort. If a notification ever shows the
 * wrong name for your account, fix the entry here rather than distrust the
 * whole table — Travian: Legends' mobile API could in principle renumber a
 * handful of the less common ones.
 */
final class GameData {

    private static final Map<Integer, String> BUILDING_NAMES = new HashMap<Integer, String>();

    static {
        BUILDING_NAMES.put(1, "Woodcutter");
        BUILDING_NAMES.put(2, "Clay Pit");
        BUILDING_NAMES.put(3, "Iron Mine");
        BUILDING_NAMES.put(4, "Cropland");
        BUILDING_NAMES.put(5, "Sawmill");
        BUILDING_NAMES.put(6, "Brickyard");
        BUILDING_NAMES.put(7, "Iron Foundry");
        BUILDING_NAMES.put(8, "Grain Mill");
        BUILDING_NAMES.put(9, "Bakery");
        BUILDING_NAMES.put(10, "Warehouse");
        BUILDING_NAMES.put(11, "Granary");
        BUILDING_NAMES.put(13, "Smithy");
        BUILDING_NAMES.put(14, "Tournament Square");
        BUILDING_NAMES.put(15, "Main Building");
        BUILDING_NAMES.put(16, "Rally Point");
        BUILDING_NAMES.put(17, "Marketplace");
        BUILDING_NAMES.put(18, "Embassy");
        BUILDING_NAMES.put(19, "Barracks");
        BUILDING_NAMES.put(20, "Stable");
        BUILDING_NAMES.put(21, "Workshop");
        BUILDING_NAMES.put(22, "Academy");
        BUILDING_NAMES.put(23, "Cranny");
        BUILDING_NAMES.put(24, "Town Hall");
        BUILDING_NAMES.put(25, "Residence");
        BUILDING_NAMES.put(26, "Palace");
        BUILDING_NAMES.put(27, "Treasury");
        BUILDING_NAMES.put(28, "Trade Office");
        BUILDING_NAMES.put(29, "Great Barracks");
        BUILDING_NAMES.put(30, "Great Stable");
        BUILDING_NAMES.put(31, "City Wall");
        BUILDING_NAMES.put(32, "Earth Wall");
        BUILDING_NAMES.put(33, "Palisade");
        BUILDING_NAMES.put(34, "Stone Wall");
        BUILDING_NAMES.put(35, "Brewery");
        BUILDING_NAMES.put(36, "Trapper");
        BUILDING_NAMES.put(37, "Hero's Mansion");
        BUILDING_NAMES.put(38, "Great Warehouse");
        BUILDING_NAMES.put(39, "Great Granary");
        BUILDING_NAMES.put(40, "Wonder of the World");
        BUILDING_NAMES.put(41, "Horse Drinking Trough");
        BUILDING_NAMES.put(42, "Water Ditch");
        BUILDING_NAMES.put(43, "Natarian Wall");
    }

    private GameData() {
    }

    static String buildingName(int buildingTypeId) {
        String name = BUILDING_NAMES.get(buildingTypeId);
        return name != null ? name : ("Building #" + buildingTypeId);
    }
}
