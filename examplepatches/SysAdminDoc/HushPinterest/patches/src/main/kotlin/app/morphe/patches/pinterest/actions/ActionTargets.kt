/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.actions

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.pinterest.ui.instructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val PIN_MENU = "Lcom/pinterest/feature/gridactions/modal/view/PinOverflowMenuModalImpl;"

/**
 * Where a pin's closeup sends its overflow button when Pinterest's android_overflow_gestalt_sheet
 * experiment is on: a full-screen sheet that builds its own rows instead of [PIN_MENU] (#2).
 */
internal const val PIN_SHEET_LOCATION = "Lcom/pinterest/feature/GridActionsLocation\$PIN_OVERFLOW_MENU_MODAL_FRAGMENT;"

/** The manifest-backed menu class keeps its name; its private pin field identifies the model. */
internal fun BytecodePatchContext.pinMenu(): MutableClass = mutableClassDefByOrNull(PIN_MENU)
    ?: throw PatchException("Pin actions: this build has no pin overflow menu controller")

internal fun BytecodePatchContext.pinType(): String = (classDefByOrNull(PIN_MENU)
    ?: throw PatchException("Pin actions: this build has no pin overflow menu controller")).fields.singleOrNull {
    it.name == "pin" && it.type.startsWith("Lcom/pinterest/api/model/")
}?.type ?: throw PatchException("Pin actions: the overflow menu has no unique pin model field")

internal fun Method.fields(): List<FieldReference> = implementation?.instructions?.mapNotNull {
    (it as? ReferenceInstruction)?.reference as? FieldReference
}?.toList() ?: emptyList()

/**
 * The overflow sheet's fragment, the method that builds its rows, the public getter for the menu data
 * it was opened with, that data's pin, closeup flag and grid origin, and the list its rows go in.
 */
internal class PinSheet(
    val fragment: MutableClass,
    val build: MutableMethod,
    val data: Method,
    val pin: FieldReference,
    val closeup: FieldReference,
    val origin: FieldReference,
    val list: Method,
)

/** The overflow sheet's fragment and its onViewCreated. Null when the build has no sheet. */
internal fun BytecodePatchContext.pinSheetView(): Pair<MutableClass, MutableMethod>? {
    val location = classDefByOrNull(PIN_SHEET_LOCATION) ?: return null
    fun fail(why: String): Nothing = throw PatchException("Pin actions: the pin overflow sheet $why")
    val named = location.methods.filter { it.name == "<init>" }.flatMap { init ->
        init.instructions().filter { it.opcode == Opcode.CONST_CLASS }
            .map { ((it as ReferenceInstruction).reference as TypeReference).type }
    }.distinct()
    val fragment = mutableClassDefByOrNull(named.singleOrNull() ?: fail("location names ${named.size} classes"))
        ?: fail("fragment ${named.single()} isn't in the app")
    val build = fragment.methods.singleOrNull { method ->
        method.name == "onViewCreated" && method.implementation != null &&
            method.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/View;", "Landroid/os/Bundle;")
    } ?: fail("has no onViewCreated of its own")
    return fragment to build
}

/** Null when the build has no overflow sheet. Throws when it has one this can't read. */
internal fun BytecodePatchContext.pinSheet(pin: String): PinSheet? {
    val (fragment, build) = pinSheetView() ?: return null
    fun fail(why: String): Nothing = throw PatchException("Pin actions: the pin overflow sheet $why")
    fun public(method: Method) = AccessFlags.PUBLIC.isSet(method.accessFlags) && !AccessFlags.STATIC.isSet(method.accessFlags)
    val data = fragment.methods.filter { method ->
        public(method) && method.parameterTypes.isEmpty() && method.returnType.startsWith("L") &&
            classDefByOrNull(method.returnType)?.methods?.any { described ->
                described.name == "toString" && described.instructions().any { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == "PinOverflowMenuModalData(pin="
                }
            } == true
    }.singleOrNull() ?: fail("has no single public getter for its menu data")
    val dataClass = classDefBy(data.returnType)
    val described = dataClass.methods.single { it.name == "toString" }.instructions()
    // The data's toString names each field right before reading it.
    fun after(label: String, read: Opcode, type: String?): FieldReference {
        val at = described.indexOfFirst {
            it.opcode == Opcode.CONST_STRING && ((it as ReferenceInstruction).reference as StringReference).string == label
        }
        if (at < 0) fail("data doesn't describe \"$label\"")
        val field = described.drop(at + 1).firstOrNull { it.opcode == read }?.let { (it as ReferenceInstruction).reference as FieldReference }
            ?.takeIf { it.definingClass == dataClass.type && (type == null || it.type == type) }
            ?: fail("data has no $read for \"$label\"")
        val declared = dataClass.fields.singleOrNull { it.name == field.name && it.type == field.type }
        if (declared == null || !AccessFlags.PUBLIC.isSet(declared.accessFlags)) fail("data field for \"$label\" isn't public")
        return field
    }
    val list = fragment.methods.singleOrNull { method ->
        public(method) && method.parameterTypes.isEmpty() && method.returnType == "Landroid/widget/LinearLayout;"
    } ?: fail("has no single public getter for its row list")
    return PinSheet(
        fragment, build, data,
        after("PinOverflowMenuModalData(pin=", Opcode.IGET_OBJECT, pin),
        after(", isPinCloseup=", Opcode.IGET_BOOLEAN, "Z"),
        after(", originView=", Opcode.IGET_OBJECT, "Landroid/view/View;"),
        list,
    )
}
