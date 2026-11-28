package semicoloncolonel.mobilestream.patches.fandango.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.fandango.shared.Constants

// Fandango at Home for Android TV 10.20.a016 picks quality in two places.
//
// 1. Which edition to play (SD, HD, HDX, or 4K UHD). At launch the app works
//    out the device's highest edition from its DRM level, the display's
//    physical width, and the HDCP level, and stores it as
//    maxPlaybackVideoQuality. A display narrower than 3600 pixels caps it at
//    HDX. The "4K on any display" option reports the display as 3840 pixels
//    wide. The Widevine L1 check, the HDCP cap, and the account's own limit
//    (maxPlayableVideoQuality from Fandango's server) still apply, since a 4K
//    license needs them anyway.
// 2. Which rendition of that edition to play. The app's media3 is renamed. Its
//    AdaptiveTrackSelection, and the app's own subclass of it that reads each
//    segment's bitrate, both pick the highest-bitrate rendition at or below
//    one allowed bitrate, which comes from the measured bandwidth. That
//    allowed bitrate is now unlimited, so playback starts and stays at the
//    highest rendition. Renditions media3 excluded after a load error are
//    still skipped.

// Media3's AdaptiveTrackSelection constructor logs this warning; the class
// keeps the string after renaming.
internal object AdaptiveTrackSelectionFingerprint : Fingerprint(
    strings = listOf("Adjusting minDurationToRetainAfterDiscardMs to be at least minDurationForQualityIncreaseMs"),
)

// DeviceInfoManager's static edition check: DRM level first, then the Fire TV
// model, then the display width.
internal object MaxEditionFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Landroid/graphics/Point;", "L", "Ljava/lang/String;"),
    strings = listOf("widevine_L1", "playready_SL3000", "AFTMM"),
)

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
    val anyDisplay by booleanOption(
        key = "anyDisplay",
        default = false,
        title = "4K on any display",
        description = "Offers 4K UHD editions when the TV output is below 4K. " +
            "The device still needs Widevine L1 and HDCP 2.2.",
    )

    execute {
        if (highestBitrate == true) {
            val selection = AdaptiveTrackSelectionFingerprint.classDef
            // getAllocatedBandwidth(long chunkDurationUs), the allowed bitrate.
            val allowed = selection.methods.filter { method ->
                method.returnType == "J" && method.parameterTypes == listOf("J") &&
                    AccessFlags.STATIC.isSet(method.accessFlags).not()
            }
            if (allowed.size != 1) {
                throw PatchException("Force highest quality: expected one allowed-bitrate method, found ${allowed.size}")
            }
            allowed.single().addInstructions(
                0,
                """
                    const-wide v0, 0x7fffffffffffffffL
                    return-wide v0
                """,
            )
        }

        if (anyDisplay == true) {
            val method = MaxEditionFingerprint.method
            val instructions = method.implementation!!.instructions.toList()
            val index = instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.IGET &&
                    ((instruction as ReferenceInstruction).reference as FieldReference).let {
                        it.definingClass == "Landroid/graphics/Point;" && it.name == "x"
                    }
            }
            if (index < 0) throw PatchException("Force highest quality: no display width read")
            val register = (instructions[index] as TwoRegisterInstruction).registerA
            method.addInstruction(index + 1, "const/16 v$register, 0xf00")
        }
    }
}
