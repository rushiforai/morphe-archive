package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Silver and the hero auction house, read from the game: the wallet, the silver log (silverAccounting), my
 * bids and sales, the market overview (average price per item type), open auctions, the hero's bag and the
 * game's own price history per item type (itemTypeSellingInformation). Query and field names come from the
 * game's client (TLMobile GraphQL DTOs and its root-query table). From these it works out: new silver events
 * to announce, cheap auctions ending soon, a sell verdict per bag item and a weekly summary.
 * Pure logic (no Android APIs).
 */
final class SilverData {

    /**
     * The market overview's averagePrice is taken as the price of ONE item (a type's auctions mix different
     * amounts). Not yet confirmed live; the first-run log and the game's auction screen settle it.
     */
    static final boolean AVERAGE_IS_PER_UNIT = true;
    /** priceHistory is read as oldest first, newest last. Not yet confirmed live (compare with the game's chart). */
    static final boolean HISTORY_NEWEST_LAST = true;

    static final int DEFAULT_DEAL_PERCENT = 30;
    static final int DEFAULT_DEAL_MINUTES = 15;

    private static final String ITEM = "item { typeId name rarity }";
    private static final String AUCTION = "identifier " + ITEM + " amount status startedAt finishedAt price "
            + "bidsAmount maxBid highestBidder { id name }";

    static final String ME_QUERY = "query { ownPlayer { id wallet { goldAmount silverAmount } auctions { "
            + "silverAccounting { totalTiedSilver oldBalanceValue oldBalanceDate records { time reason silverChange "
            + "itemAmount " + ITEM + " } } } } }";
    static final String CONFIG_QUERY = "query { bootstrapData { auction { maxAuctionForSel rateGoldToSilver "
            + "rateSilverToGold maxDuration } serverSupportedFeatures { auctionsV2 { enabled fee } } } }";
    static final String BIDS_QUERY = "query { ownPlayer { auctions { bids { auctions(first: 50) { edges { node { "
            + AUCTION + " } } } } } } }";
    static final String SELLS_QUERY = "query { ownPlayer { auctions { sell { auctions(first: 50) { edges { node { "
            + AUCTION + " } } } } } } }";
    static final String MARKET_QUERY = "query { ownPlayer { auctions { items(first: 100) { edges { node { typeId "
            + "name rarity itemsCount auctionsCount nextFinishAt averagePrice nextPrice } } } } } }";
    static final String BUY_QUERY = "query { ownPlayer { auctions { buy(first: 100, sortBy: REMAINING_TIME, "
            + "sortOrder: ASC) { totalCount edges { node { " + AUCTION + " } } } } } }";
    /** Same list without the sort arguments, used when the game refuses them. */
    static final String BUY_QUERY_PLAIN = "query { ownPlayer { auctions { buy(first: 100) { totalCount edges { "
            + "node { " + AUCTION + " } } } } } }";
    static final String BAG_QUERY = "query { ownPlayer { hero { inventory { id typeId name rarity amount "
            + "isAuctionable possibleAmountsToSell isEquipped place } } } }";

    /** Runs one read-only query against the game and returns its JSON answer (null when there is no session). */
    interface Reader {
        JSONObject query(String query) throws Exception;
    }

    private SilverData() {
    }

    // ------------------------------------------------------------------
    // reading
    // ------------------------------------------------------------------

    /**
     * Everything the alerts need: me (wallet + silver log), the market overview and the open auctions.
     * Each part is read on its own, so one refused query leaves the others. Errors are kept per part.
     */
    static JSONObject readForAlerts(Reader r, long nowMs) throws Exception {
        JSONObject out = new JSONObject().put("at", nowMs);
        put(out, "me", r, ME_QUERY);
        put(out, "market", r, MARKET_QUERY);
        if (!put(out, "buy", r, BUY_QUERY)) {
            put(out, "buy", r, BUY_QUERY_PLAIN);
        }
        return out;
    }

    /** Everything the Silver tab shows: the alert parts plus config, my bids and sales, the bag and price history. */
    static JSONObject readAll(Reader r, long nowMs) throws Exception {
        JSONObject out = readForAlerts(r, nowMs);
        put(out, "config", r, CONFIG_QUERY);
        put(out, "bids", r, BIDS_QUERY);
        put(out, "sells", r, SELLS_QUERY);
        if (put(out, "bag", r, BAG_QUERY)) {
            List<BagItem> bag = bag(out);
            String q = sellingQuery(bag, true);
            if (q != null && !put(out, "selling", r, q)) {
                put(out, "selling", r, sellingQuery(bag, false));
            }
        }
        return out;
    }

