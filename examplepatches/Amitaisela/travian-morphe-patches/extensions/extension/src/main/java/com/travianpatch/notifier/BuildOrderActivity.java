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

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Lets the user set, per village, an ordered list of "upgrade this building to this level" entries.
 * This screen only edits the list; nothing here fires a build. A later automation step reads what is
 * saved here.
 */
public class BuildOrderActivity extends Activity {

    private List<VillageList.Entry> villages = new ArrayList<VillageList.Entry>();
    private List<BuildOrderStore.Entry> order = new ArrayList<BuildOrderStore.Entry>();
    private String selectedVillageId;
    private LinearLayout listColumn;
    private Spinner buildingPicker;
    private EditText levelInput;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        villages = VillageList.fromJson(
                getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE)
                        .getString(NotifierWorker.KEY_VILLAGES, null));
        setContentView(buildContent());
    }

    private View buildContent() {
        LinearLayout column = UiKit.column(this);
        column.addView(UiKit.title(this, "Build order"));
        column.addView(UiKit.muted(this, "Set what each village builds next. Nothing here builds anything by "
                + "itself yet."));

        if (villages.isEmpty()) {
            LinearLayout empty = UiKit.card(this);
            empty.addView(UiKit.body(this, "No villages seen yet. Open Travian Tools again after the next check."));
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

        column.addView(UiKit.section(this, "Order"));
        listColumn = new LinearLayout(this);
        listColumn.setOrientation(LinearLayout.VERTICAL);
        column.addView(listColumn, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));

        column.addView(UiKit.section(this, "Add"));
        LinearLayout addCard = UiKit.card(this);
        buildingPicker = new Spinner(this);
        List<String> buildingLabels = new ArrayList<String>();
        final List<Integer> buildingIds = new ArrayList<Integer>();
        for (int id = 1; id <= 43; id++) {
            String name = GameData.buildingName(id);
            if (!name.startsWith("Building #")) {
                buildingLabels.add(name);
                buildingIds.add(id);
            }
        }
        buildingPicker.setAdapter(spinnerAdapter(buildingLabels));
        addCard.addView(buildingPicker);

        levelInput = new EditText(this);
        levelInput.setHint("Target level");
        levelInput.setHintTextColor(UiKit.mutedColor(this));
        levelInput.setTextColor(UiKit.textColor(this));
        levelInput.setInputType(InputType.TYPE_CLASS_NUMBER);
        addCard.addView(levelInput);

        addCard.addView(UiKit.primaryButton(this, "Add to order", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int position = buildingPicker.getSelectedItemPosition();
                if (position < 0 || position >= buildingIds.size()) {
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
                order.add(new BuildOrderStore.Entry(buildingIds.get(position), level));
                persist();
                levelInput.setText("");
                draw();
            }
        }));
        column.addView(addCard, UiKit.cardParams(this));

        selectVillage(villages.get(0).id);
        return UiKit.page(this, column);
    }

    private void selectVillage(String villageId) {
        selectedVillageId = villageId;
        SharedPreferences prefs = getSharedPreferences(BuildOrderStore.PREFS, Context.MODE_PRIVATE);
        order = BuildOrderStore.fromJson(prefs.getString(BuildOrderStore.key(villageId), null));
        draw();
    }

    private void persist() {
        getSharedPreferences(BuildOrderStore.PREFS, Context.MODE_PRIVATE).edit()
                .putString(BuildOrderStore.key(selectedVillageId), BuildOrderStore.toJson(order))
                .apply();
    }

    private void draw() {
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
