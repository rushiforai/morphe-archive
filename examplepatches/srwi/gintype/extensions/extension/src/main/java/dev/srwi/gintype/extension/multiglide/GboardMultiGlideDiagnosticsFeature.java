package dev.srwi.gintype.extension.multiglide;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import dev.srwi.gintype.extension.R;
import dev.srwi.gintype.extension.settings.GboardPatchesFeatureAvailability;
import dev.srwi.gintype.extension.settings.GboardPatchesSettings;
import dev.srwi.gintype.extension.settings.GboardPatchesSettingsContract;
import dev.srwi.gintype.extension.settings.GboardSettingsText;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/** Sub-page for MultiGlide trace logging and log export/clear diagnostics. */
public final class GboardMultiGlideDiagnosticsFeature
        implements GboardPatchesSettingsContract.Feature {

    private static final String TAG = "GboardPatches";
    private static final int[] PRESET_EXPORT_MINUTES = {5, 15, 30, 60, 180, 0};
    private static final String VALUE_CUSTOM = "custom";

    private final String title;
    private final String summary;
    private final String traceLoggingTitle;
    private final String traceLoggingSummary;
    private final String traceExportTitle;
    private final String traceExportSummary;
    private final String traceExportDialogTitle;
    private final String traceExportMinutesTemplate;
    private final String traceExportHoursTemplate;
    private final String traceExportAllLabel;
    private final String traceExportHint;
    private final String traceExportError;
    private final String traceExportEmpty;
    private final String traceExportDone;
    private final String delayCustomLabel;
    private final String traceClearTitle;
    private final String traceClearSummary;
    private final String traceClearConfirmTitle;
    private final String traceClearConfirmMessage;
    private final String traceClearDone;
    private final String errorTitle;
    private final String errorSummary;

    public GboardMultiGlideDiagnosticsFeature(Context context) {
        title = text(context, R.string.gboard_patches_multiglide_section_diagnostics);
        summary = text(context, R.string.gboard_patches_multiglide_diagnostics_summary);
        traceLoggingTitle = text(context, R.string.gboard_patches_multiglide_trace_logging_title);
        traceLoggingSummary =
                text(context, R.string.gboard_patches_multiglide_trace_logging_summary);
        traceExportTitle = text(context, R.string.gboard_patches_multiglide_trace_export_title);
        traceExportSummary = text(context, R.string.gboard_patches_multiglide_trace_export_summary);
        traceExportDialogTitle =
                text(context, R.string.gboard_patches_multiglide_trace_export_dialog_title);
        traceExportMinutesTemplate =
                text(context, R.string.gboard_patches_multiglide_trace_export_minutes_item);
        traceExportHoursTemplate =
                text(context, R.string.gboard_patches_multiglide_trace_export_hours_item);
        traceExportAllLabel = text(context, R.string.gboard_patches_multiglide_trace_export_all);
        traceExportHint = text(context, R.string.gboard_patches_multiglide_trace_export_hint);
        traceExportError = text(context, R.string.gboard_patches_multiglide_trace_export_error);
        traceExportEmpty = text(context, R.string.gboard_patches_multiglide_trace_export_empty);
        traceExportDone = text(context, R.string.gboard_patches_multiglide_trace_export_done);
        delayCustomLabel = text(context, R.string.gboard_patches_multiglide_auto_space_delay_custom);
        traceClearTitle = text(context, R.string.gboard_patches_multiglide_trace_clear_title);
        traceClearSummary = text(context, R.string.gboard_patches_multiglide_trace_clear_summary);
        traceClearConfirmTitle =
                text(context, R.string.gboard_patches_multiglide_trace_clear_confirm_title);
        traceClearConfirmMessage =
                text(context, R.string.gboard_patches_multiglide_trace_clear_confirm_message);
        traceClearDone = text(context, R.string.gboard_patches_multiglide_trace_clear_done);
        errorTitle = text(context, R.string.gboard_patches_multiglide_error_title);
        errorSummary = text(context, R.string.gboard_patches_multiglide_error_summary);
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
    public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context, GboardPatchesFeatureAvailability.FEATURE_MULTIGLIDE);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            if (host == null || host.getContext() == null) {
                return buildErrorScreen();
            }
            SharedPreferences preferences = GboardPatchesSettings.preferences(host.getContext());
            GboardMultiGlideSettings.ensureDefaults(preferences);
            boolean traceLoggingEnabled =
                    GboardMultiGlideSettings.readTraceLoggingEnabled(preferences);

            List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>(3);
            rows.add(new GboardPatchesSettingsContract.ToggleRow(
                    traceLoggingTitle,
                    traceLoggingSummary,
                    true,
                    traceLoggingEnabled,
                    value -> {
                        GboardMultiGlideSettings.writeTraceLoggingEnabled(preferences, value);
                        GboardPatchesSettingsContract.refresh(host);
                    }));
            rows.add(new GboardPatchesSettingsContract.CommandRow(
                    traceExportTitle,
                    traceExportSummary,
                    true,
                    () -> showTraceExportMinutesSelector(host)));
            rows.add(new GboardPatchesSettingsContract.DangerRow(
                    traceClearTitle,
                    traceClearSummary,
                    true,
                    () -> {
                        GboardMultiGlideTraceLogger.clearTraceLogs(host.getContext());
                        GboardPatchesSettingsContract.showMessage(host, traceClearDone);
                    },
                    traceClearConfirmTitle,
                    traceClearConfirmMessage));

            return new GboardPatchesSettingsContract.Screen(
                    title,
                    null,
                    title,
                    summary,
                    Collections.emptyList(),
                    Collections.singletonList(new GboardPatchesSettingsContract.Section(null, rows)),
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT);
        } catch (Throwable throwable) {
            try {
                Log.w(TAG, "Failed to render MultiGlide diagnostics screen", throwable);
            } catch (Throwable ignored) {
                // Fallback error screen below handles recovery.
            }
            return buildErrorScreen();
        }
    }

    private void showTraceExportMinutesSelector(GboardPatchesSettingsContract.FeatureHost host) {
        String[] labels = new String[PRESET_EXPORT_MINUTES.length + 1];
        String[] values = new String[PRESET_EXPORT_MINUTES.length + 1];
        for (int i = 0; i < PRESET_EXPORT_MINUTES.length; i++) {
            int mins = PRESET_EXPORT_MINUTES[i];
            labels[i] = formatExportWindowLabel(mins);
            values[i] = Integer.toString(mins);
        }
        labels[PRESET_EXPORT_MINUTES.length] = delayCustomLabel;
        values[PRESET_EXPORT_MINUTES.length] = VALUE_CUSTOM;

        GboardPatchesSettingsContract.showChoiceDialog(
                host,
                traceExportDialogTitle,
                labels,
                values,
                Integer.toString(15),
                VALUE_CUSTOM,
                () -> GboardPatchesSettingsContract.showTextInputDialog(
                        host,
                        traceExportDialogTitle,
                        traceExportHint,
                        "15",
                        raw -> {
                            int mins = GboardMultiGlideSettingsFeature.parseIntInRange(
                                    raw,
                                    GboardMultiGlideSettings.MIN_TRACE_EXPORT_MINUTES,
                                    GboardMultiGlideSettings.MAX_TRACE_EXPORT_MINUTES,
                                    traceExportError);
                            exportTraceForMinutes(host, mins);
                        }),
                choice -> {
                    int mins = Integer.parseInt(choice);
                    exportTraceForMinutes(host, mins);
                });
    }

    private void exportTraceForMinutes(GboardPatchesSettingsContract.FeatureHost host, int minutes) {
        GboardMultiGlideTraceLogger.TraceExportResult result =
                GboardMultiGlideTraceLogger.readTraceForExport(host.getContext(), minutes);
        if (result.lineCount == 0 || result.content.isEmpty()) {
            GboardPatchesSettingsContract.showMessage(host, traceExportEmpty);
            return;
        }
        String fileName = minutes > 0
                ? "multiglide_trace_" + minutes + "m.jsonl"
                : "multiglide_trace_all.jsonl";
        GboardPatchesSettingsContract.createTextDocument(
                host,
                fileName,
                "text/plain",
                result.content,
                () -> GboardPatchesSettingsContract.showMessage(host, traceExportDone));
    }

    private String formatExportWindowLabel(int minutes) {
        if (minutes <= 0) {
            return traceExportAllLabel;
        }
        if (minutes >= 60 && minutes % 60 == 0) {
            return String.format(Locale.US, traceExportHoursTemplate, minutes / 60);
        }
        return String.format(Locale.US, traceExportMinutesTemplate, minutes);
    }

    private GboardPatchesSettingsContract.Screen buildErrorScreen() {
        return new GboardPatchesSettingsContract.Screen(
                title,
                null,
                title,
                summary,
                Collections.singletonList(new GboardPatchesSettingsContract.StatusBlock(
                        errorTitle,
                        errorSummary,
                        GboardPatchesSettingsContract.StatusTone.WARNING)),
                Collections.emptyList());
    }

    private static String text(Context context, int id) {
        return GboardSettingsText.get(context, id);
    }
}
