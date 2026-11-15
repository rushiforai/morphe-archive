package app.template.patches.wps

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// ============================================================================
// WPS Office 26.11.0 (b1650) - Google Play services library anchors
//
// Unlike the privilege gates (unobfuscated, matched by name), the bundled
// play-services-basement code is R8-renamed, so these fingerprints use shape
// plus a library string that survives R8 in every build observed. Both anchors
// were confirmed present and unique in the stock 26.11.0 dex (classes8.dex).
//
// They MUST be resolved before the GmsCore string rewrite runs: both match on
// the literal "com.google.android.gms", which the rewrite replaces.
// ============================================================================

/** Logged by `GooglePlayServicesUtilLight.isGooglePlayServicesAvailable(Context, int)`. */
internal const val SIGNATURE_INVALID_WARNING =
    " requires Google Play services, but their signature is invalid."

/** Thrown by `GooglePlayServicesUtilLight.ensurePlayServicesAvailable(Context[, int])`. */
internal const val SERVICE_CHECK_MESSAGE = "Google Play Services not available"

/** Every string constant in a method body, in instruction order. */
internal fun Method.stringConstants(): Sequence<String> = sequence {
    val implementation = implementation ?: return@sequence
    for (instruction in implementation.instructions) {
        val value = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
        if (value != null) yield(value)
    }
}

internal fun Method.hasExactString(value: String) = stringConstants().any { it == value }

internal fun Method.hasStringContaining(part: String) = stringConstants().any { part in it }

/**
 * `(Context, int)` / `(int, Context)` reduced to a shape that survives R8
 * reordering parameters: `["I", "L"]`.
 */
private fun Method.intAndContextShape(): List<String> =
    parameterTypes.map { if (it.startsWith("L")) "L" else it.toString() }.sorted()

/**
 * `GooglePlayServicesUtilLight.isGooglePlayServicesAvailable(Context, int)`, or the
 * `GoogleApiAvailabilityLight` method R8 inlined it into.
 *
 * It verifies that the Play services package is installed and signed by Google.
 * After the string rewrite that package is MicroG RE, which is not Google-signed,
 * so this would answer SERVICE_INVALID (9) and the sign-in flow would stop before
 * it ever reaches MicroG. Forced to SUCCESS (0).
 */
internal object WpsPlayServicesAvailabilityFingerprint : Fingerprint(
    returnType = "I",
    custom = { method, _ ->
        method.intAndContextShape() == listOf("I", "L") &&
            method.hasStringContaining(SIGNATURE_INVALID_WARNING) &&
            method.hasStringContaining("com.google.android.gms")
    },
)

/**
 * `GooglePlayServicesUtilLight.ensurePlayServicesAvailable(Context[, int])`: the
 * throwing wrapper around the check above. Returns early, which is a no-op for a
 * void method, so callers carry on to the (now MicroG-backed) service bind.
 */
internal object WpsPlayServicesEnsureFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.stringConstants().any { it == SERVICE_CHECK_MESSAGE || it.contains(SERVICE_CHECK_MESSAGE) } &&
            method.parameterTypes.map { if (it.startsWith("L")) "L" else it.toString() }.sorted() in
            listOf(listOf("L"), listOf("I", "L"))
    },
)
