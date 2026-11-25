package local.honista

import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/** Catch stale app references that a DEX writer accepts but ART cannot resolve. */
internal fun referenceProblems(payload: Iterable<ClassDef>, findClass: (String) -> ClassDef?): List<String> {
    val cache = mutableMapOf<String, ClassDef?>()
    fun lookup(type: String) = cache.getOrPut(type) { findClass(type) }
    fun hierarchy(type: String, seen: MutableSet<String> = mutableSetOf()): List<ClassDef> {
        if (!seen.add(type)) return emptyList()
        val def = lookup(type) ?: return emptyList()
        return listOf(def) + (listOfNotNull(def.superclass) + def.interfaces).flatMap { hierarchy(it, seen) }
    }
    fun isAppType(type: String) = type.startsWith("LX/") || type.startsWith("Lcom/instagram/")
    val issues = sortedSetOf<String>()
    for (def in payload) for (method in def.methods) {
        for (instruction in method.implementation?.instructions ?: emptyList()) {
            val ref = (instruction as? ReferenceInstruction)?.reference ?: continue
            val opcode = instruction.opcode.toString()
            val owner = when (ref) {
                is MethodReference -> ref.definingClass
                is FieldReference -> ref.definingClass
                is TypeReference -> ref.type
                else -> continue
            }
            val ownerClass = lookup(owner)
            val issue = if (ownerClass == null) {
                if (isAppType(owner)) "Missing class: $owner" else null
            } else when (ref) {
                is MethodReference -> {
                    val candidates = if (ref.name == "<init>") listOf(ownerClass) else hierarchy(owner)
                    val target = candidates.flatMap { it.methods }.find {
                        it.name == ref.name && it.parameterTypes == ref.parameterTypes && it.returnType == ref.returnType
                    }
                    when {
                        target == null -> "Missing method: $ref"
                        opcode.startsWith("INVOKE_STATIC") != (target.accessFlags and 8 != 0) -> "Static method mismatch: $ref"
                        else -> null
                    }
                }
                is FieldReference -> {
                    val target = hierarchy(owner).flatMap { it.fields }.find { it.name == ref.name && it.type == ref.type }
                    when {
                        target == null -> "Missing field: $ref"
                        (opcode.startsWith("SGET") || opcode.startsWith("SPUT")) != (target.accessFlags and 8 != 0) -> "Static field mismatch: $ref"
                        else -> null
                    }
                }
                else -> null
            }
            if (issue != null) issues += "${def.type}->${method.name}: $issue"
        }
    }
    return issues.toList()
}