    /** Stores data (or the error) under key; true when the game answered with data and no errors. */
    private static boolean put(JSONObject out, String key, Reader r, String query) throws Exception {
        JSONObject resp;
        try {
            resp = r.query(query);
        } catch (Exception e) {
            out.put(key + "Error", "no answer (" + e.getClass().getSimpleName() + ")");
            return false;
        }
        if (resp == null) {
            out.put(key + "Error", "no game session yet");
            return false;
        }
        JSONArray errors = resp.optJSONArray("errors");
        JSONObject data = resp.optJSONObject("data");
        if (errors != null && errors.length() > 0) {
            JSONObject first = errors.optJSONObject(0);
            out.put(key + "Error", first == null ? "error" : first.optString("message", "error"));
            return false;
        }
        if (data == null) {
            out.put(key + "Error", "no data");
            return false;
        }
        out.put(key, data);
        out.remove(key + "Error");
        return true;
    }

    /**
     * One query with the game's price history for every sellable bag item type (aliases s0, s1, ...), or null
     * when there is nothing to ask. withRarity adds the rarity argument for items that have one.
     */
    static String sellingQuery(List<BagItem> bag, boolean withRarity) {
        StringBuilder b = new StringBuilder("query {");
        int n = 0;
        for (String key : sellKeys(bag).keySet()) {
            String[] parts = key.split(":", 2);
            b.append(" s").append(n++).append(": itemTypeSellingInformation(itemTypeId: ").append(parts[0]);
            if (withRarity && parts[1].length() > 0 && !"none".equalsIgnoreCase(parts[1])) {
                b.append(", rarity: ").append(parts[1]);
            }
            b.append(") { lowestPrice averagePrice highestPrice priceHistory salesHistory }");
        }
        return n == 0 ? null : b.append(" }").toString();
    }

    /** The distinct "typeId:rarity" keys of sellable bag items, in bag order, mapped to their alias index. */
    static Map<String, Integer> sellKeys(List<BagItem> bag) {
        Map<String, Integer> keys = new LinkedHashMap<String, Integer>();
        for (BagItem it : bag) {
            if (it.sellable() && !keys.containsKey(it.key())) {
                keys.put(it.key(), keys.size());
            }
        }
        return keys;
    }

    // ------------------------------------------------------------------
    // parsed shapes
    // ------------------------------------------------------------------

    static final class Record {
        final long timeMs;
        final String reason;
        final long change;
        final String itemName;
        final int itemAmount;

        Record(long timeMs, String reason, long change, String itemName, int itemAmount) {
            this.timeMs = timeMs;
            this.reason = reason;
            this.change = change;
            this.itemName = itemName;
            this.itemAmount = itemAmount;
        }
    }

    static final class Auction {
        final String id;
        final int typeId;
        final String name;
        final String rarity;
        final int amount;
        final String status;
        final long finishedMs;
        final long price;
        final int bids;
        final long maxBid;
        final String bidderId;

        Auction(String id, int typeId, String name, String rarity, int amount, String status, long finishedMs,
                long price, int bids, long maxBid, String bidderId) {
            this.id = id;
            this.typeId = typeId;
            this.name = name;
            this.rarity = rarity;
            this.amount = amount;
            this.status = status;
            this.finishedMs = finishedMs;
            this.price = price;
            this.bids = bids;
            this.maxBid = maxBid;
            this.bidderId = bidderId;
        }

        boolean running() {
            return status == null || "RUNNING".equalsIgnoreCase(status);
        }

        String key() {
            return typeId + ":" + (rarity == null ? "" : rarity);
        }
    }

    static final class MarketItem {
        final int typeId;
        final String name;
        final String rarity;
        final int auctions;
        final long averagePrice;
        final long nextPrice;

        MarketItem(int typeId, String name, String rarity, int auctions, long averagePrice, long nextPrice) {
            this.typeId = typeId;
            this.name = name;
            this.rarity = rarity;
            this.auctions = auctions;
            this.averagePrice = averagePrice;
            this.nextPrice = nextPrice;
        }
    }

