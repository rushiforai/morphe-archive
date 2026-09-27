package com.travianpatch.notifier;

import org.json.JSONObject;

import java.util.List;

/**
 * The game's own auction requests and the rules for the automatic ones. Bodies come from the game's code
 * (RestAPI AuctionBidRequest {action:"auction", maxBid, identifier} on /hero/auction/bid, and the two-step
 * AuctionSellItemRequest {action:"auction", id, amount} on /hero/auction/sell-item). Bids spend silver only;
 * nothing here ever touches gold. Pure logic (no Android APIs).
 */
final class SilverActions {

    static final String BID = "BID";
    static final String SELL = "SELL";
    static final String BID_PATH = "/hero/auction/bid";
    static final String SELL_PATH = "/hero/auction/sell-item";
    /**
     * Selling is a two-step send like troops. Stop after step 1 (show what the game answered) until one
     * watched try shows where the one-time token comes back; switched off in a later release.
     */
    static final boolean SELL_STEP_ONE_ONLY = true;

    static final String KEY_AUTO_BID = "silver_auto_bid";
    static final String KEY_BID_CAP = "silver_bid_cap";
    static final String KEY_AUTO_SELL = "silver_auto_sell";
    static final String KEY_DEAL_PERCENT = "silver_deal_percent";
    static final String KEY_DEAL_MINUTES = "silver_deal_minutes";

    private SilverActions() {
    }

    /** Bid on an auction: the game raises my bid automatically up to maxBid. */
    static GameAction bid(String identifier, long maxBid, String label) throws Exception {
        if (identifier == null || identifier.length() == 0 || maxBid <= 0) {
            throw new IllegalArgumentException("no auction or bid");
        }
        JSONObject body = new JSONObject().put("action", "auction").put("identifier", identifier)
                .put("maxBid", maxBid);
        return new GameAction(BID, "", BID_PATH, body, label, "bid:" + identifier);
    }

    /** Put `amount` of a bag item (inventory id) up for auction. */
    static GameAction sell(long itemId, int amount, String label) throws Exception {
        if (itemId <= 0 || amount <= 0) {
            throw new IllegalArgumentException("no item or amount");
        }
        JSONObject body = new JSONObject().put("action", "auction").put("id", itemId).put("amount", amount);
        return new GameAction(SELL, "", SELL_PATH, body, label, "sell:" + itemId);
    }

    /**
     * Whether an automatic bid counts as used up for that auction. A bid the guard refused before sending
     * (automation off, quiet hours, attack pause, a repeat within a minute) is tried again on a later check.
     */
    static boolean bidTried(String outcome) {
        return !"REFUSED".equals(outcome);
    }

    /**
     * The automatic bid for a deal: up to `percent` % under the normal price and never above the user's cap
     * or the silver I have. 0 when no bid should be made (no cap set, or the auction is already above that).
     */
    static long autoBidAmount(SilverData.Deal deal, int percent, long cap, long silver) {
        if (cap <= 0 || silver <= 0) {
            return 0;
        }
        long ceiling = deal.normalTotal() * (100 - percent) / 100;
        long bid = Math.min(Math.min(ceiling, cap), silver);
        return bid > deal.auction.price ? bid : 0;
    }

    /**
     * The bag items the automatic seller would put up now: sellable, the game's history says prices are high,
     * and still room under the game's limit of running sales (maxSales < 0 = limit not known = none sold).
     */
    static List<SilverData.BagItem> toSell(JSONObject snap, int runningSales, int maxSales) {
        List<SilverData.BagItem> out = new java.util.ArrayList<SilverData.BagItem>();
        if (maxSales < 0) {
            return out;
        }
        List<SilverData.BagItem> bag = SilverData.bag(snap);
        int room = maxSales - runningSales;
        for (SilverData.BagItem it : bag) {
            if (room <= 0) {
                break;
            }
            if (!it.sellable() || it.amountToSell() <= 0) {
                continue;
            }
            SilverData.Advice advice = SilverData.advise(SilverData.priceInfo(snap, bag, it));
            if (advice.verdict == SilverData.Verdict.SELL_NOW) {
                out.add(it);
                room--;
            }
        }
        return out;
    }
}
