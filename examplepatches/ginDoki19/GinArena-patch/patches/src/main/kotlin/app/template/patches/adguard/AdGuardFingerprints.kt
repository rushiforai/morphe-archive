package app.template.patches.adguard

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/*
 * All anchors below are non-obfuscated literals that survive R8:
 *   - developer log strings
 *   - Kotlin data-class toString prefixes
 *   - parameter-name intrinsics
 * None reference an obfuscated class or method name, so a re-obfuscated
 * release (which happens every version) does not break them.
 *
 * Verified against AdGuard 4.15.2 (versionCode 42321001):
 *   PlusManager          LH0/b
 *   PaidLicense          LK0/i$n
 *   LicenseDuration      LK0/i$l$a
 */

/** Anchors the PlusManager implementation class. */
internal val PlusManagerClass = Fingerprint(
    strings = listOf("Failed to get state from backend. Remaining retry count: "),
)

/** Anchors PlusState.PaidLicense (data-class toString). */
internal val PaidLicenseClass = Fingerprint(
    strings = listOf("PaidLicense(licenseKey="),
)

/**
 * PlusManager.getCachedPlusState(): no params, returns PlusState,
 * reads cache (IGET_OBJECT) and writes it back (IPUT_OBJECT).
 * 4.15.2 -> N6()
 */
internal val GetPlusState = Fingerprint(
    classFingerprint = PlusManagerClass,
    returnType = "L",
    filters = listOf(opcode(Opcode.IGET_OBJECT), opcode(Opcode.IPUT_OBJECT)),
    custom = { m, _ -> m.parameterTypes.isEmpty() },
)

/**
 * PlusManager.setPlusState(PlusState): one arg, void, writes cache
 * (IPUT_OBJECT) then notifies observers (INVOKE_INTERFACE).
 * 4.15.2 -> rb(LK0/i;)V
 *
 * The IPUT_OBJECT discriminator matters: other one-arg void methods in
 * PlusManager also call INVOKE_INTERFACE and would crash if matched.
 */
internal val SetPlusState = Fingerprint(
    classFingerprint = PlusManagerClass,
    returnType = "V",
    filters = listOf(opcode(Opcode.IPUT_OBJECT), opcode(Opcode.INVOKE_INTERFACE)),
    custom = { m, _ -> m.parameterTypes.size == 1 },
)

/**
 * PlusManager.fetchAndUpdatePlusState(cacheStrategy, retryStrategy):
 * two args, returns PlusState, INSTANCE_OF then INVOKE_VIRTUAL.
 * 4.15.2 -> l7(LH0/a$a;LH0/a$e;)LK0/i;
 */
internal val FetchAndUpdatePlusState = Fingerprint(
    classFingerprint = PlusManagerClass,
    returnType = "L",
    filters = listOf(opcode(Opcode.INSTANCE_OF), opcode(Opcode.INVOKE_VIRTUAL)),
    custom = { m, _ ->
        // Both parameters must be objects. The retry wrapper in the same class
        // also takes two parameters and returns PlusState, but its first is a
        // boolean, so matching on shape alone would hit the wrong method.
        m.parameterTypes.size == 2 && m.parameterTypes.all { it.startsWith("L") }
    },
)

/**
 * PlusManager.fetchPlusStateForPromo(cacheStrategy, retryStrategy):
 * anchored on the Kotlin intrinsic parameter-name checks.
 * 4.15.2 -> P7(LH0/a$a;LH0/a$e;)LK0/i;
 */
internal val FetchPlusStateForPromo = Fingerprint(
    classFingerprint = PlusManagerClass,
    returnType = "L",
    filters = listOf(string("cacheStrategy"), string("retryStrategy")),
)

/** PlusState.PaidLicense constructor (String, LicenseType, LicenseDuration, int, int, String). */
internal val PaidLicenseCtor = Fingerprint(
    classFingerprint = PaidLicenseClass,
    name = "<init>",
)

/** LicenseDuration.Lifetime.toString() - lets us resolve the singleton static field. */
internal val LifetimeDuration = Fingerprint(
    name = "toString",
    filters = listOf(string("Lifetime")),
)

/**
 * PlusManager.activateLicenseKey(String): one String arg, void, backend
 * re-verification via INVOKE_INTERFACE. Optional - skipped if absent.
 * 4.15.2 -> Y2(Ljava/lang/String;)V
 */
internal val ActivateLicenseKey = Fingerprint(
    classFingerprint = PlusManagerClass,
    returnType = "V",
    filters = listOf(opcode(Opcode.INVOKE_INTERFACE)),
    custom = { m, _ ->
        m.parameterTypes.size == 1 && m.parameterTypes[0] == "Ljava/lang/String;"
    },
)
