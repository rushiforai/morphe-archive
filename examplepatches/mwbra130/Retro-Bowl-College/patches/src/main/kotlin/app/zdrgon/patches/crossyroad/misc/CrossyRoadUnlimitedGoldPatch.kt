package app.zdrgon.patches.crossyroad.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.zdrgon.patches.crossyroad.shared.Constants.COMPATIBILITY_CROSSY_ROAD
import kotlin.io.readBytes
import kotlin.io.writeBytes

// ── NATIVE anchors (Crossy Road 7.14.0) ──────────────────────────────────
// Both targets live on GlobalController (the game's coin wallet) inside
// libil2cpp.so, one copy per ABI. Every anchor below was byte-verified on
// 2026-10-27 to occur EXACTLY ONCE in its 7.14.0 library, which makes each
// match self-verifying: a different game build fails loudly instead of
// patching the wrong bytes.
//
// Why TWO sites per ABI: SpendCoins does NOT go through the Coins getter —
// it loads the backing field directly and compares it against the cost
// (verified by disassembly on both arches). Patching only the getter would
// make the balance *display* 65,535 while the prize machine still refused
// pulls the real balance can't cover. So:
//   1. Coins getter  → always returns 65,535 (display + every UI/pre-check
//      that reads the balance through the property).
//   2. SpendCoins    → always returns true immediately, never deducts
//      (the actual prize-machine / coin-gated character path).
// The real saved balance is never written by either site, so removing the
// patch restores the untouched wallet.

// ── ARM64 — lib/arm64-v8a/libil2cpp.so (87,877,760 bytes) ─────────────────
// .text VA = file offset + 0x4000 in this library.
//
// Coins getter window @ file 0x24CC258 (VA 0x24D0258):
//   str w1,[x0,#0x90] ; ret            (set_TotalCoinsSpent)
//   ldr w0,[x0,#0x94] ; ret            (get_Coins)          ← patch at +8
//   str w1,[x0,#0x94] ; ret            (set_Coins)
// The 8-byte getter+setter pair alone occurs 4× in the library; the 24-byte
// window including the preceding TotalCoinsSpent setter (field offset 0x90,
// Coins is 0x94) occurs exactly once.
private val ARM64_GETTER_ANCHOR = goldHex("019000B9 C0035FD6 009440B9 C0035FD6 019400B9 C0035FD6")
private const val ARM64_GETTER_PATCH_OFFSET = 8
// movz w0,#0xFFFF (0x529FFFE0) ; ret (0xD65F03C0) — exactly fills the
// 8-byte getter.
private val ARM64_GETTER_PATCH = goldHex("E0FF9F52 C0035FD6")

// SpendCoins entry @ file 0x24D066C (VA 0x024D466C–0x024D49A0). First 48
// bytes of the prologue (sub sp,#0x60; register saves; adrp/mov setup) —
// exactly 1 occurrence.
private val ARM64_SPEND_ANCHOR = goldHex(
    "FF8301D1 FE6F01A9 FA6702A9 F85F03A9 F65704A9 F44F05A9 " +
            "397801D0 F803052A F50304AA 28EB6B39 F60303AA F70302AA"
)
// mov w0,#1 (0x52800020) ; ret (0xD65F03C0) — always succeed, never deduct.
private val ARM64_SPEND_PATCH = goldHex("20008052 C0035FD6")

// ── ARM32 — lib/armeabi-v7a/libil2cpp.so (73,451,820 bytes) ───────────────
// First LOAD segment maps file offset == VA for .text in this library.
//
// Coins getter window @ file 0x133DA44 (VA 0x0133DA44):
//   str r1,[r0,#0x4C] ; bx lr          (set_TotalCoinsSpent)
//   ldr r0,[r0,#0x50] ; bx lr          (get_Coins)          ← patch at +8
//   str r1,[r0,#0x50] ; bx lr          (set_Coins)
//   ldr r0,[r0,#0x54] ; bx lr          (get_SessionPlayCount)
//   str r1,[r0,#0x54] ; bx lr          (set_SessionPlayCount)
//   push {r4,lr} ; ldr r4,[pc,…]       (next method's prologue)
// Short windows around the getter are generic (6 hits — many classes have
// back-to-back int properties at 0x4C/0x50); this 48-byte window spanning
// three property pairs plus the following prologue occurs exactly once.
private val ARM32_GETTER_ANCHOR = goldHex(
    "4C1080E5 1EFF2FE1 500090E5 1EFF2FE1 501080E5 1EFF2FE1 " +
            "540090E5 1EFF2FE1 541080E5 1EFF2FE1 10402DE9 50409FE5"
)
private const val ARM32_GETTER_PATCH_OFFSET = 8
// movw r0,#0xFFFF (0xE30F0FFF) ; bx lr (0xE12FFF1E) — exactly fills the
// 8-byte getter.
private val ARM32_GETTER_PATCH = goldHex("FF0F0FE3 1EFF2FE1")

