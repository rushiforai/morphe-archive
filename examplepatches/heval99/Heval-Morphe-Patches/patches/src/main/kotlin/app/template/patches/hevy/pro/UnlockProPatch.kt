// Based on arandomhooman/hoomans-morphe-patches (GPL-3.0), patches/hevy/pro/UnlockProPatch.kt: the
// idea of rewriting a HevyProStore getter in the Hermes bundle to LoadConstTrue + Ret.
// Its fixed byte signature no longer matches 3.1.16, so the getter is now found by parsing the
// bytecode (HermesBytecode) and triangulating on the string ids the getter reads.
package app.template.patches.hevy.pro

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_HEVY
import java.security.MessageDigest

internal const val HEVY_BUNDLE = "assets/index.android.bundle"

// HevyProStore's isPro getter reads all three of these (GetById operands): the debug override
// switch, subscription.is_pro and the offline grace-period flag. No other function reads all three.
internal val IS_PRO_GETTER_STRINGS = listOf(
    "isProStatusOverrideEnabled",
    "is_pro",
    "isWithinProOfflineGracePeriod",
)

//   78 00  LoadConstTrue r0
//   5C 00  Ret r0
internal val RETURN_TRUE = byteArrayOf(0x78, 0x00, 0x5C, 0x00)
private const val SHA1_FOOTER_SIZE = 20

/**
 * Finds HevyProStore's isPro getter: the one function whose bytecode contains the string id of
 * every [IS_PRO_GETTER_STRINGS] entry as an instruction operand (little-endian u16, or u32 for ids
 * above 0xFFFF, which Hermes encodes with the *Long opcode forms).
 */
internal fun HermesBytecode.findIsProGetter(): HermesBytecode.Function {
    val operands = IS_PRO_GETTER_STRINGS.map { value ->
        val id = stringIds(value).singleOrNull()
            ?: throw PatchException("Expected exactly one \"$value\" in the Hermes string table")
        // Ids below 0x100 use the 1-byte *Short opcode forms; a single byte is too weak to scan for.
        if (id < 0x100) throw PatchException("\"$value\" has string id $id, too small to locate reliably")
        val width = if (id > 0xFFFF) 4 else 2
        ByteArray(width) { (id ushr (8 * it)).toByte() }
    }

    val matches = functions.filter { function ->
        val start = function.offset
        val end = function.offset + function.bytecodeSize
        operands.all { bytes.indexOf(it, start, end) >= 0 }
    }
    val getter = matches.singleOrNull() ?: throw PatchException(
        "Expected exactly one Hermes function reading ${IS_PRO_GETTER_STRINGS.joinToString()}, " +
            "found ${matches.size}: ${matches.joinToString { "#${it.id}" }}",
    )
    if (getter.frameSize < 1 || getter.bytecodeSize < RETURN_TRUE.size) {
        throw PatchException("isPro getter #${getter.id} is too small to rewrite")
    }
    // Hermes can share one body between functions; rewriting it would change the others too.
    if (functions.count { it.offset == getter.offset } != 1) {
        throw PatchException("isPro getter #${getter.id} shares its bytecode with another function")
    }
    return getter
}

private fun ByteArray.indexOf(pattern: ByteArray, start: Int, end: Int): Int {
    outer@ for (i in start..end - pattern.size) {
        for (j in pattern.indices) {
            if (this[i + j] != pattern[j]) continue@outer
        }
        return i
    }
    return -1
}

@Suppress("unused")
val unlockProPatch = rawResourcePatch(
    name = "Unlock Pro",
    description = "Unlocks Pro features. Server features like Hevy Coach stay locked.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HEVY)

    execute {
        val bundle = get(HEVY_BUNDLE)
        if (!bundle.exists()) {
            throw PatchException(
                "$HEVY_BUNDLE not found. The Hermes bundle lives in the base split: patch a " +
                    "merged APK (APKEditor m) rather than a single split.",
            )
        }

        val bytes = bundle.readBytes()
        val getter = HermesBytecode(bytes).findIsProGetter()

        // isPro returns true before it checks the override, subscription.is_pro or the grace
        // period. Length-preserving. The last 20 bytes are a SHA-1 of everything before them;
        // Hermes does not seem to check it at load, but it is recomputed so the bundle stays
        // self-consistent for anything that does.
        RETURN_TRUE.copyInto(bytes, destinationOffset = getter.offset)
        val footer = bytes.size - SHA1_FOOTER_SIZE
        MessageDigest.getInstance("SHA-1").digest(bytes.copyOfRange(0, footer))
            .copyInto(bytes, destinationOffset = footer)
        bundle.writeBytes(bytes)
    }
}
