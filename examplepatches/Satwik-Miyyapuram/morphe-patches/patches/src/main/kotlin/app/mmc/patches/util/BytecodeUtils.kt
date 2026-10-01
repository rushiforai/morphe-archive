package app.mmc.patches.util

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import java.util.logging.Logger

internal val mmcLogger: Logger = Logger.getLogger("app.mmc.patches")

/**
 * Inserts an early return at index 0 of this method, making the original body dead code.
 *
 * - `V`                 -> `return-void`
 * - `Z`, `B`, `S`, `C`, `I` -> `const/4 v0, <value>` + `return v0`
 * - objects / arrays    -> `const/4 v0, 0x0` + `return-object v0` (null)
 *
 * Writing to `v0` is always safe here because we return immediately afterwards, even when
 * `v0` happens to alias a parameter register.
 *
 * @return true if the method was patched.
 */
internal fun MutableMethod.stubReturn(booleanValue: Boolean = false): Boolean {
    val impl = implementation ?: return false
    val smali = when (returnType) {
        "V" -> "return-void"
        "Z", "B", "S", "C", "I" -> {
            if (impl.registerCount < 1) return false
            """
                const/4 v0, ${if (booleanValue) "0x1" else "0x0"}
                return v0
            """
        }
        "J", "D" -> {
            if (impl.registerCount < 2) return false
            """
                const-wide/16 v0, 0x0
                return-wide v0
            """
        }
        else -> {
            if (impl.registerCount < 1) return false
            """
                const/4 v0, 0x0
                return-object v0
            """
        }
    }
    addInstructions(0, smali)
    return true
}

/**
 * Stubs every method named in [methodNames] declared directly in [classType].
 * Missing classes / methods are tolerated so the patch degrades gracefully on
 * future app versions.
 *
 * @return number of methods patched.
 */
internal fun BytecodePatchContext.stubMethodsInClass(
    classType: String,
    methodNames: Set<String>,
    booleanValue: Boolean = false,
): Int {
    val mutableClass = mutableClassDefByOrNull(classType) ?: run {
        mmcLogger.warning("Class not found, skipping: $classType")
        return 0
    }
    var patched = 0
    mutableClass.methods
        .filter { it.name in methodNames }
        .forEach { method ->
            if (method.stubReturn(booleanValue)) {
                patched++
                mmcLogger.info("Stubbed ${classType}->${method.name}")
            }
        }
    return patched
}

/**
 * Stubs the method matched by [fingerprint], if it matches.
 *
 * @return true if a method was patched.
 */
internal fun BytecodePatchContext.stubFingerprint(
    fingerprint: Fingerprint,
    booleanValue: Boolean = false,
): Boolean {
    val method = fingerprint.methodOrNull ?: run {
        mmcLogger.warning("Fingerprint did not match, skipping: ${fingerprint.javaClass.simpleName}")
        return false
    }
    val ok = method.stubReturn(booleanValue)
    if (ok) mmcLogger.info("Stubbed ${method.definingClass}->${method.name} (${fingerprint.javaClass.simpleName})")
    return ok
}
