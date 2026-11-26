/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Ported from hxreborn/morphe-patches (protonvpn/misc/anchors/Anchors.kt)
 * for use within lustx-patches. Extension-module-dependent helpers
 * (setExtensionMember, unitClass, unitInstanceField) omitted — see Phase 2/3.
 */

// hxreborn i fucking love you, if i had money to sponsor you i would.
// if someone other than hxreborn is reading this, PLS GO STAR THEIR REPO ASW

package app.morphe.patches.protonvpn.shared.anchors

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionFilter
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal open class ToStringFingerprint(prefix: String) :
    Fingerprint(
        name = "toString",
        returnType = "Ljava/lang/String;",
        parameters = emptyList(),
        strings = listOf(string(prefix, StringComparisonType.STARTS_WITH)),
    )

internal object VpnUserToStringFingerprint : ToStringFingerprint("VpnUser(userId=")

internal object VpnUserIsFreeUserFingerprint : Fingerprint(
    classFingerprint = VpnUserToStringFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = "Ljava/lang/Integer;", name = "intValue"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        opcode(Opcode.IF_NEZ, MatchAfterImmediately()),
    ),
)

internal val vpnUserType
    get() = VpnUserToStringFingerprint.originalClassDef.type

internal fun isFreeUserCall(
    location: InstructionLocation = InstructionLocation.MatchAfterAnywhere(),
) = methodCall(VpnUserIsFreeUserFingerprint.originalMethod, location)

private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference

internal fun findPropertyField(toString: Fingerprint, property: String): FieldReference {
    toString.match()
    val instructions = toString.originalMethod.implementation!!.instructions.toList()
    val labels = instructions.mapNotNull { (it.reference() as? StringReference)?.string }
        .filter { it.endsWith("=") }
    val labelIndex = labels.indexOfFirst { label ->
        label.endsWith("$property=") &&
            label.dropLast(property.length + 1).let { it.endsWith("(") || it.endsWith(", ") }
    }
    if (labelIndex < 0) throw PatchException("No $property in ${toString.originalMethod}")
    val fields = instructions
        .filter { it.opcode.name.startsWith("iget") }
        .mapNotNull { it.reference() as? FieldReference }
        .filter { it.definingClass == toString.originalClassDef.type }
        .distinct()
    if (fields.size != labels.size) {
        throw PatchException(
            "${toString.originalMethod} reads ${fields.size} fields for ${labels.size} labels",
        )
    }
    return fields[labelIndex]
}

private fun propertyGetters(toString: Fingerprint, field: FieldReference) = toString.originalClassDef.methods.filter { method ->
    method.parameterTypes.isEmpty() &&
        !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.implementation?.instructions?.toList()?.let { body ->
            body.size == 2 && body[0].reference() == field
        } == true
}

internal fun propertyGetter(toString: Fingerprint, property: String) = propertyGetters(toString, findPropertyField(toString, property)).firstOrNull()
    ?: throw PatchException("No getter for $property in ${toString.originalClassDef.type}")

internal fun propertyGetterCall(toString: Fingerprint, property: String): InstructionFilter {
    val field = findPropertyField(toString, property)
    val getters = propertyGetters(toString, field)
    if (getters.isEmpty()) throw PatchException("No getter for $field")
    return anyInstruction(*getters.map { methodCall(it) }.toTypedArray())
}

internal fun propertyRead(toString: Fingerprint, property: String): InstructionFilter {
    val field = findPropertyField(toString, property)
    val read = fieldAccess(field, listOf(Opcode.IGET, Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN))
    val getters = propertyGetters(toString, field)
    return anyInstruction(read, *getters.map { methodCall(it) }.toTypedArray())
}
