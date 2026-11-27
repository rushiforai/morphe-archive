package dev.jason.gboardpatches.extension.writingtools;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardAiWritingToolsSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";
    private static final String VALUE_UNUSED = "__unused__";
    private final String headerBadge;
    private final String entryTitle;
    private final String entrySummary;
    private final String headerSummary;
    private final String errorTitle;
    private final String errorSummary;
    private final String enabledTitle;
    private final String enabledSummary;
    private final String allKeyboardsTitle;
    private final String allKeyboardsSummary;
    private final String backendTypeTitle;
    private final String backendTypeSummary;
    private final String backendTypeDialogTitle;
    private final String[] backendTypeValues;
    private final String sectionBehavior;

    public GboardAiWritingToolsSettingsFeature(Context context) {
        headerBadge = GboardSettingsText.get(context, R.string.gboard_patches_header_badge);
        entryTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_title);
        entrySummary = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_summary);
        headerSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_header_summary);
        errorTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_error_title);
        errorSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_error_summary);
        enabledTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_enabled_title);
        enabledSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_enabled_summary);
        allKeyboardsTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_all_keyboards_title);
        allKeyboardsSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_all_keyboards_summary);
        backendTypeTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_backend_type_title);
        backendTypeSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_backend_type_summary);
        backendTypeDialogTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_backend_type_dialog_title);
        backendTypeValues = new String[]{
                GboardAiWritingToolsSettings.BACKEND_GBOARD_SERVER,
                GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_AICORE,
                GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_ASTREA,
                GboardAiWritingToolsSettings.BACKEND_SHARED_LOCAL
        };
        sectionBehavior = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_section_behavior);
    }

    @Override
    public String getEntryTitle() {
        return entryTitle;
    }

    @Override
    public String getEntrySummary() {
        return entrySummary;
    }

    @Override
    public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context,
                GboardPatchesFeatureAvailability.FEATURE_AI_WRITING_TOOLS);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            if (host == null || host.getContext() == null) {
                return buildErrorScreen();
            }

            SharedPreferences preferences =
                    GboardAiWritingToolsSettings.preferences(host.getContext());
            GboardAiWritingToolsSettings.ensureDefaults(preferences);

            boolean enabled = GboardAiWritingToolsSettings.readEnabled(preferences);
            boolean allKeyboardsEnabled =
                    GboardAiWritingToolsSettings.readAllKeyboardsEnabled(preferences);
            String backendType = GboardAiWritingToolsSettings.readBackendType(preferences);

            List<GboardPatchesSettingsContract.Row> behaviorRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            behaviorRows.add(new GboardPatchesSettingsContract.ToggleRow(
                    enabledTitle,
                    enabledSummary,
                    true,
                    enabled,
                    value -> GboardAiWritingToolsSettings.writeEnabled(preferences, value))
                    .setRestartRequired(GboardAiWritingToolsSettings.PREF_KEY_ENABLED));
            behaviorRows.add(new GboardPatchesSettingsContract.ToggleRow(
                    allKeyboardsTitle,
                    allKeyboardsSummary,
                    enabled,
                    allKeyboardsEnabled,
                    value -> GboardAiWritingToolsSettings.writeAllKeyboardsEnabled(
                            preferences,
                            value))
                    .setRestartRequired(GboardAiWritingToolsSettings.PREF_KEY_ALL_KEYBOARDS));
            behaviorRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    backendTypeTitle,
                    backendTypeSummary,
                    GboardAiWritingToolsSettings.BACKEND_SHARED_LOCAL.equals(backendType)
                            ? GboardSettingsText.get(host.getContext(), R.string.gboard_patches_shared_model_label) : backendType,
                    enabled,
                    () -> showBackendTypeDialog(host, preferences, backendType)));

            if (GboardAiWritingToolsSettings.BACKEND_SHARED_LOCAL.equals(backendType)) {
                behaviorRows.add(new GboardPatchesSettingsContract.ActionRow(
                        GboardSettingsText.get(host.getContext(), R.string.gboard_patches_shared_context_title),
                        GboardSettingsText.get(host.getContext(), R.string.gboard_patches_shared_context_summary),
                        enabled,
                        () -> host.getContext().startActivity(new android.content.Intent(host.getContext(), dev.jason.gboardpatches.extension.sharedmodel.SharedWritingContextActivity.class).addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK))));
                behaviorRows.add(new GboardPatchesSettingsContract.ActionRow(
                        GboardSettingsText.get(host.getContext(), R.string.gboard_patches_shared_model_setup_title),
                        GboardSettingsText.get(host.getContext(), R.string.gboard_patches_shared_model_setup_summary),
                        enabled,
                        () -> dev.jason.gboardpatches.extension.sharedmodel.SharedModelSetupActivity.open(host.getContext())));
            }

            return new GboardPatchesSettingsContract.Screen(
                    entryTitle,
                    headerBadge,
                    entryTitle,
                    headerSummary,
                    Collections.emptyList(),
                    Collections.singletonList(new GboardPatchesSettingsContract.Section(
                            sectionBehavior,
                            behaviorRows)),
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render AI Writing Tools settings screen", throwable);
            return buildErrorScreen();
        }
    }

    private GboardPatchesSettingsContract.Screen buildErrorScreen() {
        List<GboardPatchesSettingsContract.StatusBlock> statusBlocks =
                new ArrayList<GboardPatchesSettingsContract.StatusBlock>();
        statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                errorTitle,
                errorSummary,
                GboardPatchesSettingsContract.StatusTone.WARNING));
        return new GboardPatchesSettingsContract.Screen(
                entryTitle,
                headerBadge,
                entryTitle,
                headerSummary,
                statusBlocks,
                Collections.emptyList());
    }

    private void showBackendTypeDialog(GboardPatchesSettingsContract.FeatureHost host,
            SharedPreferences preferences, String currentBackendType) {
        String[] labels = backendTypeValues.clone();
        labels[labels.length - 1] = GboardSettingsText.get(host.getContext(), R.string.gboard_patches_shared_model_label);
        GboardPatchesSettingsContract.showChoiceDialog(host,
                backendTypeDialogTitle,
                labels,
                backendTypeValues,
                currentBackendType,
                VALUE_UNUSED,
                () -> {
                },
                value -> {
                    if(GboardAiWritingToolsSettings.BACKEND_SHARED_LOCAL.equals(value)){
                        dev.jason.gboardpatches.extension.sharedmodel.SharedLocalAiState.select(preferences,true);
                        dev.jason.gboardpatches.extension.sharedmodel.SharedModelClient.activate(host.getContext());
                    }else{
                        GboardAiWritingToolsSettings.writeBackendType(preferences,value);
                        dev.jason.gboardpatches.extension.sharedmodel.SharedModelClient.releaseSession();
                    }
                    GboardPatchesSettingsContract.refresh(host);
                });
    }
}
