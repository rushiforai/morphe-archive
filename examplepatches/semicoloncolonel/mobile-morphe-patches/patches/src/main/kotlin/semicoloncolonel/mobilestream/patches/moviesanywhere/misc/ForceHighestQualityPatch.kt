package semicoloncolonel.mobilestream.patches.moviesanywhere.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.moviesanywhere.shared.Constants

// Movies Anywhere 1.54.0 picks quality in two places.
//
// 1. Which edition to play. For each title the server lists every edition:
//    AVC SDR, HEVC SDR, HDR10, and Dolby Vision, each at SD, HD, HD Plus
//    (1080p), and 4K UHD. The app works out the device's band and resolution
//    and plays the closest edition. Widevine L1 is allowed only when the UI
//    mode is a TV, so a phone gets at most HD in AVC SDR, even when it has L1.
//    HD Plus and 4K also need the display to be large enough, and HDR is only
//    chosen together with 4K.
//      - "Full HD on phones" reports the UI mode as a TV. The app still checks
//        the device's real Widevine level and its own list of blocked devices.
//      - "4K and HDR" reports the display as large enough for 4K. The HDR band
//        still follows the display's own HDR10 and Dolby Vision support.
//    The playback session from Movies Anywhere's server can cap the band and
//    resolution further (videoQualityBand, videoMaximumResolution), and that
//    cap stays.
// 2. Which rendition of that edition to play. The app's media3 is renamed. Its
//    AdaptiveTrackSelection picks the highest-bitrate rendition at or below an
//    allowed bitrate from the measured bandwidth. That allowed bitrate is now
//    unlimited, so playback starts and stays at the highest rendition.
//    Renditions media3 excluded after a load error are still skipped.

// Media3's AdaptiveTrackSelection constructor logs this warning; the class
// keeps the string after renaming.
internal object AdaptiveTrackSelectionFingerprint : Fingerprint(
    strings = listOf("Adjusting minDurationToRetainAfterDiscardMs to be at least minDurationForQualityIncreaseMs"),
)

internal object PlaybackCapabilitiesFingerprint : Fingerprint(
    strings = listOf("Device is not a TV, does not support Widevine L1", "Device playback capabilities (AllowL1:"),
)

/**
 * In media3's determineIdealSelectedIndex, each rendition's bitrate is widened
 * to a long and compared with the allowed bitrate. Sets the allowed bitrate to
 * Long.MAX_VALUE just before that comparison. Returns how many were changed.
 */
internal fun MutableMethod.unlimitAllowedBitrate(): Int {
    val instructions = implementation?.instructions?.toList() ?: return 0
    val compares = instructions.indices.filter { index ->
        index > 0 && instructions[index].opcode == Opcode.CMP_LONG &&
            instructions[index - 1].opcode == Opcode.INT_TO_LONG
    }
    compares.asReversed().forEach { index ->
        val allowed = (instructions[index] as ThreeRegisterInstruction).registerC
        addInstruction(index, "const-wide v$allowed, 0x7fffffffffffffffL")
    }
    return compares.size
}

/** Replaces the int result of each call [matches] accepts with [value]. Returns how many. */
internal fun MutableMethod.overrideIntResults(value: Int, matches: (MethodReference) -> Boolean): Int {
    val instructions = implementation?.instructions?.toList() ?: return 0
    val results = instructions.indices.filter { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        reference != null && matches(reference) &&
            instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT
    }
    results.asReversed().forEach { index ->
        val register = (instructions[index + 1] as OneRegisterInstruction).registerA
        addInstruction(index + 2, "const/16 v$register, $value")
    }
    return results.size
}

@Suppress("unused")
val forceHighestQualityPatch = bytecodePatch(
    name = "Force highest quality",
    description = "Plays the highest quality your device and plan allow, instead of lowering it to match " +
        "the measured connection speed. Turn it off if videos buffer.",
    default = false,
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(Constants.REQUIRE_NATIVE_LIBS)

    val highestBitrate by booleanOption(
        key = "highestBitrate",
        default = true,
        title = "Highest bitrate",
        description = "Keeps each title at its highest bitrate, whatever the measured connection speed.",
    )
    val fullHd by booleanOption(
        key = "fullHd",
        default = true,
        title = "Full HD on phones",
        description = "Plays the 1080p edition on a phone with Widevine L1, instead of HD.",
    )
    val uhd by booleanOption(
        key = "uhd",
        default = false,
        title = "4K and HDR",
        description = "Plays the 4K edition, in HDR10 or Dolby Vision when the screen supports it. " +
            "Needs Full HD on phones.",
    )

    execute {
        if (highestBitrate == true) {
            val changed = AdaptiveTrackSelectionFingerprint.classDef.methods
                .filter { it.returnType == "I" && it.parameterTypes.firstOrNull()?.toString() == "J" }
                .sumOf { it.unlimitAllowedBitrate() }
            if (changed != 1) {
                throw PatchException("Force highest quality: expected one bitrate comparison, found $changed")
            }
        }

        val capabilities = PlaybackCapabilitiesFingerprint.method
        if (fullHd == true) {
            val changed = capabilities.overrideIntResults(4) {
                it.definingClass == "Landroid/app/UiModeManager;" && it.name == "getCurrentModeType"
            }
            if (changed != 1) throw PatchException("Force highest quality: UI mode check not found")
        }
        if (uhd == true) {
            // The display size checks: (Display, size class) -> boolean on the
            // same class. The HDR checks take an int and are left alone.
            val changed = capabilities.overrideIntResults(1) {
                it.definingClass == capabilities.definingClass && it.returnType == "Z" &&
                    it.parameterTypes.size == 2 && it.parameterTypes[0].toString() == "Landroid/view/Display;" &&
                    it.parameterTypes[1].toString() != "I"
            }
            if (changed == 0) throw PatchException("Force highest quality: display size check not found")
        }
    }
}
