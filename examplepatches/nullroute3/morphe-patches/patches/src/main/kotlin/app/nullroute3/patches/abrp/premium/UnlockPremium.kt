package app.nullroute3.patches.abrp.premium

import app.nullroute3.patches.abrp.updates.disableExpoOtaPatch
import app.nullroute3.patches.abrp.shared.Constants.COMPATIBILITY_ABRP
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import java.io.File

private const val BUNDLE_PATH = "assets/index.android.bundle"

private const val GET_BY_ID = 0x45
private const val GET_BY_ID_SIZE = 6
private const val LOAD_CONST_TRUE = 0x95
private const val RET = 0x76

/** String table index of `isPremiumUser` in the 7.1.13 bundle. */
private const val IS_PREMIUM_USER = 0x37F7

/**
 * Result function of `isPremiumUserSelector`, 100 bytes:
 * `(roles, isPremiumDisabled, isAndroidAutomotiveTemplate) => boolean`.
 * It returns false when Premium is disabled, true on Android Automotive, and otherwise
 * whether the roles include `premium` or `admin`.
 */
private val PREMIUM_SELECTOR_RESULT = (
    "890202b05d023402003b020202440202006745020201cff4b044028906019400160106009302b0110144" +
        "05060294900422976e02050604b01d02160106009303b011014405060294900454a06e03050604100203" +
        "d1060200960276029500760096007600"
    ).hexToByteArray()

private fun String.hexToByteArray(): ByteArray =
    chunked(2).map { it.toInt(16).toByte() }.toByteArray()

/**
 * `LoadConstTrue r0; Ret r0`, padded to [size].
 *
 * The padding is never executed (the function returns at offset 2), so the function keeps
 * its bytecode size and the function header table needs no change. The padding uses
 * `LoadConstTrue r0` rather than `Unreachable` so that even a stray jump into the padding
 * cannot crash the VM.
 */
private fun returnTrue(size: Int): ByteArray {
    val code = byteArrayOf(LOAD_CONST_TRUE.toByte(), 0x00, RET.toByte(), 0x00)
    return code + ByteArray(size - code.size) { LOAD_CONST_TRUE.toByte() }
}

/**
 * `LoadConstTrue <register>` repeated to fill [size] bytes.
 *
 * `LoadConstTrue` is 2 bytes and idempotent, so repeating it keeps the destination register
 * `true` while consuming exactly the size of the replaced instruction. Padding with
 * `Unreachable` would crash the VM: execution continues right after the first
 * `LoadConstTrue`, straight into the padding.
 */
private fun loadTrue(register: Byte, size: Int): ByteArray {
    require(size % 2 == 0) { "the replacement size must be a multiple of 2" }
    return ByteArray(size) { i -> if (i % 2 == 0) LOAD_CONST_TRUE.toByte() else register }
}

private fun ByteArray.indexOf(pattern: ByteArray, from: Int = 0): Int {
    outer@ for (i in from..size - pattern.size) {
        for (j in pattern.indices) {
            if (this[i + j] != pattern[j]) continue@outer
        }
        return i
    }
    return -1
}

private fun ByteArray.replaceExactlyOne(pattern: ByteArray, replacement: ByteArray, what: String) {
    require(pattern.size == replacement.size) { "$what: the replacement must keep the bytecode size" }

    val at = indexOf(pattern)
    if (at < 0) throw PatchException("$what: pattern not found in $BUNDLE_PATH")
    if (indexOf(pattern, at + 1) >= 0) throw PatchException("$what: pattern is not unique in $BUNDLE_PATH")

    replacement.copyInto(this, at)
}

/**
 * Replaces every `GetById <dst>, <src>, <cache>, isPremiumUser` with `LoadConstTrue <dst>`.
 *
 * These read the premium flag off a state object instead of going through
 * `isPremiumUserSelector`, so they need their own patch.
 */
private fun ByteArray.unlockPremiumReads() {
    // GetById <dst>, <src>, <cache>, isPremiumUser. The three operand bytes vary per call site,
    // so only the opcode and the string index are matched.
    val stringIndexHigh = (IS_PREMIUM_USER shr 8).toByte()
    val stringIndexLow = IS_PREMIUM_USER.toByte()
    var patched = 0
    var at = 0

    while (at <= size - GET_BY_ID_SIZE) {
        val matches = this[at] == GET_BY_ID.toByte() &&
            this[at + 4] == stringIndexHigh &&
            this[at + 5] == stringIndexLow
        if (!matches) {
            at++
            continue
        }

        loadTrue(this[at + 1], GET_BY_ID_SIZE).copyInto(this, at)
        patched++
        at += GET_BY_ID_SIZE
    }

    if (patched != 3) {
        throw PatchException("Expected 3 isPremiumUser reads in $BUNDLE_PATH, found $patched")
    }
}

/**
 * ABRP decides Premium in JS. `isPremiumUserSelector` is a reselect selector whose result
 * function checks the account roles, and every paywall, `PremiumGate` and `MissingPremium`
 * screen reads that selector. Forcing the result function to `true` unlocks the Premium
 * features.
 *
 * The bundle is Hermes bytecode v98, so the patch edits the function bodies in place and keeps
 * every bytecode size, which leaves the function header table untouched.
 */
@Suppress("unused")
val unlockPremiumPatch = patch(
    name = "Unlock Premium",
    description = "Forces isPremiumUserSelector and the isPremiumUser state reads to true, " +
        "which unlocks the Premium features and removes the paywalls.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ABRP)
    dependsOn(disableExpoOtaPatch)

    finalize {
        val bundle: File = resourceFile(BUNDLE_PATH)
        val bytes = bundle.readBytes()

        bytes.replaceExactlyOne(
            pattern = PREMIUM_SELECTOR_RESULT,
            replacement = returnTrue(PREMIUM_SELECTOR_RESULT.size),
            what = "isPremiumUserSelector result function",
        )

        bytes.unlockPremiumReads()

        bundle.writeBytes(bytes)
    }
}
