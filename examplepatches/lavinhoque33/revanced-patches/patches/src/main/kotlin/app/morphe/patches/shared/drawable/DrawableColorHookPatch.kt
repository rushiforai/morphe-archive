/*
 * Copyright (C) 2026 anddea
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Original author(s):
 * - anddea (https://github.com/anddea)
 * - inotia00 (https://github.com/inotia00)
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-24.
 *
 * ------------------------------------------------------------------------
 * GPLv3 Section 7 – Additional Terms & Attribution Requirements
 * ------------------------------------------------------------------------
 *
 * This file contains substantial original work by the author(s) listed above.
 *
 * In accordance with Section 7 of the GNU General Public License v3.0,
 * the following additional terms apply to this file:
 *
 * 1. Source Credit Preservation (Section 7(b)): This specific copyright notice
 *    and the list of original authors above must be preserved in any copy
 *    or derivative work. You may add your own copyright notice below it,
 *    but you may not remove the original one.
 *
 * 2. Origin & Modification Marking (Section 7(c)): Modified versions must be
 *    clearly marked as such (e.g., by adding a "Modified by" line or a new
 *    copyright notice) and must not be misrepresented as the original work.
 *
 * 3. Version Control Attribution (Section 7(b)): Any ports or substantial
 *    modifications must retain historical authorship credit in version control
 *    systems (e.g., Git), listing original author(s) appropriately and
 *    modifiers as committers or co-authors.
 *
 * 4. User Interface Attribution (Section 7(b)): Any works containing or
 *    derived from this material must maintain a visible credit or
 *    acknowledgment to the original author(s) within the application's
 *    user interface (e.g., in an "About" or "Credits" section).
 */

package app.morphe.patches.shared.drawable

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.youtube.utils.playservice.is_21_07_or_greater
import app.morphe.patches.youtube.utils.playservice.versionCheckPatch
import app.morphe.util.cloneMutableAndPreserveParameters
import app.morphe.util.indexOfFirstInstructionReversedOrThrow
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private var insertMethod: MutableMethod? = null
private lateinit var insertClass: MutableClass
private var parametersPreserved = false
private var insertIndex: Int = 0
private var insertRegister: Int = 0
private var offset = 0

val drawableColorHookPatch = bytecodePatch(
    description = "drawableColorHookPatch"
) {
    dependsOn(versionCheckPatch)

    execute {
        insertMethod = null
        offset = 0
        parametersPreserved = false

        val match = DrawableColorFingerprint.matchOrNull() ?: return@execute
        val method = match.method
        val paintIndex = method.indexOfFirstInstructionReversedOrThrow {
            val reference = getReference<MethodReference>()
            reference != null && reference.definingClass == "Landroid/graphics/Paint;" && reference.name == "setColor"
        }
        val paintCall = method.getInstruction<Instruction>(paintIndex) as? FiveRegisterInstruction ?: return@execute
        insertMethod = method
        insertClass = match.classDef
        insertIndex = paintIndex
        insertRegister = paintCall.registerD
    }
}

private fun preserveDrawableReceiver(method: MutableMethod): MutableMethod {
    if (parametersPreserved) return method

    // The stock method can overwrite its receiver register with the Paint before setColor.
    val instructionCount = method.implementation!!.instructions.size
    val cloned = method.cloneMutableAndPreserveParameters(insertClass)
    insertIndex += cloned.implementation!!.instructions.size - instructionCount
    insertMethod = cloned
    parametersPreserved = true
    return cloned
}

internal fun addDrawableColorHook(
    methodDescriptor: String,
    highPriority: Boolean = false,
    passDrawable: Boolean = false,
) {
    val method = insertMethod ?: throw PatchException("Litho background drawable color hook unavailable.")
    val target = if (is_21_07_or_greater) preserveDrawableReceiver(method) else method
    val callRegister = if (passDrawable) "p0, v$insertRegister" else "v$insertRegister"
    target.addInstructions(
        if (highPriority) insertIndex else insertIndex + offset,
        """
            invoke-static {$callRegister}, $methodDescriptor
            move-result v$insertRegister
            """
    )
    offset += 2
}

/** Observe the color after all overrides, without replacing what is passed to Paint. */
internal fun addDrawableDrawnColorHook(methodDescriptor: String): Boolean {
    val method = insertMethod ?: return false
    if (!parametersPreserved && method.implementation!!.registerCount > 14) return false
    val target = preserveDrawableReceiver(method)

    // Keep offset unchanged so later color overrides are still inserted before this observer.
    target.addInstruction(
        insertIndex + offset,
        "invoke-static {p0, v$insertRegister}, $methodDescriptor",
    )
    return true
}
