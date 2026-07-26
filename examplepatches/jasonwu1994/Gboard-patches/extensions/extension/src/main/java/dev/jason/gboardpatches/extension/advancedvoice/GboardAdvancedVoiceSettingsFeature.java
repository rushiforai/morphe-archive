package dev.jason.gboardpatches.extension.advancedvoice;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.util.Log;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardAdvancedVoiceSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";
    private static final String APKMIRROR_DOWNLOAD_URL =
            "https://www.apkmirror.com/apk/google-inc/gboard/gboard-the-google-keyboard-17-7-7-932364120-release/gboard-the-google-keyboard-17-7-7-932364120-release-arm64-v8a-android-apk-download/";

    private final String entryTitle;
    private final String entrySummary;
    private final String headerBadge;
    private final String headerSummary;
    private final String errorTitle;
    private final String errorSummary;
    private final String enabledTitle;
    private final String enabledSummary;
    private final String zhTwPunctuationTitle;
    private final String zhTwPunctuationSummary;
    private final String sectionBehavior;
    private final String sectionInformation;
    private final String payloadPresentTitle;
    private final String payloadPresentSummary;
    private final String payloadPresentRequirementTitle;
    private final String payloadPresentRequirementSummary;
    private final String payloadAbsentTitle;
    private final String payloadAbsentSummary;
    private final String payloadAbsentRequirementTitle;
    private final String payloadAbsentRequirementSummary;
    private final String payloadUnknownTitle;
    private final String payloadUnknownSummary;
    private final String payloadUnknownRequirementTitle;
    private final String payloadUnknownRequirementSummary;

    public GboardAdvancedVoiceSettingsFeature(Context context) {
        entryTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_title,
                "Advanced Voice Typing");
        entrySummary = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_summary,
                "Controls whether Advanced Voice Typing is forced on.");
        headerBadge = GboardSettingsText.get(context,
                R.string.gboard_patches_header_badge,
                "Gboard");
        headerSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_header_summary,
                "Voice typing -> Advanced features、 Add punctuation");
        errorTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_error_title,
                "Advanced Voice Typing unavailable");
        errorSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_error_summary,
                "The Advanced Voice Typing settings screen failed to load. "
                        + "Reopen Gboard settings and try again.");
        enabledTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_enabled_title,
                "Enable Advanced Voice Typing");
        enabledSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_enabled_summary,
                "When Advanced Voice Typing is active, a colorful microphone icon appears. "
                        + "Force-stop and restart Gboard for changes to take effect.");
        zhTwPunctuationTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_zh_tw_punctuation_title,
                "Automatically Add Punctuation to Chinese Input");
        zhTwPunctuationSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_zh_tw_punctuation_summary,
                "Requires Voice typing -> Advanced features to be enabled. "
                        + "Force-stop and restart Gboard for changes to take effect.");
        sectionBehavior = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_section_behavior,
                "Behavior");
        sectionInformation = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_section_information,
                "Information");
        payloadPresentTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_payload_present_title,
                "Dictation payload detected");
        payloadPresentSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_payload_present_summary,
                "The currently installed %1$s meets the APK payload requirement for "
                        + "Advanced Voice Typing.");
        payloadPresentRequirementTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_payload_present_requirement_title,
                "Installation requirement (currently met)");
        payloadPresentRequirementSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_payload_present_requirement_summary,
                "No download is needed right now. For future updates or reinstalls, you must "
                        + "still use a bundle or split APKM and apply the patch in Morphe; a "
                        + "standalone APK cannot work.\nTap to view the APKMirror download page");
        payloadAbsentTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_payload_absent_title,
                "Dictation payload not detected");
        payloadAbsentSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_payload_absent_summary,
                "The currently installed %1$s does not contain libdictation_jni.so, which "
                        + "Advanced Voice Typing requires.");
        payloadAbsentRequirementTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_payload_absent_requirement_title,
                "Get a bundle or split APKM");
        payloadAbsentRequirementSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_payload_absent_requirement_summary,
                "Get a bundle or split APKM and apply the patch in Morphe; a standalone APK "
                        + "cannot work.\nTap to open the APKMirror download page");
        payloadUnknownTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_payload_unknown_title,
                "Unable to verify Dictation payload");
        payloadUnknownSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_payload_unknown_summary,
                "The installed APK files for the selected Gboard package could not be "
                        + "inspected.");
        payloadUnknownRequirementTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_payload_unknown_requirement_title,
                "Verify the installation source");
        payloadUnknownRequirementSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_advanced_voice_payload_unknown_requirement_summary,
                "It is currently unclear whether another download is needed. Verify that you "
                        + "used a bundle or split APKM and applied the patch in Morphe; a "
                        + "standalone APK cannot work.\nTap to view the APKMirror download page");
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
                GboardPatchesFeatureAvailability.FEATURE_ADVANCED_VOICE_TYPING);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.Host host) {
        try {
            if (host == null || host.getContext() == null) {
                return buildErrorScreen();
            }

            Context context = host.getContext();
            SharedPreferences preferences = GboardAdvancedVoiceSettings.preferences(context);
            GboardAdvancedVoiceSettings.ensureDefaults(preferences);
            boolean enabled = GboardAdvancedVoiceSettings.readEnabled(preferences);
            boolean zhTwPunctuationEnabled =
                    GboardAdvancedVoiceSettings.readZhTwPunctuationEnabled(preferences);
            GboardDictationPayloadDetector.Detection payloadDetection =
                    GboardDictationPayloadDetector.detect(
                            context,
                            targetPackageNames(context));
            Log.i(TAG, "Loaded Advanced Voice Typing enabled=" + enabled
                    + ", zhTwPunctuationEnabled=" + zhTwPunctuationEnabled
                    + ", payloadStatus=" + payloadDetection.getStatus()
                    + ", payloadPackage=" + payloadDetection.getPackageName());

            List<GboardPatchesSettingsContract.Row> behaviorRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            behaviorRows.add(new GboardPatchesSettingsContract.ToggleRow(
                    enabledTitle,
                    enabledSummary,
                    true,
                    enabled,
                    value -> {
                        GboardAdvancedVoiceSettings.writeEnabled(context, value);
                        Log.i(TAG, "Saved Advanced Voice Typing enabled=" + value);
                    }));
            behaviorRows.add(new GboardPatchesSettingsContract.ToggleRow(
                    zhTwPunctuationTitle,
                    zhTwPunctuationSummary,
                    true,
                    zhTwPunctuationEnabled,
                    value -> {
                        GboardAdvancedVoiceSettings.writeZhTwPunctuationEnabled(
                                context,
                                value);
                        Log.i(TAG, "Saved zh-TW punctuation enabled=" + value);
                    }));

            List<GboardPatchesSettingsContract.Row> informationRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            PayloadGuidance guidance = buildPayloadGuidance(payloadDetection);
            informationRows.add(new GboardPatchesSettingsContract.DetailRow(
                    guidance.statusTitle,
                    guidance.statusSummary,
                    true));
            informationRows.add(new GboardPatchesSettingsContract.CommandRow(
                    guidance.commandTitle,
                    guidance.commandSummary,
                    true,
                    () -> openExternalUrl(context, APKMIRROR_DOWNLOAD_URL)));

            return new GboardPatchesSettingsContract.Screen(
                    entryTitle,
                    headerBadge,
                    entryTitle,
                    headerSummary,
                    Collections.emptyList(),
                    Arrays.asList(
                            new GboardPatchesSettingsContract.Section(
                                    sectionBehavior,
                                    behaviorRows),
                            new GboardPatchesSettingsContract.Section(
                                    sectionInformation,
                                    informationRows)),
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render Advanced Voice Typing settings screen", throwable);
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

    private PayloadGuidance buildPayloadGuidance(
            GboardDictationPayloadDetector.Detection detection) {
        if (detection != null
                && detection.getStatus() == GboardDictationPayloadDetector.Status.PRESENT
                && detection.getPackageName() != null) {
            return new PayloadGuidance(
                    payloadPresentTitle,
                    String.format(payloadPresentSummary, detection.getPackageName()),
                    payloadPresentRequirementTitle,
                    payloadPresentRequirementSummary);
        }
        if (detection != null
                && detection.getStatus() == GboardDictationPayloadDetector.Status.ABSENT
                && detection.getPackageName() != null) {
            return new PayloadGuidance(
                    payloadAbsentTitle,
                    String.format(payloadAbsentSummary, detection.getPackageName()),
                    payloadAbsentRequirementTitle,
                    payloadAbsentRequirementSummary);
        }
        return new PayloadGuidance(
                payloadUnknownTitle,
                payloadUnknownSummary,
                payloadUnknownRequirementTitle,
                payloadUnknownRequirementSummary);
    }


    private static List<String> targetPackageNames(Context context) {
        List<String> packageNames = new ArrayList<String>();
        addPackageName(packageNames, context == null ? null : context.getPackageName());
        addPackageName(packageNames, "com.google.android.inputmethod.latin");
        addPackageName(packageNames, "com.google.android.inputmethod.latin.jason.dev");
        addPackageName(packageNames, "dev.jason.com.google.android.inputmethod.latin");
        return packageNames;
    }

    private static void addPackageName(List<String> packageNames, String packageName) {
        if (packageName != null
                && !packageName.isEmpty()
                && !packageNames.contains(packageName)) {
            packageNames.add(packageName);
        }
    }

    private static void openExternalUrl(Context context, String url) {
        if (context == null || url == null || url.isEmpty()) {
            return;
        }
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to open Advanced Voice download URL", throwable);
        }
    }

    private static final class PayloadGuidance {
        private final String statusTitle;
        private final String statusSummary;
        private final String commandTitle;
        private final String commandSummary;

        private PayloadGuidance(
                String statusTitle,
                String statusSummary,
                String commandTitle,
                String commandSummary) {
            this.statusTitle = statusTitle;
            this.statusSummary = statusSummary;
            this.commandTitle = commandTitle;
            this.commandSummary = commandSummary;
        }
    }
}
