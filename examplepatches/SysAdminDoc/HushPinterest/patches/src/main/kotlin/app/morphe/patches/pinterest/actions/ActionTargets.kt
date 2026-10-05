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
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal const val PIN_MENU = "Lcom/pinterest/feature/gridactions/modal/view/PinOverflowMenuModalImpl;"

/** The manifest-backed menu class keeps its name; its private pin field identifies the model. */
internal fun BytecodePatchContext.pinMenu(): MutableClass = mutableClassDefByOrNull(PIN_MENU)
    ?: throw PatchException("Pin actions: this build has no pin overflow menu controller")

internal fun BytecodePatchContext.pinType(): String = pinMenu().fields.singleOrNull {
    it.name == "pin" && it.type.startsWith("Lcom/pinterest/api/model/")
}?.type ?: throw PatchException("Pin actions: the overflow menu has no unique pin model field")

internal fun Method.fields(): List<FieldReference> = implementation?.instructions?.mapNotNull {
    (it as? ReferenceInstruction)?.reference as? FieldReference
}?.toList() ?: emptyList()
