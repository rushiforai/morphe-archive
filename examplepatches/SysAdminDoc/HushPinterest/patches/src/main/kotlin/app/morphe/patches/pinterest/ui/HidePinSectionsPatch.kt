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
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val DESCRIPTION_PATCH = "Hide pin title and description"
private const val AUTHOR_PATCH = "Hide pin author"

/** What a closeup module asks itself after taking a pin. It keeps its name. */
internal const val CLOSEUP_SHOULD_SHOW = "shouldShowForPin"

internal const val PIN_DESCRIPTION_HOOK = "$EXTENSION_PACKAGE/ui/PinPageSections;->description(Landroid/view/View;I)I"
internal const val PIN_AUTHOR_HOOK = "$EXTENSION_PACKAGE/ui/PinPageSections;->author(Landroid/view/View;I)I"

/**
 * Hands every closeup module's answer to "do I show for this pin" through [hook], which gets the
 * module and the answer and returns the answer to use. The base class's updatePin asks and branches
 * right after, so this is the one place all of a pin page's sections pass through, and a no there
 * takes Pinterest's own path for a section with nothing to show.
 */
internal fun BytecodePatchContext.addCloseupGate(patch: String, hook: String) {
    val owner = classDefByOrNull(CLOSEUP_MODULE) ?: throw PatchException("$patch: $CLOSEUP_MODULE is missing")
    val update = owner.methods.filter {
        it.name == "updatePin" && it.returnType == "V" && it.parameterTypes.size == 1 && it.implementation != null &&
            !AccessFlags.STATIC.isSet(it.accessFlags)
    }.one("$patch: the closeup module's updatePin")
    val body = update.instructions()
    val ask = body.indices.filter { at ->
        val call = (body[at] as? ReferenceInstruction)?.reference as? MethodReference
        call?.name == CLOSEUP_SHOULD_SHOW && call.returnType == "Z" && call.parameterTypes.isEmpty()
    }.one("$patch: the module's $CLOSEUP_SHOULD_SHOW call")
    val answer = body.getOrNull(ask + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT } as? OneRegisterInstruction
        ?: throw PatchException("$patch: nothing reads the $CLOSEUP_SHOULD_SHOW answer")
    val self = update.implementation!!.registerCount - 2
    if (answer.registerA > 15 || self > 15) throw PatchException("$patch: the module's registers don't fit the call")
    mutable(update).addInstructions(ask + 2, """
        invoke-static { p0, v${answer.registerA} }, $hook
        move-result v${answer.registerA}
    """)
}

@Suppress("unused")
val hidePinDescriptionPatch = bytecodePatch(
    name = DESCRIPTION_PATCH,
    description = "Removes the title and description under a pin you open. The likes and comments bar stays, and so " +
        "do the posted date and image size when they're on. Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Pin page")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hidePinDescription")
        requireStatusMethod("pinDescription")
        addCloseupGate(DESCRIPTION_PATCH, PIN_DESCRIPTION_HOOK)
        enableCapability("pinDescription")
        enableStatus("hidePinDescription")
    }
}

@Suppress("unused")
val hidePinAuthorPatch = bytecodePatch(
    name = AUTHOR_PATCH,
    description = "Removes the creator's whole row, picture and name included, from under a pin you open. " +
        "Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Pin page")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hidePinAuthor")
        requireStatusMethod("pinAuthor")
        addCloseupGate(AUTHOR_PATCH, PIN_AUTHOR_HOOK)
        enableCapability("pinAuthor")
        enableStatus("hidePinAuthor")
    }
}
