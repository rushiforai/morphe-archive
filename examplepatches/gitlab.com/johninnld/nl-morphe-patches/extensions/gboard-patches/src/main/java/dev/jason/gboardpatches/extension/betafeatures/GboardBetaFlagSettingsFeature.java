package dev.jason.gboardpatches.extension.betafeatures;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesIcons;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

/**
 * The 18.8 beta gates: one master switch plus a switch per flag, so a single feature can be
 * turned on without dragging the other four along.
 *
 * Every switch writes a preference the flag hook reads on each query, which is why the screen
 * marks rows as restart required only where Gboard caches the value in a static initialiser.
 */
public final class GboardBetaFlagSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";

    private final String title;
    private final String summary;
    private final String entrySummary;
    private final String badge;
    private final String section;
    private final String masterSummary;
    private final String errorTitle;
    private final String errorSummary;

    public GboardBetaFlagSettingsFeature(Context context) {
        title = text(context, R.string.gboard_patches_beta_flags_title);
        summary = text(context, R.string.gboard_patches_beta_flags_summary);
        entrySummary = text(context, R.string.gboard_patches_beta_flags_entry_summary);
        badge = text(context, R.string.gboard_patches_header_badge);
        section = text(context, R.string.gboard_patches_beta_flags_section);
        masterSummary = text(context, R.string.gboard_patches_beta_flags_master_summary);
        errorTitle = text(context, R.string.gboard_patches_beta_flags_error_title);
        errorSummary = text(context, R.string.gboard_patches_beta_flags_error_summary);
    }

    @Override public String getEntryTitle() { return title; }
    @Override public String getEntrySummary() { return entrySummary; }
    @Override public int getEntryIcon() { return GboardPatchesIcons.SPARKLE; }
    @Override public String getEntryTone() { return "green"; }

    @Override public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context, GboardPatchesFeatureAvailability.FEATURE_BETA_FLAGS);
    }

    @Override public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            Context context = host == null ? null : host.getContext();
            if (context == null) {
                return errorScreen();
            }
            SharedPreferences preferences = GboardPatchesSettings.preferences(context);
            GboardBetaFlagSettings.ensureDefault(preferences);

            List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();
            rows.add(new GboardPatchesSettingsContract.ToggleRow(
                    title, masterSummary, true,
                    GboardBetaFlagSettings.readEnabled(preferences),
                    value -> GboardBetaFlagSettings.writeEnabled(preferences, value))
                    .setRestartRequired(GboardBetaFlagSettings.PREF_KEY_ENABLED));

            for (GboardBetaFeatureCatalog.Entry entry : GboardBetaFeatureCatalog.entries()) {
                GboardBetaFlagSettings.ensureFlagDefault(preferences, entry.flagName);
                boolean checked = GboardBetaFlagSettings.readFlagEnabled(
                        preferences, entry.flagName);
                final String flagName = entry.flagName;
                rows.add(new GboardPatchesSettingsContract.ToggleRow(
                        text(context, entry.titleRes),
                        text(context, entry.summaryRes),
                        true,
                        checked,
                        value -> GboardBetaFlagSettings.writeFlagEnabled(
                                preferences, flagName, value))
                        .setRestartRequired(GboardBetaFlagSettings.flagKey(flagName)));
            }

            return new GboardPatchesSettingsContract.Screen(
                    title, badge, title, summary,
                    Collections.emptyList(),
                    Collections.singletonList(new GboardPatchesSettingsContract.Section(
                            section, rows)));
        } catch (Throwable failure) {
            try {
                Log.w(TAG, "Failed to render beta feature settings", failure);
            } catch (Throwable ignored) {
                // The warning screen is the only remaining action.
            }
            return errorScreen();
        }
    }

    private GboardPatchesSettingsContract.Screen errorScreen() {
        return new GboardPatchesSettingsContract.Screen(
                title, badge, errorTitle, errorSummary,
                Collections.emptyList(), Collections.emptyList());
    }

    private static String text(Context context, int resourceId) {
        return GboardSettingsText.get(context, resourceId);
    }
}