    static final class BagItem {
        final long id;
        final int typeId;
        final String name;
        final String rarity;
        final int amount;
        final boolean auctionable;
        final boolean equipped;
        final List<Integer> sellAmounts;

        BagItem(long id, int typeId, String name, String rarity, int amount, boolean auctionable, boolean equipped,
                List<Integer> sellAmounts) {
            this.id = id;
            this.typeId = typeId;
            this.name = name;
            this.rarity = rarity;
            this.amount = amount;
            this.auctionable = auctionable;
            this.equipped = equipped;
            this.sellAmounts = sellAmounts;
        }

        boolean sellable() {
            return auctionable && !equipped && amount > 0 && id > 0;
        }

        String key() {
            return typeId + ":" + (rarity == null ? "" : rarity);
        }

        /** How many to put up: the whole stack when the game allows it, else the biggest allowed batch that fits. */
        int amountToSell() {
            if (sellAmounts == null || sellAmounts.isEmpty()) {
                return amount;
            }
            int best = 0;
            for (Integer n : sellAmounts) {
                if (n != null && n <= amount && n > best) {
                    best = n;
                }
            }
            return best;
        }
    }

    static final class PriceInfo {
        final long lowest, average, highest;
        final List<Long> history;

        PriceInfo(long lowest, long average, long highest, List<Long> history) {
            this.lowest = lowest;
            this.average = average;
            this.highest = highest;
            this.history = history;
        }
    }

    /** The game's times are unix seconds; a value that already looks like milliseconds is kept. */
    static long toMs(long t) {
        return t > 100_000_000_000L ? t : t * 1000L;
    }

    private static JSONObject path(JSONObject o, String... keys) {
        JSONObject cur = o;
        for (String k : keys) {
            if (cur == null) {
                return null;
            }
            cur = cur.optJSONObject(k);
        }
        return cur;
    }

    private static String str(JSONObject o, String key) {
        if (o == null || o.isNull(key)) {
            return null;
        }
        return o.optString(key, null);
    }

    static String myId(JSONObject snap) {
        return str(path(snap, "me", "ownPlayer"), "id");
    }

    /** Silver in the wallet, or -1 when not known. */
    static long silver(JSONObject snap) {
        JSONObject w = path(snap, "me", "ownPlayer", "wallet");
        return w == null || w.isNull("silverAmount") ? -1 : w.optLong("silverAmount", -1);
    }

    /** Silver held in my running bids, or -1 when not known. */
    static long tiedSilver(JSONObject snap) {
        JSONObject a = path(snap, "me", "ownPlayer", "auctions", "silverAccounting");
        return a == null || a.isNull("totalTiedSilver") ? -1 : a.optLong("totalTiedSilver", -1);
    }

    static List<Record> records(JSONObject snap) {
        List<Record> out = new ArrayList<Record>();
        JSONObject a = path(snap, "me", "ownPlayer", "auctions", "silverAccounting");
        JSONArray list = a == null ? null : a.optJSONArray("records");
        for (int i = 0; list != null && i < list.length(); i++) {
            JSONObject r = list.optJSONObject(i);
            if (r == null) {
                continue;
            }
            JSONObject item = r.optJSONObject("item");
            out.add(new Record(toMs(r.optLong("time")), str(r, "reason"), r.optLong("silverChange"),
                    str(item, "name"), r.optInt("itemAmount")));
        }
        return out;
    }

    private static List<Auction> auctionList(JSONObject connection) {
        List<Auction> out = new ArrayList<Auction>();
        JSONArray edges = connection == null ? null : connection.optJSONArray("edges");
        for (int i = 0; edges != null && i < edges.length(); i++) {
            JSONObject e = edges.optJSONObject(i);
            JSONObject n = e == null ? null : e.optJSONObject("node");
            if (n == null) {
                continue;
            }
            JSONObject item = n.optJSONObject("item");
            JSONObject bidder = n.optJSONObject("highestBidder");
            out.add(new Auction(str(n, "identifier"), item == null ? 0 : item.optInt("typeId"), str(item, "name"),
                    str(item, "rarity"), n.optInt("amount"), str(n, "status"), toMs(n.optLong("finishedAt")),
                    n.optLong("price"), n.optInt("bidsAmount"), n.optLong("maxBid"), str(bidder, "id")));
        }
        return out;
    }

    static List<Auction> buy(JSONObject snap) {
        return auctionList(path(snap, "buy", "ownPlayer", "auctions", "buy"));
    }

