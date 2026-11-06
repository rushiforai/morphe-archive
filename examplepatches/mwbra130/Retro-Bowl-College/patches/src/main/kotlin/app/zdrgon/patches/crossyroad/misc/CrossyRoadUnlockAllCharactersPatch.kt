package app.zdrgon.patches.crossyroad.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.zdrgon.patches.crossyroad.shared.Constants.COMPATIBILITY_CROSSY_ROAD
import kotlin.io.readBytes
import kotlin.io.writeBytes

// ── NATIVE anchors (Crossy Road 7.14.0) ──────────────────────────────────
// Every character in the game funnels its locked/unlocked state through
// Character.IsUnlocked() — the collection screen, the character carousel
// and gameplay selection all consult it. The method itself checks every
// legitimate unlock source (saved unlock list, purchase state, secret /
// progress conditions) across a ~0x3BC-byte body; replacing its entry with
// "return true" makes every character — paid, coin-priced, prize-machine,
// progress-counter ("unlock in 100"), and secret — display and play as
// unlocked. Character.IsUnlockedForMultiplayer() gets the same treatment
// so the multiplayer roster agrees.
//
// The saved unlock list is never written by this patch: characters are
// unlocked only while the patch is applied, and removing it restores the
// real collection state untouched.
//
// Every anchor below is the first 48 bytes of its method and was
// byte-verified on 2026-10-27 to occur EXACTLY ONCE in its 7.14.0
// library, which makes each match self-verifying.
//
// ── ARM64 — lib/arm64-v8a/libil2cpp.so (.text VA = file + 0x4000) ────────
// IsUnlocked @ VA 0x0243A2E4 (file 0x24362E4). The ARM64 C# dump carried
// the address directly; the disassembled body shows the standard IL2CPP
// type-init guard followed by the per-source unlock checks.
private val ARM64_IS_UNLOCKED_ANCHOR = uaHex(
    "FF0301D1 FE5702A9 F44F03A9 147D0190 F30300AA 889E5A39 " +
            "C8030037 A06201B0 00FC47F9 1249F897 A06201D0 000040F9"
)
// IsUnlockedForMultiplayer @ VA 0x0243FFF4 (file 0x243BFF4).
private val ARM64_IS_UNLOCKED_MP_ANCHOR = uaHex(
    "FE0F1EF8 F44F01A9 D47C01F0 F30300AA 88A25A39 88010037 " +
            "806201B0 009044F9 CF31F897 A06201D0 00B840F9 CC31F897"
)
// mov w0,#1 (0x52800020) ; ret (0xD65F03C0)
private val ARM64_RETURN_TRUE = uaHex("20008052 C0035FD6")

// ── ARM32 — lib/armeabi-v7a/libil2cpp.so (file offset == VA) ─────────────
// The C# stub dump assigned NO address to these methods on ARM32; the
// addresses come from the Il2CppInspectorRedux disassembler metadata
// (il2cpp.json addressMap: _ZN9Character10IsUnlockedEv) and were verified
// by disassembly — the entry shows the identical structure to ARM64
// (register save, type-init guard byte, the same il2cpp init routine
// called repeatedly), at file 0x0127F1F4.
private val ARM32_IS_UNLOCKED_ANCHOR = uaHex(
    "F0412DE9 10D04DE2 48549FE5 0040A0E1 05508FE0 0000D5E5 " +
            "000050E3 1C00001A 34049FE5 00009FE7 44A0F7EB 2C049FE5"
)
// IsUnlockedForMultiplayer @ file 0x012864B8 (same metadata source).
private val ARM32_IS_UNLOCKED_MP_ANCHOR = uaHex(
    "70402DE9 20519FE5 0040A0E1 05508FE0 0000D5E5 000050E3 " +
            "0A00001A 0C019FE5 00009FE7 9483F7EB 04019FE5 00009FE7"
)
// mov r0,#1 (0xE3A00001) ; bx lr (0xE12FFF1E)
private val ARM32_RETURN_TRUE = uaHex("0100A0E3 1EFF2FE1")

