package dev.abotmaker.ramblerenhancements;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Typeface;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * Searchable installed-apps picker and rule editor dialogs for per-app Rambler custom instructions.
 */
final class RamblerAppRuleDialogs {
    interface PackagesConsumer {
        void accept(List<String> selectedPackages);
    }

    interface RuleConsumer {
        void accept(RamblerCustomInstructionRules.Rule rule);
    }

    private RamblerAppRuleDialogs() {
    }

    static void showAppPickerDialog(
            Activity activity,
            String title,
            String subtitle,
            Collection<String> initialPackages,
            List<RamblerCustomInstructionRules.AppEntry> installedApps,
            PackagesConsumer onConfirm) {
        RamblerWaveformDialogs.Palette pal = RamblerWaveformDialogs.palette(activity);
        LinkedHashSet<String> selected = new LinkedHashSet<String>();
        if (initialPackages != null) {
            for (String pkg : initialPackages) {
                if (pkg != null && !pkg.trim().isEmpty()) {
                    selected.add(pkg.trim());
                }
            }
        }

        // Include any already-selected packages even if not in launcher list (e.g. manual entry).
        List<RamblerCustomInstructionRules.AppEntry> allEntries =
                new ArrayList<RamblerCustomInstructionRules.AppEntry>();
        Set<String> knownPackages = new LinkedHashSet<String>();
        if (installedApps != null) {
            for (RamblerCustomInstructionRules.AppEntry entry : installedApps) {
                allEntries.add(entry);
                knownPackages.add(entry.packageName);
            }
        }
        for (String pkg : selected) {
            if (!knownPackages.contains(pkg)) {
                allEntries.add(new RamblerCustomInstructionRules.AppEntry(pkg, pkg));
                knownPackages.add(pkg);
            }
        }

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(activity, 18), dp(activity, 10), dp(activity, 18), dp(activity, 4));

        if (subtitle != null && !subtitle.isEmpty()) {
            TextView sub = new TextView(activity);
            sub.setText(subtitle);
            sub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            sub.setTextColor(pal.secondary);
            LinearLayout.LayoutParams subParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            subParams.bottomMargin = dp(activity, 8);
            root.addView(sub, subParams);
        }

