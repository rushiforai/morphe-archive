package com.travianpatch.notifier;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.InputType;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Lets the user set, per village, an ordered list of "upgrade this building to this level" entries, and
 * shows what the game itself says: which buildings the village has, what can be built or upgraded right
 * now, and the exact cost and effect of the next level. This screen only edits the list; nothing here
 * fires a build. Everything shown comes from the game's own data; where the game gives nothing the screen
 * says "not known".
 */
public class BuildOrderActivity extends Activity {

    /** One thing the picker offers: a building type to upgrade or to build new. */
    private static final class Option {
        final int typeId;
        final boolean isNew;
        final BuildOptions.Verdict verdict;

        Option(int typeId, boolean isNew, BuildOptions.Verdict verdict) {
            this.typeId = typeId;
            this.isNew = isNew;
            this.verdict = verdict;
        }

        String label() {
            String base = GameData.buildingName(typeId) + (isNew ? " (new)" : " (upgrade)");
            return verdict.answer == BuildOptions.Answer.UNKNOWN ? base + " - rule unclear" : base;
        }
    }

    private List<VillageList.Entry> villages = new ArrayList<VillageList.Entry>();
    private List<BuildOrderStore.Entry> order = new ArrayList<BuildOrderStore.Entry>();
    private BuildingRules rules;
    private PlayerBuildings player;
    private List<VillageResources.Entry> resources = new ArrayList<VillageResources.Entry>();
    private List<Option> options = new ArrayList<Option>();
    private String selectedVillageId;
    private LinearLayout builtColumn;
    private LinearLayout listColumn;
    private TextView summaryView;
    private TextView optionInfoView;
    private Spinner buildingPicker;
    private EditText levelInput;
    private LinearLayout choicesColumn;
    private android.widget.Switch autoSwitch;
    private TextView queueNotesView;

    /** BuildOrderStore prefs keys: per-village "run the queue automatically" and the worker's last status notes. */
    static String autoKey(String villageId) {
        return "auto_" + villageId;
    }