/** ABIs to probe, in order. Missing paths are skipped, not an error. */
private val UA_LIBIL2CPP_ABIS = listOf(
    "arm64-v8a",
    "armeabi-v7a",
    "armeabi",
    "x86",
    "x86_64"
)

/** ELF identification header — e_ident, needed before EI_CLASS is readable. */
private const val UA_ELF_HEADER_SIZE = 20

/**
 * Crossy Road — Unlock all characters: a standalone rawResourcePatch
 * (character unlock state is pure IL2CPP native code; there is no DEX
 * half).
 *
 * In 7.14.0 the libraries ship ONLY in the split_config.<abi> APKs inside
 * the bundle, so the input to the patcher must be the full bundle
 * (XAPK/APKM). Handing the patcher a base-only .apk leaves lib/ empty and
 * this patch throws the "no libil2cpp.so" error below by design.
 *
 * Per ABI, ALL anchors are located and verified unique BEFORE any byte is
 * written, and the file is written exactly once — a library is never left
 * with only one of the two edits applied.
 */
@Suppress("unused")
val crossyRoadUnlockAllCharactersPatch = rawResourcePatch(
    name = "Unlock all characters",
    description = "Every character is unlocked and playable — paid, coin, prize machine, progress and secret characters included. Your real collection progress is not changed; characters are unlocked while the patch is applied.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CROSSY_ROAD)

    execute {
        val patched = mutableListOf<String>()
        val present = mutableListOf<String>()
        val skipped = mutableListOf<String>()

        for (abi in UA_LIBIL2CPP_ABIS) {
            val path = "lib/$abi/libil2cpp.so"
            val soFile = get(path, true)
            if (!soFile.exists()) continue
            present += abi

            val bytes = soFile.readBytes()
            if (bytes.size < UA_ELF_HEADER_SIZE || bytes[0] != 0x7F.toByte() ||
                bytes[1] != 'E'.code.toByte() || bytes[2] != 'L'.code.toByte() ||
                bytes[3] != 'F'.code.toByte()
            ) {
                throw PatchException(
                    "Crossy Road Unlock all characters: $path is not an ELF file — " +
                            "unexpected split layout?"
                )
            }

            // EI_CLASS (offset 4): 1 = 32-bit (ARM), 2 = 64-bit (AArch64).
            val eiClass = bytes[4].toInt() and 0xFF
            val result = when (eiClass) {
                1 -> patchUnlockArm32(soFile, bytes, path)
                2 -> patchUnlockArm64(soFile, bytes, path)
                else -> {
                    throw PatchException(
                        "Crossy Road Unlock all characters: unsupported ELF class $eiClass " +
                                "in $path — unsupported game version?"
                    )
                }
            }
            if (result == null) skipped += abi else patched += "$abi@$result"
        }

        if (present.isEmpty()) {
            throw PatchException(
                "Crossy Road Unlock all characters: no lib/<abi>/libil2cpp.so found in " +
                        "any of $UA_LIBIL2CPP_ABIS — in 7.14.0 the libraries ship ONLY in the " +
                        "split_config.<abi> APKs inside the bundle, so patch the full " +
                        "XAPK/APKM bundle, not a base-only .apk"
            )
        }
        if (patched.isEmpty()) {
            throw PatchException(
                "Crossy Road Unlock all characters: IsUnlocked anchors not found in any " +
                        "of the present libraries ($present) — unsupported game version?"
            )
        }

        println("Crossy Road Unlock all characters: patched IsUnlocked + IsUnlockedForMultiplayer in " + patched.joinToString())
        if (skipped.isNotEmpty()) {
            println(
                "Crossy Road Unlock all characters: anchors not found for " +
                        "${skipped.joinToString()} (other architectures still patched)"
            )
        }
    }
}

/** Parses a big-endian hex string (spaces optional) into a byte array. */
private fun uaHex(s: String): ByteArray =
    s.replace(" ", "").chunked(2).map { it.toInt(16).toByte() }.toByteArray()

