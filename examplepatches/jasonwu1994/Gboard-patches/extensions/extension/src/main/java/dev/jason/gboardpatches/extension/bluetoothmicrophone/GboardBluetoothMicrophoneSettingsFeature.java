package dev.jason.gboardpatches.extension.bluetoothmicrophone;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.Collections;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardBluetoothMicrophoneSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";

    private final String entryTitle;
    private final String entrySummary;
    private final String headerBadge;
    private final String errorTitle;
    private final String errorSummary;
    private final String sectionTitle;

    public GboardBluetoothMicrophoneSettingsFeature(Context context) {
        this(
                GboardSettingsText.get(context,
                        R.string.gboard_patches_bluetooth_microphone_title,
                        "Use Bluetooth microphone"),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_bluetooth_microphone_summary,
                        "Voice typing -> Use Bluetooth microphone"),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_header_badge,
                        "Gboard"),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_bluetooth_microphone_error_title,
                        "Bluetooth microphone unavailable"),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_bluetooth_microphone_error_summary,
                        "The Bluetooth microphone settings screen failed to load. Reopen Gboard settings and try again."),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_bluetooth_microphone_section_behavior,
                        "Behavior"));
    }

    GboardBluetoothMicrophoneSettingsFeature(
            String entryTitle,
            String entrySummary,
            String headerBadge,
            String errorTitle,
            String errorSummary,
            String sectionTitle) {
        this.entryTitle = entryTitle;
        this.entrySummary = entrySummary;
        this.headerBadge = headerBadge;
        this.errorTitle = errorTitle;
        this.errorSummary = errorSummary;
        this.sectionTitle = sectionTitle;
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
                GboardPatchesFeatureAvailability.FEATURE_BLUETOOTH_MICROPHONE);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.Host host) {
        try {
            if (host == null || host.getContext() == null) {
                return buildErrorScreen();
            }
            SharedPreferences preferences = GboardPatchesSettings.preferences(host.getContext());
            GboardBluetoothMicrophoneSettings.ensureDefault(preferences);
            return buildScreenForState(
                    GboardBluetoothMicrophoneSettings.readEnabled(preferences),
                    value -> GboardBluetoothMicrophoneSettings.writeEnabled(
                            preferences,
                            value));
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render Bluetooth microphone settings", throwable);
            return buildErrorScreen();
        }
    }

    GboardPatchesSettingsContract.Screen buildScreenForState(
            boolean enabled,
            GboardPatchesSettingsContract.ToggleAction toggleAction) {
        return new GboardPatchesSettingsContract.Screen(
                entryTitle,
                headerBadge,
                entryTitle,
                "",
                Collections.emptyList(),
                Collections.singletonList(new GboardPatchesSettingsContract.Section(
                        sectionTitle,
                        Collections.singletonList(new GboardPatchesSettingsContract.ToggleRow(
                                entryTitle,
                                entrySummary,
                                true,
                                enabled,
                                toggleAction)))),
                GboardPatchesSettingsContract.RefreshPolicy.none(),
                GboardPatchesSettingsContract.PanelStyle.FLAT);
    }

    private GboardPatchesSettingsContract.Screen buildErrorScreen() {
        return new GboardPatchesSettingsContract.Screen(
                entryTitle,
                headerBadge,
                entryTitle,
                "",
                Collections.singletonList(new GboardPatchesSettingsContract.StatusBlock(
                        errorTitle,
                        errorSummary,
                        GboardPatchesSettingsContract.StatusTone.WARNING)),
                Collections.emptyList());
    }
}
