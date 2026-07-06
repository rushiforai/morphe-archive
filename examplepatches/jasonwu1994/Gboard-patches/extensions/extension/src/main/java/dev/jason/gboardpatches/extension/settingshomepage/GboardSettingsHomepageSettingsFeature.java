package dev.jason.gboardpatches.extension.settingshomepage;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardSettingsHomepageSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";
    private static final String FALLBACK_HEADER_BADGE = "Gboard";
    private static final String FALLBACK_ENTRY_TITLE = "Settings Style";
    private static final String FALLBACK_ENTRY_SUMMARY =
            "Choose whether Gboard settings use the new or legacy settings style.";
    private static final String FALLBACK_HEADER_SUMMARY =
            "Control whether Gboard settings use the new or legacy settings experience. Reopen"
                    + " Gboard settings after changing this option.";
    private static final String FALLBACK_ERROR_TITLE = "Settings homepage unavailable";
    private static final String FALLBACK_ERROR_SUMMARY =
            "The homepage selector failed to load. Reopen Gboard settings and try again.";
    private static final String FALLBACK_SAFETY_TITLE = "Compatibility safeguard";
    private static final String FALLBACK_RECOVERY_TITLE = "Crash safeguard";
    private static final String FALLBACK_TRIAL_TITLE = "Trial window";
    private static final String FALLBACK_TITLE_MODE = "Settings style";
    private static final String FALLBACK_TITLE_CURRENT = "Current active style";
    private static final String VALUE_UNUSED = "__unused__";
    private static final String FALLBACK_LABEL_AUTO = "Auto";
    private static final String FALLBACK_LABEL_NEW = "New";
    private static final String FALLBACK_LABEL_LEGACY = "Legacy";
    private static final String FALLBACK_SECTION_STYLE = "Style";
    private static final String FALLBACK_SECTION_CURRENT_STATE = "Current state";
    private static final long TRIAL_SCREEN_REFRESH_INTERVAL_MS = 1000L;

    private String headerBadge = FALLBACK_HEADER_BADGE;
    private String entryTitle = FALLBACK_ENTRY_TITLE;
    private String entrySummary = FALLBACK_ENTRY_SUMMARY;
    private String headerSummary = FALLBACK_HEADER_SUMMARY;
    private String errorTitle = FALLBACK_ERROR_TITLE;
    private String errorSummary = FALLBACK_ERROR_SUMMARY;
    private String safetyTitle = FALLBACK_SAFETY_TITLE;
    private String recoveryTitle = FALLBACK_RECOVERY_TITLE;
    private String trialTitle = FALLBACK_TRIAL_TITLE;
    private String titleMode = FALLBACK_TITLE_MODE;
    private String titleCurrent = FALLBACK_TITLE_CURRENT;
    private String labelAuto = FALLBACK_LABEL_AUTO;
    private String labelNew = FALLBACK_LABEL_NEW;
    private String labelLegacy = FALLBACK_LABEL_LEGACY;
    private String sectionStyle = FALLBACK_SECTION_STYLE;
    private String sectionCurrentState = FALLBACK_SECTION_CURRENT_STATE;

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
        initializeText(context);
        return GboardPatchesFeatureAvailability.hasFeature(
                context,
                GboardPatchesFeatureAvailability.FEATURE_SETTINGS_HOMEPAGE);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.Host host) {
        try {
            Context context = host.getContext();
            initializeText(context);
            SharedPreferences preferences = GboardSettingsHomepageSettings.preferences(context);
            GboardSettingsHomepageSettings.ensureDefaults(preferences);
            GboardSettingsHomepageSettings.expireForceNewTrialIfNeeded(preferences);

            String selectedMode = GboardSettingsHomepageSettings.readMode(preferences);
            boolean forceNewSupported = GboardSettingsHomepageSettings.isForceNewSupported(
                    context);
            boolean crashRecoveryActive =
                    GboardSettingsHomepageSettings.isForceNewCrashRecoveryActive(preferences);
            boolean trialExpired =
                    GboardSettingsHomepageSettings.isForceNewTrialExpired(preferences)
                            || GboardSettingsHomepageSettings
                                    .isForceNewTrialWindowExpired(preferences);
            boolean trialArmed =
                    GboardSettingsHomepageSettings.isForceNewTrialArmed(preferences)
                            && !trialExpired;
            long trialRemainingSeconds = GboardSettingsHomepageSettings
                    .readForceNewTrialRemainingSeconds(preferences);
            String currentHomepageLabel =
                    GboardSettingsHomepageSettings.isCurrentHomepageNew(context)
                            ? labelNew
                            : labelLegacy;

            List<GboardPatchesSettingsContract.Row> styleRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            styleRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    titleMode,
                    modeSummary(context, selectedMode, forceNewSupported, crashRecoveryActive,
                            trialArmed, trialExpired),
                    modeLabel(context, selectedMode, crashRecoveryActive, trialArmed,
                            trialExpired),
                    true,
                    () -> showModeDialog(host, preferences),
                    buildSettingsStylePreview(context)));

            List<GboardPatchesSettingsContract.Row> currentStateRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            currentStateRows.add(new GboardPatchesSettingsContract.DetailRow(
                    titleCurrent,
                    currentHomepageSummary(context, currentHomepageLabel, selectedMode,
                            forceNewSupported, crashRecoveryActive, trialArmed, trialExpired),
                    true));

            List<GboardPatchesSettingsContract.StatusBlock> statusBlocks =
                    new ArrayList<GboardPatchesSettingsContract.StatusBlock>();
            if (GboardSettingsHomepageSettings.MODE_FORCE_NEW.equals(selectedMode)
                    && !forceNewSupported) {
                statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                        safetyTitle,
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_settings_homepage_safeguard_summary,
                                "This Android version does not expose the expected expressive"
                                        + " runtime. New still remains selectable, but it runs"
                                        + " under crash recovery protection."),
                        GboardPatchesSettingsContract.StatusTone.WARNING));
            }
            if (GboardSettingsHomepageSettings.MODE_FORCE_NEW.equals(selectedMode)
                    && trialArmed) {
                statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                        trialTitle,
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_settings_homepage_trial_armed_summary,
                                "Open Gboard settings within %1$d seconds. If nothing launches"
                                        + " in that window, it falls back to Legacy"
                                        + " automatically.",
                                trialRemainingSeconds),
                        GboardPatchesSettingsContract.StatusTone.WARNING));
            }
            if (GboardSettingsHomepageSettings.MODE_FORCE_NEW.equals(selectedMode)
                    && crashRecoveryActive) {
                statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                        recoveryTitle,
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_settings_homepage_recovery_summary,
                                "The previous New settings launch did not finish cleanly."
                                        + " Legacy stays active so you can reopen settings and"
                                        + " retry safely."),
                        GboardPatchesSettingsContract.StatusTone.WARNING));
            }
            if (GboardSettingsHomepageSettings.MODE_FORCE_NEW.equals(selectedMode)
                    && trialExpired) {
                statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                        trialTitle,
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_settings_homepage_trial_expired_summary,
                                "The New launch window expired before Gboard opened its"
                                        + " settings page. Legacy stays active until you choose"
                                        + " New again."),
                        GboardPatchesSettingsContract.StatusTone.WARNING));
            }

            return new GboardPatchesSettingsContract.Screen(
                    entryTitle,
                    headerBadge,
                    entryTitle,
                    headerSummary,
                    statusBlocks,
                    Arrays.asList(
                            new GboardPatchesSettingsContract.Section(sectionStyle, styleRows),
                            new GboardPatchesSettingsContract.Section(
                                    sectionCurrentState,
                                    currentStateRows)),
                    trialArmed
                            ? GboardPatchesSettingsContract.RefreshPolicy.liveStatusOnly(
                                    TRIAL_SCREEN_REFRESH_INTERVAL_MS)
                            : GboardPatchesSettingsContract.RefreshPolicy.none());
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render settings homepage feature", throwable);
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

    private void showModeDialog(GboardPatchesSettingsContract.Host host,
            SharedPreferences preferences) {
        host.showChoiceDialog(
                titleMode,
                new String[] { labelAuto, labelNew, labelLegacy },
                new String[] {
                        GboardSettingsHomepageSettings.MODE_AUTO,
                        GboardSettingsHomepageSettings.MODE_FORCE_NEW,
                        GboardSettingsHomepageSettings.MODE_FORCE_LEGACY
                },
                GboardSettingsHomepageSettings.readMode(preferences),
                VALUE_UNUSED,
                () -> {
                },
                value -> GboardSettingsHomepageSettings.writeMode(host.getContext(), value));
    }

    private String modeLabel(Context context, String mode, boolean crashRecoveryActive,
            boolean trialArmed, boolean trialExpired) {
        if (GboardSettingsHomepageSettings.MODE_FORCE_NEW.equals(mode)) {
            if (crashRecoveryActive) {
                return GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_settings_homepage_mode_new_recovered,
                        "New (recovered)");
            }
            if (trialExpired) {
                return GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_settings_homepage_mode_new_expired,
                        "New (expired)");
            }
            if (trialArmed) {
                return GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_settings_homepage_mode_new_armed,
                        "New (armed)");
            }
            return labelNew;
        }
        if (GboardSettingsHomepageSettings.MODE_FORCE_LEGACY.equals(mode)) {
            return labelLegacy;
        }
        return labelAuto;
    }

    private String modeSummary(Context context, String mode, boolean forceNewSupported,
            boolean crashRecoveryActive, boolean trialArmed, boolean trialExpired) {
        if (GboardSettingsHomepageSettings.MODE_FORCE_NEW.equals(mode)) {
            if (crashRecoveryActive) {
                return GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_settings_homepage_mode_summary_new_recovered,
                        "The previous New launch crashed. Legacy stays active until you switch"
                                + " modes or choose New again to retry.");
            }
            if (trialExpired) {
                return GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_settings_homepage_mode_summary_new_expired,
                        "The New launch window expired. Choose New again, then open Gboard"
                                + " settings within 10 seconds to retry.");
            }
            if (trialArmed) {
                return GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_settings_homepage_mode_summary_new_armed,
                        "Open Gboard settings within 10 seconds. If the launch crashes or"
                                + " never starts, it falls back to Legacy automatically.");
            }
            if (!forceNewSupported) {
                return GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_settings_homepage_mode_summary_new_guarded,
                        "New stays available on this Android version, but it runs with"
                                + " automatic fallback protection if the settings launch"
                                + " fails.");
            }
            return GboardSettingsText.get(
                    context,
                    R.string.gboard_patches_settings_homepage_mode_summary_new,
                    "Always use the new settings style. Reopen Gboard settings to apply.");
        }
        if (GboardSettingsHomepageSettings.MODE_FORCE_LEGACY.equals(mode)) {
            return GboardSettingsText.get(
                    context,
                    R.string.gboard_patches_settings_homepage_mode_summary_legacy,
                    "Always use the legacy settings style. Reopen Gboard settings to apply.");
        }
        return GboardSettingsText.get(
                context,
                R.string.gboard_patches_settings_homepage_mode_summary_auto,
                "Follow Gboard automatic selection. Reopen Gboard settings after switching"
                        + " modes.");
    }

    private String currentHomepageSummary(Context context, String currentHomepageLabel,
            String selectedMode, boolean forceNewSupported, boolean crashRecoveryActive,
            boolean trialArmed, boolean trialExpired) {
        if (GboardSettingsHomepageSettings.MODE_FORCE_NEW.equals(selectedMode)
                && (crashRecoveryActive || trialExpired)) {
            return GboardSettingsText.get(
                    context,
                    R.string.gboard_patches_settings_homepage_current_summary_guarded,
                    "Legacy settings style is active right now because New is being held back"
                            + " by the safety guard.");
        }
        if (GboardSettingsHomepageSettings.MODE_FORCE_NEW.equals(selectedMode) && trialArmed) {
            return GboardSettingsText.get(
                    context,
                    R.string.gboard_patches_settings_homepage_current_summary_queued,
                    "New settings style is queued for the next Gboard settings launch.");
        }
        if (GboardSettingsHomepageSettings.MODE_FORCE_NEW.equals(selectedMode)
                && !forceNewSupported) {
            return GboardSettingsText.get(
                    context,
                    R.string.gboard_patches_settings_homepage_current_summary_protected,
                    "New settings style is selected with crash recovery protection on this"
                            + " Android version.");
        }
        return GboardSettingsText.get(
                context,
                R.string.gboard_patches_settings_homepage_current_summary_default,
                "%1$s settings style is active right now.",
                currentHomepageLabel);
    }

    private GboardPatchesSettingsContract.PreviewSpec buildSettingsStylePreview(Context context) {
        return new GboardPatchesSettingsContract.PreviewSpec(
                titleMode,
                "",
                GboardPatchesSettingsContract.PreviewLayout.STACKED,
                new GboardPatchesSettingsContract.PreviewImage(
                        "settings-previews/settingshomepage/settings_style_new.jpg",
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_settings_homepage_preview_new,
                                "New style")),
                new GboardPatchesSettingsContract.PreviewImage(
                        "settings-previews/settingshomepage/settings_style_legacy.jpg",
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_settings_homepage_preview_legacy,
                                "Legacy style")));
    }

    private void initializeText(Context context) {
        headerBadge = GboardSettingsText.get(
                context,
                R.string.gboard_patches_header_badge,
                FALLBACK_HEADER_BADGE);
        entryTitle = GboardSettingsText.get(
                context,
                R.string.gboard_patches_settings_homepage_title,
                FALLBACK_ENTRY_TITLE);
        entrySummary = GboardSettingsText.get(
                context,
                R.string.gboard_patches_settings_homepage_summary,
                FALLBACK_ENTRY_SUMMARY);
        headerSummary = GboardSettingsText.get(
                context,
                R.string.gboard_patches_settings_homepage_header_summary,
                FALLBACK_HEADER_SUMMARY);
        errorTitle = GboardSettingsText.get(
                context,
                R.string.gboard_patches_settings_homepage_error_title,
                FALLBACK_ERROR_TITLE);
        errorSummary = GboardSettingsText.get(
                context,
                R.string.gboard_patches_settings_homepage_error_summary,
                FALLBACK_ERROR_SUMMARY);
        safetyTitle = GboardSettingsText.get(
                context,
                R.string.gboard_patches_settings_homepage_safeguard_title,
                FALLBACK_SAFETY_TITLE);
        recoveryTitle = GboardSettingsText.get(
                context,
                R.string.gboard_patches_settings_homepage_recovery_title,
                FALLBACK_RECOVERY_TITLE);
        trialTitle = GboardSettingsText.get(
                context,
                R.string.gboard_patches_settings_homepage_trial_title,
                FALLBACK_TRIAL_TITLE);
        titleMode = GboardSettingsText.get(
                context,
                R.string.gboard_patches_settings_homepage_mode_title,
                FALLBACK_TITLE_MODE);
        titleCurrent = GboardSettingsText.get(
                context,
                R.string.gboard_patches_settings_homepage_current_title,
                FALLBACK_TITLE_CURRENT);
        labelAuto = GboardSettingsText.get(
                context,
                R.string.gboard_patches_settings_homepage_label_auto,
                FALLBACK_LABEL_AUTO);
        labelNew = GboardSettingsText.get(
                context,
                R.string.gboard_patches_settings_homepage_label_new,
                FALLBACK_LABEL_NEW);
        labelLegacy = GboardSettingsText.get(
                context,
                R.string.gboard_patches_settings_homepage_label_legacy,
                FALLBACK_LABEL_LEGACY);
        sectionStyle = GboardSettingsText.get(
                context,
                R.string.gboard_patches_settings_homepage_section_style,
                FALLBACK_SECTION_STYLE);
        sectionCurrentState = GboardSettingsText.get(
                context,
                R.string.gboard_patches_settings_homepage_section_current_state,
                FALLBACK_SECTION_CURRENT_STATE);
    }
}