// SpendCoins entry @ file 0x1342D6C (VA 0x01342D6C–0x013430DC).
// Il2CppInspector could not assign this method a VA in the ARM32 dump, so
// the address was recovered by disassembly of the gap between
// SetInitialCoinCount's end and GameStarted (0x1343148): UpdateCoinText
// occupies 0x1342C58–0x1342D4C, its literal pool follows, and the next
// prologue is SpendCoins — confirmed by its body: it saves r1 (deltaCoins)
// in r4, loads the Coins field directly (ldr r1,[fp,#0x50]), compares it
// against the cost (cmp r1,r4 ; bge spend path at 0x1342F5C) and the spend
// path deducts in place (sub r6,r1,r4 ; str r6,[fp,#0x50]). First 48 bytes
// of the prologue — exactly 1 occurrence.
private val ARM32_SPEND_ANCHOR = goldHex(
    "F04F2DE9 0CD04DE2 60639FE5 00B0A0E1 0390A0E1 02A0A0E1 " +
            "06608FE0 0140A0E1 0000D6E5 000050E3 1F00001A 40039FE5"
)
// mov r0,#1 (0xE3A00001) ; bx lr (0xE12FFF1E) — always succeed, never deduct.
private val ARM32_SPEND_PATCH = goldHex("0100A0E3 1EFF2FE1")

/** ABIs to probe, in order. Missing paths are skipped, not an error. */
private val GOLD_LIBIL2CPP_ABIS = listOf(
    "arm64-v8a",
    "armeabi-v7a",
    "armeabi",
    "x86",
    "x86_64"
)

/** ELF identification header — e_ident, needed before EI_CLASS is readable. */
private const val GOLD_ELF_HEADER_SIZE = 20

/**
 * Crossy Road — Unlimited gold: a standalone rawResourcePatch (there is no
 * DEX half — the wallet is pure IL2CPP native code).
 *
 * In 7.14.0 the libraries ship ONLY in the split_config.<abi> APKs inside
 * the bundle, so the input to the patcher must be the full bundle
 * (XAPK/APKM). Handing the patcher a base-only .apk leaves lib/ empty and
 * this patch throws the "no libil2cpp.so" error below by design (a
 * half-patched result would be worse than a loud fail).
 *
 * Per ABI, BOTH sites are located and verified unique BEFORE any byte is
 * written, and the file is written exactly once — a library is never left
 * with only one of the two edits applied.
 */
@Suppress("unused")
val crossyRoadUnlimitedGoldPatch = rawResourcePatch(
    name = "Unlimited gold",
    description = "Your coin balance always shows 65,535 and spending coins always works without deducting any — pull the prize machine and buy coin characters as much as you want.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CROSSY_ROAD)

    execute {
        val patched = mutableListOf<String>()
        val present = mutableListOf<String>()
        val skipped = mutableListOf<String>()

        for (abi in GOLD_LIBIL2CPP_ABIS) {
            val path = "lib/$abi/libil2cpp.so"
            val soFile = get(path, true)
            if (!soFile.exists()) continue
            present += abi

            val bytes = soFile.readBytes()
            if (bytes.size < GOLD_ELF_HEADER_SIZE || bytes[0] != 0x7F.toByte() ||
                bytes[1] != 'E'.code.toByte() || bytes[2] != 'L'.code.toByte() ||
                bytes[3] != 'F'.code.toByte()
            ) {
                throw PatchException(
                    "Crossy Road Unlimited gold: $path is not an ELF file — " +
                            "unexpected split layout?"
                )
            }

            // EI_CLASS (offset 4): 1 = 32-bit (ARM), 2 = 64-bit (AArch64).
            val eiClass = bytes[4].toInt() and 0xFF
            val result = when (eiClass) {
                1 -> patchGoldArm32(soFile, bytes, path)
                2 -> patchGoldArm64(soFile, bytes, path)
                else -> {
                    throw PatchException(
                        "Crossy Road Unlimited gold: unsupported ELF class $eiClass " +
                                "in $path — unsupported game version?"
                    )
                }
            }
            if (result == null) skipped += abi else patched += "$abi@$result"
        }

        if (present.isEmpty()) {
            throw PatchException(
                "Crossy Road Unlimited gold: no lib/<abi>/libil2cpp.so found in " +
                        "any of $GOLD_LIBIL2CPP_ABIS — in 7.14.0 the libraries ship ONLY in the " +
                        "split_config.<abi> APKs inside the bundle, so patch the full " +
                        "XAPK/APKM bundle, not a base-only .apk"
            )
        }
        if (patched.isEmpty()) {
            throw PatchException(
                "Crossy Road Unlimited gold: coin anchors not found in any of the " +
                        "present libraries ($present) — unsupported game version?"
            )
        }

        println("Crossy Road Unlimited gold: patched Coins getter + SpendCoins in " + patched.joinToString())
        if (skipped.isNotEmpty()) {
            println(
                "Crossy Road Unlimited gold: anchors not found for " +
                        "${skipped.joinToString()} (other architectures still patched)"
            )
        }
    }
}

