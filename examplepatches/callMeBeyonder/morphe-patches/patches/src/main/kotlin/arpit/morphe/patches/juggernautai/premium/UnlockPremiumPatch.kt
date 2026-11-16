package arpit.morphe.patches.juggernautai.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import arpit.morphe.patches.juggernautai.shared.Constants.COMPATIBILITY_JUGGERNAUTAI
import arpit.morphe.patches.juggernautai.shared.disableExpoUpdatesPatch
import java.security.MessageDigest

private const val BUNDLE_PATH = "assets/index.android.bundle"

/** Hermes bytecode version shipped by JuggernautAI 3.1.0. */
private const val HERMES_VERSION = 96

private val HERMES_MAGIC = byteArrayOf(
    0xC6.toByte(), 0x1F, 0xBC.toByte(), 0x03,
    0xC1.toByte(), 0x03, 0x19, 0x1F,
)

/**
 * The bundled config flag the whole paywall hangs off.
 *
 * `src/config/config.ts` exposes it as a CJS getter over a module-environment
 * slot that is filled once at module init with `!isBetaTesting`, where
 * `isBetaTesting` is `channel === 'beta'`. Every reader goes through the getter,
 * so initialising the slot to `false` turns the app's own "subscriptions are not
 * live" mode on.
 */
private const val SUBSCRIPTION_FLAG = "SUBSCRIPTION_ENABLED"

/**
 * Unlocks JuggernautAI Premium.
 *
 * JuggernautAI is a React Native + Expo app. `classes*.dex` only holds the Expo
 * shell, the IAPHUB/Google Play Billing bridges and native glue; the entitlement
 * model itself is JavaScript compiled to Hermes bytecode (HBC v96) inside
 * `assets/index.android.bundle` of the base APK, so this patch rewrites the
 * bundle instead of any smali.
 *
 * The verified client gate model (see `analysis/juggernautai/notes/`):
 * 1. `useSubscription()` (func 37279) reads the MMKV key `subscription` and
 *    exposes `hasSubscription`, then runs an effect (func 37283) that calls
 *    `navigation.navigate('Subscription')` — the only `navigate('Subscription')`
 *    in the bundle — when the IAPHUB active-product list is empty, the account
 *    role is not in `FREE_USER_ROLES` and `SUBSCRIPTION_ENABLED` is true.
 * 2. `SubscriptionScreen` (func 40127) runs a guard (func 40130) that resets the
 *    navigator to `MainTabs` as soon as there is an active product, the account
 *    is in `FREE_USER_ROLES`, or `SUBSCRIPTION_ENABLED` is false.
 * 3. The purchase sync effect (func 37284) only dispatches
 *    `syncUserSubscriptions()` when `SUBSCRIPTION_ENABLED` is true, and
 *    `useWalkthroughTrigger` (func 37225) uses the same flag to decide whether a
 *    subscription has to be bought before the walkthrough.
 *
 * All four readers are the complete set of consumers of the flag, and all four
 * treat `false` as "no paywall": the effect skips the redirect and writes
 * `subscription = { hasSubscription: true }` to MMKV, the Subscription screen
 * bounces straight back to `MainTabs`, the IAPHUB sync is skipped and the
 * walkthrough runs. There is no per-program lock in the bundle — premium
 * programs (`isPremium` in func 45045) are only split into the "Our Premium
 * Programs" / "Specialized Training" lists by funcs 45032/45035 — so disabling
 * the flag is enough to reach every program without simulating a purchase.
 *
 * Play Billing and IAPHUB stay in place and untouched: the store flow is simply
 * never entered. What the backend owns is not affected — a re-signed sideload
 * still loses Play Integrity / App Check, and Firestore data that the server
 * gates on a subscription is out of reach of any client patch.
 *
 * The patch depends on [disableExpoUpdatesPatch]. The build ships
 * `EXPO_UPDATES_CHECK_ON_LAUNCH=ALWAYS` against `https://u.expo.dev/d23b55f8-…`, so an
 * OTA JS update downloaded on first launch would silently replace the patched
 * `assets/index.android.bundle` on the next launch. That patch turns the Expo-updates
 * configuration off in the shell's DEX, which is the same state the
 * `expo.modules.updates.ENABLED` manifest flag would produce; the manifest itself is
 * deliberately not edited, because the on-request raw coder never materialises
 * `AndroidManifest.xml` (only `assets/`, `lib/` and the other root entries are
 * extracted), so a raw resource patch cannot read or replace it.
 *
 * The patch resolves the flag's string id and the initialisation sequence that
 * fills its environment slot from the bundle at patch time (never hardcoded),
 * verifies the exact instruction shapes before rewriting, and refreshes the
 * Hermes SHA-1 trailer. The exported getter bodies are left untouched: Hermes
 * deduplicates identical functions, so every module's "return environment slot
 * N" getter shares one code sequence and rewriting it would break unrelated
 * modules.
 */
