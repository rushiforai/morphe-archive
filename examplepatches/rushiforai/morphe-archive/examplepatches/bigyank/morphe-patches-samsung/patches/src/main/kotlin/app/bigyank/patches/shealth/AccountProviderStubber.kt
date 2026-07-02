package app.bigyank.patches.shealth

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.util.MethodUtil

/**
 * Health 7.x fetches account IDs via ContentResolver on Samsung Account's provider
 * (SamsungAccountDataSourceImpl). Scan dex and route through AccountManager instead.
 */
internal fun BytecodePatchContext.stubAccountProviderFetchCalls() {
    classDefForEach { classDef ->
        val stubs = classDef.methods.mapNotNull { method ->
            if (!isAccountProviderFetchCall(classDef, method)) return@mapNotNull null
            method to accountProviderFetchAccountIdBody(classDef.type)
        }
        if (stubs.isEmpty()) return@classDefForEach

        val mutableClass = mutableClassDefBy(classDef)
        stubs.forEach { (method, body) ->
            val mutableMethod = mutableClass.methods.firstOrNull { candidate ->
                MethodUtil.methodSignaturesMatch(candidate, method)
            } ?: return@forEach
            mutableMethod.replaceBodyInPlace(body)
        }
    }
}

private fun isAccountProviderFetchCall(classDef: ClassDef, method: Method): Boolean {
    if (!classDef.type.contains("SamsungAccountDataSourceImpl")) return false
    if (method.name != "invokeSuspend") return false
    if (method.returnType != "Ljava/lang/Object;") return false
    if ("getSamsungAccountId" !in method.stringConstants()) return false
    return method.referencesMethod("ContentResolver", "call")
}

private fun Method.stringConstants(): Set<String> {
    val impl = implementation ?: return emptySet()
    return impl.instructions.mapNotNull { instruction ->
        if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) {
            return@mapNotNull null
        }
        ((instruction as ReferenceInstruction).reference as? StringReference)?.string
    }.toSet()
}

private fun Method.referencesMethod(definingClassSuffix: String, name: String): Boolean {
    val impl = implementation ?: return false
    return impl.instructions.any { instruction ->
        val opcode = instruction.opcode
        if (opcode != Opcode.INVOKE_VIRTUAL &&
            opcode != Opcode.INVOKE_INTERFACE &&
            opcode != Opcode.INVOKE_STATIC
        ) {
            return@any false
        }
        val ref = (instruction as ReferenceInstruction).reference as? MethodReference ?: return@any false
        ref.name == name && ref.definingClass.contains(definingClassSuffix)
    }
}

private fun MutableMethod.replaceBodyInPlace(stubBody: String) {
    val impl = implementation as? MutableMethodImplementation ?: return
    impl.clearExceptionHandlers()
    removeInstructions(0, impl.instructions.count())
    addInstructions(0, stubBody)
}

private fun MutableMethodImplementation.clearExceptionHandlers() {
    val tryBlocksField = MutableMethodImplementation::class.java.getDeclaredField("tryBlocks")
    tryBlocksField.isAccessible = true
    @Suppress("UNCHECKED_CAST")
    (tryBlocksField.get(this) as java.util.ArrayList<*>).clear()
}
