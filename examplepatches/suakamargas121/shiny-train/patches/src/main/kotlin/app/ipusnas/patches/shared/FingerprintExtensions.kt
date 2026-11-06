package app.ipusnas.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

/**
 * Returns the first matched method, or null when the fingerprint does not
 * match — e.g. when the target class or method was reobfuscated between app
 * versions. Used to implement per-version fingerprint fallbacks: try the
 * 2.1.4-shaped fingerprint, then the 2.1.6-shaped one.
 */
context(_: BytecodePatchContext)
val Fingerprint.methodOrNull: MutableMethod?
    get() = matchAllOrNull()?.firstOrNull()?.method

/**
 * Resolves the first fingerprint that matches, or throws when none of the
 * supplied fingerprints match. Using this keeps patch execute blocks flat:
 *
 * ```
 * fingerprintOrNull(FpV214, FpV216).addInstruction(0, "return-void")
 * ```
 */
context(_: BytecodePatchContext)
fun fingerprintOrNull(vararg fingerprints: Fingerprint): MutableMethod {
    return fingerprints.firstNotNullOfOrNull { it.methodOrNull }
        ?: throw PatchException(
            "None of the fingerprints matched: " +
                fingerprints.joinToString { it.definingClass.toString() }
        )
}
