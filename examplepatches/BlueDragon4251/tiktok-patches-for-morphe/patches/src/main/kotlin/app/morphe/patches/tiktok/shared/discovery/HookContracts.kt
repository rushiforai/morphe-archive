package app.morphe.patches.tiktok.shared.discovery

import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal fun Method.calls(owner: String? = null, name: String? = null,
                          parameters: List<String>? = null, returns: String? = null): Boolean =
    implementation?.instructions?.any { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref != null && (owner == null || ref.definingClass == owner) && (name == null || ref.name == name) &&
            (parameters == null || ref.parameterTypes == parameters) && (returns == null || ref.returnType == returns)
    } == true

internal fun Method.readsField(owner: String, name: String): Boolean =
    implementation?.instructions?.any { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        ref?.definingClass == owner && ref.name == name && instruction.opcode.name.lowercase().startsWith("iget")
    } == true