    static List<Auction> myBids(JSONObject snap) {
        return auctionList(path(snap, "bids", "ownPlayer", "auctions", "bids", "auctions"));
    }

    static List<Auction> mySales(JSONObject snap) {
        return auctionList(path(snap, "sells", "ownPlayer", "auctions", "sell", "auctions"));
    }

    /** The market overview by "typeId:rarity". */
    static Map<String, MarketItem> market(JSONObject snap) {
        Map<String, MarketItem> out = new LinkedHashMap<String, MarketItem>();
        JSONObject items = path(snap, "market", "ownPlayer", "auctions", "items");
        JSONArray edges = items == null ? null : items.optJSONArray("edges");
        for (int i = 0; edges != null && i < edges.length(); i++) {
            JSONObject e = edges.optJSONObject(i);
            JSONObject n = e == null ? null : e.optJSONObject("node");
            if (n == null) {
                continue;
            }
            MarketItem m = new MarketItem(n.optInt("typeId"), str(n, "name"), str(n, "rarity"),
                    n.optInt("auctionsCount"), n.optLong("averagePrice"), n.optLong("nextPrice"));
            out.put(m.typeId + ":" + (m.rarity == null ? "" : m.rarity), m);
        }
        return out;
    }

    static List<BagItem> bag(JSONObject snap) {
        List<BagItem> out = new ArrayList<BagItem>();
        JSONObject hero = path(snap, "bag", "ownPlayer", "hero");
        JSONArray list = hero == null ? null : hero.optJSONArray("inventory");
        for (int i = 0; list != null && i < list.length(); i++) {
            JSONObject it = list.optJSONObject(i);
            if (it == null) {
                continue;
            }
            List<Integer> amounts = null;
            JSONArray pa = it.optJSONArray("possibleAmountsToSell");
            if (pa != null) {
                amounts = new ArrayList<Integer>();
                for (int k = 0; k < pa.length(); k++) {
                    if (!pa.isNull(k)) {
                        amounts.add(pa.optInt(k));
                    }
                }
            }
            out.add(new BagItem(it.optLong("id"), it.optInt("typeId"), str(it, "name"), str(it, "rarity"),
                    it.optInt("amount"), it.optBoolean("isAuctionable"), it.optBoolean("isEquipped"), amounts));
        }
        return out;
    }

    /** The game's price history for a bag item, or null when not read. */
    static PriceInfo priceInfo(JSONObject snap, List<BagItem> bag, BagItem item) {
        Integer idx = sellKeys(bag).get(item.key());
        JSONObject sel = snap == null ? null : snap.optJSONObject("selling");
        JSONObject s = idx == null || sel == null ? null : sel.optJSONObject("s" + idx);
        if (s == null) {
            return null;
        }
        List<Long> hist = new ArrayList<Long>();
        JSONArray h = s.optJSONArray("priceHistory");
        for (int i = 0; h != null && i < h.length(); i++) {
            if (!h.isNull(i)) {
                hist.add(h.optLong(i));
            }
        }
        return new PriceInfo(s.optLong("lowestPrice"), s.optLong("averagePrice"), s.optLong("highestPrice"), hist);
    }

    /** The auction fee in percent (auctionsV2.fee), or -1 when not known or not a plain percent. */
    static int feePercent(JSONObject snap) {
        JSONObject v2 = path(snap, "config", "bootstrapData", "serverSupportedFeatures", "auctionsV2");
        if (v2 == null || v2.isNull("fee")) {
            return -1;
        }
        int fee = v2.optInt("fee", -1);
        return fee >= 0 && fee < 100 ? fee : -1;
    }

    /** Silver paid for one gold at the game's exchange (auction.rateSilverToGold), or -1 when not known. */
    static int silverPerGold(JSONObject snap) {
        JSONObject a = path(snap, "config", "bootstrapData", "auction");
        return a == null || a.isNull("rateSilverToGold") ? -1 : a.optInt("rateSilverToGold", -1);
    }

    /** Silver received for one gold (auction.rateGoldToSilver), or -1 when not known. */
    static int silverForGold(JSONObject snap) {
        JSONObject a = path(snap, "config", "bootstrapData", "auction");
        return a == null || a.isNull("rateGoldToSilver") ? -1 : a.optInt("rateGoldToSilver", -1);
    }