private fun uaIndexOf(haystack: ByteArray, needle: ByteArray): Int {
    if (needle.isEmpty()) return 0
    val last = haystack.size - needle.size
    var i = 0
    while (i <= last) {
        var match = true
        for (j in needle.indices) {
            if (haystack[i + j] != needle[j]) {
                match = false
                break
            }
        }
        if (match) return i
        i++
    }
    return -1
}

/** Number of occurrences of [needle] in [haystack]. */
private fun uaCount(haystack: ByteArray, needle: ByteArray): Int {
    var n = 0
    var i = 0
    val last = haystack.size - needle.size
    while (i <= last) {
        var match = true
        for (j in needle.indices) {
            if (haystack[i + j] != needle[j]) {
                match = false
                break
            }
        }
        if (match) n++
        i++
    }
    return n
}

/**
 * Locates [anchor] in [bytes] and enforces the self-verifying property:
 * returns its index, or -1 when absent; throws when it matches more than
 * once (an ambiguous match is never patched).
 */
private fun uaLocateUnique(bytes: ByteArray, anchor: ByteArray, what: String, path: String): Int {
    val idx = uaIndexOf(bytes, anchor)
    if (idx < 0) return -1
    val hits = uaCount(bytes, anchor)
    if (hits != 1) {
        throw PatchException(
            "Crossy Road Unlock all characters: $what anchor matched $hits times " +
                    "in $path — refusing to patch an ambiguous site"
        )
    }
    return idx
}

/**
 * ARM64 half: IsUnlocked and IsUnlockedForMultiplayer both become
 * "return true". Both anchors are verified before either write lands.
 * Returns a summary of the patched offsets, or null when either anchor is
 * absent (wrong game version for this ABI).
 */
private fun patchUnlockArm64(soFile: java.io.File, bytes: ByteArray, path: String): String? {
    println("Crossy Road Unlock all characters: $path size=" + bytes.size + " bytes (ARM64)")
    val unlockedIdx = uaLocateUnique(bytes, ARM64_IS_UNLOCKED_ANCHOR, "ARM64 IsUnlocked", path)
    if (unlockedIdx < 0) return null
    val mpIdx = uaLocateUnique(bytes, ARM64_IS_UNLOCKED_MP_ANCHOR, "ARM64 IsUnlockedForMultiplayer", path)
    if (mpIdx < 0) return null

    ARM64_RETURN_TRUE.copyInto(bytes, unlockedIdx)
    ARM64_RETURN_TRUE.copyInto(bytes, mpIdx)
    soFile.writeBytes(bytes)
    return "unlocked=0x${unlockedIdx.toString(16)},mp=0x${mpIdx.toString(16)}"
}

/**
 * ARM32 half: IsUnlocked and IsUnlockedForMultiplayer both become
 * "return true". Both anchors are verified before either write lands.
 * Returns a summary of the patched offsets, or null when either anchor is
 * absent (wrong game version for this ABI).
 */
private fun patchUnlockArm32(soFile: java.io.File, bytes: ByteArray, path: String): String? {
    println("Crossy Road Unlock all characters: $path size=" + bytes.size + " bytes (ARM32)")
    val unlockedIdx = uaLocateUnique(bytes, ARM32_IS_UNLOCKED_ANCHOR, "ARM32 IsUnlocked", path)
    if (unlockedIdx < 0) return null
    val mpIdx = uaLocateUnique(bytes, ARM32_IS_UNLOCKED_MP_ANCHOR, "ARM32 IsUnlockedForMultiplayer", path)
    if (mpIdx < 0) return null

    ARM32_RETURN_TRUE.copyInto(bytes, unlockedIdx)
    ARM32_RETURN_TRUE.copyInto(bytes, mpIdx)
    soFile.writeBytes(bytes)
    return "unlocked=0x${unlockedIdx.toString(16)},mp=0x${mpIdx.toString(16)}"
}
