package app.template.patches.wps

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// ============================================================================
// WPS Office 26.11.1 (b1651) - Google Play services library anchors
//
// Unlike the privilege gates (unobfuscated, matched by name), the bundled
// play-services-basement code is R8-renamed, so these fingerprints use shape
// plus a library string that survives R8 in every build observed. Both anchors
// were confirmed present and unique in the stock 26.11.1 dex.
//
// They MUST be resolved before the GmsCore string rewrite runs: both match on
// the literal "com.google.android.gms", which the rewrite replaces.
// ============================================================================

/** Logged by `GooglePlayServicesUtilLight.isGooglePlayServicesAvailable(Context, int)`. */
internal const val SIGNATURE_INVALID_WARNING =
    " requires Google Play services, but their signature is invalid."

/** Thrown by `GooglePlayServicesUtilLight.ensurePlayServicesAvailable(Context[, int])`. */
internal const val SERVICE_CHECK_MESSAGE = "Google Play Services not available"

// ============================================================================
// IMPORTANT: these two anchors match by NAME + PROTOTYPE, deliberately not by
// scanning the method body for a string.
//
// The obvious implementation checks for the "signature is invalid" warning
// string. That requires dexlib2 to materialise the method's instruction list,
// and this APK (a recompiled third-party mod build) contains methods whose
// array payloads declare an invalid element width - 13, 17 and 7 were all seen
// inside this very class. Reading those throws `Invalid element width`, and an
// exception raised inside a Fingerprint predicate aborts the ENTIRE patch run
// with a stack trace instead of simply not matching.
//
// Name + prototype live in the method-id table and are readable without
// decoding any code, so this form cannot trip over a corrupt body. Both methods
// are uniquely named here, so the old string check bought no extra selectivity.
//
// The repointing below uses `forceBody`, which REPLACES a body rather than
// reading it, so the corrupt original is never decoded.
// ============================================================================


/**
 * Every string constant in a method body, in instruction order.
 *
 * MUST NOT THROW. `implementation` is backed by dexlib2, which parses the code
 * item lazily; a structurally malformed body (an array payload whose element
 * width is not 1/2/4/8, for example) throws `Invalid element width` while the
 * instruction list is being materialised. That exception used to escape from
 * inside a Fingerprint `custom` predicate and abort the whole patch run with a
 * stack trace, instead of this method simply not matching and being skipped.
 *
 * A method whose body cannot be decoded cannot match a string predicate anyway,
 * so returning no strings is the correct answer, not an error to propagate.
 */
internal fun Method.stringConstants(): Sequence<String> = sequence {
    val instructionList = try {
        implementation?.instructions?.toList().orEmpty()
    } catch (t: Throwable) {
        emptyList()
    }
    for (instruction in instructionList) {
        val value = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
        if (value != null) yield(value)
    }
}

/**
 * The method's instruction list, or empty if the body cannot be decoded.
 *
 * dexlib2 materialises a code item lazily, so this read is the one place that
 * can throw `Invalid element width` on a structurally malformed method. Callers
 * that only inspect or rewrite instructions should use this and skip the method
 * when it comes back empty, rather than letting the exception abort the run.
 */
internal fun Method.safeInstructions(): List<com.android.tools.smali.dexlib2.iface.instruction.Instruction> =
    try {
        implementation?.instructions?.toList().orEmpty()
    } catch (t: Throwable) {
        emptyList<com.android.tools.smali.dexlib2.iface.instruction.Instruction>()
    }

internal fun Method.hasExactString(value: String) = stringConstants().any { it == value }

internal fun Method.hasStringContaining(part: String) = stringConstants().any { part in it }

/**
 * `GooglePlayServicesUtilLight.isGooglePlayServicesAvailable(Context, int)`.
 *
 * It verifies that the Play services package is installed and signed by Google.
 * After the string rewrite that package is MicroG RE, which is not Google-signed,
 * so this would answer SERVICE_INVALID (9) and sign-in would stop before it ever
 * reaches MicroG. Forced to SUCCESS (0).
 *
 * Matched by NAME + PROTOTYPE on purpose - see the IMPORTANT note above. Both
 * methods are uniquely named in this build, so a body scan added no selectivity.
 */
internal object WpsPlayServicesAvailabilityFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/common/GooglePlayServicesUtilLight;",
    name = "isGooglePlayServicesAvailable",
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I"),
)

/**
 * `GooglePlayServicesUtilLight.ensurePlayServicesAvailable(Context, int)`: the
 * throwing wrapper around the check above. Returns early, which is a no-op for a
 * void method, so callers carry on to the (now MicroG-backed) service bind.
 */
internal object WpsPlayServicesEnsureFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/common/GooglePlayServicesUtilLight;",
    name = "ensurePlayServicesAvailable",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "I"),
)
