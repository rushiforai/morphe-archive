package app.southstar21.patches.instagram.misc.extension

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

/**
 * An extension stub `public static Object name(Object)`, which a patch overwrites with
 * [callThrough] so the extension can call one of Instagram's obfuscated methods.
 */
internal fun extensionStub(extensionClass: String, name: String) = Fingerprint(
    definingClass = extensionClass,
    name = name,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)

/**
 * Overwrites an extension stub `(Object)Object` to call [target] on its argument: as the
 * receiver if [target] is an instance method, otherwise as its only parameter.
 */
internal fun MutableMethod.callThrough(target: Method) {
    val isStatic = AccessFlags.STATIC.isSet(target.accessFlags)
    val invoke = if (isStatic) "invoke-static" else "invoke-virtual"
    val argumentType = if (isStatic) target.parameterTypes.first().toString() else target.definingClass
    addInstructions(
        0,
        """
            check-cast p0, $argumentType
            $invoke { p0 }, $target
            move-result-object v0
            return-object v0
        """
    )
}
