package app.ffejhog.patches.bluesky

import app.morphe.patcher.patch.RawResourcePatch
import app.morphe.patcher.patch.rawResourcePatch
import java.security.MessageDigest

/** Path of the React Native / Hermes bytecode bundle inside the APK. */
private const val JS_BUNDLE_PATH = "assets/index.android.bundle"

/** The Hermes bytecode file ends with a 20-byte SHA-1 footer that the runtime verifies on load. */
private const val HBC_SHA1_FOOTER_SIZE = 20

/**
 * The 12 bytes of the age gate comparison in the app shell, anchored on the two preceding
 * instructions so that the sequence is unique inside the ~33 MB bundle:
 *
 * ```
 * ... 78 8d 45 0c 0c 1a 7b d0 | d4 3b 12 0c
 *         (GetById operand tails)  JStrictEqual 0x3b r18 r12
 * ```
 *
 * `JStrictEqual` (0xD4) jumps to the branch that renders `<NoAccessScreen/>` when
 * `state.access === AgeAssuranceAccess.None`.
 */
private val GATE_PATTERN: ByteArray = byteArrayOf(
    0x78, 0x8d.toByte(), 0x45, 0x0c,
    0x0c, 0x1a, 0x7b, 0xd0.toByte(),
    0xd4.toByte(), 0x3b, 0x12, 0x0c,
)

/**
 * Same instruction layout with the branch removed: `Eq` (0x16) instead of `JStrictEqual`.
 *
 * `Eq r21 = r18 == r12` is three bytes long just like the jump, so every following instruction
 * keeps its address and all jump offsets stay valid.
 *
 * The destination register must be one that is written before it is ever read, because `Eq`
 * stores a value where `JStrictEqual` did not. `r21` qualifies: its first write in the
 * fall-through is a `NewObject` at a later address, so it carries no live value across the
 * comparison. Writing there is harmless and execution falls through to the normal app
 * instead of jumping to the age gate screen. (Do not use `r11`: it holds the global object,
 * and `r12` still holds `Access.None`, both of which the surrounding code reads.)
 */
private val GATE_REPLACEMENT: ByteArray = byteArrayOf(
    0x78, 0x8d.toByte(), 0x45, 0x0c,
    0x0c, 0x1a, 0x7b, 0xd0.toByte(),
    0x16, 0x15, 0x12, 0x0c,
)

/**
 * Removes the client-side age verification wall from Bluesky.
 *
 * Bluesky is a React Native (Expo) app, so its UI lives in a Hermes bytecode bundle rather than
 * in Dalvik bytecode. In regions where age assurance is required and the user has not completed
 * it, the app shell renders a full-screen "share your age range" page instead of the app. That
 * page is chosen by a single comparison in the shell's render function:
 *
 * ```
 * if      (session.status === 'deactivated')  -> <DeactivatedScreen/>
 * else if (state.error === 'account-data')    -> <DataUnavailableScreen/>
 * else if (state.access === Access.None)      -> <NoAccessScreen/>     <- age gate
 * else                                        -> <RoutesContainer/>    <- the app
 * ```
 *
 * The patch replaces the conditional jump of the third branch with a non-branching comparison,
 * making the gate branch unreachable so the shell always renders the app. The rest of the age
 * assurance state (`AgeAssuranceAccess`, per-region flags) is untouched, so content restrictions
 * that apply to unverified users are preserved; only the blocking screen is bypassed.
 *
 * This is a [RawResourcePatch] because the bundle is an opaque binary asset: it is extracted
 * as-is, modified byte for byte, and written back into the patched APK.
 */
@Suppress("unused")
val bypassAgeGatePatch: RawResourcePatch = rawResourcePatch(
    name = "Bypass age verification gate",
    description = "Removes the full-screen age verification wall that blocks the app in regions " +
        "requiring age assurance. Content restrictions for unverified users are unchanged.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_BLUESKY)

    execute {
        val bundle = this[JS_BUNDLE_PATH]

        bundle.writeBytes(bundle.readBytes().withAgeGateBypassed())
    }
}

/**
 * Returns a copy of [this] Hermes bytecode file with the age gate branch neutralized, or throws
 * when the expected byte sequence is not present exactly once, which means the app version is
 * not supported.
 */
internal fun ByteArray.withAgeGateBypassed(): ByteArray {
    check(size > HBC_SHA1_FOOTER_SIZE) {
        "assets/index.android.bundle is too small to be a Hermes bytecode file ($size bytes)."
    }

    val matches = indicesOf(GATE_PATTERN)
    if (matches.size != 1) {
        error(
            "Expected the age gate bytecode pattern exactly once in $JS_BUNDLE_PATH, " +
                "but found ${matches.size} matches. This app version is not supported.",
        )
    }

    val patched = copyOf()
    val instructionOffset = matches.single()
    for (i in 0 until GATE_REPLACEMENT.size) {
        patched[instructionOffset + i] = GATE_REPLACEMENT[i]
    }

    // The runtime verifies the SHA-1 footer, so it must be recomputed after the edit.
    val bodyLength = patched.size - HBC_SHA1_FOOTER_SIZE
    val sha1 = MessageDigest.getInstance("SHA-1")
    sha1.update(patched, 0, bodyLength)
    val digest: ByteArray = sha1.digest()
    for (i in 0 until digest.size) {
        patched[bodyLength + i] = digest[i]
    }

    return patched
}

/** Every start index at which [pattern] occurs in this array. */
private fun ByteArray.indicesOf(pattern: ByteArray): List<Int> {
    val haystack = this
    return buildList {
        for (start in 0..haystack.size - pattern.size) {
            if (pattern.indices.all { haystack[start + it] == pattern[it] }) add(start)
        }
    }
}
