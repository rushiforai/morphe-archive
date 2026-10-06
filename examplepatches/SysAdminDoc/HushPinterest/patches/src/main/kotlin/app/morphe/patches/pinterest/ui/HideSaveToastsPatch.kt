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
import app.morphe.patches.pinterest.misc.extension.handleTargets
import app.morphe.patches.pinterest.misc.extension.parameterRegisterNumber
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.extension.writeStub
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.extendsClass
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

private const val PATCH = "Hide save toasts"
internal const val TOAST_CONTAINER = "Lcom/pinterest/gestalt/toast/PinterestToastContainer;"
private const val TOAST_VIEW = "Lcom/pinterest/gestalt/toast/BaseGestaltToast;"

/** Resource names of the save confirmations' text, as the toast models that build them read them. */
internal val SAVE_TOAST_STRINGS = setOf("saved_to", "saved_onto_board_bold", "pinned", "pinned_multiple", "pinned_multiple_to_board")

/** The enum constant the follow suggestion after a save names when you open its creator. */
internal const val FOLLOW_UPSELL = "FollowUpsellToast"

@Suppress("unused")
val hideSaveToastsPatch = bytecodePatch(
    name = PATCH,
    description = "Stops the pop-up Pinterest shows after you save a pin, such as \"Saved to\" your board or " +
        "the suggestion to follow the pin's creator. The pin is still saved.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("hideSaveToasts")
        requireStatusMethod("saveToasts")
        val show = toastShowMethod()
        val model = show.parameterTypes.single().toString()
        val (saved, follow) = saveToastModels(model)
        val found = handleTargets(PATCH, "save toasts", listOf("saved to board" to saved, "follow suggestion" to follow)) { (what, types) ->
            if (types.isEmpty()) "no $what toast was found" else null
        }
        val types = (saved + follow).distinct()
        val method = mutable(show)
        val register = method.freeLocalsAt(PATCH, 0, 1).single()
        val toast = method.parameterRegisterNumber(0)
        if (toast > 15) throw PatchException("$PATCH: the toast container's model register is past v15")
        // Instance checks the extension asks when a toast reaches the container.
        writeStub(UI_HOOKS, "isSaveToast", 2, types.joinToString("\n") { type ->
            "instance-of v0, p0, $type\nif-nez v0, :hush_save_toast"
        } + "\nconst/4 v0, 0x0\nreturn v0\n:hush_save_toast\nconst/4 v0, 0x1\nreturn v0")
        method.addInstructionsWithLabels(0, """
            invoke-static { v$toast }, $UI_HOOKS->hideSaveToast(Ljava/lang/Object;)Z
            move-result v$register
            if-eqz v$register, :hush_show_toast
            return-void
        """, ExternalLabel("hush_show_toast", method.getInstruction(0)))
        if (found == 2) enableCapability("saveToasts")
        enableStatus("hideSaveToasts")
    }
}

/** The container's one method that takes a toast model and asks it for its view. */
internal fun BytecodePatchContext.toastShowMethod(): Method {
    val container = classDefByOrNull(TOAST_CONTAINER) ?: throw PatchException("$PATCH: Pinterest's toast container wasn't found")
    return container.methods.filter { method ->
        val model = method.parameterTypes.singleOrNull()?.toString()
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" && model != null &&
            method.calls().any { it.definingClass == model && it.returnType == TOAST_VIEW && it.parameters() == listOf(TOAST_CONTAINER) }
    }.one("$PATCH: toast container show method")
}

/** Concrete toast models whose own methods read a save confirmation's text, and the follow suggestion's. */
internal fun BytecodePatchContext.saveToastModels(model: String): Pair<List<String>, List<String>> {
    val saved = mutableListOf<String>()
    val follow = mutableListOf<String>()
    classDefForEach { owner ->
        if (AccessFlags.ABSTRACT.isSet(owner.accessFlags) || AccessFlags.INTERFACE.isSet(owner.accessFlags) ||
            owner.type == model || !extendsClass(owner.type, model)) return@classDefForEach
        val fields = owner.methods.flatMap { it.fields() }
        if (fields.any { it.type == "I" && it.name in SAVE_TOAST_STRINGS }) saved += owner.type
        if (fields.any { it.name == FOLLOW_UPSELL && it.type == it.definingClass }) follow += owner.type
    }
    return saved.sorted() to follow.sorted()
}
