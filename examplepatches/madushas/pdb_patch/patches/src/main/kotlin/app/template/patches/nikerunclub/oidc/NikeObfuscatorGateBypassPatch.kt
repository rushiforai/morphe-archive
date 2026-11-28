package app.template.patches.nikerunclub.oidc

import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.NIKE_RUN_CLUB_COMPATIBILITY
import app.template.patches.shared.Replacement
import app.template.patches.shared.byteArrayOf
import java.io.RandomAccessFile

/**
 * Nike Run Club obfuscates its client configuration (`res/3mS.json` plus a set of
 * `res/values` string resources) with the native library `libnike-obfuscator.so`.
 *
 * The library has two layers:
 *  1. a keyed transform (`x`) that encrypts/decrypts the configuration, and
 *  2. an **access gate** (`a`) that is consulted before every transform.
 *
 * The gate asks the Android framework for the APK's own signing certificate
 * (`PackageManager.getPackageInfo(..., GET_SIGNATURES)` ->
 * `PackageInfo.signatures[0].toByteArray()`) and compares it against Nike's Play
 * certificate, which is baked into the library. The expected certificate length is
 * compiled into the gate as the immediate `0x332` = 818 bytes, which is exactly the
 * length of Nike's `NIKEBOOM` certificate (verified: 818-byte DER).
 *
 * On the Play-signed build the comparison succeeds and the transform returns the
 * plaintext. On any re-signed build (i.e. every patched APK) the comparison fails, the
 * gate refuses, and the transform returns the literal string
 * `"Invalid Access: Device info reported to Nike."` instead of the configuration value.
 *
 * The practical consequence is that every obfuscated value - including the OIDC
 * `client_id` used to build the `accounts.nike.com` authorize request - is that error
 * string on a patched build, so Nike's authorize endpoint answers HTTP 500. The app
 * otherwise loads fine, which is exactly the reported symptom.
 *
 * This patch replaces the *body* of the access gate with an unconditional "allowed"
 * (`return 1`) in every shipped ABI. The keyed transform is untouched, so the
 * configuration decrypts exactly as it does on the Play-signed build.
 *
 * Static proof (offline harness: pristine `libnike-obfuscator.so` + mock `Context`/
 * `PackageManager`/`PackageInfo`/`Signature`, real JNI call):
 *  - unpatched library + genuine Play certificate -> `cdaf4dbcc130faa860b8860aa771b9db`
 *    (the real `oauth_oidc_app_id`)
 *  - unpatched library + foreign certificate -> `Invalid Access: Device info reported to Nike.`
 *  - patched library (this patch) + foreign certificate -> `cdaf4dbcc130faa860b8860aa771b9db`
 *
 * The stub is ABI-specific; each pattern below is the unique function prologue of the
 * gate in that ABI's library (the gate is the exported symbol `a`, verified against the
 * ELF symbol table of every shipped ABI):
 *  - arm64-v8a: `mov w0, #1` / `ret`
 *  - armeabi-v7a: `movs r0, #1` / `bx lr`
 *  - x86 / x86_64: `mov eax, #1` / `ret`
 *
 * Each pattern occurs exactly once in its library, so the replacement is unambiguous.
 * If a future Nike release changes the library, the pattern lookup fails loudly
 * (`PatchException`) instead of silently producing a broken login.
 */
private data class GateStub(
    val path: String,
    val prologue: String,
    val stub: String,
)

private val GATE_STUBS = listOf(
    GateStub(
        path = "lib/arm64-v8a/libnike-obfuscator.so",
        prologue = "fd 7b ba a9 fc 6f 01 a9 fa 67 02 a9 f8 5f 03 a9 f6 57 04 a9",
        stub = "20 00 80 52 c0 03 5f d6", // mov w0, #1 ; ret
    ),
    GateStub(
        path = "lib/armeabi-v7a/libnike-obfuscator.so",
        prologue = "f0 b5 03 af 2d e9 00 0f 87 b0 83 46 40 f2 32 30",
        stub = "01 20 70 47", // movs r0, #1 ; bx lr
    ),
    GateStub(
        path = "lib/x86/libnike-obfuscator.so",
        prologue = "55 89 e5 53 57 56 83 ec 2c e8 00 00 00 00 5b 81 c3 de 18 00",
        stub = "b8 01 00 00 00 c3", // mov eax, #1 ; ret
    ),
    GateStub(
        path = "lib/x86_64/libnike-obfuscator.so",
        prologue = "55 48 89 e5 41 57 41 56 41 55 41 54 53 48 83 ec 28 49 89 f5",
        stub = "b8 01 00 00 00 c3", // mov eax, #1 ; ret
    ),
)

/**
 * Makes Nike Run Club's obfuscated client configuration readable on re-signed builds.
 *
 * Without this patch the OIDC client id (and every other obfuscated configuration value)
 * is the string `Invalid Access: Device info reported to Nike.` on a patched APK and
 * Nike's authorize endpoint replies with HTTP 500.
 */
@Suppress("unused")
val nikeObfuscatorGateBypassPatch = rawResourcePatch(
    name = "Nike obfuscator access-gate bypass",
    description = "Nike Run Club's libnike-obfuscator.so refuses to decrypt its client " +
        "configuration when the APK is not signed with Nike's key, which breaks the OIDC " +
        "login (accounts.nike.com answers HTTP 500). This patch forces the library's " +
        "access gate to allow the transform in every ABI, so the OIDC client id decrypts " +
        "correctly on re-signed builds.",
    default = true,
) {
    compatibleWith(NIKE_RUN_CLUB_COMPATIBILITY)

    execute {
        GATE_STUBS.forEach { gate ->
            val target = get(gate.path, true)
            // Not every build ships every ABI - skip the ones this APK does not contain.
            if (!target.exists()) return@forEach

            val pattern = byteArrayOf(gate.prologue)
            val stub = byteArrayOf(gate.stub)
            require(stub.size <= pattern.size) { "Gate stub is larger than its prologue" }

            // `Replacement` pads a shorter replacement with zeroes, which would clobber the
            // rest of the function prologue. Build an equal-length replacement instead:
            // the stub followed by the untouched tail of the original prologue.
            val replacement = stub + pattern.copyOfRange(stub.size, pattern.size)

            RandomAccessFile(target, "rw").use { raf ->
                Replacement(
                    pattern,
                    replacement,
                    gate.path,
                ).replacePattern(raf)
            }
        }
    }
}
