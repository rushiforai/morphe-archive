package de.deconta.patches.shared

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal fun Method.strings(): List<String> =
    implementation?.instructions?.mapNotNull { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
    } ?: emptyList()

internal fun Method.parameterTypeNames() = parameterTypes.map { it.toString() }

internal fun BytecodePatchContext.findClasses(predicate: (ClassDef) -> Boolean): List<ClassDef> {
    val found = mutableListOf<ClassDef>()
    classDefForEach { if (predicate(it)) found += it }
    return found
}

internal fun BytecodePatchContext.findMethods(
    predicate: (ClassDef, Method) -> Boolean,
): List<Pair<ClassDef, Method>> {
    val found = mutableListOf<Pair<ClassDef, Method>>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method -> if (predicate(classDef, method)) found += classDef to method }
    }
    return found
}

internal fun BytecodePatchContext.singleClass(description: String, predicate: (ClassDef) -> Boolean): ClassDef {
    val found = findClasses(predicate)
    return found.singleOrNull()
        ?: throw PatchException("Expected one $description, found ${found.size}: ${found.map { it.type }}")
}

internal fun BytecodePatchContext.singleMethod(
    description: String,
    predicate: (ClassDef, Method) -> Boolean,
): MutableMethod {
    val found = findMethods(predicate)
    val (classDef, method) = found.singleOrNull()
        ?: throw PatchException(
            "Expected one $description, found ${found.size}: " +
                found.map { (c, m) -> "${c.type}->${m.name}" },
        )
    return mutableMethod(classDef, method)
}

internal fun BytecodePatchContext.mutableMethod(classDef: ClassDef, method: Method): MutableMethod =
    mutableClassDefBy(classDef).methods.first { candidate ->
        candidate.name == method.name &&
            candidate.returnType == method.returnType &&
            candidate.parameterTypeNames() == method.parameterTypeNames()
    }