@Suppress("unused")
val unlockPremiumPatch = rawResourcePatch(
    name = "Unlock Premium",
    description = "Unlocks all premium programs by initialising the app's own " +
        "`SUBSCRIPTION_ENABLED` config flag to false at module init. That is the flag the paywall, " +
        "the Subscription screen guard, the IAPHUB sync and the walkthrough check all " +
        "read, so the app runs in its \"subscriptions not live\" mode: no paywall, " +
        "premium programs selectable. Expo OTA updates are disabled so a downloaded " +
        "JS bundle cannot overwrite the patched one. Store and server-side data are " +
        "not affected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JUGGERNAUTAI)

    // The bundle rewrite is pointless if Expo updates can replace it on the next launch.
    dependsOn(disableExpoUpdatesPatch)

    execute {
        val bundle = get(BUNDLE_PATH)
        if (!bundle.exists()) throw PatchException("$BUNDLE_PATH not found.")

        val bytes = bundle.readBytes()
        val hermes = HermesBundle(bytes)
        hermes.disableSubscriptionFlag()
        hermes.updateTrailingHash()
        bundle.writeBytes(bytes)
    }
}

/**
 * Reader for the Hermes bytecode container (v96) that can rewrite instructions.
 *
 * Layout follows the bytecode file format: 8-byte magic, version, 20-byte source
 * hash, nineteen 32-bit header fields, a 1-byte option flag + 19 padding bytes
 * (128-byte header total), the function header table, the string-kind and
 * identifier-hash tables, the string table, its overflow table and the string
 * storage. Function header offsets are absolute file offsets.
 *
 * v96 packs the 16-byte small function header as bit fields: bits 0..24 hold the
 * bytecode offset, bits 25..31 the parameter count, bits 32..46 the bytecode size
 * and bits 47..63 the function-name string id.
 */
private class HermesBundle(private val bytes: ByteArray) {
    private val header = IntArray(HEADER_FIELD_COUNT) { bytes.readUInt32(HEADER_FIELDS_OFFSET + it * 4) }

    private val functionCount get() = header[2]
    private val stringKindCount get() = header[3]
    private val identifierCount get() = header[4]
    private val stringCount get() = header[5]
    private val overflowStringCount get() = header[6]
    private val stringStorageSize get() = header[7]

    private val stringTableOffset: Int
        get() = align(
            align(align(HEADER_SIZE + functionCount * SMALL_FUNCTION_HEADER_SIZE) + stringKindCount * 4) +
                identifierCount * 4
        )

    private val overflowTableOffset: Int get() = stringTableOffset + stringCount * 4
    private val stringStorageOffset: Int get() = overflowTableOffset + overflowStringCount * 8

