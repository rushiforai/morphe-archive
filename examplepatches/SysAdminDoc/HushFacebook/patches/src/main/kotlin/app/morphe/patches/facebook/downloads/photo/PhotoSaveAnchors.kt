/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.downloads.photo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Where the photo viewer decides on Save photo, read from 577, 580 and 581.
 *
 * Facebook's photo viewer (MediaGalleryMenuHelper, a name Redex keeps in the class) builds its
 * menu in one method and offers Save photo (item 0x7d5) when the photo's `can_viewer_download`
 * is true, it isn't a Video, and the post isn't marked work-sensitive. The viewer's menu button
 * asks the same of each item before it shows (581 `LX/8pC;->A0Z`), so it reads the flag too. Both
 * reads look alike in every build: `const` of the field's hash, `TreeJNI.getBooleanValue`, its
 * `move-result`, an `if-eqz` on that result, then the photo's type name against "Video". The
 * video player's own menus read the flag for their Download video item without the "Video" test,
 * and this leaves them alone.
 *
 * The item's action comes from `newSavePhotoAction`, a name Redex keeps on the menu's builder
 * (581 `LX/9QR;`). Its listener saves the image the viewer already loaded, through Facebook. The
 * patch wraps that listener so a tap saves through Hushfacebook first, and Facebook's runs when
 * that can't start.
 */
internal const val PHOTO_PATCH = "Download any photo"

internal const val PHOTO_SAVE = "$EXTENSION_PACKAGE/download/PhotoSave;"
internal const val OFFERS_PHOTO_SAVE = "$PHOTO_SAVE->offersSave(Z)Z"
internal const val MENU_LISTENER = "Landroid/view/MenuItem\$OnMenuItemClickListener;"
internal const val WRAP_SAVE_ACTION = "$PHOTO_SAVE->saveAction(${MENU_LISTENER}Ljava/lang/Object;)$MENU_LISTENER"

/** The kept name of the builder method that makes Save photo's listener. */
internal const val SAVE_PHOTO_ACTION = "newSavePhotoAction"

/** The photo's flag the poster's settings decide, by the hash Facebook's models look it up by. */
internal val CAN_VIEWER_DOWNLOAD = "can_viewer_download".hashCode()

private const val TREE = "Lcom/facebook/graphservice/tree/TreeJNI;"
private const val VIDEO_TYPE = "Video"

/** How far past the `if-eqz` the "Video" test may sit. Every build has it three instructions on. */
private const val VIDEO_TEST_REACH = 5

/**
 * The index of each photo-menu read of `can_viewer_download` in [method]'s code: the index of the
 * `if-eqz` right after its `move-result`, where the hook goes.
 */
internal fun photoDownloadGates(method: Method): List<Int> {
    val code = method.implementation?.instructions?.toList() ?: return emptyList()
    return code.indices.filter { isPhotoDownloadGate(code, it) }.map { it + 2 }
}

private fun isPhotoDownloadGate(code: List<Instruction>, at: Int): Boolean {
    val read = code[at]
    if (read.opcode != Opcode.INVOKE_VIRTUAL) return false
    val called = (read as ReferenceInstruction).reference as? MethodReference ?: return false
    if (called.definingClass != TREE || called.name != "getBooleanValue" || called.parameterTypes.map(CharSequence::toString) != listOf("I")) {
        return false
    }
    val key = code.getOrNull(at - 1) ?: return false
    if (key !is NarrowLiteralInstruction || key.narrowLiteral != CAN_VIEWER_DOWNLOAD) return false
    if ((key as OneRegisterInstruction).registerA != (read as FiveRegisterInstruction).registerD) return false
    val result = code.getOrNull(at + 1) ?: return false
    if (result.opcode != Opcode.MOVE_RESULT) return false
    val flag = (result as OneRegisterInstruction).registerA
    val branch = code.getOrNull(at + 2) ?: return false
    if (branch.opcode != Opcode.IF_EQZ || (branch as OneRegisterInstruction).registerA != flag) return false
    return code.subList(at + 3, minOf(code.size, at + 3 + VIDEO_TEST_REACH)).any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == VIDEO_TYPE
    }
}

/** The builder's Save photo action: an instance method by the kept name taking the photo and answering a listener. */
internal fun isSavePhotoAction(method: Method): Boolean =
    method.name == SAVE_PHOTO_ACTION && !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.returnType == MENU_LISTENER && method.parameterTypes.size == 1

/** Hands the flag a gate read to the extension, which answers yes while the switch is on. */
internal fun MutableMethod.answerGateWithTheSwitch(at: Int) {
    val flag = (implementation!!.instructions.toList()[at] as OneRegisterInstruction).registerA
    addInstructions(
        at,
        """
            invoke-static/range { v$flag .. v$flag }, $OFFERS_PHOTO_SAVE
            move-result v$flag
        """,
    )
}

/**
 * Wraps the listener the action answers in the extension's. The action is straight-line code with
 * one `return-object`, so the wrap goes right before it and nothing can jump past it.
 */
internal fun MutableMethod.wrapSaveAction() {
    val code = implementation!!.instructions.toList()
    if (code.any { it is OffsetInstruction }) {
        throw PatchException("$PHOTO_PATCH: $definingClass->$name branches, so the wrap could be skipped")
    }
    val returns = code.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
    val back = returns.singleOrNull()
        ?: throw PatchException("$PHOTO_PATCH: $definingClass->$name has ${returns.size} return-object, expected one")
    val listener = (back.value as OneRegisterInstruction).registerA
    addInstructions(
        back.index,
        """
            invoke-static { v$listener, p1 }, $WRAP_SAVE_ACTION
            move-result-object v$listener
        """,
    )
}
