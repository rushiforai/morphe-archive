/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.extension.tiktok.settings.preference;

import app.morphe.extension.tiktok.settings.L10n;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.preference.Preference;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import androidx.annotation.NonNull;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.spoof.sim.SimPreset;
import app.morphe.extension.tiktok.spoof.sim.SimPresets;

@SuppressWarnings("deprecation")
public class SimPresetPreference extends Preference {
    private final List<SimPreset> visiblePresets = new ArrayList<>();

    /**
     * The status line and the explanation under an empty list, held for the length of one open
     * dialog. A no-match used to be a disabled row inside the list itself, which left the list
     * reporting one item and made the explanation look like a result that could not be picked.
     */
    private TextView resultCount;
    private TextView emptyState;
    private ListView presetList;
    private final InputTextPreference countryIsoPreference;
    private final InputTextPreference mccMncPreference;
    private final InputTextPreference operatorNamePreference;

    public SimPresetPreference(Context context,
                               InputTextPreference countryIsoPreference,
                               InputTextPreference mccMncPreference,
                               InputTextPreference operatorNamePreference) {
        super(context);
        this.countryIsoPreference = countryIsoPreference;
        this.mccMncPreference = mccMncPreference;
        this.operatorNamePreference = operatorNamePreference;
        setTitle("SIM country preset");
        refreshSummary();
    }

    public void refreshSummary() {
        refreshSummary(
                Settings.SIM_SPOOF_ISO.get(),
                Settings.SIMSPOOF_MCCMNC.get(),
                Settings.SIMSPOOF_OP_NAME.get()
        );
    }

    public void refreshSummary(String iso, String mccMnc, String operatorName) {
        SimPreset selectedPreset = SimPresets.findSelected(iso, mccMnc, operatorName);
        if (selectedPreset != null) {
            setSummary(selectedPreset.country + ", " + selectedPreset.operatorName + " ("
                    + selectedPreset.mccMnc + ")");
        } else if (SimPresets.hasEmptyCurrentValues(iso, mccMnc, operatorName)) {
            setSummary("No preset selected");
        } else {
            setSummary("Custom SIM details");
        }
    }

    @Override
    protected void onClick() {
        showPresetDialog();
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);

