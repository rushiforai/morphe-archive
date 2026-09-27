package com.travianpatch.notifier;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * The Village tab: everything for one village on one screen - what is building now, the Auto-build switch
 * with its latest status, the queue (with when its next entry starts), and what can be built (a searchable
 * list, or a map of the village's slots). All numbers come from the game's own data saved by the
 * background check.
 */
final class VillageTab implements HubActivity.Tab {

    private static final String KEY_SELECTED = "selected_village";
    private static final String KEY_FILTER = "build_filter";
    private static final int FILTER_MAP = 3;
    /** Row groups in the Build list; BLOCKED rows (the game says no) only show while searching. */
    private static final int CAT_BUILDINGS = 0, CAT_FIELDS = 1, CAT_NEW = 2, CAT_BLOCKED = 3;

    private final HubActivity a;
    private final List<TextView> countdowns = new ArrayList<TextView>();
    private final List<QueueView.Item> countdownItems = new ArrayList<QueueView.Item>();
    /** The search text; kept on the tab so it survives the redraw after + or −. */
    private String search = "";

    private List<VillageList.Entry> villages;
    private PlayerBuildings player;
    private BuildingRules rules;
    private List<VillageResources.Entry> resources;
    private String villageId;
    private List<BuildOrderStore.Entry> order;

    VillageTab(HubActivity a) {
        this.a = a;
    }

    private SharedPreferences orders() {
        return a.getSharedPreferences(BuildOrderStore.PREFS, Context.MODE_PRIVATE);
    }

    private void load() {
        SharedPreferences state = a.getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE);
        villages = VillageList.fromJson(state.getString(NotifierWorker.KEY_VILLAGES, null));
        player = PlayerBuildings.parse(state.getString(NotifierWorker.KEY_PLAYER_BUILDINGS, null));
        rules = BuildingRules.parse(a.getSharedPreferences(BuildingRules.PREFS, Context.MODE_PRIVATE)
                .getString(BuildingRules.KEY_JSON, null));
        resources = VillageResources.fromJson(state.getString(NotifierWorker.KEY_VILLAGE_RESOURCES, null));
        villageId = orders().getString(KEY_SELECTED, null);
        boolean known = false;
        for (VillageList.Entry v : villages) {
            known |= v.id.equals(villageId);
        }
        if (!known) {
            villageId = villages.isEmpty() ? null : villages.get(0).id;
        }
        order = villageId == null ? new ArrayList<BuildOrderStore.Entry>()
                : BuildOrderStore.fromJson(orders().getString(BuildOrderStore.key(villageId), null));
    }

    @Override
    public View build() {
        load();
        countdowns.clear();
        countdownItems.clear();
        LinearLayout col = new LinearLayout(a);
        col.setOrientation(LinearLayout.VERTICAL);
        if (villageId == null) {
            col.addView(message("No village read yet. Open the game once and wait for the first check."));
            return col;
        }
        col.addView(villageHeader());
        ActionClient.Settings s = ActionSender.settings(a);
        boolean autoOn = orders().getBoolean(BuildOrderStore.autoKey(villageId), false);
        if (autoOn && s.dryRun) {
            col.addView(banner("Practice mode is on: auto-build only writes what it would do. Turn it off in Settings."));
        }
        col.addView(UiKit.section(a, "Building now"));
        col.addView(buildingNowCard(), UiKit.cardParams(a));
        col.addView(UiKit.section(a, "Auto-build"));
        col.addView(autoCard(autoOn), UiKit.cardParams(a));
        col.addView(UiKit.section(a, "Queue"));
        col.addView(queueCard(autoOn), UiKit.cardParams(a));
        col.addView(UiKit.section(a, "Build"));
        col.addView(buildSection());
        return col;
    }

    @Override
    public void tick() {
        long now = System.currentTimeMillis();
        for (int i = 0; i < countdowns.size(); i++) {
            countdowns.get(i).setText(QueueView.when(countdownItems.get(i), now));
        }
    }

    // ------------------------------------------------------------------ sections

    private View villageHeader() {
        if (villages.size() == 1) {
            TextView name = UiKit.text(a, villages.get(0).label(), 17, true, UiKit.textColor(a));
            name.setPadding(UiKit.dp(a, 4), UiKit.dp(a, 8), 0, 0);
            return name;
        }
        Spinner picker = new Spinner(a);
        List<String> labels = new ArrayList<String>();
        int selected = 0;
        for (int i = 0; i < villages.size(); i++) {
            labels.add(villages.get(i).label());
            if (villages.get(i).id.equals(villageId)) {
                selected = i;
            }
        }
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(a, android.R.layout.simple_spinner_item, labels) {
            @Override
            public View getView(int position, View convertView, android.view.ViewGroup parent) {
                TextView v = (TextView) super.getView(position, convertView, parent);
                v.setTextColor(UiKit.textColor(a));
                v.setTextSize(17);
                return v;
            }
        };
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        picker.setAdapter(adapter);
        picker.setSelection(selected, false);
        picker.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String picked = villages.get(position).id;
                if (!picked.equals(villageId)) {
                    orders().edit().putString(KEY_SELECTED, picked).apply();
                    a.redraw();
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });
        return picker;
    }

    private View buildingNowCard() {
        LinearLayout card = UiKit.card(a);
        String title = currentVillageTitle();
        int shown = 0;
        for (QueueView.Group g : QueueView.parse(stateJson())) {
            if (title != null && !title.equals(g.title)) {
                continue;
            }
            for (QueueView.Item item : g.items) {
                LinearLayout row = UiKit.listRow(a, item.label, null);
                TextView when = UiKit.text(a, QueueView.when(item, System.currentTimeMillis()), 14, false,
                        UiKit.accentText(a));
                row.addView(when);
                countdowns.add(when);
                countdownItems.add(item);
                if (shown > 0) {
                    card.addView(UiKit.divider(a));
                }
                card.addView(row);
                shown++;
            }
        }
        if (shown == 0) {
            card.addView(UiKit.muted(a, "Nothing is building or training."));
        }
        return card;
    }

    private View autoCard(boolean autoOn) {
        LinearLayout card = UiKit.card(a);
        Switch toggle = UiKit.accentSwitch(a, "Build the queue automatically", autoOn);
        toggle.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton b, boolean checked) {
                orders().edit().putBoolean(BuildOrderStore.autoKey(villageId), checked).apply();
                if (checked) {
                    // One switch is enough: turning auto-build on also turns automatic actions on.
                    a.getSharedPreferences(ActionSender.PREFS, Context.MODE_PRIVATE).edit()
                            .putBoolean(ActionSender.KEY_MASTER, true).apply();
                }
                a.redraw();
            }
        });
        card.addView(toggle, fullWidth());
        String notes = orders().getString(BuildOrderStore.notesKey(villageId), null);
        TextView status = UiKit.muted(a, autoOn ? (notes == null ? "Starts at the next check (within 5 minutes)." : notes)
                : "Off. The queue waits until you switch this on; ▶ still builds right away.");
        status.setPadding(0, UiKit.dp(a, 6), 0, 0);
        card.addView(status);
        if (isRoman()) {
            card.addView(UiKit.divider(a), gapParams());
            Switch both = UiKit.accentSwitch(a, "Build a field and a building at the same time", parallel());
            both.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                @Override
                public void onCheckedChanged(CompoundButton b, boolean checked) {
                    orders().edit().putBoolean(BuildOrderStore.parallelKey(villageId), checked).apply();
                    a.redraw();
                }
            });
            card.addView(both, fullWidth());
            card.addView(UiKit.muted(a, "Romans only. On: the first field and the first building in the queue each "
                    + "start as soon as their own line is free."));
        }
        return card;
    }

    private View queueCard(boolean autoOn) {
        LinearLayout card = UiKit.card(a);
        if (order.isEmpty()) {
            card.addView(UiKit.muted(a, "Empty. Tap + next to anything under Build to queue it."));
            return card;
        }
        addNextLines(card, autoOn);
        QueueEstimate.Result total = QueueEstimate.totalCost(rules, village(), order);
        TextView sum = UiKit.muted(a, "Total " + Costs.shortLine(total.totalCost.lumber, total.totalCost.clay,
                total.totalCost.iron, total.totalCost.crop)
                + (total.unknownCount > 0 ? "  (+" + total.unknownCount + " not known)" : ""));
        sum.setPadding(0, UiKit.dp(a, 4), 0, UiKit.dp(a, 4));
        card.addView(sum);
        for (int i = 0; i < order.size(); i++) {
            final int index = i;
            BuildOrderStore.Entry e = order.get(i);
            String name = GameData.buildingName(e.buildingTypeId) + (e.slotId > 0 ? " · slot " + e.slotId : "");
            LinearLayout row = UiKit.listRow(a, (i + 1) + ".  " + name + "  → " + e.targetLevel, null);
            if (i > 0) {
                UiKit.addPill(row, UiKit.pill(a, "↑", false, new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        move(index, -1);
                    }
                }));
            }
            UiKit.addPill(row, UiKit.pill(a, "✕", false, new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    order.remove(index);
                    saveOrder();
                }
            }));
            card.addView(UiKit.divider(a));
            card.addView(row);
        }
        return card;
    }

    /** "Next: X → 3, starts in about …" per build line, with a Build now button when it can start right away. */
    private void addNextLines(LinearLayout card, boolean autoOn) {
        PlayerBuildings.Village village = village();
        if (rules == null || village == null) {
            return;
        }
        boolean parallel = parallel();
        AutomationSettings.Config cfg = AutomationSettings.fromJson(a.getSharedPreferences(AutomationSettings.PREFS,
                Context.MODE_PRIVATE).getString(AutomationSettings.KEY, null));
        String title = currentVillageTitle();
        String json = stateJson();
        long fieldFree = NextBuild.lineFreeAt(json, title, village, parallel, true);
        long buildingFree = NextBuild.lineFreeAt(json, title, village, parallel, false);
        SharedPreferences o = orders();
        long fieldIdle = autoOn ? o.getLong("idle_since_" + villageId + (parallel ? "_field" : ""), 0) : 0;
        long buildingIdle = autoOn ? o.getLong("idle_since_" + villageId + (parallel ? "_building" : ""), 0) : 0;
        long now = System.currentTimeMillis();
        List<NextBuild.Estimate> next = NextBuild.upcoming(rules, player.tribeId, village,
                VillageResources.find(resources, villageId), order, cfg, parallel, fieldFree, buildingFree,
                fieldIdle, buildingIdle, now);
        if (next.isEmpty()) {
            card.addView(UiKit.muted(a, "Nothing in the queue can start: see the Auto-build status above."));
            return;
        }
        for (final NextBuild.Estimate est : next) {
            String name = GameData.buildingName(est.row.typeId) + (est.row.slotId > 0 && BuildChoices.isField(est.row.typeId)
                    ? " · slot " + est.row.slotId : "");
            LinearLayout row = UiKit.listRow(a, "Next: " + name + " → " + est.row.toLevel, nextLine(est, autoOn, now));
            if (est.canStartNow) {
                UiKit.addPill(row, UiKit.pill(a, "Build now", true, new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        confirmBuild(est.row);
                    }
                }));
            }
            card.addView(row);
        }
        card.addView(UiKit.divider(a));
    }

    private String nextLine(NextBuild.Estimate est, boolean autoOn, long now) {
        StringBuilder sb = new StringBuilder();
        if (!autoOn) {
            sb.append("Auto-build is off, so it won't start by itself.\n");
        } else if (est.startEarliestMs == NextBuild.UNKNOWN) {
            sb.append("Start time not known yet.\n");
        } else if (est.startLatestMs <= now) {
            sb.append("Starts at the next check (about every 5 min).\n");
        } else if (est.startEarliestMs == est.startLatestMs || est.startLatestMs - est.startEarliestMs < 60_000L) {
            sb.append("Starts in about ").append(AlertStatus.duration(est.startLatestMs - now))
                    .append(" (").append(clock(est.startLatestMs)).append(")\n");
        } else {
            sb.append("Starts in ").append(AlertStatus.duration(Math.max(0, est.startEarliestMs - now))).append(" to ")
                    .append(AlertStatus.duration(est.startLatestMs - now)).append(" (")
                    .append(clock(est.startEarliestMs)).append("–").append(clock(est.startLatestMs)).append(")\n");
        }
        List<String> why = new ArrayList<String>();
        if (est.lineFreeAtMs == NextBuild.UNKNOWN) {
            why.add("something is building (end time not known)");
        } else if (est.lineFreeAtMs > now) {
            why.add("current build ends in " + AlertStatus.duration(est.lineFreeAtMs - now));
        }
        if (est.resourcesAtMs == NextBuild.UNKNOWN) {
            why.add("resources: production won't cover it");
        } else if (est.resourcesAtMs > now) {
            why.add("resources in " + AlertStatus.duration(est.resourcesAtMs - now));
        }
        if (autoOn && est.startEarliestMs != NextBuild.UNKNOWN && est.startLatestMs > now) {
            why.add("plus the random wait");
        }
        sb.append(why.isEmpty() ? "Ready." : "Waiting: " + android.text.TextUtils.join(", ", why) + ".");
        if (!est.canStartNow) {
            sb.append("\nBuild now shows up once the line is free and the resources are there.");
        }
        return sb.toString();
    }

    private View buildSection() {
        LinearLayout col = new LinearLayout(a);
        col.setOrientation(LinearLayout.VERTICAL);
        final PlayerBuildings.Village village = village();
        if (rules == null || village == null) {
            col.addView(message("The game's building data hasn't been read yet. Open the game and wait a minute."));
            return col;
        }
        int filter = orders().getInt(KEY_FILTER, 0);
        col.addView(UiKit.segments(a, new String[]{"Buildings", "Fields", "New", "Map"}, filter, new UiKit.OnPick() {
            @Override
            public void picked(int index) {
                orders().edit().putInt(KEY_FILTER, index).apply();
                a.redraw();
            }
        }), UiKit.cardParams(a));
        if (filter == FILTER_MAP) {
            col.addView(mapView(village));
            return col;
        }

        final EditText box = new EditText(a);
        box.setHint("Search, e.g. wall, granary");
        box.setSingleLine(true);
        box.setTextColor(UiKit.textColor(a));
        box.setHintTextColor(UiKit.mutedColor(a));
        box.setText(search);
        col.addView(box, UiKit.cardParams(a));

        final LinearLayout card = UiKit.card(a);
        final List<View> rowViews = new ArrayList<View>();
        final List<String> rowText = new ArrayList<String>();
        final List<Integer> rowCat = new ArrayList<Integer>();
        VillageResources.Entry stock = VillageResources.find(resources, villageId);
        for (BuildChoices.Row r : sortedChoices(village)) {
            int cat = category(r);
            View v = cat == CAT_BLOCKED ? blockedRow(r) : choiceRow(r, stock);
            LinearLayout wrap = new LinearLayout(a);
            wrap.setOrientation(LinearLayout.VERTICAL);
            wrap.addView(UiKit.divider(a));
            wrap.addView(v);
            card.addView(wrap);
            rowViews.add(wrap);
            rowText.add(GameData.buildingName(r.typeId).toLowerCase(Locale.US));
            rowCat.add(cat);
        }
        final TextView empty = UiKit.muted(a, "");
        card.addView(empty);
        final int shownFilter = filter;
        final Runnable apply = new Runnable() {
            @Override
            public void run() {
                String q = search.trim().toLowerCase(Locale.US);
                boolean first = true;
                for (int i = 0; i < rowViews.size(); i++) {
                    boolean show = q.isEmpty() ? rowCat.get(i) == shownFilter : rowText.get(i).contains(q);
                    View wrap = rowViews.get(i);
                    wrap.setVisibility(show ? View.VISIBLE : View.GONE);
                    if (show) {
                        ((LinearLayout) wrap).getChildAt(0).setVisibility(first ? View.GONE : View.VISIBLE);
                        first = false;
                    }
                }
                empty.setText(!first ? "" : q.isEmpty() ? "Nothing here can be built right now, going by the game's rules."
                        : "No building matches \"" + search.trim() + "\".");
                empty.setVisibility(first ? View.VISIBLE : View.GONE);
            }
        };
        apply.run();
        box.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                search = s.toString();
                apply.run();
            }
        });
        col.addView(card, UiKit.cardParams(a));
        return col;
    }

    /** Every row the Build list can show: buildings, then fields (lowest level first), then new, then blocked. */
    private List<BuildChoices.Row> sortedChoices(PlayerBuildings.Village village) {
        List<BuildChoices.Row> rows = new ArrayList<BuildChoices.Row>(BuildChoices.list(rules, player.tribeId, village));
        Collections.sort(rows, new Comparator<BuildChoices.Row>() {
            @Override
            public int compare(BuildChoices.Row x, BuildChoices.Row y) {
                int cx = category(x), cy = category(y);
                if (cx != cy) {
                    return cx - cy;
                }
                if (cx == CAT_FIELDS) {
                    return x.fromLevel != y.fromLevel ? x.fromLevel - y.fromLevel : x.slotId - y.slotId;
                }
                return 0; // keep the game's order otherwise (the sort is stable)
            }
        });
        return rows;
    }

    private static int category(BuildChoices.Row r) {
        if (r.verdict.answer == BuildOptions.Answer.NO) {
            return CAT_BLOCKED;
        }
        return r.slotId == 0 ? CAT_NEW : BuildChoices.isField(r.typeId) ? CAT_FIELDS : CAT_BUILDINGS;
    }

    /** A row the game says no to; shown only in search results, with the game's reason. */
    private View blockedRow(BuildChoices.Row r) {
        String name = GameData.buildingName(r.typeId);
        String title = r.slotId == 0 ? name + "  · new" : name + "   " + r.fromLevel;
        LinearLayout row = UiKit.listRow(a, title, "Can't build: " + r.verdict.reason);
        row.setAlpha(0.55f);
        return row;
    }

    /**
     * One buildable row. When the queue already takes this building higher, the title shows where it is
     * going ("1 ⇢ 3") and the + pill names the level it would add next ("+4"); − takes one level back off.
     */
    private View choiceRow(final BuildChoices.Row r, VillageResources.Entry stock) {
        String name = GameData.buildingName(r.typeId);
        boolean field = BuildChoices.isField(r.typeId);
        final int planned = BuildOrderStore.plannedLevel(order, r.typeId, r.slotId);
        boolean queued = planned > r.fromLevel;
        String head = r.slotId == 0 ? name + "  · new" : name + (field ? " · slot " + r.slotId : "");
        String title = head + "   " + r.fromLevel + (queued ? " ⇢ " + planned : " → " + r.toLevel);
        BuildingRules.Rule rule = rules.find(r.typeId);
        final int adds = queued ? planned + 1 : r.toLevel;
        boolean atMax = rule != null && adds > rule.maxLevel;
        String sub;
        if (queued) {
            BuildingRules.Level more = rule == null ? null : rule.levelData(adds);
            sub = "In your queue up to " + planned + (atMax ? " (the game's maximum)"
                    : more == null ? "" : "\n+ adds " + adds + ": " + Costs.shortLine(more.lumber, more.clay, more.iron, more.crop));
        } else if (r.next == null) {
            sub = "cost not known";
        } else {
            sub = Costs.shortLine(r.next.lumber, r.next.clay, r.next.iron, r.next.crop);
            if (stock != null) {
                String miss = Costs.missing(stock.lumberStock, stock.clayStock, stock.ironStock, stock.cropStock,
                        r.next.lumber, r.next.clay, r.next.iron, r.next.crop, 0);
                if (miss.length() > 0) {
                    sub += "\n" + miss;
                }
            }
        }
        if (r.verdict.answer == BuildOptions.Answer.UNKNOWN) {
            sub += "\n" + r.verdict.reason;
        }
        LinearLayout row = UiKit.listRow(a, title, sub);
        if (r.verdict.answer == BuildOptions.Answer.YES) {
            UiKit.addPill(row, UiKit.pill(a, "▶", true, new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    confirmBuild(r);
                }
            }));
        }
        if (queued) {
            UiKit.addPill(row, UiKit.pill(a, "−", false, new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    if (BuildOrderStore.removeOneLevel(order, r.typeId, r.slotId, r.fromLevel)) {
                        saveOrder();
                    }
                }
            }));
        }
        if (!atMax) {
            UiKit.addPill(row, UiKit.pill(a, "+" + adds, false, new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    addToQueue(r);
                }
            }));
        }
        return row;
    }

    // ------------------------------------------------------------------ map

    /**
     * The village the way the game shows it: the fields around the village, then the buildings inside the
     * wall, each at the game's own position (VillageLayout). Tap a slot to build or queue there.
     */
    private View mapView(final PlayerBuildings.Village village) {
        LinearLayout col = new LinearLayout(a);
        col.setOrientation(LinearLayout.VERTICAL);
        String raw = null;
        try {
            org.json.JSONObject known = new org.json.JSONObject(a.getSharedPreferences(NotifierWorker.STATE_PREFS,
                    Context.MODE_PRIVATE).getString(NotifierWorker.KEY_LAND_DISTRIBUTION, "{}"));
            raw = known.has(villageId) ? known.optString(villageId) : null;
        } catch (Exception ignored) {
            // not read yet
        }
        int distribution = VillageLayout.distribution(raw);
        List<VillageMapView.Spot> spots = new ArrayList<VillageMapView.Spot>();
        for (PlayerBuildings.Slot s : village.slots) {
            int planned = 0;
            for (BuildOrderStore.Entry e : order) {
                if (e.slotId == s.slotId && (s.isEmpty() || e.buildingTypeId == s.typeId)) {
                    planned = Math.max(planned, e.targetLevel);
                }
            }
            spots.add(new VillageMapView.Spot(s.slotId, s.typeId, s.level, village.queuedLevel(s.slotId), planned,
                    s.isEmpty() ? "" : GameData.buildingName(s.typeId)));
        }
        VillageMapView.OnSlot onSlot = new VillageMapView.OnSlot() {
            @Override
            public void tapped(int slotId) {
                for (PlayerBuildings.Slot s : village.slots) {
                    if (s.slotId == slotId) {
                        tapSlot(s);
                        return;
                    }
                }
            }
        };
        LinearLayout f = UiKit.card(a);
        f.addView(UiKit.text(a, "Fields", 15, true, UiKit.textColor(a)));
        f.addView(new VillageMapView(a, true, distribution, spots, onSlot));
        if (distribution == 0) {
            f.addView(UiKit.muted(a, "Field spots follow the game's most common layout until the game tells this "
                    + "app your village's field pattern (read once, at a background check)."));
        }
        col.addView(f, UiKit.cardParams(a));
        LinearLayout c = UiKit.card(a);
        c.addView(UiKit.text(a, "Village", 15, true, UiKit.textColor(a)));
        c.addView(new VillageMapView(a, false, distribution, spots, onSlot));
        TextView note = UiKit.muted(a, "Spots are where the game's own screens put them. ⚒ = building now, "
                + "→ = in your queue. Tap a spot (or the wall ring) to build or queue.");
        note.setPadding(0, UiKit.dp(a, 8), 0, 0);
        c.addView(note);
        col.addView(c, UiKit.cardParams(a));
        return col;
    }

    /** A built slot: its upgrade row. An empty slot: pick which building goes there first. */
    private void tapSlot(PlayerBuildings.Slot s) {
        PlayerBuildings.Village village = village();
        if (village == null) {
            return;
        }
        if (!s.isEmpty()) {
            BuildChoices.Row row = BuildQueueStep.rowForSlot(rules, player.tribeId, village, s.slotId, s.typeId);
            if (row != null) {
                slotDialog(row);
            }
            return;
        }
        final List<BuildChoices.Row> options = new ArrayList<BuildChoices.Row>();
        List<String> labels = new ArrayList<String>();
        for (BuildingRules.Rule rule : rules.rules) {
            if (!BuildChoices.fitsSlot(rule, s.slotId)) {
                continue;
            }
            BuildChoices.Row row = BuildQueueStep.rowForSlot(rules, player.tribeId, village, s.slotId, rule.type);
            if (row == null || row.verdict.answer == BuildOptions.Answer.NO) {
                continue;
            }
            options.add(row);
            labels.add(GameData.buildingName(rule.type)
                    + (row.verdict.answer == BuildOptions.Answer.UNKNOWN ? "  (can't be checked yet)" : ""));
        }
        if (options.isEmpty()) {
            Toast.makeText(a, "Nothing can be built on slot " + s.slotId + " right now, going by the game's rules",
                    Toast.LENGTH_LONG).show();
            return;
        }
        new AlertDialog.Builder(a)
                .setTitle("Slot " + s.slotId + ": build what?")
                .setItems(labels.toArray(new String[0]), new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface d, int which) {
                        slotDialog(options.get(which));
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private void slotDialog(final BuildChoices.Row r) {
        int planned = BuildOrderStore.plannedLevel(order, r.typeId, r.slotId);
        final int adds = Math.max(planned, r.fromLevel) + 1;
        BuildingRules.Rule rule = rules.find(r.typeId);
        boolean atMax = rule != null && adds > rule.maxLevel;
        String cost = r.next == null ? "cost not known" : Costs.shortLine(r.next.lumber, r.next.clay, r.next.iron, r.next.crop);
        String msg = GameData.buildingName(r.typeId) + " on slot " + r.slotId + ", level " + r.fromLevel
                + (planned > r.fromLevel ? " (queued to " + planned + ")" : "") + "\n\nNext level " + r.toLevel + ": " + cost
                + (r.verdict.answer != BuildOptions.Answer.YES ? "\n\n" + r.verdict.reason : "");
        AlertDialog.Builder b = new AlertDialog.Builder(a).setTitle("Slot " + r.slotId).setMessage(msg)
                .setNegativeButton("Close", null);
        if (!atMax) {
            b.setNeutralButton("Queue " + adds, new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface d, int w) {
                    addToQueue(r);
                }
            });
        }
        if (r.verdict.answer == BuildOptions.Answer.YES) {
            b.setPositiveButton("Build now", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface d, int w) {
                    confirmBuild(r);
                }
            });
        }
        b.show();
    }

    // ------------------------------------------------------------------ actions

    /** Adds the next level after anything already queued for the same slot (or the same new building). */
    private void addToQueue(BuildChoices.Row r) {
        int target = Math.max(r.toLevel, BuildOrderStore.plannedLevel(order, r.typeId, r.slotId) + 1);
        BuildingRules.Rule rule = rules.find(r.typeId);
        if (rule != null && target > rule.maxLevel) {
            Toast.makeText(a, "Already queued up to the game's maximum (" + rule.maxLevel + ")", Toast.LENGTH_SHORT).show();
            return;
        }
        boolean replaced = false;
        for (int i = 0; i < order.size(); i++) {
            BuildOrderStore.Entry e = order.get(i);
            if (e.buildingTypeId == r.typeId && e.slotId == r.slotId) {
                order.set(i, new BuildOrderStore.Entry(r.typeId, target, r.slotId));
                replaced = true;
                break;
            }
        }
        if (!replaced) {
            order.add(new BuildOrderStore.Entry(r.typeId, target, r.slotId));
        }
        saveOrder();
    }

    private void move(int index, int delta) {
        int to = index + delta;
        if (to < 0 || to >= order.size()) {
            return;
        }
        Collections.swap(order, index, to);
        saveOrder();
    }

    private void saveOrder() {
        orders().edit().putString(BuildOrderStore.key(villageId), BuildOrderStore.toJson(order)).apply();
        a.redraw();
    }

    private void confirmBuild(final BuildChoices.Row r) {
        final String label = GameData.buildingName(r.typeId) + (r.slotId > 0 ? " (slot " + r.slotId + ")" : "")
                + " to " + r.toLevel;
        String cost = r.next == null ? "cost not known" : Costs.shortLine(r.next.lumber, r.next.clay, r.next.iron, r.next.crop);
        long nextAttack = a.getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE)
                .getLong(NotifierWorker.KEY_NEXT_ATTACK_AT, 0);
        long minutes = (nextAttack - System.currentTimeMillis()) / 60_000L;
        String warning = nextAttack > System.currentTimeMillis() && minutes < ActionSender.settings(a).attackPauseMinutes
                ? "\n\n⚠ An attack lands in about " + Math.max(0, minutes) + " min." : "";
        String practice = ActionSender.settings(a).dryRun ? "\n\nPractice mode is on: nothing will be sent." : "";
        new AlertDialog.Builder(a)
                .setTitle("Build now?")
                .setMessage(label + "\n" + cost + warning + practice)
                .setPositiveButton("Build", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface d, int w) {
                        buildNow(r, label);
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private void buildNow(final BuildChoices.Row r, final String label) {
        final String vid = villageId;
        PlayerBuildings.Village village = village();
        BuildingRules.Rule rule = rules == null ? null : rules.find(r.typeId);
        final int slot = r.slotId > 0 ? r.slotId
                : (village == null || rule == null ? 0 : BuildChoices.slotForNew(rule, village));
        if (slot == 0) {
            Toast.makeText(a, "No free slot for it", Toast.LENGTH_SHORT).show();
            return;
        }
        Toast.makeText(a, label + ": sending (opening the village first, a few seconds)…", Toast.LENGTH_SHORT).show();
        new Thread(new Runnable() {
            @Override
            public void run() {
                String text;
                try {
                    ActionClient.Result res = ActionSender.sendFromScreen(a, GameActions.build(vid, slot, r.typeId, label, r.fromLevel, r.next));
                    text = label + ": " + res.describe();
                    if ("SENT".equals(res.outcome)) {
                        NotifierWorker.requestCheckNow(a);
                    }
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

    // ------------------------------------------------------------------ helpers

    private PlayerBuildings.Village village() {
        return player == null ? null : player.findVillage(villageId);
    }

    private boolean isRoman() {
        return player != null && player.tribeId == BuildChoices.ROMAN_TRIBE;
    }

    /** Romans with the "field and building at the same time" switch on (on unless turned off). */
    private boolean parallel() {
        return isRoman() && orders().getBoolean(BuildOrderStore.parallelKey(villageId), true);
    }

    private String stateJson() {
        return a.getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE)
                .getString(NotifierWorker.STATE_KEY, null);
    }

    private String currentVillageTitle() {
        for (VillageList.Entry v : villages) {
            if (v.id.equals(villageId)) {
                return v.name + " (" + v.x + "|" + v.y + ")";
            }
        }
        return null;
    }

    private static String clock(long ms) {
        return new SimpleDateFormat("HH:mm", Locale.US).format(new Date(ms));
    }

    private LinearLayout.LayoutParams fullWidth() {
        return new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
    }

    private LinearLayout.LayoutParams gapParams() {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
                UiKit.dp(a, 1));
        lp.topMargin = UiKit.dp(a, 10);
        lp.bottomMargin = UiKit.dp(a, 10);
        return lp;
    }

    private View message(String text) {
        LinearLayout card = UiKit.card(a);
        card.addView(UiKit.body(a, text));
        LinearLayout wrap = new LinearLayout(a);
        wrap.setOrientation(LinearLayout.VERTICAL);
        wrap.setPadding(0, UiKit.dp(a, 12), 0, 0);
        wrap.addView(card, UiKit.cardParams(a));
        return wrap;
    }

    private View banner(String text) {
        LinearLayout card = UiKit.card(a);
        card.setBackground(UiKit.rounded(UiKit.dark(a) ? 0xFF3A2A12 : 0xFFFFF1D6, 14, a));
        card.addView(UiKit.body(a, text));
        LinearLayout wrap = new LinearLayout(a);
        wrap.setOrientation(LinearLayout.VERTICAL);
        wrap.setPadding(0, UiKit.dp(a, 10), 0, 0);
        wrap.addView(card, UiKit.cardParams(a));
        return wrap;
    }
}
