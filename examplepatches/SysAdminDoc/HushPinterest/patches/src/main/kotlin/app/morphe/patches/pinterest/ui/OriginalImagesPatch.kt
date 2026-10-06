/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH = "Original-quality images"

/** The text Pinterest's image model writes before its first rendition, followed by the other three. */
internal const val IMAGE_DESCRIPTION = "Image(largeInternal="
internal const val IMAGE_ORIGINAL = ", original="

/**
 * Pinterest's image model holds four renditions and answers the large one first, then the
 * original, medium and small. While the switch is on, its chooser answers the original first
 * wherever Pinterest supplied one, and keeps its own order otherwise.
 *
 * Found by reading 14.38.0 and 14.25.0 (2026-10-05). The model keeps its description text in both.
 */
@Suppress("unused")
val originalImagesPatch = bytecodePatch(
    name = PATCH,
    description = "Has Pinterest's image model pick the original image before its large size wherever Pinterest " +
        "supplied one. Uses more data.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("originalImages")
        requireStatusMethod("imageChooser")
        val (chooser, original) = imageChooser()
        val method = mutable(chooser)
        val answer = method.freeLocalsAt(PATCH, 0, 1).single()
        method.addInstructionsWithLabels(0, """
            invoke-static { }, $UI_HOOKS->originalImages()Z
            move-result v$answer
            if-eqz v$answer, :hush_image_order
            iget-object v$answer, p0, $original
            if-eqz v$answer, :hush_image_order
            return-object v$answer
        """, ExternalLabel("hush_image_order", method.getInstruction(0)))
        enableCapability("imageChooser")
        enableStatus("originalImages")
    }
}

/** Each label the image model's description writes, with the field it writes after it. */
internal fun Method.imageLabels(): Map<String, FieldReference> {
    val labels = linkedMapOf<String, FieldReference>()
    var label: String? = null
    for (instruction in instructions()) {
        val reference = (instruction as? ReferenceInstruction)?.reference
        if (reference is StringReference) label = reference.string
        if (instruction.opcode == Opcode.IGET_OBJECT && reference is FieldReference && label != null) {
            labels[label] = reference
            label = null
        }
    }
    return labels
}

/**
 * The image model's rendition chooser and its original rendition: the model's one instance method,
 * taking nothing and answering a rendition, that reads all four and starts with the large one.
 */
internal fun BytecodePatchContext.imageChooser(): Pair<Method, FieldReference> {
    val description = methodsWithString(IMAGE_DESCRIPTION).filter { it.name == "toString" }.one("$PATCH: image model")
    val labels = description.imageLabels()
    val large = labels[IMAGE_DESCRIPTION]
    val original = labels[IMAGE_ORIGINAL]
    val renditions = labels.values.toSet()
    if (large == null || original == null || renditions.size != 4 || renditions.any { it.type != large.type || it.definingClass != description.definingClass }) {
        throw PatchException("$PATCH: Pinterest's image model no longer describes four renditions of one kind")
    }
    val chooser = classDefBy(description.definingClass).methods.filter { method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.isEmpty() && method.returnType == large.type &&
            method.fields().toSet().containsAll(renditions)
    }.one("$PATCH: image rendition chooser")
    val first = chooser.instructions().firstOrNull()
    if (first?.opcode != Opcode.IGET_OBJECT || (first as ReferenceInstruction).reference != large) {
        throw PatchException("$PATCH: the image chooser no longer starts with the large rendition")
    }
    return chooser to original
}
