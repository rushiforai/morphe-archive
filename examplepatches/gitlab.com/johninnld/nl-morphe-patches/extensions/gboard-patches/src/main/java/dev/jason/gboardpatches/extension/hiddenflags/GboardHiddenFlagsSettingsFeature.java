package dev.jason.gboardpatches.extension.hiddenflags;

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
 * One toggle per curated flag, each writing through Gboard's own override store so the value
 * applies without a restart and without a rebuild.
 */
public final class GboardHiddenFlagsSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private final String title;
    private final String summary;
    private final String entrySummary;
    private final String badge;
    private final String section;
    private final String errorTitle;
    private final String errorSummary;

    public GboardHiddenFlagsSettingsFeature(Context context) {
        title = text(context, R.string.gboard_patches_hidden_flags_title);
        summary = text(context, R.string.gboard_patches_hidden_flags_summary);
        entrySummary = text(context, R.string.gboard_patches_hidden_flags_entry_summary);
        badge = text(context, R.string.gboard_patches_header_badge);
        section = text(context, R.string.gboard_patches_hidden_flags_section);
        errorTitle = text(context, R.string.gboard_patches_hidden_flags_error_title);
        errorSummary = text(context, R.string.gboard_patches_hidden_flags_error_summary);
    }

    @Override public String getEntryTitle() { return title; }
    @Override public String getEntrySummary() { return entrySummary; }
    @Override public int getEntryIcon() { return GboardPatchesIcons.BOLT; }
    @Override public String getEntryTone() { return "amber"; }

    @Override public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context, GboardPatchesFeatureAvailability.FEATURE_HIDDEN_FLAGS);
    }

    @Override public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            Context context = host == null ? null : host.getContext();
            if (context == null) {
                return errorScreen();
            }
            SharedPreferences preferences = GboardPatchesSettings.preferences(context);
            List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();
            for (GboardHiddenFlagCatalog.Entry entry : GboardHiddenFlagCatalog.entries()) {
                boolean checked = GboardHiddenFlagSettings.readEnabled(
                        preferences, entry.flagName);
                final String flagName = entry.flagName;
                rows.add(new GboardPatchesSettingsContract.ToggleRow(
                        entry.title, entry.summary, true, checked,
                        value -> {
                            boolean written = GboardHiddenFlagSettings.writeEnabled(
                                    preferences, flagName, value);
                            boolean readBack = GboardHiddenFlagSettings.readEnabled(
                                    preferences, flagName);
                            boolean applied = written && readBack == value && GboardFlagOverrideRuntime.applyOne(
                                    context, flagName, value);
                            if (!written || readBack != value || !applied) {
                                Log.w("GboardPatches", "Hidden flag switch did not take: "
                                        + flagName + "=" + value + " written=" + written
                                        + " readBack=" + readBack + " applied=" + applied);
                            }
                        }));
            }
            return new GboardPatchesSettingsContract.Screen(
                    title, badge, title, summary,
                    Collections.emptyList(),
                    Collections.singletonList(new GboardPatchesSettingsContract.Section(
                            section, rows)));
        } catch (Throwable failure) {
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
