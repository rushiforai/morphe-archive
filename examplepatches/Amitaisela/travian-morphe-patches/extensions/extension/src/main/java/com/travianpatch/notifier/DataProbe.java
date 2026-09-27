package com.travianpatch.notifier;

import java.util.ArrayList;
import java.util.List;

/**
 * One-off, read-only look at game data the next features need (round 4: silver and the hero auction house).
 * Every field name comes from the game's own client (its GraphQL types); this logs what the server really
 * answers so the silver features can be checked against live shapes (price per item or per lot, history
 * order, fee format, exchange rates). Only "query" requests: nothing is changed in the game. Pure logic (no
 * Android APIs) so it can be checked off-device.
 */
final class DataProbe {

    /** Set when the probe starts, so it never runs a second time. */
    static final String KEY_DONE = "data_probe_done_v4";
    /** Longest slice of one response that is logged. */
    static final int MAX_LOGGED_CHARS = 16000;
    /** Android cuts a log line near 4 KB, so long text is logged in pieces of this size. */
    static final int LOG_PIECE = 3000;
    /** Map cells read around the village for oases: (2 * radius + 1)^2 cells. */
    static final int OASIS_RADIUS = 3;

    private DataProbe() {
    }

    static boolean shouldRun(boolean done, int knownVillages) {
        return !done && knownVillages > 0;
    }

    private static final String RESOURCES = "{ lumber clay iron crop }";
    private static final String UNITS = "{ t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 }";

    /** The silver reads the Silver tab uses, each once, plus the game's own sell-fee and exchange settings. */
    static List<String> queries(String villageId, int x, int y) {
        List<String> q = new ArrayList<String>();
        q.add(SilverData.ME_QUERY);
        q.add(SilverData.CONFIG_QUERY);
        q.add(SilverData.MARKET_QUERY);
        q.add(SilverData.BUY_QUERY);
        q.add(SilverData.BUY_QUERY_PLAIN);
        q.add(SilverData.BIDS_QUERY);
        q.add(SilverData.SELLS_QUERY);
        q.add(SilverData.BAG_QUERY);
        q.add("query { ownPlayer { auctions { silverAccounting { silverInAuctions { time reason silverChange "
                + "itemAmount item { typeId name rarity } } } } } }");
        return q;
    }

    /**
     * The game's price history for the first few item types of a market overview answer (the data object),
     * asked with and without the rarity argument; empty when the overview had no items.
     */
    static List<String> sellingProbes(org.json.JSONObject marketData) throws Exception {
        List<String> out = new ArrayList<String>();
        java.util.Map<String, SilverData.MarketItem> market = SilverData.market(
                new org.json.JSONObject().put("market", marketData));
        List<SilverData.BagItem> fake = new ArrayList<SilverData.BagItem>();
        for (SilverData.MarketItem m : market.values()) {
            if (fake.size() >= 3) {
                break;
            }
            fake.add(new SilverData.BagItem(1, m.typeId, m.name, m.rarity, 1, true, false, null));
        }
        String withRarity = SilverData.sellingQuery(fake, true);
        if (withRarity != null) {
            out.add(withRarity);
            out.add(SilverData.sellingQuery(fake, false));
        }
        return out;
    }

    /**
     * Every map cell within OASIS_RADIUS of the village in one query (aliases c0, c1, ...), with the oasis on
     * it. withAnimals adds the animals (FreeOasis.troops); asked both ways in case the fragment is refused.
     */
    static String oasisGrid(int x, int y, boolean withAnimals) {
        String oasis = withAnimals
                ? "oasis { id x y type ... on FreeOasis { troops " + UNITS + " } }"
                : "oasis { id x y type }";
        StringBuilder b = new StringBuilder("query {");
        int n = 0;
        for (int dy = -OASIS_RADIUS; dy <= OASIS_RADIUS; dy++) {
            for (int dx = -OASIS_RADIUS; dx <= OASIS_RADIUS; dx++) {
                b.append(" c").append(n++).append(": mapCell(coordinates: { x: ").append(x + dx)
                        .append(", y: ").append(y + dy).append(" }) { x y type ").append(oasis).append(" }");
            }
        }
        return b.append(" }").toString();
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