    static String notesKey(String villageId) {
        return "notes_" + villageId;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SharedPreferences state = getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE);
        villages = VillageList.fromJson(state.getString(NotifierWorker.KEY_VILLAGES, null));
        resources = VillageResources.fromJson(state.getString(NotifierWorker.KEY_VILLAGE_RESOURCES, null));
        player = PlayerBuildings.parse(state.getString(NotifierWorker.KEY_PLAYER_BUILDINGS, null));
        rules = BuildingRules.parse(getSharedPreferences(BuildingRules.PREFS, Context.MODE_PRIVATE)
                .getString(BuildingRules.KEY_JSON, null));
        setContentView(buildContent());
    }

    private View buildContent() {
        LinearLayout column = UiKit.column(this);
        column.addView(UiKit.title(this, "Build order"));
        column.addView(UiKit.muted(this, "Build now, or queue what each village builds next. A queue only runs "
                + "by itself when its switch and Automatic actions (Actions screen) are on. Everything shown is "
                + "read from the game; gold is never used."));

        if (villages.isEmpty() || rules == null || player == null) {
            LinearLayout empty = UiKit.card(this);
            empty.addView(UiKit.body(this, "The game's building data hasn't been read yet. Open Travian Tools "
                    + "again after the next check."));
            column.addView(empty, UiKit.cardParams(this));
            return UiKit.page(this, column);
        }

        column.addView(UiKit.section(this, "Village"));
        Spinner villagePicker = new Spinner(this);
        List<String> villageLabels = new ArrayList<String>();
        for (VillageList.Entry v : villages) {
            villageLabels.add(v.label());
        }
        villagePicker.setAdapter(spinnerAdapter(villageLabels));
        villagePicker.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                selectVillage(villages.get(position).id);
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });
        column.addView(villagePicker, UiKit.cardParams(this));

        column.addView(UiKit.section(this, "Already built"));
        builtColumn = new LinearLayout(this);
        builtColumn.setOrientation(LinearLayout.VERTICAL);
        column.addView(builtColumn, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));

        column.addView(UiKit.section(this, "Build or queue"));
        choicesColumn = new LinearLayout(this);
        choicesColumn.setOrientation(LinearLayout.VERTICAL);
        column.addView(choicesColumn, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));

        column.addView(UiKit.section(this, "Order"));
        LinearLayout autoCard = UiKit.card(this);
        autoSwitch = UiKit.accentSwitch(this, "Run this queue automatically", false);
        autoSwitch.setOnCheckedChangeListener(new android.widget.CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(android.widget.CompoundButton b, boolean checked) {
                if (selectedVillageId != null) {
                    getSharedPreferences(BuildOrderStore.PREFS, Context.MODE_PRIVATE).edit()
                            .putBoolean(autoKey(selectedVillageId), checked).apply();
                }
            }
        });
        autoCard.addView(autoSwitch, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        queueNotesView = UiKit.muted(this, "");
        autoCard.addView(queueNotesView);
        column.addView(autoCard, UiKit.cardParams(this));
        LinearLayout summaryCard = UiKit.card(this);
        summaryView = UiKit.body(this, "");
        summaryCard.addView(summaryView);
        column.addView(summaryCard, UiKit.cardParams(this));
        listColumn = new LinearLayout(this);
        listColumn.setOrientation(LinearLayout.VERTICAL);
        column.addView(listColumn, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));

        column.addView(UiKit.section(this, "Add"));
        LinearLayout addCard = UiKit.card(this);
        buildingPicker = new Spinner(this);
        buildingPicker.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                showOptionInfo(position);
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                optionInfoView.setText("");
            }
        });
        addCard.addView(buildingPicker);
        optionInfoView = UiKit.muted(this, "");
        addCard.addView(optionInfoView);

        levelInput = new EditText(this);
        levelInput.setHint("Target level");
        levelInput.setHintTextColor(UiKit.mutedColor(this));
        levelInput.setTextColor(UiKit.textColor(this));
        levelInput.setInputType(InputType.TYPE_CLASS_NUMBER);
        addCard.addView(levelInput);

        addCard.addView(UiKit.primaryButton(this, "Add to order", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                addSelected();
            }
        }));
        column.addView(addCard, UiKit.cardParams(this));

        selectVillage(villages.get(0).id);
        return UiKit.page(this, column);
    }

    private void addSelected() {
        int position = buildingPicker.getSelectedItemPosition();
        if (position < 0 || position >= options.size()) {
            return;
        }
        String levelText = levelInput.getText().toString().trim();
        if (levelText.length() == 0) {
            return;
        }
        int level;
        try {
            level = Integer.parseInt(levelText);
        } catch (NumberFormatException e) {
            return;
        }
        Option option = options.get(position);
        BuildingRules.Rule rule = rules.find(option.typeId);
        if (rule != null && (level < 1 || level > rule.maxLevel)) {
            Toast.makeText(this, "The game allows levels 1 to " + rule.maxLevel + " for this building",
                    Toast.LENGTH_SHORT).show();
            return;
        }
        PlayerBuildings.Village village = player.findVillage(selectedVillageId);
        int reached = village == null ? 0 : QueueEstimate.reachedLevel(village, option.typeId);
        for (BuildOrderStore.Entry e : order) {
            if (e.buildingTypeId == option.typeId && e.targetLevel > reached) {
                reached = e.targetLevel;
            }
        }
        if (level <= reached) {
            Toast.makeText(this, "Already at level " + reached + " (built, queued in the game, or in this order)",
                    Toast.LENGTH_SHORT).show();
            return;
        }
        order.add(new BuildOrderStore.Entry(option.typeId, level));
        persist();
        levelInput.setText("");
        draw();
    }

    private void selectVillage(String villageId) {
        selectedVillageId = villageId;
        SharedPreferences prefs = getSharedPreferences(BuildOrderStore.PREFS, Context.MODE_PRIVATE);
        order = BuildOrderStore.fromJson(prefs.getString(BuildOrderStore.key(villageId), null));
        if (autoSwitch != null) {
            autoSwitch.setChecked(prefs.getBoolean(autoKey(villageId), false));
            queueNotesView.setText(prefs.getString(notesKey(villageId), "The queue hasn't run yet."));
        }
        rebuildOptions();
        draw();
    }

    /** Works out what the picker may offer for the selected village, straight from the game's rules. */
    private void rebuildOptions() {
        options = new ArrayList<Option>();
        PlayerBuildings.Village village = player.findVillage(selectedVillageId);
        if (village != null) {
            List<Integer> seen = new ArrayList<Integer>();
            for (PlayerBuildings.Slot slot : village.slots) {
                if (slot.isEmpty() || seen.contains(slot.typeId)) {
                    continue;
                }
                BuildingRules.Rule rule = rules.find(slot.typeId);
                if (rule == null) {
                    continue;
                }
                seen.add(slot.typeId);
                BuildOptions.Verdict best = null;
                for (PlayerBuildings.Slot other : village.slots) {
                    if (other.typeId == slot.typeId) {
                        BuildOptions.Verdict verdict = BuildOptions.canUpgrade(rule, village, other);
                        if (best == null || verdict.answer == BuildOptions.Answer.YES) {
                            best = verdict;
                        }
                    }
                }
                if (best != null && best.answer != BuildOptions.Answer.NO) {
                    options.add(new Option(slot.typeId, false, best));
                }
            }
            for (BuildingRules.Rule rule : rules.rules) {
                if (rule.type >= 1 && rule.type <= 4) {
                    continue; // resource fields already exist; they can only be upgraded
                }
                BuildOptions.Verdict verdict = BuildOptions.canBuildNew(rule, player.tribeId, village);
                if (verdict.answer != BuildOptions.Answer.NO) {
                    options.add(new Option(rule.type, true, verdict));
                }
            }
        }
        List<String> labels = new ArrayList<String>();
        for (Option o : options) {
            labels.add(o.label());
        }
        buildingPicker.setAdapter(spinnerAdapter(labels));
        drawBuilt(village);
        drawChoices(village);
        levelInput.setEnabled(village != null);
        if (village == null) {
            optionInfoView.setText("This village's buildings haven't been read yet. Open the game and wait for the next check.");
        } else if (options.isEmpty()) {
            optionInfoView.setText("Nothing can be built or upgraded here right now, going by the game's rules.");
        }
    }

    private void showOptionInfo(int position) {
        if (position < 0 || position >= options.size()) {
            return;
        }
        Option option = options.get(position);
        PlayerBuildings.Village village = player.findVillage(selectedVillageId);
        int currentLevel = 0;
        if (village != null && !option.isNew) {
            currentLevel = village.levelOf(option.typeId);
        }
        optionInfoView.setText(nextLevelText(option.typeId, currentLevel + 1)
                + (option.verdict.answer == BuildOptions.Answer.UNKNOWN ? " " + option.verdict.reason + "." : ""));
    }

    /** The game's cost and effect for one level of one building, or "not known" where the table has none. */
    private String nextLevelText(int typeId, int level) {
        BuildingRules.Rule rule = rules.find(typeId);
        BuildingRules.Level data = rule == null ? null : rule.levelData(level);
        if (data == null) {
            return "Level " + level + ": the game's table has no cost for it. Build time: not known yet.";
        }
        return "Level " + level + " costs " + data.lumber + " wood, " + data.clay + " clay, " + data.iron
                + " iron, " + data.crop + " crop. Effect value " + data.effectValue + ", population +"
                + data.producedPopulation + ". Build time: not known yet.";
    }

    private void drawBuilt(PlayerBuildings.Village village) {
        builtColumn.removeAllViews();
        if (village == null) {
            LinearLayout empty = UiKit.card(this);
            empty.addView(UiKit.body(this, "This village's buildings haven't been read yet."));
            builtColumn.addView(empty, UiKit.cardParams(this));
            return;
        }
        LinearLayout card = UiKit.card(this);
        card.setOrientation(LinearLayout.VERTICAL);
        int shown = 0;
        for (PlayerBuildings.Slot slot : village.slots) {
            if (slot.isEmpty()) {
                continue;
            }
            int queued = village.queuedLevel(slot.slotId);
            String line = GameData.buildingName(slot.typeId) + " (slot " + slot.slotId + ") level " + slot.level
                    + (queued > slot.level ? ", upgrading to " + queued : "") + ". "
                    + nextLevelText(slot.typeId, Math.max(slot.level, queued) + 1);
            card.addView(UiKit.body(this, line));
            shown++;
        }
        if (shown == 0) {
            card.addView(UiKit.body(this, "No buildings found."));
        }
        builtColumn.addView(card, UiKit.cardParams(this));
    }

    /** One card per next level the game allows right now, with Build now and Queue. */
    private void drawChoices(PlayerBuildings.Village village) {
        choicesColumn.removeAllViews();
        if (village == null) {
            return;
        }
        int shown = 0;
        for (final BuildChoices.Row row : BuildChoices.list(rules, player.tribeId, village)) {
            if (row.verdict.answer == BuildOptions.Answer.NO) {
                continue;
            }
            LinearLayout card = UiKit.card(this);
            card.setOrientation(LinearLayout.VERTICAL);
            String where = row.slotId > 0 ? " (slot " + row.slotId + ") " + row.fromLevel + " to " + row.toLevel
                    : " (new)";
            card.addView(UiKit.body(this, GameData.buildingName(row.typeId) + where));
            card.addView(UiKit.muted(this, nextLevelText(row.typeId, row.toLevel)
                    + (row.verdict.answer == BuildOptions.Answer.UNKNOWN ? " " + row.verdict.reason + "." : "")));
            LinearLayout buttons = new LinearLayout(this);
            buttons.setOrientation(LinearLayout.HORIZONTAL);
            if (row.verdict.answer == BuildOptions.Answer.YES) {
                buttons.addView(UiKit.primaryButton(this, "Build now", new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        confirmBuild(row);
                    }
                }));
            }
            // A queue entry is "type to level" and works on the highest slot of that type, so Queue is offered
            // only where it does exactly what the card says.
            BuildChoices.Row target = BuildQueueStep.rowFor(rules, player.tribeId, village, row.typeId);
            boolean queueFits = row.slotId > 0 ? target != null && target.slotId == row.slotId
                    : village.countOf(row.typeId) == 0;
            if (queueFits) {
                buttons.addView(UiKit.primaryButton(this, "Queue", new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        queueRow(row);
                    }
                }));
            } else {
                card.addView(UiKit.muted(this, "Queue works on the highest building of this kind; use Build now here."));
            }
            card.addView(buttons);
            choicesColumn.addView(card, UiKit.cardParams(this));
            shown++;
        }
        if (shown == 0) {
            LinearLayout empty = UiKit.card(this);
            empty.addView(UiKit.body(this, "Nothing can be built or upgraded here right now, going by the game's rules."));
            choicesColumn.addView(empty, UiKit.cardParams(this));
        }
    }

    private void queueRow(BuildChoices.Row row) {
        for (BuildOrderStore.Entry e : order) {
            if (e.buildingTypeId == row.typeId && e.targetLevel >= row.toLevel) {
                Toast.makeText(this, "Already in the order", Toast.LENGTH_SHORT).show();
                return;
            }
        }
        order.add(new BuildOrderStore.Entry(row.typeId, row.toLevel));
        persist();
        draw();
        Toast.makeText(this, "Queued " + GameData.buildingName(row.typeId) + " " + row.toLevel, Toast.LENGTH_SHORT).show();
    }

    private void confirmBuild(final BuildChoices.Row row) {
        BuildingRules.Level cost = row.next;
        String costText = cost == null ? "cost not known"
                : cost.lumber + " wood, " + cost.clay + " clay, " + cost.iron + " iron, " + cost.crop + " crop";
        final String label = GameData.buildingName(row.typeId) + " to " + row.toLevel;
        long nextAttack = getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE)
                .getLong(NotifierWorker.KEY_NEXT_ATTACK_AT, 0);
        long minutes = (nextAttack - System.currentTimeMillis()) / 60_000L;
        String warning = nextAttack > System.currentTimeMillis() && minutes < ActionSender.settings(this).attackPauseMinutes
                ? " Warning: an attack lands in about " + Math.max(0, minutes) + " min; resources spent now can't be looted."
                : "";
        new android.app.AlertDialog.Builder(this)
                .setTitle("Build now?")
                .setMessage(label + ". Costs " + costText + ". This starts it in the game." + warning)
                .setPositiveButton("Build", new android.content.DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(android.content.DialogInterface d, int w) {
                        buildNow(row, label);
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private void buildNow(final BuildChoices.Row row, final String label) {
        final String villageId = selectedVillageId;
        final PlayerBuildings.Village village = player.findVillage(villageId);
        final int slot = row.slotId > 0 ? row.slotId
                : (village == null ? 0 : BuildChoices.slotForNew(row.typeId, village));
        if (slot == 0) {
            Toast.makeText(this, "No free slot for it", Toast.LENGTH_SHORT).show();
            return;
        }
        new Thread(new Runnable() {
            @Override
            public void run() {
                String text;
                try {
                    ActionClient.Result r = ActionSender.sendFromScreen(BuildOrderActivity.this,
                            GameActions.build(villageId, slot, row.typeId, label));
                    text = label + ": " + r.describe();
                } catch (Exception e) {
                    text = label + ": failed (" + e.getClass().getSimpleName() + ")";
                }
                final String shown = text;
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(BuildOrderActivity.this, shown, Toast.LENGTH_LONG).show();
                    }
                });
            }
        }).start();
    }

    private void persist() {
        getSharedPreferences(BuildOrderStore.PREFS, Context.MODE_PRIVATE).edit()
                .putString(BuildOrderStore.key(selectedVillageId), BuildOrderStore.toJson(order))
                .apply();
    }

    private void updateSummary() {
        QueueEstimate.Result result = QueueEstimate.totalCost(rules, player.findVillage(selectedVillageId), order);
        String cost = result.totalCost.lumber + " wood, " + result.totalCost.clay + " clay, "
                + result.totalCost.iron + " iron, " + result.totalCost.crop + " crop";
        String note = result.unknownCount == 0 ? ""
                : " " + result.unknownCount + " item(s) have no cost in the game's table and are not counted.";
        if (result.alreadyReachedCount > 0) {
            note += " " + result.alreadyReachedCount + " item(s) are already reached and cost nothing.";
        }
        VillageResources.Entry stock = VillageResources.find(resources, selectedVillageId);
        String stockNote = stock == null ? " Current stock isn't known yet." : "";
        summaryView.setText("Total: " + cost + ". Time: not known yet." + note + stockNote);
    }

    private void draw() {
        updateSummary();
        listColumn.removeAllViews();
        if (order.isEmpty()) {
            LinearLayout empty = UiKit.card(this);
            empty.addView(UiKit.body(this, "Nothing queued yet for this village."));
            listColumn.addView(empty, UiKit.cardParams(this));
            return;
        }
        for (int i = 0; i < order.size(); i++) {
            listColumn.addView(orderRow(i), UiKit.cardParams(this));
        }
    }

    private View orderRow(final int index) {
        LinearLayout row = UiKit.card(this);
        row.setOrientation(LinearLayout.VERTICAL);
        TextView label = UiKit.body(this, (index + 1) + ". " + order.get(index).label());
        row.addView(label);

        LinearLayout controls = new LinearLayout(this);
        controls.setOrientation(LinearLayout.HORIZONTAL);
        controls.setPadding(0, UiKit.dp(this, 8), 0, 0);
        controls.addView(smallButton("↑", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (index > 0) {
                    Collections.swap(order, index, index - 1);
                    persist();
                    draw();
                }
            }
        }));
        controls.addView(smallButton("↓", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (index < order.size() - 1) {
                    Collections.swap(order, index, index + 1);
                    persist();
                    draw();
                }
            }
        }));
        controls.addView(smallButton("✕", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                order.remove(index);
                persist();
                draw();
            }
        }));
        row.addView(controls);
        return row;
    }

    private android.widget.Button smallButton(String label, View.OnClickListener onClick) {
        android.widget.Button button = new android.widget.Button(this);
        button.setText(label);
        button.setOnClickListener(onClick);
        return button;
    }

    /** A spinner adapter whose text uses the app's own colours instead of the system default, which reads
     * too low-contrast against the dark page background. */
    private ArrayAdapter<String> spinnerAdapter(List<String> items) {
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, items) {
            @Override
            public View getView(int position, View convertView, android.view.ViewGroup parent) {
                TextView view = (TextView) super.getView(position, convertView, parent);
                view.setTextColor(UiKit.textColor(BuildOrderActivity.this));
                return view;
            }

            @Override
            public View getDropDownView(int position, View convertView, android.view.ViewGroup parent) {
                TextView view = (TextView) super.getDropDownView(position, convertView, parent);
                view.setTextColor(UiKit.textColor(BuildOrderActivity.this));
                view.setBackgroundColor(UiKit.surface(BuildOrderActivity.this));
                return view;
            }
        };
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        return adapter;
    }
}
