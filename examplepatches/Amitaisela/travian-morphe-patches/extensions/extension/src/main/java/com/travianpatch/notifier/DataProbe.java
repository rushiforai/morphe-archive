package com.travianpatch.notifier;

import java.util.ArrayList;
import java.util.List;

/**
 * One-off, read-only look at game data the next features need (troops, academy/smithy, Gold status,
 * culture points, farm lists, crop finder, map tiles, hero adventures). Every field name comes from the
 * game's own client (its GraphQL types); this logs what the server really answers so the features are
 * built on live shapes. Only "query" requests: nothing is changed in the game. Pure logic (no Android
 * APIs) so it can be checked off-device.
 */
final class DataProbe {

    /** Set when the probe starts, so it never runs a second time. */
    static final String KEY_DONE = "data_probe_done_v1";
    /** Longest slice of one response that is logged. */
    static final int MAX_LOGGED_CHARS = 16000;
    /** Android cuts a log line near 4 KB, so long text is logged in pieces of this size. */
    static final int LOG_PIECE = 3000;

    private DataProbe() {
    }

    static boolean shouldRun(boolean done, int knownVillages) {
        return !done && knownVillages > 0;
    }

    private static final String RESOURCES = "{ lumber clay iron crop }";
    private static final String UNITS = "{ t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 }";

    static List<String> queries(String villageId, int x, int y) {
        List<String> q = new ArrayList<String>();
        q.add("query { bootstrapData { tribes { id units { id baseTrainingDuration attackPower "
                + "defencePowerAgainstInfantry defencePowerAgainstCavalry velocity carry upkeepCost trainedAt "
                + "requiredBuildings { buildingTypeId level } researchingCost " + RESOURCES + " researchDuration "
                + "trainingCost " + RESOURCES + " upgradingCost " + RESOURCES + " extraProperties { name value } } } "
                + "mapConfiguration { width height coreRadius } serverConfiguration { speed map { width height } } "
                + "settlersAmountToFoundVillage } }");
        q.add("query { ownVillage(id: " + villageId + ") { landDistribution cpProduction mainBuilding { level } "
                + "researchedUnits { id level } "
                + "academy { unitInDevelopment { eventId unitId finishedAt upgradeToLevel } } "
                + "smithy { unitsUnderResearch { eventId unitId finishedAt upgradeToLevel } } "
                + "barracks { trainingBonus } stable { trainingBonus } } }");
        q.add("query { ownPlayer { goldFeatures { goldClub troopEvasion travianPlus { isActive isAutoProlonged expiresAt } } "
                + "culturalPointsOverview { usedSlots maxControllableVillages cpProduced cpNeeded cpProducedForNextSlot "
                + "cpNeededForNextSlot nextSlotAvailableAt cpProductionTotal } notCollectedTasks dailyQuestsHasReward } }");
        q.add("query { ownPlayer { farmLists { id name ownerVillage { id } defaultTroop " + UNITS + " slotsAmount "
                + "runningRaidsAmount isExpanded sortIndex lastStartedTime useShip onlyLosses } } }");
        q.add(croplands(x, y, "TYPE_15"));
        q.add(croplands(x, y, "TYPE_9"));
        q.add("query { a: mapCell(coordinates: { x: " + x + ", y: " + y + " }) " + CELL
                + " b: mapCell(coordinates: { x: " + (x + 1) + ", y: " + y + " }) " + CELL
                + " c: mapCell(coordinates: { x: " + x + ", y: " + (y + 1) + " }) " + CELL + " }");
        q.add("query { mapBlock(xMin: " + (x - 3) + ", yMin: " + (y - 3) + ", xMax: " + (x + 3) + ", yMax: " + (y + 3)
                + ") { xMin yMin xMax yMax villages { id x y name } oases { id x y type bonusResources " + RESOURCES + " } } }");
        q.add("query { ownPlayer { hero { adventuresAmount health status { status } "
                + "adventures { id x y difficulty travelingDuration distance place } } } }");
        return q;
    }

    private static final String CELL = "{ id x y type groundType regionId landDistribution village { id name } "
            + "oasis { id type bonusResources { lumber clay iron crop } } }";

    private static String croplands(int x, int y, String type) {
        return "query { croplands(first: 10, filter: { startPosition: { x: " + x + ", y: " + y + " }, type: " + type
                + " }) { totalCount edges { node { distance x y type bonus mapId occupiedBy { id name } } } "
                + "pageInfo { hasNextPage endCursor } } }";
    }

    /** The slots of one farm list (asked only when the account has a list). */
    static String farmSlotsQuery(long listId) {
        return "query { farmList(id: " + listId + ") { id slots { id target { id x y name } troop " + UNITS
                + " distance isActive isRunning runningAttacks nextAttackAt isSpying "
                + "lastRaid { time bootyMax icon raidedResources " + RESOURCES + " } } } }";
    }

    /** Splits text into pieces of at most `piece` characters (Android cuts long log lines). */
    static List<String> split(String text, int piece) {
        List<String> out = new ArrayList<String>();
        if (text == null) {
            return out;
        }
        for (int i = 0; i < text.length(); i += piece) {
            out.add(text.substring(i, Math.min(text.length(), i + piece)));
        }
        return out;
    }
}
