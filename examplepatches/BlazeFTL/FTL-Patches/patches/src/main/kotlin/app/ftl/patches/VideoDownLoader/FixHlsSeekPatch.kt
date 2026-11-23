package app.ftl.patches.videodownloader

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.OpcodesFilter
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private object HlsConvertGateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/util/ArrayList;"
    ),
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.IGET_BOOLEAN,
        Opcode.IF_EQZ,
        Opcode.IGET,
        Opcode.IF_NE,
        Opcode.IPUT_BOOLEAN
    )
)

private object BackgroundConvertGateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_BOOLEAN,
            type = "Z"
        ),
        opcode(Opcode.IF_EQZ, InstructionLocation.MatchAfterImmediately()),
        methodCall(
            smali = "Ljava/lang/System;->currentTimeMillis()J",
            location = InstructionLocation.MatchAfterWithin(5)
        ),
        methodCall(
            smali = "Ljava/lang/Thread;->start()V",
            location = InstructionLocation.MatchAfterWithin(30)
        )
    ),
    custom = { _, classDef ->
        classDef.fields.any { it.type == "Ljava/util/concurrent/LinkedBlockingQueue;" }
    }
)

private fun MethodReference.isCurrentTimeMillis() =
    definingClass == "Ljava/lang/System;" && name == "currentTimeMillis"

@Suppress("unused")
val fixHlsSeekPatch = bytecodePatch(
    name = "Fix HLS seek playback",
    description = "Remuxes classic MPEG-TS HLS downloads to MP4 so seeking in players has no dark frames, " +
        "and runs the conversion when the download finishes even if the app is minimized.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VIDEO_DOWNLOADER)

    execute {
        HlsConvertGateFingerprint.let {
            it.method.removeInstructions(it.instructionMatches[0].index, 2)
        }

        BackgroundConvertGateFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()

            val gateIndices = instructions.indices.filter { index ->
                instructions[index].opcode == Opcode.SGET_BOOLEAN &&
                    instructions.getOrNull(index + 1)?.opcode == Opcode.IF_EQZ &&
                    instructions
                        .subList(index + 2, minOf(index + 7, instructions.size))
                        .any {
                            ((it as? ReferenceInstruction)?.reference as? MethodReference)
                                ?.isCurrentTimeMillis() == true
                        }
            }

            gateIndices.forEach { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                replaceInstruction(index, "const/16 v$register, 0x1")
            }
        }
    }
}
