package app.mix.patches.railone

import app.mix.native.NativeFingerprint

/**
 * Native fingerprints for the target app's protection libraries, mirroring the
 * Java-side fingerprint API but for native functions.
 *
 * These fingerprints identify the exact functions the patch set neutralizes
 * the data-wipe functions and the random-crash kill dispatcher.
 * See `NativeKillPatch` for the patch that uses them.
 */

/** The protection libraries of the target app. */
const val ZMAFCCXQ = "libzmafccxq.so"
const val XZGZORUC = "libxzgzoruc.so"

/**
 * Decodes dynamic strings obfuscated with a per-library XOR scheme: the adr
 * target points at a 1-byte header, and the string bytes after it are XORed
 * with (base + index). The base differs per library - pass the value observed
 * for each specific library.
 */
fun railOneStringDecoder(base: Int): (ByteArray) -> String? { return { bytes ->
    if (bytes.size < 2) {
        null
    } else {
        val decoded = ByteArray(bytes.size - 1)
        for (i in decoded.indices) {
            decoded[i] = (bytes[i + 1].toInt() xor ((base + i) and 0xFF)).toByte()
        }
        // Strings are NUL-terminated; trim at first NUL.
        val end = decoded.indexOfFirst { it.toInt() == 0 }.let { if (it == -1) decoded.size else it }
        runCatching { String(decoded, 0, end, Charsets.UTF_8) }.getOrNull()
    }
} }

/**
 * A data-wipe function: JNI-reflects ActivityManager and calls
 * clearApplicationUserData(pkg, null) to erase the app's data.
 */
internal object ZmafccxqWipeFingerprint : NativeFingerprint(
    definingLibrary = ZMAFCCXQ,
    strings = listOf("clearApplicationUserData"),
)

/**
 * The signature check: fetches two signatures via getPackageManager/getPackageInfo
 * and compares them.
 */
internal object ZmafccxqSignatureCheckFingerprint : NativeFingerprint(
    definingLibrary = ZMAFCCXQ,
    strings = listOf("getPackageManager"),
)

/**
 * The signature-failure wipe, reached from the signature check via a
 * tail-call trampoline. Fingerprinted as the branch target of
 * [ZmafccxqSignatureCheckFingerprint] - the exact function the patch set
 * neutralizes (entry -> ret).
 */
internal object ZmafccxqSignatureWipeFingerprint : NativeFingerprint(
    caller = ZmafccxqSignatureCheckFingerprint,
)

/**
 * The data-wipe function in the second library - same wipe, different lib.
 * References both "android/app/ActivityManager" and "clearApplicationUserData".
 */
internal object XzgzorucWipeFingerprint : NativeFingerprint(
    definingLibrary = XZGZORUC,
    strings = listOf("clearApplicationUserData"),
)

/**
 * The random-crash kill dispatcher: computes a value, takes value % 10, and
 * executes a random guaranteed crash: null-deref, div-by-zero, stack-smash,
 * 0xdeadbeef deref, abort.
 *
 * Fingerprinted by its unique division magic constant 0x66666667 (the
 * compiler's multiply-shift for signed % 10 on AArch64) - the one constant
 * that appears nowhere else in the protection libs.
 */
internal object XzgzorucKillDispatcherFingerprint : NativeFingerprint(
    definingLibrary = XZGZORUC,
    constants = listOf(0x66666667L),
    custom = { function ->
        function.instructions.any { it.mnemonic == "bl" } &&
            function.instructions.count { it.mnemonic == "bl" } >= 3
    },
)
