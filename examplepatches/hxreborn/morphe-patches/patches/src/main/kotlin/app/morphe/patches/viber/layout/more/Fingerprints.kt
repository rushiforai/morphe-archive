/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.viber.layout.more

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal object FilterMoreItemsFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    parameters = listOf("L"),
    filters = listOf(
        methodCall(definingClass = "this", parameters = listOf(), returnType = "Ljava/util/List;"),
        methodCall(definingClass = "Ljava/util/Iterator;", name = "next"),
        opcode(Opcode.CHECK_CAST),
        methodCall(
            opcode = Opcode.INVOKE_INTERFACE,
            name = "apply",
            parameters = listOf("Ljava/lang/Object;"),
            returnType = "Z",
        ),
        methodCall(definingClass = "Ljava/util/ArrayList;", name = "add"),
    ),
)

internal fun itemConstructorFingerprint(itemType: String) = Fingerprint(
    definingClass = itemType,
    name = "<init>",
    parameters = listOf("L"),
)

internal fun itemBuilderConstructorFingerprint(builderType: String) = Fingerprint(
    definingClass = builderType,
    name = "<init>",
    parameters = listOf("Landroid/content/Context;", "I", "I"),
    filters = listOf(
        fieldAccess(definingClass = "this", type = "I", opcode = Opcode.IPUT),
        fieldAccess(definingClass = "this", type = "I", opcode = Opcode.IPUT, location = MatchAfterImmediately()),
    ),
)

internal fun itemIdCopyFingerprint(itemType: String, builderIdField: FieldReference) = Fingerprint(
    definingClass = itemType,
    name = "<init>",
    filters = listOf(
        fieldAccess(reference = builderIdField, opcode = Opcode.IGET),
        fieldAccess(definingClass = "this", type = "I", opcode = Opcode.IPUT, location = MatchAfterImmediately()),
    ),
)
