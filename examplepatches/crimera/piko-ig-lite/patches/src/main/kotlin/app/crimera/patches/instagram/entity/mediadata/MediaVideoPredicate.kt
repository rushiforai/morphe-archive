/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.entity.mediadata

import app.crimera.patches.common.requireExactlyOne
import app.crimera.patches.instagram.models.MEDIA_DESCRIPTOR
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

/**
 * Riff's remote-media validators require a video URL only for video media. Resolve the Media
 * predicate whose false edge skips that URL producer and whose true edge reaches it in a straight
 * line. Logging mappers are not a model contract: on 452 the ASL mapper stopped receiving Media.
 * Repeated validator call sites must agree on exactly one callable predicate.
 */
internal fun resolveMediaVideoPredicate(
    validator: ClassDef,
    media: ClassDef,
): MethodReference {
    val candidates = validator.methods.flatMap { method ->
        val instructions = method.implementation?.instructions?.toList().orEmpty()
        val offsets = instructions.runningFold(0) { offset, instruction -> offset + instruction.codeUnits }
        instructions.indices.mapNotNull { index ->
            val call = instructions[index]
            if (call.opcode != Opcode.INVOKE_VIRTUAL && call.opcode != Opcode.INVOKE_VIRTUAL_RANGE) return@mapNotNull null
            val reference = call.getReference<MethodReference>() ?: return@mapNotNull null
            if (reference.definingClass != MEDIA_DESCRIPTOR || reference.parameterTypes.isNotEmpty() || reference.returnType != "Z") {
                return@mapNotNull null
            }

            // Invoke/result/branch adjacency is the DEX contract, not a release instruction index.
            val result = instructions.getOrNull(index + 1) ?: return@mapNotNull null
            val branch = instructions.getOrNull(index + 2) ?: return@mapNotNull null
            if (result.opcode != Opcode.MOVE_RESULT || branch.opcode != Opcode.IF_EQZ) return@mapNotNull null
            if ((result as OneRegisterInstruction).registerA != (branch as OneRegisterInstruction).registerA) return@mapNotNull null
            val targetOffset = offsets[index + 2] + (branch as OffsetInstruction).codeOffset
            val targetIndex = offsets.indexOf(targetOffset)
            if (targetIndex <= index + 3 || targetIndex >= instructions.size) return@mapNotNull null

            val fallthrough = instructions.subList(index + 3, targetIndex)
            val producerIndex = fallthrough.indexOfFirst { instruction ->
                instruction.opcode.setsResult() &&
                    instruction.getReference<MethodReference>()?.returnType == "Lcom/instagram/model/mediasize/VideoUrlImpl;"
            }
            if (producerIndex < 0) return@mapNotNull null
            if (fallthrough.getOrNull(producerIndex + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) return@mapNotNull null
            if (fallthrough.take(producerIndex + 1).any { it is OffsetInstruction || !it.opcode.canContinue() }) return@mapNotNull null
            ImmutableMethodReference(reference.definingClass, reference.name, reference.parameterTypes, reference.returnType)
        }
    }.distinctBy { it.toString() }
    val predicate = requireExactlyOne("Media video predicate gating Riff video URL selection", candidates)
    val declaration = requireExactlyOne(
        "Media video predicate declaration $predicate",
        media.methods.filter { it.name == predicate.name && it.parameterTypes.isEmpty() && it.returnType == "Z" },
    )
    if (!AccessFlags.PUBLIC.isSet(declaration.accessFlags) || AccessFlags.STATIC.isSet(declaration.accessFlags)) {
        throw PatchException("Media video predicate is not a public instance method: $declaration")
    }
    return predicate
}
