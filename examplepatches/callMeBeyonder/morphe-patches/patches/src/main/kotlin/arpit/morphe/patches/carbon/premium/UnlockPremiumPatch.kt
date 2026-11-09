package arpit.morphe.patches.carbon.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import arpit.morphe.patches.carbon.shared.Constants.COMPATIBILITY_CARBON
import java.security.MessageDigest

private const val BUNDLE_PATH = "assets/index.android.bundle"

/** Hermes bytecode version shipped by Carbon 2.77.6010. */
private const val HERMES_VERSION = 96

private val HERMES_MAGIC = byteArrayOf(
    0xC6.toByte(), 0x1F, 0xBC.toByte(), 0x03,
    0xC1.toByte(), 0x03, 0x19, 0x1F,
)

/** Property the screens read to decide whether the account is subscribed. */
private const val IS_SUBSCRIBED = "isSubscribed"

/**
 * The `GetById "isSubscribed"` instructions that read the flag as a boolean.
 *
 * All five are verified before patching: the bundle contains five real
 * instruction-boundary reads (decoded from absolute function-header offsets).
 * Two are boolean gates — [0x563878] compares `isSubscribed === true` inside
 * `hasActiveSubscription()` (func 24026), and [0x563A9C] compares it inside
 * `subscriptionState()` (func 24030) and writes `isActive` from the result.
 * The other three expose the flag to the UI — the Zustand selector getter
 * [0x66A588] (`state => state.isSubscribed`) plus the two object-copy sites
 * [0x76DF57] / [0x76E568] that build the Account / Subscription Information
 * objects. Forcing all five to `true` makes every reader see a subscribed
 * account. Raw `0x37` byte patterns that do not land on instruction
 * boundaries are deliberately not scanned — the list above is decoded, not
 * found by byte search.
 */
private val IS_SUBSCRIBED_SITES = listOf(0x563878, 0x563A9C, 0x66A588, 0x76DF57, 0x76E568)

/**
 * Entry point of `hasActiveSubscription()` (func 24026, assigned to the
 * `hasActiveSubscription` property in func 24025).
 *
 * This function is a method, not a plain boolean: every caller does
 * `GetById hasActiveSubscription` followed by `Call1`. Replacing that method
 * reference with `true` makes the app call `true()` and crash with
 * "true is not a function", so the method reference must stay intact. The
 * patch instead stubs the *body*: overwrite the first `GetEnvironment`
 * with `LoadConstTrue r0` + `Ret r0` so every call returns `true` regardless
 * of RevenueCat state. The bytes at [HAS_ACTIVE_ENTRY] are verified before
 * rewriting.
 */
private const val HAS_ACTIVE_ENTRY = 0x563825

/**
 * Entry points of the RevenueCat entitlement readers wired into the
 * subscription store in func 24025:
 * - [ACTIVE_PRODUCT_ID_ENTRY] = `activeProductId()` (func 24028): returns
 *   `customerInfo.entitlements.active.premium.productIdentifier`, or `null`
 *   when the entitlement is absent.
 * - [ACTIVE_PRODUCT_PLAN_ID_ENTRY] = `activeProductPlanId()` (func 24029):
 *   returns the active plan/product identifier, or `null` when absent.
 * - [SUBSCRIPTION_STATE_ENTRY] = `subscriptionState()` (func 24030): builds
 *   the UI subscription object (`isActive`, `isCancelled`, `willRenew`,
 *   `originalStore`, `periodType`, `packageType`, `nextBillDate`, …).
 *
 * These readers expect RevenueCat objects, not booleans, so the patch does
 * not force `premium` with a boolean. Instead each body is replaced by a
 * canned active value: `subscriptionState()` returns `{}` (no `isActive`) while
 * `premium` is `null`, which is why Settings → Subscription showed "Inactive"
 * even with `isSubscribed` forced. Stubbing the three bodies makes the
 * client-side entitlement readers agree with the boolean stubs above.
 */
private const val ACTIVE_PRODUCT_ID_ENTRY = 0x5638bd
private const val ACTIVE_PRODUCT_PLAN_ID_ENTRY = 0x56391c
private const val SUBSCRIPTION_STATE_ENTRY = 0x5639fd