        EditText searchInput = new EditText(activity);
        searchInput.setHint("Search apps or package name...");
        searchInput.setSingleLine(true);
        searchInput.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        root.addView(searchInput, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView countLabel = new TextView(activity);
        countLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        countLabel.setTypeface(Typeface.DEFAULT_BOLD);
        countLabel.setTextColor(pal.accent);
        LinearLayout.LayoutParams countParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        countParams.topMargin = dp(activity, 6);
        countParams.bottomMargin = dp(activity, 6);
        root.addView(countLabel, countParams);

        ScrollView scroll = new ScrollView(activity);
        LinearLayout listContainer = new LinearLayout(activity);
        listContainer.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(listContainer, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        LinearLayout.LayoutParams scrollParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(activity, 320));
        root.addView(scroll, scrollParams);

        Runnable rebuildList = () -> {
            String query = searchInput.getText() == null
                    ? ""
                    : searchInput.getText().toString().trim().toLowerCase(Locale.ROOT);
            countLabel.setText(selected.size() + " app(s) selected");
            listContainer.removeAllViews();

            List<RamblerCustomInstructionRules.AppEntry> filtered =
                    new ArrayList<RamblerCustomInstructionRules.AppEntry>();
            for (RamblerCustomInstructionRules.AppEntry entry : allEntries) {
                if (query.isEmpty()
                        || entry.label.toLowerCase(Locale.ROOT).contains(query)
                        || entry.packageName.toLowerCase(Locale.ROOT).contains(query)) {
                    filtered.add(entry);
                }
            }
            Collections.sort(filtered, (a, b) -> {
                boolean aSel = selected.contains(a.packageName);
                boolean bSel = selected.contains(b.packageName);
                if (aSel != bSel) {
                    return aSel ? -1 : 1;
                }
                return a.label.compareToIgnoreCase(b.label);
            });

            if (filtered.isEmpty()) {
                TextView empty = new TextView(activity);
                empty.setText(allEntries.isEmpty()
                        ? "No launcher apps returned. Tap \"+ Package\" to add a package name."
                        : "No matching apps.");
                empty.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
                empty.setTextColor(pal.secondary);
                empty.setPadding(dp(activity, 4), dp(activity, 12), dp(activity, 4), dp(activity, 12));
                listContainer.addView(empty);
                return;
            }

            for (RamblerCustomInstructionRules.AppEntry entry : filtered) {
                LinearLayout row = new LinearLayout(activity);
                row.setOrientation(LinearLayout.HORIZONTAL);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setPadding(dp(activity, 4), dp(activity, 8), dp(activity, 4), dp(activity, 8));
                row.setClickable(true);
                row.setFocusable(true);

                CheckBox checkBox = new CheckBox(activity);
                checkBox.setChecked(selected.contains(entry.packageName));
                checkBox.setClickable(false);
                checkBox.setFocusable(false);
                row.addView(checkBox);

                LinearLayout textCol = new LinearLayout(activity);
                textCol.setOrientation(LinearLayout.VERTICAL);
                textCol.setPadding(dp(activity, 8), 0, 0, 0);

                TextView labelView = new TextView(activity);
                labelView.setText(entry.label);
                labelView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
                labelView.setTypeface(Typeface.DEFAULT_BOLD);
                labelView.setTextColor(pal.primary);
                textCol.addView(labelView);

                TextView pkgView = new TextView(activity);
                pkgView.setText(entry.packageName);
                pkgView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
                pkgView.setTypeface(Typeface.MONOSPACE);
                pkgView.setTextColor(pal.secondary);
                textCol.addView(pkgView);

                row.addView(textCol, new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));
                row.setOnClickListener(v -> {
                    boolean nowChecked = !selected.contains(entry.packageName);
                    if (nowChecked) {
                        selected.add(entry.packageName);
                    } else {
                        selected.remove(entry.packageName);
                    }
                    checkBox.setChecked(nowChecked);
                    countLabel.setText(selected.size() + " app(s) selected");
                });
                listContainer.addView(row, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            }
        };

        searchInput.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                rebuildList.run();
            }
        });
        rebuildList.run();

        AlertDialog dialog = new AlertDialog.Builder(activity)
                .setTitle(title)
                .setView(root)
                .setPositiveButton("Save", (ignored, which) ->
                        onConfirm.accept(new ArrayList<String>(selected)))
                .setNegativeButton("Cancel", null)
                .setNeutralButton("+ Package", null)
                .create();

        dialog.setOnShowListener(d -> {
            View neutralBtn = dialog.getButton(AlertDialog.BUTTON_NEUTRAL);
            if (neutralBtn != null) {
                neutralBtn.setOnClickListener(v -> showManualPackageDialog(activity, pkg -> {
                    selected.add(pkg);
                    if (!knownPackages.contains(pkg)) {
                        allEntries.add(new RamblerCustomInstructionRules.AppEntry(pkg, pkg));
                        knownPackages.add(pkg);
                    }
                    rebuildList.run();
                }));
            }
        });
        dialog.show();
    }

    static void showRuleEditorDialog(
            Activity activity,
            RamblerCustomInstructionRules.Rule existing,
            String prefillName,
            String prefillInstruction,
            List<RamblerCustomInstructionRules.AppEntry> installedApps,
            Map<String, String> labelMap,
            RuleConsumer onSave,
            Runnable onDelete) {
        RamblerWaveformDialogs.Palette pal = RamblerWaveformDialogs.palette(activity);
        String ruleId = existing != null ? existing.id : ("rule_" + System.currentTimeMillis());
        LinkedHashSet<String> chosenPackages = new LinkedHashSet<String>(
                existing != null ? existing.packages : Collections.<String>emptyList());

        ScrollView scroll = new ScrollView(activity);
        LinearLayout container = new LinearLayout(activity);
        container.setOrientation(LinearLayout.VERTICAL);
        container.setPadding(dp(activity, 20), dp(activity, 12), dp(activity, 20), dp(activity, 6));
        scroll.addView(container, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView nameLabel = makeFieldLabel(activity, "Rule name", pal);
        container.addView(nameLabel);
        EditText nameInput = new EditText(activity);
        nameInput.setHint("e.g. Casual lowercase");
        nameInput.setSingleLine(true);
        nameInput.setText(existing != null
                ? existing.name
                : (prefillName == null ? "" : prefillName));
        container.addView(nameInput, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView appsLabel = makeFieldLabel(activity, "Apps for this rule", pal);
        LinearLayout.LayoutParams appsLabelParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        appsLabelParams.topMargin = dp(activity, 12);
        container.addView(appsLabel, appsLabelParams);

        TextView appsPickerRow = new TextView(activity);
        appsPickerRow.setPadding(dp(activity, 12), dp(activity, 11), dp(activity, 12), dp(activity, 11));
        appsPickerRow.setBackground(RamblerWaveformDialogs.tileBackground(activity, false));
        appsPickerRow.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        appsPickerRow.setTextColor(pal.primary);
        appsPickerRow.setClickable(true);
        appsPickerRow.setFocusable(true);
        Runnable updateAppsLabel = () -> {
            if (chosenPackages.isEmpty()) {
                appsPickerRow.setText("Tap to choose apps (0 selected)");
                appsPickerRow.setTextColor(pal.accent);
            } else {
                appsPickerRow.setText(chosenPackages.size() + " app(s): "
                        + RamblerCustomInstructionRules.formatPackageList(
                        chosenPackages, labelMap, 5));
                appsPickerRow.setTextColor(pal.primary);
            }
        };
        updateAppsLabel.run();
        appsPickerRow.setOnClickListener(v -> showAppPickerDialog(
                activity,
                "Choose apps",
                "This custom instruction will apply whenever you dictate in any checked app.",
                chosenPackages,
                installedApps,
                picked -> {
                    chosenPackages.clear();
                    chosenPackages.addAll(picked);
                    updateAppsLabel.run();
                }));
        LinearLayout.LayoutParams appsRowParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        appsRowParams.topMargin = dp(activity, 4);
        container.addView(appsPickerRow, appsRowParams);

        TextView instrLabel = makeFieldLabel(activity, "Custom instruction (optional if using behavior overrides)", pal);
        LinearLayout.LayoutParams instrLabelParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        instrLabelParams.topMargin = dp(activity, 12);
        container.addView(instrLabel, instrLabelParams);

        EditText instrInput = new EditText(activity);
        instrInput.setHint("Style rules applied in the selected apps...");
        instrInput.setInputType(InputType.TYPE_CLASS_TEXT
                | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);
        instrInput.setMinLines(3);
        instrInput.setMaxLines(8);
        instrInput.setText(existing != null
                ? existing.instruction
                : (prefillInstruction == null ? "" : prefillInstruction));
        container.addView(instrInput, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        CheckBox combineBox = new CheckBox(activity);
        combineBox.setText("Combine with Default instruction (otherwise replaces Default)");
        combineBox.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        combineBox.setTextColor(pal.secondary);
        combineBox.setChecked(existing != null && existing.combineWithDefault);
        LinearLayout.LayoutParams combineParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        combineParams.topMargin = dp(activity, 8);
        container.addView(combineBox, combineParams);

        TextView overridesHeader = makeFieldLabel(activity, "Per-app behavior overrides", pal);
        LinearLayout.LayoutParams overridesHeaderParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        overridesHeaderParams.topMargin = dp(activity, 14);
        overridesHeaderParams.bottomMargin = dp(activity, 4);
        container.addView(overridesHeader, overridesHeaderParams);

        final int[] appendOverride = {existing != null
                ? existing.appendOnlyOverride
                : RamblerCustomInstructionRules.OVERRIDE_INHERIT};
        final int[] appContextOverride = {existing != null
                ? existing.appContextOverride
                : RamblerCustomInstructionRules.OVERRIDE_INHERIT};
        final int[] stripPeriodOverride = {existing != null
                ? existing.stripTrailingPeriodOverride
                : RamblerCustomInstructionRules.OVERRIDE_INHERIT};

        container.addView(makeTriStateRow(
                activity,
                "Append-only dictation",
                appendOverride,
                pal));
        container.addView(makeTriStateRow(
                activity,
                "App context",
                appContextOverride,
                pal));
        container.addView(makeTriStateRow(
                activity,
                "Strip trailing period",
                stripPeriodOverride,
                pal));

        AlertDialog.Builder builder = new AlertDialog.Builder(activity)
                .setTitle(existing == null ? "Add app rule" : "Edit app rule")
                .setView(scroll)
                .setPositiveButton("Save", null)
                .setNegativeButton("Cancel", null);
        if (existing != null && onDelete != null) {
            builder.setNeutralButton("Delete", (ignored, which) -> onDelete.run());
        }
        AlertDialog dialog = builder.create();
        dialog.setOnShowListener(d -> {
            View saveBtn = dialog.getButton(AlertDialog.BUTTON_POSITIVE);
            if (saveBtn != null) {
                saveBtn.setOnClickListener(v -> {
                    String instr = instrInput.getText() == null
                            ? ""
                            : instrInput.getText().toString().trim();
                    boolean hasOverride =
                            appendOverride[0] != RamblerCustomInstructionRules.OVERRIDE_INHERIT
                                    || appContextOverride[0] != RamblerCustomInstructionRules.OVERRIDE_INHERIT
                                    || stripPeriodOverride[0] != RamblerCustomInstructionRules.OVERRIDE_INHERIT;
                    if (instr.isEmpty() && !hasOverride) {
                        Toast.makeText(
                                        activity,
                                        "Enter a custom instruction or set a behavior override.",
                                        Toast.LENGTH_SHORT)
                                .show();
                        return;
                    }
                    if (chosenPackages.isEmpty()) {
                        Toast.makeText(activity, "Select at least one app.", Toast.LENGTH_SHORT)
                                .show();
                        return;
                    }
                    String name = nameInput.getText() == null
                            ? ""
                            : nameInput.getText().toString().trim();
                    if (name.isEmpty()) {
                        name = "Selected apps";
                    }
                    onSave.accept(new RamblerCustomInstructionRules.Rule(
                            ruleId,
                            name,
                            instr,
                            chosenPackages,
                            combineBox.isChecked(),
                            appendOverride[0],
                            appContextOverride[0],
                            stripPeriodOverride[0]));
                    dialog.dismiss();
                });
            }
        });
        dialog.show();
    }

    private static View makeTriStateRow(
            Activity activity,
            String label,
            int[] stateHolder,
            RamblerWaveformDialogs.Palette pal) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(activity, 12), dp(activity, 9), dp(activity, 12), dp(activity, 9));
        row.setBackground(RamblerWaveformDialogs.tileBackground(activity, false));
        row.setClickable(true);
        row.setFocusable(true);

        TextView titleView = new TextView(activity);
        titleView.setText(label);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        titleView.setTextColor(pal.primary);
        row.addView(titleView, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        TextView valueView = new TextView(activity);
        valueView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        valueView.setTypeface(Typeface.DEFAULT_BOLD);
        Runnable syncValue = () -> {
            valueView.setText(RamblerCustomInstructionRules.formatOverrideLabel(stateHolder[0]));
            valueView.setTextColor(
                    stateHolder[0] == RamblerCustomInstructionRules.OVERRIDE_INHERIT
                            ? pal.secondary
                            : pal.accent);
        };
        syncValue.run();
        row.addView(valueView);

        row.setOnClickListener(v -> {
            stateHolder[0] = (stateHolder[0] + 1) % 3;
            syncValue.run();
        });

        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = dp(activity, 5);
        row.setLayoutParams(params);
        return row;
    }

    private static void showManualPackageDialog(
            Activity activity, RamblerWaveformDialogs.SelectionConsumer onAdd) {
        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(activity, 20), dp(activity, 10), dp(activity, 20), dp(activity, 4));

        EditText input = new EditText(activity);
        input.setHint("com.example.app");
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        box.addView(input, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        new AlertDialog.Builder(activity)
                .setTitle("Add package name")
                .setView(box)
                .setPositiveButton("Add", (ignored, which) -> {
                    String pkg = input.getText() == null ? "" : input.getText().toString().trim();
                    if (!pkg.isEmpty()) {
                        onAdd.accept(pkg);
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private static TextView makeFieldLabel(
            Context context, String text, RamblerWaveformDialogs.Palette pal) {
        TextView view = new TextView(context);
        view.setText(text);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        view.setTypeface(Typeface.DEFAULT_BOLD);
        view.setTextColor(pal.accent);
        return view;
    }

    private static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics()));
    }
}
