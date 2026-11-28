package semicoloncolonel.mobilestream.patches.cbsnews.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.cbsnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// CBS News for Android TV 8.6.0 picks quality in two places.
//
// 1. Which renditions are allowed. The Paramount AVIA player's configuration
//    has a maximum bitrate and a maximum video height, which CBS can set for
//    each device model from its server. Both apply only when they are above
//    zero. The "Ignore device limits" option reports both as unset.
// 2. Which allowed rendition to play. The app's ExoPlayer is renamed. Its
//    AdaptiveTrackSelection, and AVIA's subclass that scales each rendition's
//    bitrate, pick the highest rendition at or below one allowed bitrate,
//    which comes from the measured bandwidth. That allowed bitrate is now
//    unlimited. AVIA's buffer-driven mode measures bandwidth on its own and is
//    not affected; the app does not turn that mode on.

internal object AdaptiveTrackSelectionFingerprint : Fingerprint(
    strings = listOf("Adjusting minDurationToRetainAfterDiscardMs to be at least minDurationForQualityIncreaseMs"),
)

internal object AviaConfigToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("Config{minBitrate="),
)

// The getter of the field toString prints after [label].
private fun MutableClass.getterAfter(toString: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>, label: String) =
    run {
        val at = toString.indexOfFirst {
            it.opcode == Opcode.CONST_STRING && ((it as ReferenceInstruction).reference as StringReference).string == label
        }
        if (at < 0) throw PatchException("Force highest quality: \"$label\" not in AVIA's Config")
        val field = toString.drop(at).firstNotNullOfOrNull {
            ((it as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf { ref -> ref.definingClass == type }
        } ?: throw PatchException("Force highest quality: no field after \"$label\"")
        methods.singleOrNull { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@singleOrNull false
            method.parameterTypes.isEmpty() && instructions.size == 2 &&
                ((instructions[0] as? ReferenceInstruction)?.reference as? FieldReference)?.name == field.name
        } ?: throw PatchException("Force highest quality: no getter for ${field.name}")
    }

@Suppress("unused")
val forceHighestQualityPatch = bytecodePatch(
    name = "Force highest quality",
    description = "Plays each video at its highest quality instead of lowering it to match the measured " +
        "connection speed.",
    default = false,
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(Constants.REQUIRE_NATIVE_LIBS)

    val highestBitrate by booleanOption(
        key = "highestBitrate",
        default = true,
        title = "Highest bitrate",
        description = "Keeps each video at its highest bitrate, whatever the measured connection speed.",
    )
    val ignoreDeviceLimits by booleanOption(
        key = "ignoreDeviceLimits",
        default = true,
        title = "Ignore device limits",
        description = "Ignores the bitrate and resolution limits CBS can set for your device model.",
    )

    execute {
        if (highestBitrate == true) {
            val selection = AdaptiveTrackSelectionFingerprint.classDef
            // determineIdealSelectedIndex(long, long) asks for the allowed bitrate first.
            val ideal = selection.methods.singleOrNull { method ->
                method.returnType == "I" && method.implementation != null &&
                    method.parameterTypes.map { it.toString() } == listOf("J", "J")
            } ?: throw PatchException("Force highest quality: no rendition picker")
            val allowedCall = ideal.implementation!!.instructions.firstNotNullOfOrNull {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf { ref ->
                    ref.definingClass == selection.type && ref.returnType == "J" &&
                        ref.parameterTypes.map { type -> type.toString() } == listOf("J")
                }
            } ?: throw PatchException("Force highest quality: no allowed-bitrate call")
            selection.methods.single { it.name == allowedCall.name && it.parameterTypes.size == 1 }
                .addInstructions(
                    0,
                    """
                        const-wide v0, 0x7fffffffffffffffL
                        return-wide v0
                    """,
                )
        }

        if (ignoreDeviceLimits == true) {
            val config = AviaConfigToStringFingerprint.classDef
            val toString = AviaConfigToStringFingerprint.method.implementation!!.instructions.toList()
            config.getterAfter(toString, ", maxBitrate=").returnEarly("const-wide/16 v0, -0x1\nreturn-wide v0")
            config.getterAfter(toString, ", maxVideoSize=").returnEarly("const/4 v0, -0x1\nreturn v0")
        }
    }
}
