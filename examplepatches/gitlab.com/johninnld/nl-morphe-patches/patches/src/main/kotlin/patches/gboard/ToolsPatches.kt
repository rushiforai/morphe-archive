package patches.gboard

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.ocr.gboardOcrFeatureMarkerPatch
import patches.gboard.features.ocr.gboardOcrFlagValuePatch
import patches.gboard.features.ocr.gboardOcrModelAssetsPatch
import patches.gboard.features.ocr.gboardOcrBundledRecognizerPatch
import patches.gboard.features.ocr.gboardOcrRuntimePatch
import patches.gboard.features.writingtools.gboardAiWritingToolsFeatureMarkerPatch
import patches.gboard.features.writingtools.gboardAiWritingToolsFlagValuePatch
import patches.gboard.features.advancedvoice.gboardAdvancedVoice1803ZhTwPatch
import patches.gboard.features.advancedvoice.gboardAdvancedVoiceFeatureMarkerPatch
import patches.gboard.features.advancedvoice.gboardAdvancedVoiceFlagValuePatch
import patches.gboard.features.advancedvoice.gboardDictationPayloadAssetsPatch
import patches.gboard.features.advancedvoice.gboardVoiceExtrasRowsPatch
import patches.gboard.features.bluetoothmicrophone.gboardBluetoothMicrophoneFeatureMarkerPatch
import patches.gboard.features.bluetoothmicrophone.gboardBluetoothMicrophoneFlagValuePatch
import patches.gboard.features.betafeatures.gboardBetaFlagFeatureMarkerPatch
import patches.gboard.features.betafeatures.gboardBetaFlagValuePatch
import patches.gboard.features.hiddenflags.gboardHiddenFlagsBootstrapPatch
import patches.gboard.features.hiddenflags.gboardHiddenFlagsFeatureMarkerPatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.features.ramblerextras.gboardRamblerExtrasMarkerPatch
import patches.gboard.shared.gboardPatchesSettingsPatch

/**
 * Gboard's Scan Text (OCR).
 *
 * Gboard can recognise text from the camera, but a re-signed build is refused the
 * Play Services recognition modules. This forces the stock entry point and the
 * language gates open, then repairs the module request and the non-Latin thin
 * recogniser init so the modules can come down normally.
 */
@Suppress("unused")
val gboardOcrScanTextPatch = resourcePatch(
    name = "Enable OCR / Scan Text",
    description = "Enables Gboard's Scan Text camera entry point and runs it with an OCR " +
        "engine bundled in the patch, so it works without Play Services. Latin text only.",
    default = true,
) {
    compatibleWith(gboard)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardOcrFeatureMarkerPatch,
        gboardOcrFlagValuePatch,
        gboardOcrRuntimePatch,
        gboardOcrBundledRecognizerPatch,
        gboardOcrModelAssetsPatch,
    )
}

/**
 * Gboard's AI Writing Tools.
 *
 * The client ships inside Gboard but is gated behind signature-scoped flags plus a
 * v2 intent routing table a re-signed build never receives. This forces the flag
 * tuple and repairs the three init points that otherwise throw on a client type the
 * assistant never learns.
 *
 * Auto Fix / proofread is NOT ported to 18.8: 18.6.3 added INTENT_AUTO_FIX to a
 * route-set builder (`wgv.h(Object)`) that no longer exists, and 18.8 builds the
 * routed set from the `voice_command_intent_types_routed_to_writing_tools_v2` flag
 * (`aeam.f`, an `adgn`) instead. The acceptance shim returns immediately on the 18.8
 * binding, so depending on it would report success for behaviour that was never
 * emitted. Rewrite and tone changes are unaffected.
 */
@Suppress("unused")
val gboardAiWritingToolsPatch = resourcePatch(
    name = "AI Writing Tools",
    description = "Enables Gboard's Writing tools: rewrite and tone changes on selected " +
        "text, in every language and keyboard. Proofread/Auto Fix is not ported to 18.8.",
    default = true,
) {
    compatibleWith(gboard)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardAiWritingToolsFeatureMarkerPatch,
        gboardAiWritingToolsFlagValuePatch,
    )
}

/**
 * New 18.8 beta gates.
 *
 * Five switches that exist in the beta but are off for a re-signed build, each with a live
 * consumer and no model or server dependency: the plain-text quick-paste chip, the floating
 * clipboard chip, invisible floating-keyboard resizing, the Emoji2 provider and the new
 * swipe-to-remove confirmation. The toggle lives under More settings; turning it off restores
 * Gboard's own values.
 */
