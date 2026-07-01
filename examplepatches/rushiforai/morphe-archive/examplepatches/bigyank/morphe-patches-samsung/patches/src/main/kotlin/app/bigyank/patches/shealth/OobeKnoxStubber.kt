package app.bigyank.patches.shealth

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.util.MethodUtil

/**
 * Stub OOBE Knox/root gates and obfuscated root-file checks by scanning dex content.
 *
 * Samsung Health renames classes like `home/oobe2/util/h` per build (`idc`, `h4d`, etc.).
 * Root helpers embed the stable Kotlin string `$this$isRooted`. Matches SamsungAppsPatcher's
 * `apply_shealth_knox_bypass.py`.
 */
internal fun BytecodePatchContext.stubOobeKnoxGates() {
    classDefForEach { classDef ->
        val stubs = classDef.methods.mapNotNull { method ->
            val body = when {
                isKnoxPopupLauncher(method) -> "return-void"
                isHomeAppCloseRootCheck(classDef, method) -> "const/4 v0, 0x0\nreturn v0"
                isKnoxHandlerViewModelKnoxFlagGetter(classDef, method) -> "const/4 v0, 0x0\nreturn v0"
                isKnoxHandlerViewModelKnoxFlagSetter(classDef, method) -> "return-void"
                isRootedFileCheck(method) -> "const/4 v0, 0x0\nreturn v0"
                else -> return@mapNotNull null
            }
            method to body
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

private fun isKnoxPopupLauncher(method: Method): Boolean {
    if (method.returnType != "V") return false
    if (!method.parameterTypes.any { it == "Landroid/app/Activity;" }) return false

    val strings = method.stringConstants()
    val hasKnoxError = strings.any {
        "OOBE_ERROR_KNOX" in it || "DP_DISCONNECTED_EXCEPTION" in it
    }
    if (!hasKnoxError || "extra_error_code" !in strings) return false

    return method.referencesType("HomeAppCloseActivity")
}

private fun isHomeAppCloseRootCheck(classDef: ClassDef, method: Method): Boolean {
    if (!classDef.type.contains("HomeAppCloseActivity")) return false
    if (method.returnType != "Z" || method.parameterTypes.isNotEmpty()) return false
    if (!AccessFlags.PRIVATE.isSet(method.accessFlags)) return false
    return method.referencesMethod("KnoxControl", "checkWarrantyBit")
}

private fun isKnoxHandlerViewModelKnoxFlagGetter(classDef: ClassDef, method: Method): Boolean {
    if (!classDef.type.contains("KnoxHandlerViewModel")) return false
    if (method.returnType != "Z" || method.parameterTypes.isNotEmpty()) return false
    if (AccessFlags.STATIC.isSet(method.accessFlags)) return false
    return method.usesOpcode(Opcode.IGET_BOOLEAN)
}

private fun isKnoxHandlerViewModelKnoxFlagSetter(classDef: ClassDef, method: Method): Boolean {
    if (!classDef.type.contains("KnoxHandlerViewModel")) return false
    if (method.returnType != "V" || method.parameterTypes != listOf("Z")) return false
    if (AccessFlags.STATIC.isSet(method.accessFlags)) return false
    return method.usesOpcode(Opcode.IPUT_BOOLEAN)
}

private fun isRootedFileCheck(method: Method): Boolean {
    if (method.returnType != "Z" || method.parameterTypes != listOf("Ljava/io/File;")) return false
    if (!AccessFlags.STATIC.isSet(method.accessFlags)) return false
    return method.stringConstants().any { "${'$'}this${'$'}isRooted" in it }
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

private fun Method.referencesType(typeSuffix: String): Boolean {
    val impl = implementation ?: return false
    return impl.instructions.any { instruction ->
        if (instruction.opcode != Opcode.CONST_CLASS) return@any false
        val ref = (instruction as ReferenceInstruction).reference as? TypeReference ?: return@any false
        ref.type.contains(typeSuffix)
    }
}

private fun Method.referencesMethod(definingClassSuffix: String, name: String): Boolean {
    val impl = implementation ?: return false
    return impl.instructions.any { instruction ->
        val opcode = instruction.opcode
        if (opcode != Opcode.INVOKE_STATIC &&
            opcode != Opcode.INVOKE_VIRTUAL &&
            opcode != Opcode.INVOKE_DIRECT
        ) {
            return@any false
        }
        val ref = (instruction as ReferenceInstruction).reference as? MethodReference ?: return@any false
        ref.name == name && ref.definingClass.contains(definingClassSuffix)
    }
}

private fun Method.usesOpcode(opcode: Opcode): Boolean {
    val impl = implementation ?: return false
    return impl.instructions.any { it.opcode == opcode }
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