        app.morphe.extension.tiktok.Utils.setTitleAndSummaryColor(view);
    }

    private void showPresetDialog() {
        Context context = getContext();
        LinearLayout dialogView = new LinearLayout(context);
        dialogView.setOrientation(LinearLayout.VERTICAL);
        dialogView.setBackground(createDialogBackground());
        int padding = dpToPx(20);
        dialogView.setPadding(padding, padding, padding, padding);

        TextView title = new TextView(context);
        title.setText(L10n.t(getContext(), "SIM country preset"));
        title.setTextColor(getTitleTextColor());
        title.setTextSize(20);
        title.setTypeface(title.getTypeface(), android.graphics.Typeface.BOLD);
        SettingsUi.markDialogHeading(title);
        dialogView.addView(title, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        TextView helper = new TextView(context);
        helper.setText(L10n.t(getContext(), "Choose a preset to fill the SIM details."));
        helper.setTextColor(getSummaryTextColor());
        LinearLayout.LayoutParams helperParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        helperParams.setMargins(0, dpToPx(18), 0, dpToPx(8));
        dialogView.addView(helper, helperParams);

        EditText search = new EditText(context);
        search.setSingleLine(true);
        search.setHint(L10n.t(getContext(), "Search countries or operators"));
        search.setTextColor(getTitleTextColor());
        search.setHintTextColor(getSummaryTextColor());
        SettingsUi.styleEditText(search);
        dialogView.addView(search, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        resultCount = SettingsUi.resultCount(context, "sim_preset_result_count");
        LinearLayout.LayoutParams resultParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        resultParams.setMargins(0, dpToPx(10), 0, 0);
        dialogView.addView(resultCount, resultParams);

        ListView listView = new ListView(context);
        listView.setBackgroundColor(Color.TRANSPARENT);
        int listPadding = Math.max(1, dpToPx(1));
        listView.setPadding(listPadding, listPadding, listPadding, listPadding);
        listView.setClipToPadding(false);
        listView.setDivider(new ColorDrawable(getDialogDividerColor()));
        listView.setDividerHeight(Math.max(1, dpToPx(1)));
        listView.setFooterDividersEnabled(true);
        PresetAdapter adapter = new PresetAdapter(context, visiblePresets);
        listView.setAdapter(adapter);
        listView.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
        presetList = listView;

        FrameLayout listContainer = new FrameLayout(context);
        listContainer.setBackground(createListBackground());
        int containerInset = Math.max(1, dpToPx(1));
        listContainer.setPadding(containerInset, containerInset, containerInset, containerInset);
        LinearLayout.LayoutParams listParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                SettingsUi.dialogListHeight(context, 320)
        );
        listParams.setMargins(0, dpToPx(12), 0, dpToPx(14));
        listContainer.addView(listView, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        ));

        // Over the empty list rather than inside it. Nothing here is selectable, so it takes no
        // focus and is not a second live region: the count above already announces the change,
        // and two of them would say the same thing twice.
        emptyState = SettingsUi.text(context, "", 14, getSummaryTextColor(),
                android.graphics.Typeface.NORMAL);
        emptyState.setGravity(Gravity.CENTER);
        emptyState.setTag("sim_preset_empty_state");
        emptyState.setFocusable(false);
        emptyState.setVisibility(View.GONE);
        int emptyPadding = dpToPx(16);
        emptyState.setPadding(emptyPadding, emptyPadding, emptyPadding, emptyPadding);
        listContainer.addView(emptyState, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER
        ));
        dialogView.addView(listContainer, listParams);

        LinearLayout actions = new LinearLayout(context);
        actions.setGravity(Gravity.END | Gravity.CENTER_VERTICAL);
        // The way back to no preset. Picking a row applied it and closed the dialog, and there
        // was nothing here that undid that short of retyping three fields.
        TextView clearButton = new TextView(context);
        clearButton.setText(L10n.t(context, "Clear preset"));
        clearButton.setTextSize(16);
        SettingsUi.styleTextAction(clearButton, false);
        clearButton.setTag("sim_preset_clear");
        clearButton.setPadding(dpToPx(12), dpToPx(8), dpToPx(12), dpToPx(6));
        actions.addView(clearButton, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));
        TextView cancelButton = new TextView(context);
        cancelButton.setText(android.R.string.cancel);
        cancelButton.setTextSize(16);
        SettingsUi.styleTextAction(cancelButton, false);
        int buttonHorizontalPadding = dpToPx(12);
        cancelButton.setPadding(buttonHorizontalPadding, dpToPx(8), buttonHorizontalPadding, dpToPx(6));
        actions.addView(cancelButton, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));
        dialogView.addView(actions, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        AlertDialog dialog = new AlertDialog.Builder(context)
                .setView(dialogView)
                .create();
        cancelButton.setOnClickListener(view -> dialog.dismiss());
        clearButton.setOnClickListener(view -> {
            clearPreset();
            dialog.dismiss();
        });

        listView.setOnItemClickListener((parent, view, position, id) -> {
            SimPreset preset = visiblePresets.get(position);
            if (preset != null && savePreset(preset)) {
                dialog.dismiss();
            }
        });

        search.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                filterPresets(s.toString(), adapter);
            }

            @Override
            public void afterTextChanged(Editable s) {
            }
        });

        filterPresets("", adapter);
        dialog.show();
        SettingsUi.styleDialog(dialog);
    }

    private boolean savePreset(SimPreset preset) {
        if (!preset.isValid()) {
            Logger.printException(() -> "Invalid SIM preset refused: "
                    + preset.country + " / " + preset.operatorName + " / "
                    + preset.mccMnc + " / " + preset.iso);
            app.morphe.extension.shared.Utils.showToastLong(
                app.morphe.extension.tiktok.settings.L10n.t("Invalid SIM preset"));
            return false;
        }

        countryIsoPreference.setText(preset.iso);
        mccMncPreference.setText(preset.mccMnc);
        operatorNamePreference.setText(preset.operatorName);
        refreshSummary(preset.iso, preset.mccMnc, preset.operatorName);

        Logger.printDebug(() -> "SIM preset selected: " + preset.country + " / "
                + preset.operatorName + " / " + preset.mccMnc + " / " + preset.iso);

        if (Settings.SIM_SPOOF.get()) {
            app.morphe.extension.shared.Utils.showToastLong(
                    app.morphe.extension.tiktok.settings.L10n.t("SIM preset saved. Restart TikTok to apply this."));
        } else {
            app.morphe.extension.shared.Utils.showToastShort(app.morphe.extension.tiktok.settings.L10n.t("SIM preset saved"));
        }

        return true;
    }

    private void filterPresets(String query, PresetAdapter adapter) {
        visiblePresets.clear();
        for (SimPreset preset : SimPresets.PRESETS) {
            if (preset.matches(query)) {
                visiblePresets.add(preset);
            }
        }

        markSelected(adapter);

        // The count is the one thing that speaks, and only when it changes. The explanation
        // under it is there to be read, not announced a second time.
        SettingsUi.setResultCount(resultCount, visiblePresets.size());
        if (emptyState == null) return;
        if (visiblePresets.isEmpty()) {
            emptyState.setText(L10n.t(getContext(), "No matching countries")
                    + "\n" + L10n.t(getContext(), "Try a country name, or a two-letter code"));
            emptyState.setVisibility(View.VISIBLE);
        } else {
            emptyState.setVisibility(View.GONE);
        }
    }

    /**
     * Marks the preset the three fields already hold and brings it into view.
     *
     * <p>The list used to be sixty identical rows with no sign of which one was on, and the only
     * way to tell was to close the dialog and read the row summary.
     */
    private void markSelected(PresetAdapter adapter) {
        SimPreset selected = SimPresets.findSelected(Settings.SIM_SPOOF_ISO.get(),
                Settings.SIMSPOOF_MCCMNC.get(), Settings.SIMSPOOF_OP_NAME.get());
        adapter.selected = selected;
        adapter.notifyDataSetChanged();
        if (presetList == null) return;
        int index = selected == null ? -1 : visiblePresets.indexOf(selected);
        if (index < 0) {
            presetList.clearChoices();
            return;
        }
        presetList.setItemChecked(index, true);
        presetList.setSelection(index);
    }

    /**
     * Back to no preset: the three settings blank, the three rows showing that, and the row
     * summary saying so. The settings are written here as well as through the rows, because
     * a row persists through its preference manager and a row on its own has none.
     */
    private void clearPreset() {
        Settings.SIM_SPOOF_ISO.save("");
        Settings.SIMSPOOF_MCCMNC.save("");
        Settings.SIMSPOOF_OP_NAME.save("");
        countryIsoPreference.setText("");
        mccMncPreference.setText("");
        operatorNamePreference.setText("");
        refreshSummary("", "", "");
    }

    private int dpToPx(int dp) {
        return Math.round(dp * getContext().getResources().getDisplayMetrics().density);
    }

    private GradientDrawable createDialogBackground() {
        return SettingsUi.borderedSurface(getContext(), 6, true);
    }

    private GradientDrawable createListBackground() {
        return SettingsUi.borderedSurface(getContext(), 4, false);
    }

    private static int getDialogBackgroundColor() {
        return SettingsUi.surface();
    }

    private static int getDialogDividerColor() {
        return SettingsUi.divider();
    }

    private static int getTitleTextColor() {
        return SettingsUi.textPrimary();
    }

    private static int getSummaryTextColor() {
        return SettingsUi.textSecondary();
    }

    private static class PresetAdapter extends ArrayAdapter<SimPreset> {
        /** The preset the fields hold right now, marked on its row; null when they hold none. */
        SimPreset selected;

        PresetAdapter(Context context, List<SimPreset> presets) {
            super(context, android.R.layout.simple_list_item_2, android.R.id.text1, presets);
        }

        @NonNull
        @Override
        public View getView(int position, View convertView, @NonNull ViewGroup parent) {
            View view = super.getView(position, convertView, parent);
            TextView title = view.findViewById(android.R.id.text1);
            TextView summary = view.findViewById(android.R.id.text2);
            // Every row is a real preset now. A no-match used to put a null in here and render
            // it as a disabled row, which is a sentence pretending to be a country.
            SimPreset preset = getItem(position);

            title.setText(preset.country);
            summary.setText(preset.getSummary());
            view.setEnabled(true);

            // The chosen row wears the radio the standard dialogs draw, and says so to TalkBack.
            boolean chosen = selected != null && preset == selected;
            Context context = parent.getContext();
            view.setSelected(chosen);
            title.setCompoundDrawablePadding(SettingsUi.dp(context, 8));
            title.setCompoundDrawablesRelativeWithIntrinsicBounds(
                    chosen ? SettingsUi.radioMark(context) : null, null, null, null);
            summary.setPaddingRelative(chosen ? SettingsUi.dp(context, 40) : 0, 0, 0, 0);

            // The fill under the press and the focus. Set flat, it covered the ListView's
            // own selector, so pressing a preset looked like nothing at all.
            view.setBackground(SettingsUi.listRow(parent.getContext(), getDialogBackgroundColor()));
            title.setTextColor(getTitleTextColor());
            summary.setTextColor(getSummaryTextColor());
            return view;
        }
    }

    @Override
    public void setTitle(CharSequence title) {
        super.setTitle(L10n.t(getContext(), title));
    }

    @Override
    public void setSummary(CharSequence summary) {
        super.setSummary(L10n.t(getContext(), summary));
    }
}
