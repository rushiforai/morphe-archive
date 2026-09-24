package com.travianpatch.notifier;

import java.util.ArrayList;
import java.util.List;

/**
 * The exact read-only queries used, once per install, to learn the real shape of the game's building
 * data. Round 1 (live, 2026-09-24) showed: the rules table is bootstrapData.buildings (not
 * buildingsRaw), ownVillage(id:) wants an Int id, and a village's buildings list works. Round 2 asks
 * for the rest of what the game's own client lists under those parents.
 *
 * Facts about this server that shape the list (all seen live): GraphQL introspection is refused, and
 * a nested field the schema doesn't have is silently omitted instead of raising an error, while a real
 * object asked for with no sub-fields comes back as an empty object. So many candidate names can share
 * one query safely, an absent key means "wrong name", and an empty object or list means "real object,
 * ask for its sub-fields". Pure logic (no Android APIs) so it can be checked off-device.
 */
final class BuildingProbe {

    private BuildingProbe() {
    }

    /** Run exactly once per install, and only after a poll has already seen at least one village. */
    static boolean shouldRun(boolean alreadyDone, int knownVillages) {
        return !alreadyDone && knownVillages > 0;
    }

    /** The queries for one village, or none if the id isn't 1-12 plain digits. */
    static List<String> queries(String villageId) {
        List<String> out = new ArrayList<String>();
        if (villageId == null || !villageId.matches("[0-9]{1,12}")) {
            return out;
        }

        // The game's own rules table: one entry per building, static per world/version.
        out.add(rules("id typeId buildingTypeId buildingType type tid name title key sortIndex category maxLevel "
                + "maxPerVillage baseBuildingTime buildingTimeFactor additionalBuildingTime"));
        out.add(rules("validTribes validVillageTypes requiredBuildings levels restrictions extension categoryEnum"));
        out.add(rules("validTribes { id tribeId }"));
        out.add(rules("validVillageTypes { id type }"));
        out.add(rules("requiredBuildings { id typeId buildingTypeId absoluteBuildingTypeId level requiredLevel "
                + "minLevel building buildingId }"));
        out.add(rules("levels { level cropUsage producedCulture producedPopulation effectValue time buildTime "
                + "upgradeTime duration }"));
        out.add(rules("levels { buildCostObject buildingCost }"));
        out.add(rules("levels { buildCostObject { lumber clay iron crop wood stone resources amounts id type "
                + "amount value } }"));
        out.add(rules("levels { buildingCost { lumber clay iron crop wood stone resources amounts id type "
                + "amount value } }"));
        out.add(rules("restrictions { id type value level villageType buildingTypeId tribeId description }"));
        out.add(rules("extension { maxLevel levels { buildingCost producedCulture producedPopulation effectValue } }"));
        out.add(bootstrap("serverConfiguration { speed serverSpeed troopSpeed buildingSpeed constructionSpeed "
                + "gameSpeed name id startTime endTime tribes mapSize }"));
        out.add(bootstrap("gameworld { id name speed serverSpeed startTime endTime }"));

        // This village's own buildings, queue and the player's tribe.
        out.add(village(villageId, "buildings { id slotId buildingTypeId level levelUpdateTimestamp aspiredLevel "
                + "upgradeTime upgradeCost cost costs nextLevel maxLevel canUpgrade isMaxLevel finishedAt "
                + "timestamp underConstruction upgradeError }"));
        out.add(village(villageId, "mainBuildingLevel timeReduction buildingTimeReduction masterBuilder "
                + "buildingUpgrade upgradeQueue constructionQueue villageType villageLayout layout type "
                + "isCapital capital population culturePoints"));
        out.add(village(villageId, "buildEvents { id buildingTypeId slotId aspiredLevel timestamp isActive "
                + "startTime startedAt duration cost buildCostObject upgradeCostObject type }"));
        out.add("query { ownPlayer { tribeId tribe race id name } }");
        out.add("query { ownPlayer { villages { id isCapital capital villageType type mainVillage } } }");
        return out;
    }

    private static String rules(String selection) {
        return bootstrap("buildings { " + selection + " }");
    }

    private static String bootstrap(String selection) {
        return "query { bootstrapData { " + selection + " } }";
    }

    private static String village(String villageId, String selection) {
        return "query { ownVillage(id: " + villageId + ") { " + selection + " } }";
    }
}
