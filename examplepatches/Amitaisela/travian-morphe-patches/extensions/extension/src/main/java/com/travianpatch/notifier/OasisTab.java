package com.travianpatch.notifier;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.Toast;

import org.json.JSONObject;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * The Oases tab: oases around the first village, read from the game (animals and their defence from the
 * game's own tables, the hero's fighting strength), with a "Send hero" raid button per oasis that has
 * animals. Empty oases are listed apart (troop escape uses them). Reads use the session the background
 * check cached; the send goes through ActionSender (guard, practice mode, village steps, log).
 */
final class OasisTab implements HubActivity.Tab {

    private static final String KEY_SCAN = "oasis_scan_json_v2";
    private static final long STALE_MS = 10 * 60_000L;

    private final HubActivity a;
    private boolean loading;
    /** When the last read started; automatic reads wait a minute after it (a failing read must not loop). */
    private long lastTry;

    OasisTab(HubActivity a) {
        this.a = a;
    }

    @Override
    public View build() {
        LinearLayout col = new LinearLayout(a);
        col.setOrientation(LinearLayout.VERTICAL);
        final VillageList.Entry village = firstVillage();
        if (village == null) {
            col.addView(UiKit.muted(a, "No village read yet: open the game and wait for the next check."));
            return col;
        }
        JSONObject scan = loadScan();
        col.addView(UiKit.section(a, "Oases near " + village.name + " (" + village.x + "|" + village.y + ")"));
        LinearLayout top = UiKit.card(a);
        String when = scan == null ? "never" : DateFormat.getTimeInstance(DateFormat.SHORT)
                .format(new Date(scan.optLong("at")));
        top.addView(UiKit.muted(a, loading ? "Reading the map…" : "Last read: " + when + ". Cells within "
                + OasisFinder.RADIUS + " fields each way."));
        top.addView(UiKit.primaryButton(a, "Refresh", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                refresh(village);
            }
        }));
        col.addView(top, UiKit.cardParams(a));
        boolean mayAuto = !loading && System.currentTimeMillis() - lastTry > 60_000L;
        if (scan == null) {
            if (mayAuto) {
                refresh(village);
            }
            return col;
        }
        if (mayAuto && System.currentTimeMillis() - scan.optLong("at") > STALE_MS) {
            refresh(village);
        }

        JSONObject heroData = scan.optJSONObject("hero");
        JSONObject hero = OasisFinder.hero(heroData);
        final int power = OasisFinder.heroPower(heroData);
        LinearLayout heroCard = UiKit.card(a);
        heroCard.addView(UiKit.listRow(a, "Hero", hero == null ? "not known"
                : "Fighting strength " + (power < 0 ? "not known" : String.valueOf(power))
                + " · health " + Math.round(hero.optDouble("health", 0)) + "%"
                + (hero.optBoolean("isAlive", true) ? "" : " · not alive")));
        col.addView(heroCard, UiKit.cardParams(a));

        Map<String, OasisFinder.Stats> nature = OasisFinder.parseNature(scan.optJSONObject("nature"));
        List<OasisFinder.Oasis> oases = OasisFinder.parseGrid(scan.optJSONObject("grid"), village.x, village.y);
        col.addView(UiKit.section(a, "With animals (hero XP)"));
        LinearLayout withAnimals = UiKit.card(a);
        LinearLayout empty = UiKit.card(a);
        int nWith = 0, nEmpty = 0;
        for (final OasisFinder.Oasis o : oases) {
            String where = "(" + o.x + "|" + o.y + ") · about " + String.format(Locale.ROOT, "%.1f", o.distance)
                    + " fields";
            if (o.empty()) {
                LinearLayout row = UiKit.listRow(a, where, "no animals");
                // An empty oasis gives the hero no XP, but it's a harmless first real send.
                UiKit.addPill(row, UiKit.pill(a, "Send hero", true, new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        confirmHero(village, o);
                    }
                }));
                if (nEmpty > 0) {
                    empty.addView(UiKit.divider(a));
                }
                empty.addView(row);
                nEmpty++;
                continue;
            }
            long[] def = OasisFinder.defence(o, nature);
            String sub = OasisFinder.animalsText(o) + (def == null ? "" : "\nAnimal defence: " + def[0]
                    + " vs infantry, " + def[1] + " vs cavalry" + (power > 0 ? " · hero "
                    + power + " (rough compare only)" : ""));
            LinearLayout row = UiKit.listRow(a, where, sub);
            UiKit.addPill(row, UiKit.pill(a, "Send hero", true, new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    confirmHero(village, o);
                }
            }));
            if (nWith > 0) {
                withAnimals.addView(UiKit.divider(a));
            }
            withAnimals.addView(row);
            nWith++;
        }
        if (nWith == 0) {
            withAnimals.addView(UiKit.muted(a, "No oasis with animals in range."));
        }
        col.addView(withAnimals, UiKit.cardParams(a));
        col.addView(UiKit.section(a, "Empty (for troop escape)"));
        if (nEmpty == 0) {
            empty.addView(UiKit.muted(a, "No empty oasis in range."));
        }
        col.addView(empty, UiKit.cardParams(a));
        col.addView(UiKit.muted(a, "Animal stats and the hero's strength come from the game. The game doesn't "
                + "give its fight formula, so no win/loss is shown."));
        return col;
    }

    @Override
    public void tick() {
    }

    private void confirmHero(final VillageList.Entry village, final OasisFinder.Oasis o) {
        String msg = "Raid (" + o.x + "|" + o.y + ") with the hero only.\n\n" + OasisFinder.animalsText(o)
                + (TroopSend.STEP_ONE_ONLY ? "\n\nTest step: this only asks the game for its one-time token and "
                + "shows the answer in Activity. The hero shouldn't leave; if the game sends it anyway, it raids "
                + "this empty oasis and comes back." : "");
        new AlertDialog.Builder(a).setTitle("Send hero?").setMessage(msg)
                .setPositiveButton(TroopSend.STEP_ONE_ONLY ? "Ask the game" : "Send", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface d, int w) {
                        sendHero(village, o);
                    }
                })
                .setNegativeButton("Cancel", null).show();
    }

    private void sendHero(final VillageList.Entry village, final OasisFinder.Oasis o) {
        Toast.makeText(a, "Sending…", Toast.LENGTH_SHORT).show();
        new Thread(new Runnable() {
            @Override
            public void run() {
                String label = "Hero raid (" + o.x + "|" + o.y + ")";
                String text;
                try {
                    Map<String, Integer> units = new HashMap<String, Integer>();
                    units.put("t11", 1);
                    ActionClient.Result r = ActionSender.sendFromScreen(a,
                            TroopSend.raid(village.id, o.cellId, o.x, o.y, units, label));
                    String arrival = "SENT".equals(r.outcome) ? TroopSend.arrivalText(r.responseBody) : "";
                    text = label + ": " + r.describe() + (arrival.isEmpty() ? "" : " · " + arrival);
                } catch (Exception e) {
                    text = label + ": failed (" + e.getClass().getSimpleName() + ")";
                }
                final String shown = text;
                a.runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(a, shown, Toast.LENGTH_LONG).show();
                    }
                });
            }
        }).start();
    }

    private void refresh(final VillageList.Entry village) {
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
                    JSONObject grid = ActionSender.queryFromScreen(a, OasisFinder.gridQuery(village.x, village.y));
                    if (grid == null) {
                        error = "No game session yet: open the game, wait for the next check.";
                    } else {
                        JSONObject nature = ActionSender.queryFromScreen(a, OasisFinder.NATURE_QUERY);
                        JSONObject hero = ActionSender.queryFromScreen(a, OasisFinder.HERO_QUERY);
                        JSONObject scan = new JSONObject().put("at", System.currentTimeMillis())
                                .put("villageId", village.id)
                                .put("grid", grid.optJSONObject("data"))
                                .put("nature", nature == null ? null : nature.optJSONObject("data"))
                                .put("hero", hero == null ? null : hero.optJSONObject("data"));
                        prefs().edit().putString(KEY_SCAN, scan.toString()).apply();
                    }
                } catch (Exception e) {
                    error = "Couldn't read the map (" + e.getClass().getSimpleName() + ")";
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

    private JSONObject loadScan() {
        String json = prefs().getString(KEY_SCAN, null);
        VillageList.Entry v = firstVillage();
        try {
            JSONObject o = json == null ? null : new JSONObject(json);
            return o != null && v != null && v.id.equals(o.optString("villageId")) ? o : null;
        } catch (Exception e) {
            return null;
        }
    }

    private SharedPreferences prefs() {
        return a.getSharedPreferences(ActionSender.PREFS, Context.MODE_PRIVATE);
    }

    private VillageList.Entry firstVillage() {
        List<VillageList.Entry> list = VillageList.fromJson(a.getSharedPreferences(NotifierWorker.STATE_PREFS,
                Context.MODE_PRIVATE).getString(NotifierWorker.KEY_VILLAGES, null));
        return list.isEmpty() ? null : list.get(0);
    }
}