    init {
        if (bytes.size < HEADER_SIZE) {
            throw PatchException("JuggernautAI bundle is too small to be Hermes bytecode.")
        }
        for (index in HERMES_MAGIC.indices) {
            if (bytes[index] != HERMES_MAGIC[index]) {
                throw PatchException("JuggernautAI bundle is not Hermes bytecode.")
            }
        }
        val version = bytes.readUInt32(8)
        if (version != HERMES_VERSION) {
            throw PatchException("Unsupported JuggernautAI Hermes bytecode version: $version")
        }
        if (header[0] != bytes.size) {
            throw PatchException("JuggernautAI bundle length mismatch: ${header[0]} != ${bytes.size}")
        }
    }

    /** Resolves an ASCII string-table entry to its bytecode string id. */
    fun stringId(value: String): Int? {
        val target = value.toByteArray(Charsets.UTF_8)
        for (index in 0 until stringCount) {
            val raw = bytes.readUInt32(stringTableOffset + index * 4)
            val isUtf16 = raw and 1
            val offset = (raw ushr 1) and SMALL_STRING_OFFSET_MASK
            val length = (raw ushr 24) and 0xFF
            if (isUtf16 != 0 || length == OVERFLOW_LENGTH || offset == OVERFLOW_OFFSET) continue
            if (length != target.size || offset + length > stringStorageSize) continue

            var matches = true
            for (position in target.indices) {
                if (bytes[stringStorageOffset + offset + position] != target[position]) {
                    matches = false
                    break
                }
            }
            if (matches) return index
        }
        return null
    }

    /** Absolute bytecode offset of [functionId]'s body. */
    private fun functionOffset(functionId: Int): Int {
        if (functionId < 0 || functionId >= functionCount) {
            throw PatchException("JuggernautAI function #$functionId is out of range.")
        }
        return bytes.readUInt32(HEADER_SIZE + functionId * SMALL_FUNCTION_HEADER_SIZE) and BYTECODE_OFFSET_MASK
    }

    /** Bytecode size of [functionId] in bytes. */
    private fun functionSize(functionId: Int): Int {
        if (functionId < 0 || functionId >= functionCount) {
            throw PatchException("JuggernautAI function #$functionId is out of range.")
        }
        val raw = bytes.readUInt32(HEADER_SIZE + functionId * SMALL_FUNCTION_HEADER_SIZE + 4)
        return raw and BYTECODE_SIZE_MASK
    }

    /**
     * Absolute byte range of the function whose body contains [site], if any.
     *
     * Several function headers can share one body (Hermes deduplicates identical
     * functions), so ranges that are equal are folded together and only genuinely
     * different overlapping ranges are rejected.
     */
    private fun functionContaining(site: Int): FunctionRange? {
        var match: FunctionRange? = null
        for (functionId in 0 until functionCount) {
            val start = functionOffset(functionId)
            val size = functionSize(functionId)
            if (site < start || site >= start + size) continue
            val current = match
            if (current == null) {
                match = FunctionRange(functionId, start, size)
            } else if (current.start != start || current.size != size) {
                throw PatchException(
                    "JuggernautAI bytecode function ranges overlap at 0x${site.toString(16)}."
                )
            }
        }
        return match
    }

    private class FunctionRange(val id: Int, val start: Int, val size: Int)

