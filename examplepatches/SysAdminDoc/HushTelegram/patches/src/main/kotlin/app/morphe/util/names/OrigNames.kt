/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.util.names

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.Reference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// Names read out of the dex, put back in source names so a patch compares them with the names it
// keeps. On a build with source names, or for anything outside the renamed package, each is the
// name as read.

val MethodReference.origDefiningClass: String get() = TelegramNames.tableOf(this).origType(definingClass)

val MethodReference.origName: String
    get() {
        val table = TelegramNames.tableOf(this)
        // Only the classes in the table had members renamed; skip building a descriptor for the rest.
        return if (!table.knows(definingClass)) name else table.origMethodName(definingClass, name, descriptor())
    }

val MethodReference.origReturnType: String get() = TelegramNames.tableOf(this).origType(returnType)

val MethodReference.origParameterTypes: List<String>
    get() = TelegramNames.tableOf(this).let { t -> parameterTypes.map { t.origType(it.toString()) } }

/** A method's `(params)return` descriptor in source names. */
val MethodReference.origDescriptor: String get() = TelegramNames.tableOf(this).origDescriptor(descriptor())

val FieldReference.origDefiningClass: String get() = TelegramNames.tableOf(this).origType(definingClass)

val FieldReference.origName: String
    get() {
        val table = TelegramNames.tableOf(this)
        return if (!table.knows(definingClass)) name else table.origFieldName(definingClass, name, type)
    }

val FieldReference.origType: String get() = TelegramNames.tableOf(this).origType(type)

/** A class's, parameter's or type reference's type in source names. */
val TypeReference.origType: String get() = TelegramNames.tableOf(this).origType(type)

/** What [Reference.toString] gives, in source names: `Lowner;->name(params)return`, `Lowner;->name:type`, a type. */
fun Reference.origString(): String = when (this) {
    is MethodReference -> "$origDefiningClass->$origName$origDescriptor"
    is FieldReference -> "$origDefiningClass->$origName:$origType"
    is TypeReference -> origType
    else -> toString()
}

/**
 * What an instruction refers to, read as [origString] reads it. A `const` holding one of the build's
 * resource ids reads as the R field 13.2 inlined into it (`Lorg/telegram/messenger/R$string;->Name:I`),
 * so a patch that looks for the field finds it on either kind of build.
 */
fun Instruction.origRef(): String? = when (this) {
    is ReferenceInstruction -> reference.origString()
    is NarrowLiteralInstruction ->
        if (opcode == Opcode.CONST || opcode == Opcode.CONST_HIGH16) TelegramNames.tableOf(this).resourceField(narrowLiteral) else null
    else -> null
}

/**
 * Whether this instruction can be the read of a static int a patch names: an `sget`, or the `const`
 * 13.2 inlined a resource id into. [origRef] then says which one it reads.
 */
fun Instruction.loadsInt(): Boolean = opcode == Opcode.SGET || opcode == Opcode.CONST || opcode == Opcode.CONST_HIGH16
