package app.bigyank.patches.shealth

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.util.MethodUtil

/**
 * Stub obfuscated SAK helpers (`c6r` on 6.x, `dc`/`qsv` on 7.x).
 *
 * Health 7.x ships an empty `c6r` shell, so the legacy fingerprint hard-fails there.
 * Stable `SakChecker.isSupported` stays fingerprinted separately.
 */
internal fun BytecodePatchContext.stubObfuscatedSakCheckers() {
    classDefForEach { classDef ->
        if (classDef.type.contains("service/health/security/sak/SakChecker")) return@classDefForEach

        val stubs = classDef.methods.mapNotNull { method ->
            if (!isObfuscatedSakSupported(method)) return@mapNotNull null
            method to "const/4 v0, 0x0\nreturn v0"
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

private fun isObfuscatedSakSupported(method: Method): Boolean {
    if (method.name != "isSakSupported") return false
    if (method.returnType != "Z" || method.parameterTypes.isNotEmpty()) return false
    if (AccessFlags.ABSTRACT.isSet(method.accessFlags)) return false
    return method.implementation != null
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