/** Parses a big-endian hex string (spaces optional) into a byte array. */
private fun goldHex(s: String): ByteArray =
    s.replace(" ", "").chunked(2).map { it.toInt(16).toByte() }.toByteArray()

private fun goldIndexOf(haystack: ByteArray, needle: ByteArray): Int {
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
private fun goldCount(haystack: ByteArray, needle: ByteArray): Int {
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
private fun goldLocateUnique(bytes: ByteArray, anchor: ByteArray, what: String, path: String): Int {
    val idx = goldIndexOf(bytes, anchor)
    if (idx < 0) return -1
    val hits = goldCount(bytes, anchor)
    if (hits != 1) {
        throw PatchException(
            "Crossy Road Unlimited gold: $what anchor matched $hits times " +
                    "in $path — refusing to patch an ambiguous site"
        )
    }
    return idx
}

/**
 * ARM64 half: Coins getter → 65,535 and SpendCoins → return true.
 * Both anchors are verified before either write lands.
 * Returns a summary of the patched offsets, or null when either anchor is
 * absent (wrong game version for this ABI).
 */
private fun patchGoldArm64(soFile: java.io.File, bytes: ByteArray, path: String): String? {
    println("Crossy Road Unlimited gold: $path size=" + bytes.size + " bytes (ARM64)")
    val getterIdx = goldLocateUnique(bytes, ARM64_GETTER_ANCHOR, "ARM64 Coins getter", path)
    if (getterIdx < 0) return null
    val spendIdx = goldLocateUnique(bytes, ARM64_SPEND_ANCHOR, "ARM64 SpendCoins", path)
    if (spendIdx < 0) return null

    ARM64_GETTER_PATCH.copyInto(bytes, getterIdx + ARM64_GETTER_PATCH_OFFSET)
    ARM64_SPEND_PATCH.copyInto(bytes, spendIdx)
    soFile.writeBytes(bytes)
    return "getter=0x${(getterIdx + ARM64_GETTER_PATCH_OFFSET).toString(16)},spend=0x${spendIdx.toString(16)}"
}

/**
 * ARM32 half: Coins getter → 65,535 and SpendCoins → return true.
 * Both anchors are verified before either write lands.
 * Returns a summary of the patched offsets, or null when either anchor is
 * absent (wrong game version for this ABI).
 */
private fun patchGoldArm32(soFile: java.io.File, bytes: ByteArray, path: String): String? {
    println("Crossy Road Unlimited gold: $path size=" + bytes.size + " bytes (ARM32)")
    val getterIdx = goldLocateUnique(bytes, ARM32_GETTER_ANCHOR, "ARM32 Coins getter", path)
    if (getterIdx < 0) return null
    val spendIdx = goldLocateUnique(bytes, ARM32_SPEND_ANCHOR, "ARM32 SpendCoins", path)
    if (spendIdx < 0) return null

    ARM32_GETTER_PATCH.copyInto(bytes, getterIdx + ARM32_GETTER_PATCH_OFFSET)
    ARM32_SPEND_PATCH.copyInto(bytes, spendIdx)
    soFile.writeBytes(bytes)
    return "getter=0x${(getterIdx + ARM32_GETTER_PATCH_OFFSET).toString(16)},spend=0x${spendIdx.toString(16)}"
}
