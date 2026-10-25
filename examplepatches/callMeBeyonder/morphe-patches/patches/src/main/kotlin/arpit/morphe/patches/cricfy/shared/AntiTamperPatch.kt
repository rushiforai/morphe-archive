package arpit.morphe.patches.cricfy.shared

import app.morphe.patcher.patch.rawResourcePatch
import arpit.morphe.patches.cricfy.shared.Constants.COMPATIBILITY_CRICFY_TV

/**
 * One `AntiTamper::isTampered(JNIEnv*, jobject)` stub, addressed by file offset.
 *
 * The offsets are taken from the `.dynsym` entry of the function in each ABI of
 * `libnative-lib.so` shipped in CRICFy TV 7.3 and are relative to the start of the
 * file (the library has a single `PT_LOAD` mapping the headers, so virtual address
 * and file offset coincide). The prologue is verified before anything is written.
 */
private class IsTamperedPatch(
    val abi: String,
    val offset: Int,
    val prologue: String,
    val replacement: String,
)

/**
 * `AntiTamper::isTampered` of CRICFy TV 7.3.
 *
 * The library is shared by all ABIs, so the four variants are patched in place:
 * a `mov`-zero-return stub replaces the function body, regardless of the size of
 * the original function. The remaining bytes of the old body are never executed.
 */
private val IS_TAMPERED_PATCHES = listOf(
    // mov w0, #0 ; ret
    IsTamperedPatch(
        abi = "arm64-v8a",
        offset = 0x65BE8,
        prologue = "fd7bbea9f44f01a9fd030091f30301aa",
        replacement = "00008052c0035fd6",
    ),
    // mov r0, #0 ; bx lr
    IsTamperedPatch(
        abi = "armeabi-v7a",
        offset = 0x3E538,
        prologue = "704c2de910b08de20150a0e10060a0e1",
        replacement = "0000a0e31eff2fe1",
    ),
    // xor eax, eax ; ret
    IsTamperedPatch(
        abi = "x86",
        offset = 0x50D10,
        prologue = "5589e553575683ec0ce8000000005b81",
        replacement = "31c0c3",
    ),
    // xor eax, eax ; ret
    IsTamperedPatch(
        abi = "x86_64",
        offset = 0x61A50,
        prologue = "554889e54157415653504989f64989ff",
        replacement = "31c0c3",
    ),
)

/**
 * Disables the native anti-tamper check.
 *
 * Repackaging the app changes its signing certificate. On startup the app requests
 * its configuration from `https://cfydjjufvbh146.top/app_new.txt`, which is served as
 * an AES-encrypted blob and decrypted by `Baker.merge(String, Context)`. That native
 * method first calls `AntiTamper::isTampered(JNIEnv*, jobject)`, which ORs signature,
 * debugger, emulator, root and hook checks; on a re-signed build it returns true and
 * `Baker.merge` hands back the ciphertext unchanged. The JSON converter then fails
 * with `ConvertException` / `Unexpected JSON token` and the app shows its request
 * error dialog instead of the home screen.
 *
 * The decryption key does not depend on the signature (`AesDecrypt_decrypt` only
 * receives the ciphertext), so forcing the check to return false restores the normal
 * startup path. This is applied to every ABI in the APK because the Manager builds
 * for the device it is installed on, not necessarily the host.
 *
 * The offsets are version-specific, which is why this patch is only compatible with
 * 7.3. A mismatch fails the patch instead of shipping a broken build.
 */
@Suppress("unused")
internal val antiTamperPatch = rawResourcePatch(
    name = "Bypass integrity check",
    description = "Disables the native tamper check that makes a re-signed build fail " +
        "to decrypt the server configuration on startup.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_CRICFY_TV)

    execute {
        val patchesByAbi = IS_TAMPERED_PATCHES.associateBy(IsTamperedPatch::abi)
        val libraries = listApkEntries("lib/")
            .filter { it.endsWith("/libnative-lib.so") }
        check(libraries.isNotEmpty()) {
            "No libnative-lib.so entries found in the APK."
        }

        for (entry in libraries) {
            val abi = entry.removePrefix("lib/").substringBefore('/')
            val patch = patchesByAbi[abi]
                ?: error("Unsupported ABI $abi: no isTampered offset for $entry.")

            val file = get(entry)
            val bytes = file.readBytes()
            val prologue = patch.prologue.hexToBytes()
            check(bytes.size >= patch.offset + prologue.size) {
                "$entry is too small for the isTampered offset 0x${patch.offset.toString(16)}."
            }
            check(bytes.copyOfRange(patch.offset, patch.offset + prologue.size).contentEquals(prologue)) {
                "$entry does not contain the expected isTampered prologue at " +
                    "0x${patch.offset.toString(16)}; the native library is not the 7.3 build."
            }

            patch.replacement.hexToBytes().copyInto(bytes, patch.offset)
            file.writeBytes(bytes)
        }
    }
}

private fun String.hexToBytes(): ByteArray =
    ByteArray(length / 2) { index ->
        substring(index * 2, index * 2 + 2).toInt(16).toByte()
    }
