package com.travianpatch.notifier;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.text.InputType;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.Toast;

import org.json.JSONObject;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * The Silver tab: silver balance and what it is worth in gold at the game's rate, the week's silver in and
 * out, my bids and sales, a sell verdict per bag item (from the game's own price history) and cheap auctions
 * ending soon, with Bid and Sell buttons and the alert / automatic bid and sell settings. All numbers are read
 * from the game with the session the background check cached; bids and sales go through ActionSender.
 */
final class SilverTab implements HubActivity.Tab {

    private static final String KEY_SNAPSHOT = "silver_snapshot";
    private static final long STALE_MS = 5 * 60_000L;
    /** The screen lists deals ending within this many minutes (alerts use the user's own window). */
    private static final int SCREEN_DEAL_MINUTES = 60;

    private final HubActivity a;
    private boolean loading;
    private long lastTry;

    SilverTab(HubActivity a) {
        this.a = a;
    }

    @Override
    public View build() {
        LinearLayout col = new LinearLayout(a);
        col.setOrientation(LinearLayout.VERTICAL);
        JSONObject snap = loadSnapshot();
        long now = System.currentTimeMillis();

        col.addView(UiKit.section(a, "Silver"));
        LinearLayout top = UiKit.card(a);
        String when = snap == null ? "never" : DateFormat.getTimeInstance(DateFormat.SHORT)
                .format(new Date(snap.optLong("at")));
        long silver = SilverData.silver(snap);
        long tied = SilverData.tiedSilver(snap);
        top.addView(UiKit.listRow(a, silver < 0 ? "Silver: not known" : silver + " silver",
                (tied < 0 ? "" : tied + " held in your bids · ") + exchangeText(snap, silver)));
        top.addView(UiKit.muted(a, loading ? "Reading the auction house…" : "Last read: " + when));
        top.addView(UiKit.primaryButton(a, "Refresh", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                refresh();
            }
        }));
        col.addView(top, UiKit.cardParams(a));
        boolean mayAuto = !loading && now - lastTry > 60_000L;
        if (mayAuto && (snap == null || now - snap.optLong("at") > STALE_MS)) {
            refresh();
        }
        if (snap == null) {
            return col;
        }

        addDeals(col, snap, now);
        addAdvisor(col, snap);
        addAuctions(col, "My bids", SilverData.myBids(snap), SilverData.myId(snap), now, true);
        addAuctions(col, "My sales", SilverData.mySales(snap), SilverData.myId(snap), now, false);
        addWeek(col, snap, now);
        addSettings(col);

        StringBuilder errors = new StringBuilder();
        for (String part : new String[]{"me", "config", "market", "buy", "bids", "sells", "bag", "selling"}) {
            if (snap.has(part + "Error")) {
                errors.append("\n").append(part).append(": ").append(snap.optString(part + "Error"));
            }
        }
        if (errors.length() > 0) {
            col.addView(UiKit.muted(a, "Some parts couldn't be read from the game:" + errors));
        }
        col.addView(UiKit.muted(a, "Prices, history, fee and rates come from the game. Bids spend silver only; "
                + "this app never spends gold."));
        return col;
    }

    @Override
    public void tick() {
    }

    private static String exchangeText(JSONObject snap, long silver) {
        int perGold = SilverData.silverPerGold(snap);
        if (perGold <= 0) {
            return "exchange rate not known";
        }
        String worth = silver > 0 ? " · yours ≈ " + (silver / perGold) + " gold" : "";
        int forGold = SilverData.silverForGold(snap);
        return "exchange: " + perGold + " silver → 1 gold" + worth
                + (forGold > 0 ? " (1 gold → " + forGold + " silver)" : "");
    }

    private void addDeals(LinearLayout col, JSONObject snap, long now) {
        SharedPreferences p = prefs();
        final int percent = p.getInt(SilverActions.KEY_DEAL_PERCENT, SilverData.DEFAULT_DEAL_PERCENT);
        List<SilverData.Deal> deals = SilverData.deals(SilverData.buy(snap), SilverData.market(snap),
                SilverData.myId(snap), now, percent, SCREEN_DEAL_MINUTES);
        col.addView(UiKit.section(a, "Cheap auctions (" + percent + "%+ under usual, next hour)"));
        LinearLayout card = UiKit.card(a);
        int n = 0;
        for (final SilverData.Deal d : deals) {
            if (n == 10) {
                break;
            }
            final SilverData.Auction au = d.auction;
            LinearLayout row = UiKit.listRow(a, SilverData.itemText(au.name, au.amount) + " · " + au.price + " silver",
                    d.percentUnder + "% under the usual " + d.normalTotal() + " · " + au.bids + " bids · ends in "
                            + AlertStatus.duration(au.finishedMs - now));
            UiKit.addPill(row, UiKit.pill(a, "Bid", true, new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    askBid(d, percent);
                }
            }));
            if (n > 0) {
                card.addView(UiKit.divider(a));
            }
            card.addView(row);
            n++;
        }
        if (n == 0) {
            card.addView(UiKit.muted(a, snap.has("buyError") || snap.has("marketError")
                    ? "Auctions or average prices couldn't be read." : "No cheap auction ends in the next hour."));
        }
        col.addView(card, UiKit.cardParams(a));
    }

    private void addAdvisor(LinearLayout col, JSONObject snap) {
        col.addView(UiKit.section(a, "Sell advisor (your hero's bag)"));
        LinearLayout card = UiKit.card(a);
        List<SilverData.BagItem> bag = SilverData.bag(snap);
        int fee = SilverData.feePercent(snap);
        int n = 0;
        for (final SilverData.BagItem it : bag) {
            if (!it.sellable()) {
                continue;
            }
            SilverData.Advice adv = SilverData.advise(SilverData.priceInfo(snap, bag, it));
            final int count = it.amountToSell();
            String verdict;
            switch (adv.verdict) {
                case SELL_NOW: verdict = "Sell now"; break;
                case WAIT: verdict = "Wait"; break;
                case FAIR: verdict = "OK to sell"; break;
                default: verdict = "Not known"; break;
            }
            String value = "";
            if (adv.average > 0) {
                long gross = SilverData.AVERAGE_IS_PER_UNIT ? adv.average * count : adv.average;
                value = " · usually ≈ " + gross + " silver"
                        + (fee >= 0 ? " (" + SilverData.afterFee(gross, fee) + " after the " + fee + "% fee)" : "");
            }
            LinearLayout row = UiKit.listRow(a, SilverData.itemText(it.name, it.amount),
                    verdict + ": " + adv.reason + value);
            if (count > 0) {
                UiKit.addPill(row, UiKit.pill(a, SilverActions.SELL_STEP_ONE_ONLY ? "Test sell" : "Sell",
                        adv.verdict == SilverData.Verdict.SELL_NOW, new View.OnClickListener() {
                            @Override
                            public void onClick(View v) {
                                askSell(it, count);
                            }
                        }));
            }
            if (n > 0) {
                card.addView(UiKit.divider(a));
            }
            card.addView(row);
            n++;
        }
        if (n == 0) {
            card.addView(UiKit.muted(a, snap.has("bagError") ? "The hero's bag couldn't be read."
                    : "Nothing in the bag can go to the auction house."));
        }
        col.addView(card, UiKit.cardParams(a));
    }

    private void addAuctions(LinearLayout col, String title, List<SilverData.Auction> list, String me, long now,
                             boolean bids) {
        col.addView(UiKit.section(a, title));
        LinearLayout card = UiKit.card(a);
        int n = 0;
        for (SilverData.Auction au : list) {
            if (!au.running()) {
                continue;
            }
            String state = bids ? (me != null && me.equals(au.bidderId) ? "winning" : "outbid")
                    : au.bids + (au.bids == 1 ? " bid" : " bids");
            LinearLayout row = UiKit.listRow(a, SilverData.itemText(au.name, au.amount) + " · " + au.price + " silver",
                    state + " · ends in " + AlertStatus.duration(Math.max(0, au.finishedMs - now))
                            + (bids && au.maxBid > 0 ? " · your max " + au.maxBid : ""));
            if (n > 0) {
                card.addView(UiKit.divider(a));
            }
            card.addView(row);
            n++;
        }
        if (n == 0) {
            card.addView(UiKit.muted(a, bids ? "No running bids." : "Nothing up for sale."));
        }
        col.addView(card, UiKit.cardParams(a));
    }

    private void addWeek(LinearLayout col, JSONObject snap, long now) {
        col.addView(UiKit.section(a, "Silver this week"));
        LinearLayout card = UiKit.card(a);
        Map<String, Long> sums = SilverData.summary(SilverData.records(snap), now, 7);
        long in = 0, out = 0;
        for (Map.Entry<String, Long> e : sums.entrySet()) {
            card.addView(UiKit.listRow(a, e.getKey(), (e.getValue() > 0 ? "+" : "") + e.getValue() + " silver"));
            if (e.getValue() > 0) {
                in += e.getValue();
            } else {
                out -= e.getValue();
            }
        }
        if (sums.isEmpty()) {
            card.addView(UiKit.muted(a, "No silver moved in the last 7 days (as far as the game's log goes)."));
        } else {
            card.addView(UiKit.divider(a));
            card.addView(UiKit.listRow(a, "In " + in + " · out " + out, "net " + (in - out) + " silver"));
        }
        col.addView(card, UiKit.cardParams(a));
    }

    private void addSettings(LinearLayout col) {
        final SharedPreferences p = prefs();
        col.addView(UiKit.section(a, "Alerts and automatic actions"));
        LinearLayout card = UiKit.card(a);
        final EditText pct = number(String.valueOf(p.getInt(SilverActions.KEY_DEAL_PERCENT,
                SilverData.DEFAULT_DEAL_PERCENT)));
        final EditText mins = number(String.valueOf(p.getInt(SilverActions.KEY_DEAL_MINUTES,
                SilverData.DEFAULT_DEAL_MINUTES)));
        final EditText cap = number(String.valueOf(p.getLong(SilverActions.KEY_BID_CAP, 0)));
        card.addView(UiKit.muted(a, "A cheap auction = at least this many % under the usual price:"));
        card.addView(pct);
        card.addView(UiKit.muted(a, "…and ending within this many minutes (for the alert and automatic bids):"));
        card.addView(mins);
        Switch bid = UiKit.accentSwitch(a, "Bid on cheap auctions automatically",
                p.getBoolean(SilverActions.KEY_AUTO_BID, false));
        bid.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton b, boolean on) {
                p.edit().putBoolean(SilverActions.KEY_AUTO_BID, on).apply();
            }
        });
        card.addView(bid);
        card.addView(UiKit.muted(a, "Most silver for one automatic bid (0 = never bid automatically):"));
        card.addView(cap);
        Switch sell = UiKit.accentSwitch(a, "Sell bag items automatically when prices are high",
                p.getBoolean(SilverActions.KEY_AUTO_SELL, false));
        sell.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton b, boolean on) {
                p.edit().putBoolean(SilverActions.KEY_AUTO_SELL, on).apply();
            }
        });
        card.addView(sell);
        card.addView(UiKit.primaryButton(a, "Save numbers", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int percent = clamp(parse(pct, SilverData.DEFAULT_DEAL_PERCENT), 5, 90);
                int minutes = clamp(parse(mins, SilverData.DEFAULT_DEAL_MINUTES), 1, 240);
                long most = Math.max(0, parse(cap, 0));
                p.edit().putInt(SilverActions.KEY_DEAL_PERCENT, percent).putInt(SilverActions.KEY_DEAL_MINUTES, minutes)
                        .putLong(SilverActions.KEY_BID_CAP, most).apply();
                Toast.makeText(a, "Saved: " + percent + "% under, " + minutes + " min, max bid " + most,
                        Toast.LENGTH_SHORT).show();
                a.redraw();
            }
        }));
        card.addView(UiKit.muted(a, "Automatic bids and sales also need Automatic actions on and Practice mode off "
                + "(Settings tab). Each auction gets one automatic bid at most."
                + (SilverActions.SELL_STEP_ONE_ONLY ? " Automatic selling starts after the one-time Test sell has "
                + "shown how the game's sell works." : "")));
        col.addView(card, UiKit.cardParams(a));
    }

    private void askBid(final SilverData.Deal d, int percent) {
        final SilverData.Auction au = d.auction;
        long suggest = Math.max(au.price + 1, d.normalTotal() * (100 - percent) / 100);
        final EditText amount = number(String.valueOf(suggest));
        LinearLayout box = new LinearLayout(a);
        box.setOrientation(LinearLayout.VERTICAL);
        int pad = UiKit.dp(a, 20);
        box.setPadding(pad, UiKit.dp(a, 8), pad, 0);
        box.addView(UiKit.body(a, SilverData.itemText(au.name, au.amount) + "\nNow " + au.price + " silver · usually "
                + d.normalTotal() + "\n\nYour highest bid (the game bids for you up to this):"));
        box.addView(amount);
        new AlertDialog.Builder(a).setTitle("Bid on this auction?").setView(box)
                .setPositiveButton("Bid", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int w) {
                        long max = parse(amount, 0);
                        if (max <= au.price) {
                            Toast.makeText(a, "The bid must be above " + au.price, Toast.LENGTH_LONG).show();
                            return;
                        }
                        try {
                            send(SilverActions.bid(au.id, max, "Bid up to " + max + " silver on "
                                    + SilverData.itemText(au.name, au.amount)));
                        } catch (Exception e) {
                            Toast.makeText(a, "Couldn't make the bid: " + e.getMessage(), Toast.LENGTH_LONG).show();
                        }
                    }
                })
                .setNegativeButton("Cancel", null).show();
    }

    private void askSell(final SilverData.BagItem it, final int count) {
        String msg = "Put " + SilverData.itemText(it.name, count) + " up for auction."
                + (SilverActions.SELL_STEP_ONE_ONLY ? "\n\nTest step: this only asks the game for its one-time "
                + "token and shows the answer in Activity. The item shouldn't be put up; if the game does it anyway, "
                + "it is a normal auction." : "");
        new AlertDialog.Builder(a).setTitle("Sell?").setMessage(msg)
                .setPositiveButton(SilverActions.SELL_STEP_ONE_ONLY ? "Ask the game" : "Sell",
                        new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int w) {
                                try {
                                    send(SilverActions.sell(it.id, count, "Sell " + SilverData.itemText(it.name, count)));
                                } catch (Exception e) {
                                    Toast.makeText(a, "Couldn't sell: " + e.getMessage(), Toast.LENGTH_LONG).show();
                                }
                            }
                        })
                .setNegativeButton("Cancel", null).show();
    }

    private void send(final GameAction action) {
        Toast.makeText(a, "Sending…", Toast.LENGTH_SHORT).show();
        new Thread(new Runnable() {
            @Override
            public void run() {
                String text;
                try {
                    text = action.label + ": " + ActionSender.sendFromScreen(a, action).describe();
                } catch (Exception e) {
                    text = action.label + ": failed (" + e.getClass().getSimpleName() + ")";
                }
                final String shown = text;
                a.runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(a, shown, Toast.LENGTH_LONG).show();
                        refresh();
                    }
                });
            }
        }).start();
    }

    private void refresh() {
        if (loading) {
            return;
        }
        loading = true;
        lastTry = System.currentTimeMillis();
        new Thread(new Runnable() {
            @Override
            public void run() {
                String error = null;
                try {
                    JSONObject snap = SilverData.readAll(new SilverData.Reader() {
                        @Override
                        public JSONObject query(String query) throws Exception {
                            return ActionSender.queryFromScreen(a, query);
                        }
                    }, System.currentTimeMillis());
                    if ("no game session yet".equals(snap.optString("meError"))) {
                        error = "No game session yet: open the game, wait for the next check.";
                    } else {
                        prefs().edit().putString(KEY_SNAPSHOT, snap.toString()).apply();
                    }
                } catch (Exception e) {
                    error = "Couldn't read the auction house (" + e.getClass().getSimpleName() + ")";
                }
                final String shown = error;
                a.runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        loading = false;
                        if (shown != null) {
                            Toast.makeText(a, shown, Toast.LENGTH_LONG).show();
                        }
                        a.redraw();
                    }
                });
            }
        }).start();
    }

    private JSONObject loadSnapshot() {
        try {
            String json = prefs().getString(KEY_SNAPSHOT, null);
            return json == null ? null : new JSONObject(json);
        } catch (Exception e) {
            return null;
        }
    }

    private SharedPreferences prefs() {
        return a.getSharedPreferences(ActionSender.PREFS, Context.MODE_PRIVATE);
    }

    private EditText number(String value) {
        EditText e = new EditText(a);
        e.setText(value);
        e.setInputType(InputType.TYPE_CLASS_NUMBER);
        e.setTextColor(UiKit.textColor(a));
        return e;
    }

    private static long parse(EditText e, long fallback) {
        try {
            return Long.parseLong(e.getText().toString().trim());
        } catch (Exception ex) {
            return fallback;
        }
    }

    private static int parse(EditText e, int fallback) {
        return (int) parse(e, (long) fallback);
    }

    private static int clamp(int v, int lo, int hi) {
        return Math.max(lo, Math.min(hi, v));
    }
}
