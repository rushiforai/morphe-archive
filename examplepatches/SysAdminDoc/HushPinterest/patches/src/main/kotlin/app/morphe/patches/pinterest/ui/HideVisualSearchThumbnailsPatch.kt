/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Hide visual search thumbnails"

/** Pinterest's stack of rounded pictures. It keeps its name. */
internal const val IMAGE_STACK = "Lcom/pinterest/design/components/images/ImageStack;"

internal const val VISUAL_SEARCH_THUMBNAILS_HOOK = "$UI_HOOKS->visualSearchThumbnails(Ljava/util/ArrayList;)Ljava/util/ArrayList;"

private const val ARRAY_LIST = "Ljava/util/ArrayList;"

/** One read of a pin's visual search crops: where its result lands and in which register. */
internal class CropRead(val method: Method, val resultAt: Int, val register: Int)

private fun call(instruction: Instruction) = (instruction as? ReferenceInstruction)?.reference as? MethodReference

private fun isStatic(instruction: Instruction) =
    instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE

/**
 * The stack on a pin's lens button is the one subclass of [IMAGE_STACK], and only the button builds
 * it. Both pin pages hand the button its pin, then read the pin's crops through one static call and
 * draw the stack when there are three or more. Those reads are what this finds, in the two methods
 * that do all of that.
 */
internal fun BytecodePatchContext.visualSearchCropReads(): List<CropRead> {
    val stacks = mutableListOf<String>()
    classDefForEach { owner -> if (owner.superclass == IMAGE_STACK) stacks += owner.type }
    val stack = stacks.one("$PATCH: the lens button's stack")
    val buttons = mutableListOf<String>()
    classDefForEach { owner ->
        val builds = owner.methods.any { method ->
            method.instructions().any {
                it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == stack
            }
        }
        if (builds) buttons += owner.type
    }
    val button = buttons.one("$PATCH: the lens button")
    val reads = mutableListOf<CropRead>()
    val methods = mutableSetOf<String>()
    classDefForEach { owner ->
        for (method in owner.methods) {
            if (method.returnType != "V" || method.parameterTypes.size != 1 || AccessFlags.STATIC.isSet(method.accessFlags)) continue
            val pin = method.parameters().single()
            val body = method.instructions()
            val handsPin = body.any { instruction ->
                call(instruction)?.let { it.definingClass == button && it.returnType == "V" && it.parameters() == listOf(pin) } == true
            }
            if (!handsPin) continue
            for (at in body.indices) {
                val read = call(body[at]) ?: continue
                if (!isStatic(body[at]) || read.returnType != ARRAY_LIST || read.parameters() != listOf(pin)) continue
                val result = body.getOrNull(at + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT } as? OneRegisterInstruction ?: continue
                reads += CropRead(method, at + 1, result.registerA)
                methods += method.definingClass + method.name
            }
        }
    }
    if (methods.size != 2) throw PatchException("$PATCH: expected the two pin pages' lens setup, found ${methods.size}")
    return reads
}

@Suppress("unused")
val hideVisualSearchThumbnailsPatch = bytecodePatch(
    name = PATCH,
    description = "Keeps a pin's lens button plain, without the little stack of cropped pictures Pinterest puts on it. " +
        "Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Pin page")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hideVisualSearchThumbnails")
        requireStatusMethod("visualSearchThumbnails")
        // Later reads first, so the earlier ones keep their indexes. A pin without crops already
        // reads as nothing here, and the button then stays the plain lens.
        for (read in visualSearchCropReads().sortedByDescending { it.resultAt }) {
            mutable(read.method).addInstructions(read.resultAt + 1, """
                invoke-static/range { v${read.register} .. v${read.register} }, $VISUAL_SEARCH_THUMBNAILS_HOOK
                move-result-object v${read.register}
            """)
        }
        enableCapability("visualSearchThumbnails")
        enableStatus("hideVisualSearchThumbnails")
    }
}