    /**
     * Initialises the environment slot behind `SUBSCRIPTION_ENABLED` to `false`.
     *
     * The config module factory computes the flag once, straight-line:
     *
     * ```
     * StrictEq             rA, rB, rA  ; isBetaTesting = channel === 'beta'
     * JmpTrue              +5, rA
     * LoadConstFalse       rA
     * StoreNPToEnvironment rE, 1, rA   ; environment slot 1 = isBetaTesting
     * Not                  rA, rA      ; SUBSCRIPTION_ENABLED = !isBetaTesting
     * StoreNPToEnvironment rE, 2, rA   ; environment slot 2
     * ```
     *
     * and each exported constant is just a `GetEnvironment` +
     * `LoadFromEnvironment` getter over one of those slots. Hermes deduplicates
     * identical function bodies, so one "return environment slot 2" sequence is
     * shared by every module whose third export is a getter (896 function
     * headers point at that body in 3.1.0). Rewriting it makes unrelated exports
     * return `false` and crashes the JS runtime, so the flag is rewritten where
     * this module computes it instead: the factory body is unique and not shared.
     *
     * The 20-byte idiom is matched with full register consistency (same value
     * register throughout, same environment register for both stores, and the
     * environment register distinct from the value register), then rewritten to
     * keep `isBetaTesting` untouched while storing `false` into slot 2. The block
     * keeps its exact length, so no header, table or offset shifts; the surplus
     * tail is filled with `LoadConstFalse` self-assignments, which are harmless
     * and never change a register's type.
     */
    fun disableSubscriptionFlag() {
        val flagStringId = stringId(SUBSCRIPTION_FLAG)
            ?: throw PatchException("JuggernautAI identifier '$SUBSCRIPTION_FLAG' not found.")

        val sites = ArrayList<Int>()
        for (site in 0..bytes.size - LOAD_CONST_STRING_SIZE) {
            if ((bytes[site].toInt() and 0xFF) != LOAD_CONST_STRING) continue
            if (bytes.readUInt16(site + 2) != flagStringId) continue
            if (functionContaining(site) == null) continue
            sites += site
        }
        if (sites.size != 1) {
            throw PatchException(
                "Expected exactly one read of '$SUBSCRIPTION_FLAG' in the JuggernautAI bundle " +
                    "but found ${sites.size}."
            )
        }

        val loadConstSite = sites.single()
        val factory = functionContaining(loadConstSite)
            ?: throw PatchException(
                "JuggernautAI '$SUBSCRIPTION_FLAG' at 0x${loadConstSite.toString(16)} is not " +
                    "inside a function body."
            )

        val candidates = ArrayList<Int>()
        for (start in factory.start..factory.start + factory.size - INIT_SEQUENCE_SIZE) {
            if (matchesInitSequence(start)) candidates += start
        }
        if (candidates.size != 1) {
            throw PatchException(
                "Expected exactly one '$SUBSCRIPTION_FLAG' initialisation site in JuggernautAI " +
                    "function #${factory.id} but found ${candidates.size}."
            )
        }

        val start = candidates.single()
        val value = bytes[start + 1].toInt() and 0xFF
        val environment = bytes[start + 10].toInt() and 0xFF

        bytes[start + 4] = STORE_NP_TO_ENVIRONMENT.toByte()
        bytes[start + 5] = environment.toByte()
        bytes[start + 6] = IS_BETA_TESTING_SLOT.toByte()
        bytes[start + 7] = value.toByte()
        bytes[start + 8] = LOAD_CONST_FALSE.toByte()
        bytes[start + 9] = value.toByte()
        bytes[start + 10] = STORE_NP_TO_ENVIRONMENT.toByte()
        bytes[start + 11] = environment.toByte()
        bytes[start + 12] = SUBSCRIPTION_ENABLED_SLOT.toByte()
        bytes[start + 13] = value.toByte()
        for (offset in INIT_SEQUENCE_PADDING_START until INIT_SEQUENCE_SIZE step 2) {
            bytes[start + offset] = LOAD_CONST_FALSE.toByte()
            bytes[start + offset + 1] = value.toByte()
        }
    }

