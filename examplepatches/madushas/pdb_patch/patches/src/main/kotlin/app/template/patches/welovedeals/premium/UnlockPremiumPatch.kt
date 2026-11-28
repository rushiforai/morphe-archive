package app.template.patches.welovedeals.premium

import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.WE_LOVE_DEALS_COMPATIBILITY
import app.template.patches.shared.byteArrayOf
import java.io.RandomAccessFile

/**
 * Unlocks We Love Deals' premium content by forcing the user's entitlement flag.
 *
 * ## Where the entitlement lives
 *
 * The app is Flutter: all logic is AOT Dart in `libapp.so` (arm64, compressed
 * pointers, Dart 3.12.2). The entitlement is a single boolean on the user model —
 * `User.has_active_subscription` (object field `field_27`) — parsed from the server
 * JSON in exactly two places, both verified with blutter (Dart AOT snapshot
 * disassembler) against build 1.2.0 (vc 87):
 *
 *  1. `User.updateFromJson` @ `0x4e1888`: `bl User::_asBool` → `stur w0, [x1, #0x27]`
 *  2. `User.fromJson`       @ `0x5d5374`: `bl User::_asBool` → local kept for the
 *     factory-allocated User (stored into `field_27` at the end)
 *
 * `_asBool` maps the server's `has_active_subscription` JSON value to a Dart bool.
 * Every premium gate in the app (the redeem screen's
 * `NoSubscriptionSlideupContent` paywall slide-up, gated deals and coupons) branches
 * on this field — the redeem path literally tests the boolean's compressed-pointer
 * bit pattern (`tbnz w1, #4` = "is it `false`?" — `true` is `NULL+0x20`, `false` is
 * `NULL+0x30` in this snapshot, with NULL in register x22).
 *
 * ## The patch
 *
 * Replace each `bl User::_asBool` with `add x0, x22, #0x20` — the canonical
 * materialisation of Dart `true` in this snapshot — so the parsed value is
 * `true` regardless of what the server sends. Four bytes per site; the surrounding
 * 16-byte patterns below are unique in the whole 8.2 MB snapshot (verified by
 * exhaustive scan), so the replacement is unambiguous.
 *
 * ```
 * before:  ldr x4, [PP, #imm] ; bl User::_asBool ; ldur x1, [fp, #-8] ; ...
 * after:   ldr x4, [PP, #imm] ; add x0, x22, #0x20 ; ldur x1, [fp, #-8] ; ...
 * ```
 *
 * ## Honest scope
 *
 * This unlocks the client-side gate: the paywall slide-up stops appearing and
 * premium UI paths execute. Coupon *redemption codes* are issued by vendors and
 * validated server-side (the `/subscriptions/` endpoints, redemption endpoints), so
 * anything the backend re-verifies stays server-gated — same classification as the
 * Skillshare patch. The flag is re-derived on every session refresh
 * (`SessionManager.refreshSession` → `updateFromJson`), so the patch holds for the
 * whole app lifetime, not just the first parse.
 *
 * Device verification (2026-11-28): A/B on a rooted emulator and on a real arm64
 * phone — with only the entitlement sites patched the redeem button still raised
 * the "Subscription Required!" dialog (no logged-in session means the User static
 * does not exist and the gate rests on the provider's data-ready flag); with the
 * gate branch NOP'd the redeem flow reaches the vendor redemption-code entry
 * directly. Full evidence trail in docs/welovedeals.md.
 */
private data class BoolSite(
    val description: String,
    val pattern: String,
)

/**
 * Both `bl User::_asBool` call sites that feed `User.has_active_subscription`,
 * each anchored by the 12 surrounding bytes (unique in the snapshot).
 *
 * The patched instruction is always at offset +4: `bl` → `add x0, x22, #0x20`
 * (`0x910082c0`), i.e. bytes `c0 82 00 91` little-endian.
 */
private val BOOL_SITES = listOf(
    BoolSite(
        description = "User.updateFromJson (session refresh path)",
        // ldr x4,[PP,#0x5e0]; bl _asBool; ldur x1,[fp,#-8]; stur w0,[x1,#0x27]
        pattern = "64f342f909000094a1835ff8207002b8",
    ),
    BoolSite(
        description = "User.fromJson (login/createSession path)",
        // ldr x4,[PP,#0x198]; bl _asBool; ldur x1,[fp,#-8]; ldr x2,[PP,#0x3ae8]
        pattern = "64cf40f94e31fc97a1835ff862775df9",
    ),
)

/** `add x0, x22, #0x20` — the Dart `true` singleton (x22 = NULL register). */
private const val TRUE_INSTR = "c0820091"

/**
 * The redeem paywall gate itself: `tbnz w1, #4, #0x58ef3c` — "if the gate bool is
 * `false`, jump to the paywall slide-up". The 12 surrounding bytes are unique in the
 * snapshot; replacing the branch with `nop` (`d503201f`) makes the redeem flow run
 * regardless of the two gate inputs (User.has_active_subscription and the redeem
 * provider's data-ready flag), leaving only the server's own validation — which is
 * where the check belongs.
 */
private val GATE_SITE = Triple(
    // ldur w1,[r0,#0x2b]; add x1,x1,HEAP,lsl#32; tbnz w1,#4,#0x58ef3c
    "41b042b821801c8be1042037",
    "8",
    "d503201f",
)

@Suppress("unused")
val welovedealsUnlockPremiumPatch = rawResourcePatch(
    name = "Unlock premium",
    description = "Forces User.has_active_subscription to true in the Dart AOT snapshot " +
        "(both JSON parse sites), the flag every premium gate branches on, and NOPs the " +
        "redeem paywall's own branch (tbnz on the gate bool at 0x58eea0) so the redeem " +
        "flow always runs. Vendor-issued redemption codes and anything the backend " +
        "re-validates stay server-gated.",
    default = true,
) {
    compatibleWith(WE_LOVE_DEALS_COMPATIBILITY)

    execute {
        val path = "lib/arm64-v8a/libapp.so"
        val target = get(path, true)
        if (!target.exists()) return@execute

        var patched = 0
        val total = BOOL_SITES.size + 1
        RandomAccessFile(target, "rw").use { raf ->
            val fileLen = raf.length()

            // scan the whole library for the unique pattern, then patch at `slotOffset`
            fun patchOnce(description: String, patternHex: String, slotOffset: Int, newHex: String) {
                val pattern = byteArrayOf(patternHex)
                val replacement = byteArrayOf(patternHex).also {
                    byteArrayOf(newHex).copyInto(it, slotOffset)
                }
                var offset = 0L
                var found = 0
                while (offset + pattern.size <= fileLen) {
                    raf.seek(offset)
                    val buf = ByteArray(pattern.size)
                    raf.readFully(buf)
                    if (buf.contentEquals(pattern)) {
                        raf.seek(offset)
                        raf.write(replacement)
                        found++
                    }
                    offset += 1
                }
                check(found == 1) {
                    "We Love Deals $description: expected exactly 1 match for $patternHex, " +
                        "found $found — snapshot layout changed, re-run blutter and refresh the pattern"
                }
                patched++
            }

            BOOL_SITES.forEach { site ->
                patchOnce(site.description, site.pattern, 4, TRUE_INSTR)
            }
            val (gatePattern, slotHex, nopHex) = GATE_SITE
            patchOnce("redeem paywall gate branch", gatePattern, slotHex.toInt(), nopHex)
        }
        println("[We Love Deals premium] patched $patched/$total sites (2 entitlement parses + paywall gate)")
    }
}