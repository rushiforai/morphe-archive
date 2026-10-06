package io.github.bakwudo.uyu.patches.twitch.shared

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.Reference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal fun <T> Iterable<T>.uniqueHook(label: String): T {
    val matches = toList()
    if (matches.size != 1) throw PatchException("Twitch patches: expected one $label, found ${matches.size}. This APK is not verified.")
    return matches.single()
}

internal val Method.reference: String
    get() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

internal fun Method.code(): List<Instruction> = implementation?.instructions?.toList() ?: emptyList()

internal fun Method.references(): List<Reference> = code()
    .mapNotNull { (it as? ReferenceInstruction)?.reference }

internal fun Method.hasStrings(vararg strings: String): Boolean {
    val found = references().filterIsInstance<StringReference>().map { it.string }.toSet()
    return strings.all { it in found }
}

internal fun Method.isInstance(params: List<String>, returns: String): Boolean =
    parameterTypes.map { it.toString() } == params && returnType == returns &&
        AccessFlags.PUBLIC.isSet(accessFlags) && !AccessFlags.STATIC.isSet(accessFlags) &&
        !AccessFlags.ABSTRACT.isSet(accessFlags) && implementation != null
