package dev.srwi.gintype.extension.customholdpopups;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.text.InputType;
import android.util.Log;
import android.util.TypedValue;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import dev.srwi.gintype.extension.R;
import dev.srwi.gintype.extension.settings.GboardPatchesFeatureAvailability;
import dev.srwi.gintype.extension.settings.GboardPatchesIcons;
import dev.srwi.gintype.extension.settings.GboardPatchesSettings;
import dev.srwi.gintype.extension.settings.GboardPatchesSettingsContract;
import dev.srwi.gintype.extension.settings.GboardSettingsText;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * Settings screen for Custom Hold Popups: master switch, hold-to-edit duration slider, list of all
 * modified/added hold popup bindings (each tappable to edit, delete, or reset), and reset-all.
 */
public final class GboardCustomHoldPopupsSettingsFeature
        implements GboardPatchesSettingsContract.Feature {

    private static final String TAG = "GboardPatches";

    private final String title;
    private final String summary;
    private final String sectionGeneral;
    private final String sectionCustomizations;
    private final String enabledTitle;
    private final String enabledSummary;
    private final String lockKeysTitle;
    private final String lockKeysSummary;
    private final String addBindingTitle;
    private final String addBindingSummary;
    private final String addBindingKeyHint;
    private final String emptyTitle;
    private final String emptySummary;
    private final String resetTitle;
    private final String resetSummary;
    private final String resetConfirmTitle;
    private final String resetConfirmMessage;
    private final String resetDone;
    private final String errorTitle;
    private final String errorSummary;

    public GboardCustomHoldPopupsSettingsFeature(Context context) {
        title = text(context, R.string.gboard_patches_custom_hold_popups_title);
        summary = text(context, R.string.gboard_patches_custom_hold_popups_summary);
        sectionGeneral = text(context, R.string.gboard_patches_custom_hold_popups_section_general);
        sectionCustomizations =
                text(context, R.string.gboard_patches_custom_hold_popups_section_customizations);
        enabledTitle = text(context, R.string.gboard_patches_custom_hold_popups_enabled_title);
        enabledSummary = text(context, R.string.gboard_patches_custom_hold_popups_enabled_summary);
        lockKeysTitle = text(context, R.string.gboard_patches_custom_hold_popups_lock_keys_title);
        lockKeysSummary = text(context, R.string.gboard_patches_custom_hold_popups_lock_keys_summary);
        addBindingTitle = text(context, R.string.gboard_patches_custom_hold_popups_add_binding_title);
        addBindingSummary = text(context, R.string.gboard_patches_custom_hold_popups_add_binding_summary);
        addBindingKeyHint = text(context, R.string.gboard_patches_custom_hold_popups_add_binding_key_hint);
        emptyTitle = text(context, R.string.gboard_patches_custom_hold_popups_empty_title);
        emptySummary = text(context, R.string.gboard_patches_custom_hold_popups_empty_summary);
        resetTitle = text(context, R.string.gboard_patches_custom_hold_popups_reset_title);
        resetSummary = text(context, R.string.gboard_patches_custom_hold_popups_reset_summary);
        resetConfirmTitle =
                text(context, R.string.gboard_patches_custom_hold_popups_reset_confirm_title);
        resetConfirmMessage =
                text(context, R.string.gboard_patches_custom_hold_popups_reset_confirm_message);
        resetDone = text(context, R.string.gboard_patches_custom_hold_popups_reset_done);
        errorTitle = text(context, R.string.gboard_patches_custom_hold_popups_error_title);
        errorSummary = text(context, R.string.gboard_patches_custom_hold_popups_error_summary);
    }

    @Override
    public String getEntryTitle() {
        return title;
    }

    @Override
    public String getEntrySummary() {
        return summary;
    }

    @Override
    public int getEntryIcon() {
        return GboardPatchesIcons.EDIT;
    }

    @Override
    public String getEntryTone() {
        return "teal";
    }

    @Override
    public boolean updatesDuringKeyboardPreview() {
        return true;
    }

    @Override
    public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context, GboardPatchesFeatureAvailability.FEATURE_CUSTOM_HOLD_POPUPS);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            if (host == null || host.getContext() == null) {
                return buildErrorScreen();
            }
            SharedPreferences preferences = GboardPatchesSettings.preferences(host.getContext());
            GboardCustomHoldPopupsSettings.ensureDefaults(preferences);
            boolean masterEnabled = GboardCustomHoldPopupsSettings.readEnabled(preferences);
            boolean lockKeys = GboardCustomHoldPopupsSettings.readLockKeys(preferences);
            List<GboardCustomHoldPopupsSettings.CustomEntry> entries =
                    GboardCustomHoldPopupsSettings.listAllCustomEntries(preferences);

            // 1. General section (Master switch + Lock keys)
            List<GboardPatchesSettingsContract.Row> generalRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>(2);
            generalRows.add(new GboardPatchesSettingsContract.SwitchRow(
                    enabledTitle,
                    enabledSummary,
                    true,
                    masterEnabled,
                    checked -> saveBoolAndRefresh(host,
                            GboardCustomHoldPopupsSettings.writeEnabled(preferences, checked))));
            generalRows.add(new GboardPatchesSettingsContract.SwitchRow(
                    lockKeysTitle,
                    lockKeysSummary,
                    masterEnabled,
                    lockKeys,
                    checked -> saveBoolAndRefresh(host,
                            GboardCustomHoldPopupsSettings.writeLockKeys(preferences, checked))));

            // 2. Custom Hold Bindings list section
            List<GboardPatchesSettingsContract.Section> sections =
                    new ArrayList<GboardPatchesSettingsContract.Section>(3);
            sections.add(new GboardPatchesSettingsContract.Section(sectionGeneral, generalRows));

            if (entries.isEmpty()) {
                List<GboardPatchesSettingsContract.Row> emptyRows =
                        new ArrayList<GboardPatchesSettingsContract.Row>(2);
                emptyRows.add(new GboardPatchesSettingsContract.CommandRow(
                        addBindingTitle,
                        addBindingSummary,
                        masterEnabled,
                        () -> showAddBindingKeyPickerDialog(host)));
                emptyRows.add(new GboardPatchesSettingsContract.CustomViewRow(
                        viewHost -> createEmptyInfoFooterView(
                                viewHost.getContext(), emptyTitle, emptySummary)));
                sections.add(new GboardPatchesSettingsContract.Section(
                        sectionCustomizations,
                        null,
                        GboardPatchesSettingsContract.SectionStyle.DEFAULT,
                        emptyRows));
            } else {
                List<GboardPatchesSettingsContract.Row> customRows =
                        new ArrayList<GboardPatchesSettingsContract.Row>(entries.size() + 1);
                customRows.add(new GboardPatchesSettingsContract.CommandRow(
                        addBindingTitle,
                        addBindingSummary,
                        masterEnabled,
                        () -> showAddBindingKeyPickerDialog(host)));
                for (GboardCustomHoldPopupsSettings.CustomEntry entry : entries) {
                    String displayKey = formatDisplayKey(entry.baseKey);
                    String changeText = entry.userAdded
                            ? entry.replacementSymbol
                            : (entry.originalSymbol + " → " + entry.replacementSymbol);
                    customRows.add(new GboardPatchesSettingsContract.CommandRow(
                            "",
                            null,
                            masterEnabled,
                            () -> showEntryEditorDialog(host, entry),
                            null,
                            displayKey,
                            changeText));
                }
                sections.add(new GboardPatchesSettingsContract.Section(
                        sectionCustomizations, customRows));

                // 3. Reset all custom bindings (only shown when custom bindings exist)
                List<GboardPatchesSettingsContract.Row> resetRows = Collections.singletonList(
                        new GboardPatchesSettingsContract.DangerRow(
                                resetTitle,
                                resetSummary,
                                true,
                                () -> {
                                    GboardCustomHoldPopupsSettings.resetAllCustomBindings(preferences);
                                    GboardPatchesSettingsContract.refresh(host);
                                    GboardPatchesSettingsContract.showMessage(host, resetDone);
                                },
                                resetConfirmTitle,
                                resetConfirmMessage));
                sections.add(new GboardPatchesSettingsContract.Section(
                        null,
                        null,
                        GboardPatchesSettingsContract.SectionStyle.ADVANCED,
                        resetRows));
            }

            return new GboardPatchesSettingsContract.Screen(
                    title,
                    null,
                    title,
                    summary,
                    Collections.emptyList(),
                    sections,
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT);
        } catch (Throwable throwable) {
            try {
                Log.w(TAG, "Failed to render Custom Hold Popups settings screen", throwable);
            } catch (Throwable ignored) {
            }
            return buildErrorScreen();
        }
    }

    private void showAddBindingKeyPickerDialog(
            GboardPatchesSettingsContract.FeatureHost host) {
        if (host == null) return;
        Context context = host.getContext();
        if (!(context instanceof Activity)) return;
        Activity activity = (Activity) context;
        GboardPatchesSettingsContract.showManagedDialog(host, onDismiss -> {
            EditText keyInput = new EditText(activity);
            keyInput.setSingleLine(true);
            keyInput.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
            keyInput.setHint(addBindingKeyHint);
            float density = activity.getResources().getDisplayMetrics().density;
            int padH = Math.round(20f * density);
            int padV = Math.round(12f * density);
            LinearLayout wrapper = new LinearLayout(activity);
            wrapper.setOrientation(LinearLayout.VERTICAL);
            wrapper.setPadding(padH, padV, padH, padV);
            wrapper.addView(keyInput, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            AlertDialog picker = new AlertDialog.Builder(activity)
                    .setTitle(addBindingTitle)
                    .setView(wrapper)
                    .setNegativeButton(
                            GboardSettingsText.get(activity, R.string.gboard_patches_dialog_cancel),
                            null)
                    .setPositiveButton(
                            GboardSettingsText.get(
                                    activity, R.string.gboard_patches_custom_hold_popups_dialog_action_add),
                            (d, which) -> {
                                String rawKey = keyInput.getText() == null
                                        ? ""
                                        : keyInput.getText().toString().trim();
                                String normalized = GboardCustomHoldPopupsSettings.normalizeBaseKey(rawKey);
                                if (normalized.isEmpty() || normalized.codePointCount(0, normalized.length()) != 1) {
                                    GboardPatchesSettingsContract.showMessage(
                                            host,
                                            GboardSettingsText.get(
                                                    activity,
                                                    R.string.gboard_patches_custom_hold_popups_dialog_error_empty));
                                    return;
                                }
                                GboardPatchesSettingsContract.showManagedDialog(host, editorDismiss -> {
                                    AlertDialog editor = GboardCustomHoldPopupsEditorDialog.show(
                                            activity,
                                            GboardCustomHoldPopupsEditorDialog.MODE_ADD,
                                            normalized,
                                            "",
                                            "",
                                            false,
                                            -1,
                                            () -> GboardPatchesSettingsContract.refresh(host),
                                            editorDismiss);
                                    return editor != null;
                                });
                            })
                    .create();
            picker.setOnDismissListener(ignored -> {
                if (onDismiss != null) {
                    onDismiss.run();
                }
            });
            picker.show();
            return true;
        });
    }

    private void showEntryEditorDialog(
            GboardPatchesSettingsContract.FeatureHost host,
            GboardCustomHoldPopupsSettings.CustomEntry entry) {
        if (host == null || entry == null) return;
        Context context = host.getContext();
        if (!(context instanceof Activity)) return;
        Activity activity = (Activity) context;
        GboardPatchesSettingsContract.showManagedDialog(host, onDismiss -> {
            AlertDialog dialog = GboardCustomHoldPopupsEditorDialog.show(
                    activity,
                    GboardCustomHoldPopupsEditorDialog.MODE_EDIT,
                    entry.baseKey,
                    entry.replacementSymbol,
                    entry.originalSymbol,
                    entry.userAdded,
                    entry.addedIndex,
                    () -> GboardPatchesSettingsContract.refresh(host),
                    onDismiss);
            return dialog != null;
        });
    }

    private static String formatDisplayKey(String normalizedBaseKey) {
        if (normalizedBaseKey == null || normalizedBaseKey.isEmpty()) {
            return "?";
        }
        if (normalizedBaseKey.length() == 1 && Character.isLetter(normalizedBaseKey.charAt(0))) {
            return normalizedBaseKey.toUpperCase(Locale.ROOT);
        }
        return normalizedBaseKey;
    }

    private void saveBoolAndRefresh(
            GboardPatchesSettingsContract.FeatureHost host,
            boolean saved) {
        if (!saved) {
            throw new IllegalStateException("Unable to persist Custom Hold Popups setting");
        }
        GboardPatchesSettingsContract.refresh(host);
    }

    private GboardPatchesSettingsContract.Screen buildErrorScreen() {
        List<GboardPatchesSettingsContract.StatusBlock> statusBlocks = Collections.singletonList(
                new GboardPatchesSettingsContract.StatusBlock(
                        errorTitle,
                        errorSummary,
                        GboardPatchesSettingsContract.StatusTone.WARNING));
        return new GboardPatchesSettingsContract.Screen(
                title,
                null,
                errorTitle,
                errorSummary,
                statusBlocks,
                Collections.emptyList());
    }

    private static LinearLayout createEmptyInfoFooterView(
            Context context, String emptyTitleText, String emptySummaryText) {
        float density = context.getResources().getDisplayMetrics().density;
        int dp16 = Math.round(16f * density);
        int dp12 = Math.round(12f * density);
        int dp8 = Math.round(8f * density);
        int dp20 = Math.round(20f * density);

        int secondaryColor = 0xFF757575;
        TypedArray ta = context.obtainStyledAttributes(
                new int[] { android.R.attr.textColorSecondary });
        try {
            secondaryColor = ta.getColor(0, secondaryColor);
        } finally {
            ta.recycle();
        }

        LinearLayout container = new LinearLayout(context);
        container.setOrientation(LinearLayout.VERTICAL);
        container.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        container.setPadding(dp16, dp8, dp16, dp12);

        TextView emptyTitleView = new TextView(context);
        emptyTitleView.setText(emptyTitleText);
        emptyTitleView.setTextColor(secondaryColor);
        emptyTitleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        titleParams.bottomMargin = dp12;
        emptyTitleView.setLayoutParams(titleParams);
        container.addView(emptyTitleView);

        Drawable infoIcon = GboardPatchesIcons.create(
                GboardPatchesIcons.INFO, secondaryColor, density);
        if (infoIcon != null) {
            ImageView iconView = new ImageView(context);
            iconView.setImageDrawable(infoIcon);
            LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(dp20, dp20);
            iconParams.bottomMargin = dp8;
            iconView.setLayoutParams(iconParams);
            container.addView(iconView);
        }

        TextView summaryView = new TextView(context);
        summaryView.setText(emptySummaryText);
        summaryView.setTextColor(secondaryColor);
        summaryView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        summaryView.setLineSpacing(0f, 1.15f);
        summaryView.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        container.addView(summaryView);
        return container;
    }

    private static String text(Context context, int resourceId) {
        return GboardSettingsText.get(context, resourceId);
    }
}
