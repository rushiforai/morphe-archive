package dev.twitchpatches.patches.twitch.playback

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import dev.twitchpatches.patches.twitch.shared.*

internal fun BytecodePatchContext.restoreNativePlaybackControls() {
    val models = mutableListOf<String>()
    classDefForEach { type ->
        if (type.methods.any { method ->
            val strings = method.references().filterIsInstance<StringReference>().map { it.string }
            strings.any { it.startsWith("StreamSettingsModel(configurablePlayer=") } &&
                strings.any { it.contains("applyDjRestrictions=") }
        }) models.add(type.type)
    }
    val model = models.uniqueHook("native playback settings model")
    val builders = mutableListOf<com.android.tools.smali.dexlib2.iface.Method>()
    classDefForEach { type ->
        type.methods.filterTo(builders) { method ->
            val calls = method.references().filterIsInstance<MethodReference>()
            calls.any { it.definingClass == model && it.name == "<init>" } && calls.any(::isDjStatus)
        }
    }
    val builder = builders.uniqueHook("native playback settings DJ status")
    val code = builder.code()
    val read = code.withIndex().filter {
        isDjStatus((it.value as? ReferenceInstruction)?.reference as? MethodReference)
    }.uniqueHook("playback settings DJ read").index
    val result = code.getOrNull(read + 1) as? OneRegisterInstruction
        ?: throw PatchException("Playback settings: DJ result register missing.")
    require(code[read + 1].opcode == Opcode.MOVE_RESULT && result.registerA <= 255) {
        "Playback settings: DJ result contract changed."
    }
    mutableClassDefBy(builder.definingClass).methods.single { it.reference == builder.reference }
        .replaceInstruction(read + 1, "const/16 v${result.registerA}, 0x0")
}

private fun isDjStatus(reference: MethodReference?): Boolean = reference?.definingClass ==
    "Ltv/twitch/android/models/channel/ChannelModel;" && reference.name == "isParticipatingDJ" &&
    reference.parameterTypes.isEmpty() && reference.returnType == "Z"
