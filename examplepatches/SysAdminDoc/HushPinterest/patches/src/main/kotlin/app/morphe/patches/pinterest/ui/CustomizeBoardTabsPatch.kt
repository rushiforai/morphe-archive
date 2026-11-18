/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.localRegisterCount
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.extension.requireStub
import app.morphe.patches.pinterest.misc.extension.requireThisIntact
import app.morphe.patches.pinterest.misc.extension.writeStub
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Customize board tabs"
internal const val BOARD_TAB_STYLE = "com.pinterest.STRUCTURED_FEED_LANDING_PAGE_HEADER_STYLE"
internal const val BOARD_TAB_HEADER_BASE = "Landroid/widget/LinearLayout;"
internal const val BOARD_TABS = "$EXTENSION_PACKAGE/ui/BoardTabs;"
internal const val BOARD_TAB_BIND_HOOK = "$BOARD_TABS->bind(Landroid/view/View;Ljava/lang/Object;)V"
internal const val BOARD_TAB_COVER_BASE = "Landroidx/constraintlayout/widget/ConstraintLayout;"
internal const val BOARD_TAB_IMAGE = "Lcom/pinterest/ui/imageview/GenericWebImageView;"
internal const val BOARD_TAB_COVERS = "$EXTENSION_PACKAGE/ui/BoardTabCovers;"
internal const val BOARD_TAB_COVER_HOOK = "$BOARD_TAB_COVERS->coverUrl(Landroid/view/View;Ljava/lang/String;)Ljava/lang/String;"
private const val BUNDLE = "Landroid/os/Bundle;"

/** The screen of a board tab, the method handing its header new data, and the header call in it. */
private class BoardTabTarget(val style: Method, val bind: Method, val call: Int, val header: String)

/**
 * The header is the screen's LinearLayout field, and the binding method is the one passing its own
 * single argument straight to that header. Other screens read the same style string, but none of
 * them has such a header.
 */
private fun BytecodePatchContext.boardTabTarget(): BoardTabTarget =
    methodsWithString(BOARD_TAB_STYLE).filter { it.parameterTypes.isEmpty() && it.returnType == "Z" }.flatMap { style ->
        val owner = classDefBy(style.definingClass)
        val headers = owner.fields.filterNot { AccessFlags.STATIC.isSet(it.accessFlags) }.map { it.type }
            .filter { classDefByOrNull(it)?.superclass == BOARD_TAB_HEADER_BASE }.toSet()
        owner.methods.filter { it.returnType == "V" && it.parameterTypes.size == 1 }.mapNotNull { method ->
            val calls = method.instructions().withIndex().filter { (_, instruction) ->
                val called = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                instruction.opcode == Opcode.INVOKE_VIRTUAL && called != null && called.definingClass in headers &&
                    called.returnType == "V" && called.parameters() == method.parameters()
            }
            calls.singleOrNull()?.let { (index, instruction) ->
                val called = (instruction as ReferenceInstruction).reference as MethodReference
                BoardTabTarget(style, method, index, called.definingClass)
            }
        }
    }.one("$PATCH: the board tab screen")

/** The read of the screen's arguments that the style check starts with. */
private fun BytecodePatchContext.writeScreenArguments(style: Method) {
    val description = style.instructions().firstOrNull { it.opcode == Opcode.IGET_OBJECT }
        ?.let { (it as ReferenceInstruction).reference as FieldReference }
        ?: throw PatchException("$PATCH: the style check reads no screen description")
    val arguments = style.calls().firstOrNull { it.returnType == BUNDLE && it.parameterTypes.isEmpty() }
        ?: throw PatchException("$PATCH: the style check reads no screen arguments")
    writeStub(BOARD_TABS, "screenArguments", 2, """
        check-cast p0, ${description.definingClass}
        iget-object v0, p0, $description
        if-eqz v0, :none
        invoke-interface { v0 }, $arguments
        move-result-object v0
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
    """)
}