    /** How many auctions the game lets me run at once (auction.maxAuctionForSel), or -1 when not known. */
    static int maxSales(JSONObject snap) {
        JSONObject a = path(snap, "config", "bootstrapData", "auction");
        return a == null || a.isNull("maxAuctionForSel") ? -1 : a.optInt("maxAuctionForSel", -1);
    }

    // ------------------------------------------------------------------
    // decisions
    // ------------------------------------------------------------------

    /** A silver log entry worth a notification, with its alert type. */
    static final class Event {
        final NotificationKind kind;
        final String text;

        Event(NotificationKind kind, String text) {
            this.kind = kind;
            this.text = text;
        }
    }

    /** The newest record time, or 0 when there are none. */
    static long newestRecord(List<Record> records) {
        long max = 0;
        for (Record r : records) {
            max = Math.max(max, r.timeMs);
        }
        return max;
    }

    /**
     * The silver log entries newer than lastSeenMs that deserve an alert (outbid, won, sold). lastSeenMs == 0
     * means the first look: nothing is announced, the caller only remembers where the log stands.
     */
    static List<Event> newEvents(List<Record> records, long lastSeenMs) {
        List<Event> out = new ArrayList<Event>();
        if (lastSeenMs <= 0) {
            return out;
        }
        for (Record r : records) {
            if (r.timeMs <= lastSeenMs || r.reason == null) {
                continue;
            }
            String what = itemText(r.itemName, r.itemAmount);
            String reason = r.reason.toUpperCase(Locale.ROOT);
            if ("OUTBID".equals(reason)) {
                out.add(new Event(NotificationKind.SILVER_OUTBID, "You were outbid on " + what
                        + (r.change > 0 ? " · " + r.change + " silver back" : "")));
            } else if ("AUCTION_WON".equals(reason)) {
                out.add(new Event(NotificationKind.SILVER_AUCTION, "You won " + what
                        + (r.change != 0 ? " for " + Math.abs(r.change) + " silver" : "")));
            } else if ("AUCTION_SOLD".equals(reason) || "HORSE_SOLD".equals(reason)) {
                out.add(new Event(NotificationKind.SILVER_AUCTION, "Sold " + what
                        + (r.change > 0 ? " for " + r.change + " silver" : "")));
            }
        }
        return out;
    }

    static String itemText(String name, int amount) {
        String n = name == null || name.length() == 0 ? "an item" : name;
        return amount > 1 ? n + " ×" + amount : n;
    }

    /** A running auction priced well under the market average and ending soon. */
    static final class Deal {
        final Auction auction;
        final long averagePerUnit;
        final int percentUnder;

        Deal(Auction auction, long averagePerUnit, int percentUnder) {
            this.auction = auction;
            this.averagePerUnit = averagePerUnit;
            this.percentUnder = percentUnder;
        }

        /** What the whole lot normally costs at the market average. */
        long normalTotal() {
            return averagePerUnit * Math.max(1, auction.amount);
        }
    }

    /** The market average for ONE item of this auction's type, or 0 when not known. */
    static long averagePerUnit(Map<String, MarketItem> market, Auction a) {
        MarketItem m = market.get(a.key());
        if (m == null || m.averagePrice <= 0) {
            return 0;
        }
        return AVERAGE_IS_PER_UNIT ? m.averagePrice : m.averagePrice / Math.max(1, a.amount);
    }

    /**
     * Running auctions ending within `minutes` whose price is at least `percent` % under the market average,
     * that I am not already winning. Cheapest (by percent under) first.
     */
    static List<Deal> deals(List<Auction> auctions, Map<String, MarketItem> market, String myId, long nowMs,
                            int percent, int minutes) {
        List<Deal> out = new ArrayList<Deal>();
        for (Auction a : auctions) {
            if (!a.running() || a.id == null || a.amount <= 0 || a.finishedMs <= nowMs
                    || a.finishedMs - nowMs > minutes * 60_000L) {
                continue;
            }
            if (myId != null && myId.equals(a.bidderId)) {
                continue;
            }
            long avg = averagePerUnit(market, a);
            if (avg <= 0) {
                continue;
            }
            long normal = avg * a.amount;
            int under = (int) Math.round(100.0 * (normal - a.price) / normal);
            if (under >= percent) {
                out.add(new Deal(a, avg, under));
            }
        }
        java.util.Collections.sort(out, new java.util.Comparator<Deal>() {
            @Override
            public int compare(Deal x, Deal y) {
                return y.percentUnder - x.percentUnder;
            }
        });
        return out;
    }

