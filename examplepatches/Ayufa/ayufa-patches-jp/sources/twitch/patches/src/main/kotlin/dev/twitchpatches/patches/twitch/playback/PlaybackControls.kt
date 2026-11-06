package dev.twitchpatches.patches.twitch.playback

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.twitchpatches.patches.twitch.shared.*

internal object StreamSettingsModelFingerprint : Fingerprint(
    strings = listOf(
        string("StreamSettingsModel(configurablePlayer=", StringComparisonType.STARTS_WITH),
        string("applyDjRestrictions=", StringComparisonType.CONTAINS),
    ),
)

private class PlaybackSettingsDjBuilderFingerprint(model: String) : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Ltv/twitch/android/models/channel/ChannelModel;",
            name = "isParticipatingDJ",
            returnType = "Z",
        ),
        methodCall(
            definingClass = model,
            name = "<init>",
        ),
    )
)

internal fun BytecodePatchContext.restoreNativePlaybackControls() {
    val model = StreamSettingsModelFingerprint.originalClassDef.type
    val builderFingerprint = PlaybackSettingsDjBuilderFingerprint(model)
    val builder = builderFingerprint.originalMethod
    val code = builder.code()
    val read = code.withIndex().filter {
        isDjStatus((it.value as? ReferenceInstruction)?.reference as? MethodReference)
    }.uniqueHook("playback settings DJ read").index
    val result = code.getOrNull(read + 1) as? OneRegisterInstruction
        ?: throw PatchException("Playback settings: DJ result register missing.")
    require(code[read + 1].opcode == Opcode.MOVE_RESULT && result.registerA <= 255) {
        "Playback settings: DJ result contract changed."
    }
    builderFingerprint.method.replaceInstruction(read + 1, "const/16 v${result.registerA}, 0x0")
    restoreNativeBackgroundPlayback()
}

internal fun isDjStatus(reference: MethodReference?): Boolean = reference?.definingClass ==
    "Ltv/twitch/android/models/channel/ChannelModel;" && reference.name == "isParticipatingDJ" &&
    reference.parameterTypes.isEmpty() && reference.returnType == "Z"