    /**
     * Matches `StrictEq` + `JmpTrue` + `LoadConstFalse` + store slot 1 + `Not`
     * + store slot 2 for one value register and one environment register.
     */
    private fun matchesInitSequence(start: Int): Boolean {
        if ((bytes[start].toInt() and 0xFF) != STRICT_EQ) return false
        val value = bytes[start + 1].toInt() and 0xFF
        val other = bytes[start + 2].toInt() and 0xFF
        if ((bytes[start + 3].toInt() and 0xFF) != value) return false
        if ((bytes[start + 4].toInt() and 0xFF) != JMP_TRUE) return false
        if ((bytes[start + 5].toInt() and 0xFF) != JMP_OVER_LOAD_CONST_FALSE) return false
        if ((bytes[start + 6].toInt() and 0xFF) != value) return false
        if ((bytes[start + 7].toInt() and 0xFF) != LOAD_CONST_FALSE) return false
        if ((bytes[start + 8].toInt() and 0xFF) != value) return false
        if ((bytes[start + 9].toInt() and 0xFF) != STORE_NP_TO_ENVIRONMENT) return false
        val environment = bytes[start + 10].toInt() and 0xFF
        if ((bytes[start + 11].toInt() and 0xFF) != IS_BETA_TESTING_SLOT) return false
        if ((bytes[start + 12].toInt() and 0xFF) != value) return false
        if ((bytes[start + 13].toInt() and 0xFF) != NOT) return false
        if ((bytes[start + 14].toInt() and 0xFF) != value) return false
        if ((bytes[start + 15].toInt() and 0xFF) != value) return false
        if ((bytes[start + 16].toInt() and 0xFF) != STORE_NP_TO_ENVIRONMENT) return false
        if ((bytes[start + 17].toInt() and 0xFF) != environment) return false
        if ((bytes[start + 18].toInt() and 0xFF) != SUBSCRIPTION_ENABLED_SLOT) return false
        if ((bytes[start + 19].toInt() and 0xFF) != value) return false
        return environment != value && environment != other
    }

    /**
     * Refreshes the SHA-1 trailer Hermes keeps over the bundle body.
     *
     * Hermes v96 verifies the trailing SHA-1 (over all bytes before the trailer);
     * the 20-byte field at offset 12 is the source-code hash and is not derived
     * from the bundle, so it is left untouched.
     */
    fun updateTrailingHash() {
        val content = bytes.copyOfRange(0, bytes.size - HASH_SIZE)
        MessageDigest.getInstance("SHA-1").digest(content).copyInto(bytes, bytes.size - HASH_SIZE)
    }

    private companion object {
        const val HEADER_FIELDS_OFFSET = 32
        const val HEADER_FIELD_COUNT = 19
        const val HEADER_SIZE = 128
        const val SMALL_FUNCTION_HEADER_SIZE = 16
        const val SMALL_STRING_OFFSET_MASK = 0x7FFFFF
        const val OVERFLOW_OFFSET = 0x7FFFFF
        const val OVERFLOW_LENGTH = 0xFF
        const val BYTECODE_OFFSET_MASK = 0x1FFFFFF
        const val BYTECODE_SIZE_MASK = 0x7FFF
        const val HASH_SIZE = 20
        const val NOT = 0x0B
        const val STRICT_EQ = 0x0F
        const val STORE_NP_TO_ENVIRONMENT = 0x2C
        const val LOAD_CONST_STRING = 0x73
        const val LOAD_CONST_FALSE = 0x79
        const val JMP_TRUE = 0x90
        const val LOAD_CONST_STRING_SIZE = 4
        const val JMP_OVER_LOAD_CONST_FALSE = 5
        const val IS_BETA_TESTING_SLOT = 1
        const val SUBSCRIPTION_ENABLED_SLOT = 2
        const val INIT_SEQUENCE_SIZE = 20
        const val INIT_SEQUENCE_PADDING_START = 14
    }
}

private fun align(value: Int): Int = (value + 3) and 3.inv()

private fun ByteArray.readUInt16(offset: Int): Int =
    (this[offset].toInt() and 0xFF) or
        ((this[offset + 1].toInt() and 0xFF) shl 8)

private fun ByteArray.readUInt32(offset: Int): Int =
    (this[offset].toInt() and 0xFF) or
        ((this[offset + 1].toInt() and 0xFF) shl 8) or
        ((this[offset + 2].toInt() and 0xFF) shl 16) or
        ((this[offset + 3].toInt() and 0xFF) shl 24)