/**
 * Canned entitlement values. All are plain strings already present in the
 * Hermes string table and are resolved at patch time (never hardcoded ids):
 * the real yearly product (`carbon_subscription:yearly`), its plan
 * (`yearly:p1y`), the store (`PLAY_STORE`), the period (`NORMAL`, i.e. not
 * `TRIAL`), the package type (`ANNUAL`, matching `PACKAGE_TYPE.ANNUAL` in the
 * bundled RevenueCat module), and a display renewal date. The date is
 * display-only — the app renders whatever string is stored.
 */
private const val FAKE_PRODUCT_ID = "carbon_subscription:yearly"
private const val FAKE_PRODUCT_PLAN_ID = "yearly:p1y"
private const val FAKE_STORE = "PLAY_STORE"
private const val FAKE_PERIOD_TYPE = "NORMAL"
private const val FAKE_PACKAGE_TYPE = "ANNUAL"
private const val FAKE_NEXT_BILL_DATE = "2 Aug 2026"

/**
 * Unlocks Carbon Premium.
 *
 * Carbon is a React Native app: the subscription gate is JavaScript compiled to
 * Hermes bytecode inside `assets/index.android.bundle`, and the JS reads the
 * account's subscription state from local flags (`isSubscribed`,
 * `hasActiveSubscription`) plus RevenueCat entitlement objects
 * (`customerInfo.entitlements.active.premium`). The patch:
 * 1. rewrites every `GetById` that reads the boolean `isSubscribed` flag into
 *    a constant `true`, so the paywall and the premium-only screens see an
 *    active subscription;
 * 2. stubs the body of `hasActiveSubscription()` to return `true` so its
 *    callers (which do `GetById` + `Call1`) keep working;
 * 3. stubs the entitlement readers `activeProductId()`,
 *    `activeProductPlanId()` and `subscriptionState()` to return a canned
 *    active yearly entitlement — the Settings → Subscription screen shows
 *    "Inactive" because `subscriptionState()` returns `{}` while `premium`
 *    is `null` (it never reaches its `isSubscribed` read), and plan/PRO
 *    surfaces read the product ids that are `null` for the same reason.
 *    The `premium` reads themselves are left untouched (boolean forcing
 *    would break object readers).
 *
 * RevenueCat and Play Billing stay in place for the store-side flows, and
 * nothing on the server is touched. Coaching/macro PAYLOAD stays
 * server-side: an account without a server-side entitlement still has no
 * coach data until the backend agrees it is entitled.
 *
 * Identifier ids and byte offsets move with every release, so both the Hermes
 * string table (resolved at patch time) and the `GetById` sites (verified
 * before rewriting) are handled explicitly instead of hardcoded ids.
 *
 * The signed-out entry paygate (`intro → Paygate` via `navigate('Paygate')`)
 * is intentionally untouched. `RootNavigator` shows `HomeTabStack` only for
 * logged-in users (`isLoggedIn`) with an active subscription, else the
 * signed-out stack; there is no session-less app home (routing `onContinue`
 * to `Onboarding` dead-ends without a session), and the entitlement stubs
 * already make the signed-in branch skip `Paygate` when entitled. What still
 * gates signed-out users is the account/session itself (server-side).
 */