/** A web image loading a String that the instruction right before has just read from a field. */
private fun Method.loadsCoverAt(index: Int): Boolean {
    val body = instructions()
    val call = body[index]
    val called = (call as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    if (index == 0 || call.opcode != Opcode.INVOKE_VIRTUAL || called.definingClass != BOARD_TAB_IMAGE ||
        called.returnType != "V" || called.parameters() != listOf("Ljava/lang/String;")
    ) return false
    val read = body[index - 1]
    val field = (read as? ReferenceInstruction)?.reference as? FieldReference ?: return false
    return read.opcode == Opcode.IGET_OBJECT && field.type == "Ljava/lang/String;" &&
        (read as OneRegisterInstruction).registerA == (call as FiveRegisterInstruction).registerD
}

/**
 * The header's inner layout loads its picture in the method taking the same data as the header. A
 * picture Pinterest leaves out still reaches its loader as before, and the hook can skip a real one.
 */
private fun BytecodePatchContext.installBoardTabCovers(target: BoardTabTarget) {
    val inner = classDefBy(target.header).fields.map { it.type }
        .filter { classDefByOrNull(it)?.superclass == BOARD_TAB_COVER_BASE }.distinct()
        .one("$PATCH: the header's picture layout")
    val parameters = target.bind.parameters()
    val (method, index) = classDefBy(inner).methods.filter { it.returnType == "V" && it.parameters() == parameters }
        .flatMap { candidate -> candidate.instructions().indices.filter { candidate.loadsCoverAt(it) }.map { candidate to it } }
        .one("$PATCH: the picture load")
    val instruction = method.instructions()[index]
    val load = instruction as FiveRegisterInstruction
    val image = load.registerC
    val url = load.registerD
    if (image > 15 || url > 15) throw PatchException("$PATCH: the picture load's registers are out of range")
    writeStub(BOARD_TAB_COVERS, "loadCover", 2, """
        check-cast p0, $BOARD_TAB_IMAGE
        invoke-virtual { p0, p1 }, ${(instruction as ReferenceInstruction).reference}
        return-void
    """)
    val patched = mutable(method)
    patched.addInstructionsWithLabels(
        index,
        """
            if-eqz v$url, :hush_cover_load
            invoke-static { v$image, v$url }, $BOARD_TAB_COVER_HOOK
            move-result-object v$url
            if-eqz v$url, :hush_cover_done
        """,
        ExternalLabel("hush_cover_load", patched.getInstruction(index)),
        ExternalLabel("hush_cover_done", patched.getInstruction(index + 1)),
    )
    enableCapability("boardTabCovers")
}

@Suppress("unused")
val customizeBoardTabsPatch = bytecodePatch(
    name = PATCH,
    description = "Tidies the top of board tabs on Home. You can hide the See board button and the More ideas for " +
        "line and move the board name. You can also stop the picture changing by keeping it or by choosing a pin, " +
        "a photo from your phone or plain black. Starts off. Turn them on in HushPinterest settings > Interface.",
) {
    category("Navigation")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("boardTabs")
        requireStatusMethod("boardTabHeader")
        requireStatusMethod("boardTabCovers")
        requireStub(BOARD_TABS, "screenArguments")
        requireStub(BOARD_TAB_COVERS, "loadCover")
        val target = boardTabTarget()
        val call = target.bind.instructions()[target.call] as FiveRegisterInstruction
        val self = target.bind.localRegisterCount()
        if (call.registerC > 15 || self > 15) throw PatchException("$PATCH: the header call's registers are out of range")
        target.bind.requireThisIntact(PATCH, listOf(target.call))
        writeScreenArguments(target.style)
        mutable(target.bind).addInstructions(target.call, "invoke-static { v${call.registerC}, v$self }, $BOARD_TAB_BIND_HOOK")
        enableCapability("boardTabHeader")
        optionalTarget(PATCH, "Board tab covers") { installBoardTabCovers(target) }
        enableStatus("boardTabs")
    }
}
