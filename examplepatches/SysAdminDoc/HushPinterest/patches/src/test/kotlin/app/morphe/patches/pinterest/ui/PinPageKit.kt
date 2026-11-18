/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.ExtensionDex
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef

/** What the pin page patches' fixture tests share. */
internal object PinPageKit {
    private val PAYLOADS = setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD)

    /** The value a status stub returns: 1 once its patch turned it on. */
    fun flag(context: BytecodePatchContext, name: String) =
        (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.implementation!!.instructions.first()
            as NarrowLiteralInstruction).narrowLiteral

    fun flagOrZero(context: BytecodePatchContext, name: String) =
        if (context.mutableClassDefBy(SETTINGS_STATUS).methods.any { it.name == name }) flag(context, name) else 0

    fun patched(context: BytecodePatchContext, method: Method): List<Instruction> =
        context.mutableClassDefBy(method.definingClass).methods.single {
            it.name == method.name && it.parameters() == method.parameters() && it.returnType == method.returnType
        }.implementation!!.instructions.toList()

    /** The opcodes, without a nop that only pads a payload and with every goto width read as one. */
    fun kinds(body: List<Instruction>) = body.filterIndexed { at, instruction ->
        instruction.opcode != Opcode.NOP || body.getOrNull(at + 1)?.opcode !in PAYLOADS
    }.map { if (it.opcode == Opcode.GOTO_16 || it.opcode == Opcode.GOTO_32) Opcode.GOTO else it.opcode }

    fun target(instruction: Instruction?) = (instruction as? ReferenceInstruction)?.reference?.toString()

    /** The extension with one status stub gone, the way an older or mismatched extension would be. */
    fun extensionWithout(stub: String): List<ClassDef> = ExtensionDex.classes().map { owner ->
        if (owner.type != SETTINGS_STATUS) owner else ImmutableClassDef(
            owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
            owner.annotations, owner.fields, owner.methods.filterNot { it.name == stub },
        )
    }
}