@Suppress("unused")
val unlockPremiumPatch = rawResourcePatch(
    name = "Unlock Premium",
    description = "Unlocks Carbon Premium by forcing the app's `isSubscribed` reads to true, " +
        "stubbing `hasActiveSubscription()` and the RevenueCat entitlement readers " +
        "(`activeProductId()`, `activeProductPlanId()`, `subscriptionState()`) to a canned " +
        "active yearly entitlement. Account data the server owns is not affected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CARBON)

    execute {
        val bundle = get(BUNDLE_PATH)
        if (!bundle.exists()) throw PatchException("$BUNDLE_PATH not found.")

        val bytes = bundle.readBytes()
        val hermes = HermesBundle(bytes)

        val stringId = hermes.stringId(IS_SUBSCRIBED)
            ?: throw PatchException("Carbon identifier '$IS_SUBSCRIBED' not found.")
        // Order matters: force the boolean sites first, then stub the
        // function bodies. The `subscriptionState()` stub is only 84 bytes
        // and does not reach the `isSubscribed` site inside it, so the
        // verified site bytes survive.
        hermes.forceGetByIdTrue(IS_SUBSCRIBED_SITES, stringId)
        hermes.forceFunctionReturnTrue(HAS_ACTIVE_ENTRY)

        val productId = hermes.stringId(FAKE_PRODUCT_ID)
            ?: throw PatchException("Carbon identifier '$FAKE_PRODUCT_ID' not found.")
        hermes.forceFunctionReturnString(ACTIVE_PRODUCT_ID_ENTRY, productId)
        val planId = hermes.stringId(FAKE_PRODUCT_PLAN_ID)
            ?: throw PatchException("Carbon identifier '$FAKE_PRODUCT_PLAN_ID' not found.")
        hermes.forceFunctionReturnString(ACTIVE_PRODUCT_PLAN_ID_ENTRY, planId)
        hermes.forceFunctionReturnFakeSubscriptionState(SUBSCRIPTION_STATE_ENTRY)

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
        get() = align(HEADER_SIZE + functionCount * SMALL_FUNCTION_HEADER_SIZE) +
            align(stringKindCount * 4) + align(identifierCount * 4)

    private val overflowTableOffset: Int get() = stringTableOffset + stringCount * 4
    private val stringStorageOffset: Int get() = overflowTableOffset + overflowStringCount * 8

    init {
        if (bytes.size < HEADER_SIZE) {
            throw PatchException("Carbon bundle is too small to be Hermes bytecode.")
        }
        for (index in HERMES_MAGIC.indices) {
            if (bytes[index] != HERMES_MAGIC[index]) {
                throw PatchException("Carbon bundle is not Hermes bytecode.")
            }
        }
        val version = bytes.readUInt32(8)
        if (version != HERMES_VERSION) {
            throw PatchException("Unsupported Carbon Hermes bytecode version: $version")
        }
        if (header[0] != bytes.size) {
            throw PatchException("Carbon bundle length mismatch: ${header[0]} != ${bytes.size}")
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

    /**
     * Replaces the `GetById` at each verified offset by a constant `true`.
     *
     * `GetById` is six bytes (opcode, destination register, object register,
     * cache index, 16-bit string id); three two-byte `LoadConstTrue` instructions
     * fill the same space and leave the destination register set.
     */
    fun forceGetByIdTrue(sites: List<Int>, stringId: Int) {
        for (site in sites) {
            if (site < 0 || site + 6 > bytes.size) {
                throw PatchException("Carbon gate at 0x${site.toString(16)} is out of range.")
            }
            if ((bytes[site].toInt() and 0xFF) != GET_BY_ID) {
                throw PatchException("Carbon gate at 0x${site.toString(16)} is not a GetById.")
            }

            val candidate = (bytes[site + 4].toInt() and 0xFF) or
                ((bytes[site + 5].toInt() and 0xFF) shl 8)
            if (candidate != stringId) {
                throw PatchException("Carbon gate at 0x${site.toString(16)} reads the wrong property.")
            }

            val destination = bytes[site + 1]
            bytes[site] = LOAD_CONST_TRUE.toByte()
            bytes[site + 1] = destination
            bytes[site + 2] = LOAD_CONST_TRUE.toByte()
            bytes[site + 3] = destination
            bytes[site + 4] = LOAD_CONST_TRUE.toByte()
            bytes[site + 5] = destination
        }
    }

    /**
     * Replaces the function body at [entry] by an immediate `return true`.
     *
     * The entry is verified to start with `GetEnvironment` before rewriting,
     * so a shifted offset fails loudly instead of corrupting unrelated code.
     * `LoadConstTrue r0` + `Ret r0` (4 bytes) overwrites the 3-byte
     * `GetEnvironment` plus the first byte of the next (now unreachable)
     * instruction; the remaining bytes are dead code after the `Ret`.
     */
    fun forceFunctionReturnTrue(entry: Int) {
        if (entry < 0 || entry + 4 > bytes.size) {
            throw PatchException("Carbon function at 0x${entry.toString(16)} is out of range.")
        }
        if ((bytes[entry].toInt() and 0xFF) != GET_ENVIRONMENT) {
            throw PatchException("Carbon function at 0x${entry.toString(16)} does not start with GetEnvironment.")
        }

        bytes[entry] = LOAD_CONST_TRUE.toByte()
        bytes[entry + 1] = 0
        bytes[entry + 2] = RET.toByte()
        bytes[entry + 3] = 0
    }

    /**
     * Replaces the function body at [entry] by `return "<string>"`.
     *
     * The entry is verified to start with `GetEnvironment` before rewriting.
     * `LoadConstString r0, <id>` (4 bytes) + `Ret r0` (2 bytes) overwrite the
     * start of the body; the remaining bytes are dead code after the `Ret`.
     * The string id is resolved at patch time, never hardcoded.
     */
    fun forceFunctionReturnString(entry: Int, stringId: Int) {
        if (entry < 0 || entry + 6 > bytes.size) {
            throw PatchException("Carbon function at 0x${entry.toString(16)} is out of range.")
        }
        if ((bytes[entry].toInt() and 0xFF) != GET_ENVIRONMENT) {
            throw PatchException("Carbon function at 0x${entry.toString(16)} does not start with GetEnvironment.")
        }

        bytes[entry] = LOAD_CONST_STRING.toByte()
        bytes[entry + 1] = 0
        bytes[entry + 2] = (stringId and 0xFF).toByte()
        bytes[entry + 3] = ((stringId ushr 8) and 0xFF).toByte()
        bytes[entry + 4] = RET.toByte()
        bytes[entry + 5] = 0
    }

    /**
     * Replaces `subscriptionState()` at [entry] by a canned active state.
     *
     * The real body builds `{ isActive, isCancelled, willRenew, originalStore,
     * periodType, nextBillDate, … }` from `premium`, and returns `{}` (no
     * `isActive`) when `premium` is `null` — the Settings → Subscription
     * screen maps a falsy `isActive` to "Inactive". The stub builds the same
     * shape directly: `NewObject r0`, then `PutNewOwnById` for `isActive`
     * (true), `isCancelled` (false), `willRenew` (true), `originalStore`
     * (`PLAY_STORE`), `store` (`PLAY_STORE`), `periodType` (`NORMAL`),
     * `packageType` (`ANNUAL`), `nextBillDate` (a display date),
     * `isLifetime` (false) and `isComplimentary` (false), then `Ret r0`.
     *
     * `paidSubscription` and `isSubscriptionPaused` are deliberately omitted:
     * the manage/cancel block is store-side (Play Billing) and stays
     * server-blocked, and `isLifetime`/`isComplimentary` false keeps the
     * normal paid-subscription card. The 84-byte stub does not reach the
     * `isSubscribed` site inside the original body, so the boolean sites
     * forced earlier remain intact.
     */
    fun forceFunctionReturnFakeSubscriptionState(entry: Int) {
        if (entry < 0 || entry + FAKE_STATE_SIZE > bytes.size) {
            throw PatchException("Carbon function at 0x${entry.toString(16)} is out of range.")
        }
        if ((bytes[entry].toInt() and 0xFF) != GET_ENVIRONMENT) {
            throw PatchException("Carbon function at 0x${entry.toString(16)} does not start with GetEnvironment.")
        }

        val isActive = stringId("isActive")
            ?: throw PatchException("Carbon identifier 'isActive' not found.")
        val isCancelled = stringId("isCancelled")
            ?: throw PatchException("Carbon identifier 'isCancelled' not found.")
        val willRenew = stringId("willRenew")
            ?: throw PatchException("Carbon identifier 'willRenew' not found.")
        val originalStore = stringId("originalStore")
            ?: throw PatchException("Carbon identifier 'originalStore' not found.")
        val store = stringId("store")
            ?: throw PatchException("Carbon identifier 'store' not found.")
        val periodType = stringId("periodType")
            ?: throw PatchException("Carbon identifier 'periodType' not found.")
        val packageType = stringId("packageType")
            ?: throw PatchException("Carbon identifier 'packageType' not found.")
        val nextBillDate = stringId("nextBillDate")
            ?: throw PatchException("Carbon identifier 'nextBillDate' not found.")
        val isLifetime = stringId("isLifetime")
            ?: throw PatchException("Carbon identifier 'isLifetime' not found.")
        val isComplimentary = stringId("isComplimentary")
            ?: throw PatchException("Carbon identifier 'isComplimentary' not found.")
        val playStore = stringId(FAKE_STORE)
            ?: throw PatchException("Carbon identifier '$FAKE_STORE' not found.")
        val normal = stringId(FAKE_PERIOD_TYPE)
            ?: throw PatchException("Carbon identifier '$FAKE_PERIOD_TYPE' not found.")
        val annual = stringId(FAKE_PACKAGE_TYPE)
            ?: throw PatchException("Carbon identifier '$FAKE_PACKAGE_TYPE' not found.")
        val nextBill = stringId(FAKE_NEXT_BILL_DATE)
            ?: throw PatchException("Carbon identifier '$FAKE_NEXT_BILL_DATE' not found.")

        var pos = entry
        fun loadConstTrue() {
            bytes[pos] = LOAD_CONST_TRUE.toByte()
            bytes[pos + 1] = 1
            pos += 2
        }
        fun loadConstFalse() {
            bytes[pos] = LOAD_CONST_FALSE.toByte()
            bytes[pos + 1] = 1
            pos += 2
        }
        fun loadConstString(id: Int) {
            bytes[pos] = LOAD_CONST_STRING.toByte()
            bytes[pos + 1] = 1
            bytes[pos + 2] = (id and 0xFF).toByte()
            bytes[pos + 3] = ((id ushr 8) and 0xFF).toByte()
            pos += 4
        }
        fun putNewOwn(id: Int) {
            bytes[pos] = PUT_NEW_OWN_BY_ID.toByte()
            bytes[pos + 1] = 0
            bytes[pos + 2] = 1
            bytes[pos + 3] = (id and 0xFF).toByte()
            bytes[pos + 4] = ((id ushr 8) and 0xFF).toByte()
            pos += 5
        }

        bytes[pos] = NEW_OBJECT.toByte()
        bytes[pos + 1] = 0
        pos += 2
        loadConstTrue()
        putNewOwn(isActive)
        loadConstFalse()
        putNewOwn(isCancelled)
        loadConstTrue()
        putNewOwn(willRenew)
        loadConstString(playStore)
        putNewOwn(originalStore)
        loadConstString(playStore)
        putNewOwn(store)
        loadConstString(normal)
        putNewOwn(periodType)
        loadConstString(annual)
        putNewOwn(packageType)
        loadConstString(nextBill)
        putNewOwn(nextBillDate)
        loadConstFalse()
        putNewOwn(isLifetime)
        loadConstFalse()
        putNewOwn(isComplimentary)
        bytes[pos] = RET.toByte()
        bytes[pos + 1] = 0
        pos += 2
        if (pos - entry != FAKE_STATE_SIZE) {
            throw PatchException("Carbon subscription state stub size mismatch.")
        }
    }

    /**
     * Refreshes the SHA-1 trailer Hermes keeps over the bundle body.
     *
     * Hermes v96 verifies the trailing SHA-1 (over all bytes before the
     * trailer); the 20-byte field at offset 12 is the source-code hash and
     * is not derived from the bundle, so it is left untouched. Verified
     * against the shipped bundle: trailing hash equals SHA-1(body).
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
        const val HASH_SIZE = 20
        const val GET_BY_ID = 0x37
        const val GET_ENVIRONMENT = 0x29
        const val LOAD_CONST_TRUE = 0x78
        const val LOAD_CONST_FALSE = 0x79
        const val LOAD_CONST_STRING = 0x73
        const val NEW_OBJECT = 0x03
        const val PUT_NEW_OWN_BY_ID = 0x40
        const val RET = 0x5C
        const val FAKE_STATE_SIZE = 84
    }
}

private fun align(value: Int): Int = (value + 3) and 3.inv()

private fun ByteArray.readUInt32(offset: Int): Int =
    (this[offset].toInt() and 0xFF) or
        ((this[offset + 1].toInt() and 0xFF) shl 8) or
        ((this[offset + 2].toInt() and 0xFF) shl 16) or
        ((this[offset + 3].toInt() and 0xFF) shl 24)