    enum Verdict { SELL_NOW, FAIR, WAIT, UNKNOWN }

    /** What the game's price history says about selling one item type now. */
    static final class Advice {
        final Verdict verdict;
        final String reason;
        /** The game's average price per item, or 0. */
        final long average;
        /** Recent price vs the average, in percent (100 = normal), or 0 when not known. */
        final int recentPercent;

        Advice(Verdict verdict, String reason, long average, int recentPercent) {
            this.verdict = verdict;
            this.reason = reason;
            this.average = average;
            this.recentPercent = recentPercent;
        }
    }

    /**
     * Compares the recent price (mean of the newest 3 history points) with the game's average: 10% or more
     * above = sell now, 10% or more below = wait, otherwise a fair price. No data = unknown.
     */
    static Advice advise(PriceInfo info) {
        if (info == null || info.average <= 0) {
            return new Advice(Verdict.UNKNOWN, "the game has no recent sales for this item", 0, 0);
        }
        List<Long> h = new ArrayList<Long>();
        for (Long v : info.history) {
            if (v != null && v > 0) {
                h.add(v);
            }
        }
        if (h.isEmpty()) {
            return new Advice(Verdict.FAIR, "no price history, only the average", info.average, 0);
        }
        int n = Math.min(3, h.size());
        long sum = 0;
        for (int i = 0; i < n; i++) {
            sum += HISTORY_NEWEST_LAST ? h.get(h.size() - 1 - i) : h.get(i);
        }
        double recent = (double) sum / n;
        int pct = (int) Math.round(100.0 * recent / info.average);
        if (pct >= 110) {
            return new Advice(Verdict.SELL_NOW, "prices are " + (pct - 100) + "% above normal", info.average, pct);
        }
        if (pct <= 90) {
            return new Advice(Verdict.WAIT, "prices are " + (100 - pct) + "% below normal", info.average, pct);
        }
        return new Advice(Verdict.FAIR, "prices are normal", info.average, pct);
    }

    /** Silver left after the game's fee, or the gross when the fee is not known. */
    static long afterFee(long gross, int feePercent) {
        return feePercent < 0 ? gross : gross * (100 - feePercent) / 100;
    }

    /** Silver in and out over the last `days` days, summed by the game's reason, biggest change first. */
    static Map<String, Long> summary(List<Record> records, long nowMs, int days) {
        Map<String, Long> sums = new LinkedHashMap<String, Long>();
        long from = nowMs - days * 86_400_000L;
        for (Record r : records) {
            if (r.timeMs < from || r.reason == null) {
                continue;
            }
            String k = reasonText(r.reason);
            Long old = sums.get(k);
            sums.put(k, (old == null ? 0 : old) + r.change);
        }
        List<Map.Entry<String, Long>> list = new ArrayList<Map.Entry<String, Long>>(sums.entrySet());
        java.util.Collections.sort(list, new java.util.Comparator<Map.Entry<String, Long>>() {
            @Override
            public int compare(Map.Entry<String, Long> x, Map.Entry<String, Long> y) {
                return Long.compare(Math.abs(y.getValue()), Math.abs(x.getValue()));
            }
        });
        Map<String, Long> out = new LinkedHashMap<String, Long>();
        for (Map.Entry<String, Long> e : list) {
            out.put(e.getKey(), e.getValue());
        }
        return out;
    }

    /** Plain words for the game's silver log reasons (SilverAccountingReason). */
    static String reasonText(String reason) {
        switch (reason.toUpperCase(Locale.ROOT)) {
            case "ADVENTURE": return "Adventures";
            case "EXCHANGE_OFFICE": return "Exchange office";
            case "AUCTION_PAYBACK": return "Bids paid back";
            case "ITEM_AUCTION": return "Auctions";
            case "QUEST": return "Quests";
            case "CUSTOMER_SERVICE": return "Customer service";
            case "BID_PLACED": return "Bids placed";
            case "BID_CHANGED": return "Bids changed";
            case "OUTBID": return "Outbid (silver back)";
            case "AUCTION_WON": return "Auctions won";
            case "AUCTION_SOLD": return "Items sold";
            case "AUCTION_DELETED": return "Auctions deleted";
            case "HORSE_SOLD": return "Horses sold";
            case "AUCTION_FEE": return "Auction fees";
            default: return reason;
        }
    }
}