@Suppress("unused")
val gboardBetaFeaturesPatch = resourcePatch(
    name = "Beta features (18.8)",
    description = "Unlocks five new Gboard 18.8 features that are off by default: plain-text " +
        "quick-paste chip, floating clipboard chip, invisible floating-keyboard resizing, the " +
        "Emoji2 provider and the swipe-to-remove confirmation.",
    default = true,
) {
    compatibleWith(gboard)
    dependsOn(
        gboardPatchesSettingsPatch,
        gboardBetaFlagFeatureMarkerPatch,
        gboardBetaFlagValuePatch,
    )
}

/**
 * Hidden flags.
 *
 * A screen with one switch per curated 18.8 flag. Each switch writes Gboard's own override entry
 * (`adfk.o(name)` for the flag, `adfk.h(adiu.OVERRIDE)` for the store), so the value is applied to
 * the running keyboard directly instead of going through a flag-getter hook. Adding a new boolean
 * gate only needs a catalog entry.
 */
@Suppress("unused")
val gboardHiddenFlagsPatch = resourcePatch(
    name = "Hidden flags (18.8)",
    description = "Adds a Hidden flags screen that forces individual Gboard 18.8 flags through " +
        "Gboard's own override store: app-specific word biasing, the app-specific suggestion bar " +
        "and the square search radius.",
    default = true,
) {
    compatibleWith(gboard)
    dependsOn(
        gboardPatchesSettingsPatch,
        gboardHiddenFlagsFeatureMarkerPatch,
        gboardHiddenFlagsBootstrapPatch,
    )
}

/**
 * Gboard's NGA ("advanced") dictation stack.
 *
 * The client ships in the APK (`AgenticDictationIme`, `libs/genaivoice`) but is gated behind
 * signature-scoped flags a re-signed build never receives. This forces `enable_nga`, the
 * consolidated speech-stack features, split feature-module install and SODA long-form. The engine
 * may still require server eligibility or Google's TTS/Scribe packages.
 */
@Suppress("unused")
val gboardAdvancedVoiceTypingPatch = resourcePatch(
    name = "Advanced voice typing (NGA)",
    description = "Enables Gboard's NGA dictation capabilities, consolidated speech-stack features " +
        "and long-form dictation. Availability depends on Gboard's recognizer eligibility.",
    default = true,
) {
    compatibleWith(gboard)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardAdvancedVoiceFeatureMarkerPatch,
        gboardAdvancedVoiceFlagValuePatch,
        gboardDictationPayloadAssetsPatch,
        gboardVoiceExtrasRowsPatch,
    )
}


/**
 * Optional Rambler toolbar and revert behaviour.
 *
 * Three 18.8 paths that are off in stock Gboard and that the core Rambler patch does not need:
 * the overflow button on the floating Rambler toolbar, keeping the rewritten text when reverting
 * from the full transcript, and passing edit history into a Jetson Lite request (only read while
 * the Lite path is active). Kept as its own patch so the feature is visible in the list.
 */
@Suppress("unused")
val gboardRamblerToolbarExtrasPatch = resourcePatch(
    name = "Rambler toolbar & revert extras (18.8)",
    description = "Adds the overflow button to the floating Rambler toolbar, keeps rewritten " +
        "text when you revert a transcript, and passes edit history on the Jetson Lite path.",
    default = true,
) {
    compatibleWith(gboard)

    dependsOn(
        ramblerVoiceTyping,
        gboardPatchesSettingsPatch,
        gboardRamblerExtrasMarkerPatch,
    )
}

@Suppress("unused")
val gboardRamblerAutomaticRetryPatch = resourcePatch(
    name = "Rambler automatic retry (18.8)",
    description = "Lets Rambler retry eligible recognition errors automatically using the audio " +
        "from the current dictation. Rambler may send that audio to Google again.",
    default = true,
) {
    compatibleWith(gboard)
    dependsOn(ramblerVoiceTyping)

    finalize {
        applyFeatureMarker("dev.jason.gboardpatches.feature.rambler_automatic_retry")
    }
}

/**
 * Gboard's own "Use Bluetooth microphone" voice-typing setting.
 *
 * Stock declares `enable_use_bluetooth_setting` false, so the row never appears on a normal build.
 * This exposes the stock row; whether a recording is captured from the headset is decided by
 * Gboard afterwards (`anis.c(Context)` plus its Android-version and input-device checks, which
 * prefer wired/USB and can exclude car devices).
 */
@Suppress("unused")
val gboardUseBluetoothMicrophonePatch = resourcePatch(
    name = "Use Bluetooth microphone",
    description = "Shows Gboard's Voice typing \u2192 Use Bluetooth microphone setting so dictation " +
        "can capture from a paired headset. Routing stays Gboard's own decision.",
    default = true,
) {
    compatibleWith(gboard)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardBluetoothMicrophoneFeatureMarkerPatch,
        gboardBluetoothMicrophoneFlagValuePatch,
    )
}
