package arpit.morphe.patches.jumprope.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import arpit.morphe.patches.jumprope.shared.Constants.COMPATIBILITY_JUMPROPE

private const val BUNDLE_PATH = "assets/public/static/js/main.b075b1c6.chunk.js"

private const val GATE = "\"true\"===this.state.premium"
private const val STATE_SEED = "premium:window.localStorage.premium"
private const val HOOK_SEED = "useState)(window.localStorage.premium)"
private const val WRITE_SITE = "window.localStorage.premium=!0"

/**
 * Counts non-overlapping occurrences of [needle] in [text].
 *
 * Implemented as an [String.indexOf] loop because the bundle is a single-line
 * minified chunk (2,594,634 chars) where line-based checks do not apply.
 */
private fun countOf(text: String, needle: String): Int {
    var count = 0
    var fromIndex = 0
    while (true) {
        val index = text.indexOf(needle, fromIndex)
        if (index < 0) return count
        count++
        fromIndex = index + needle.length
    }
}

/**
 * Unlocks Jump Rope Challenge Premium.
 *
 * Jump Rope Challenge is a Capacitor hybrid (React CRA chunks + cordova-plugin-purchase),
 * not a native bytecode target: the entitlement gate lives in readable web JS inside
 * `assets/public/static/js/main.b075b1c6.chunk.js` (base APK inside the XAPK), so this
 * patch rewrites the JS bundle instead of any smali. The native `cc.fovea.PurchasePlugin`
 * bridge is a stock plugin and is deliberately left unpatched.
 *
 * The verified gate model (see `analysis/jump-rope-challenge/notes/premium-bypass.md`):
 * entitlement is the single localStorage string `premium`, seeded at component mount and
 * compared to `"true"`; it is only ever written by the CdvPurchase `verified` callback
 * at offset 1199572 (`window.localStorage.premium=!0`) after
 * `store.owned("jumpchallengepro")`. There is no server-side gate, no native
 * SharedPreferences flag, and no signature check in the app path.
 *
 * The patch performs three counted replacements, all verified against the shipped chunk
 * (char offsets are positions in the minified single-line chunk):
 * 1. `"true"===this.state.premium` → `!0` — the shared gate predicate across Gates 1-4
 *    (14 occurrences: §4 offsets 1131402, 1132267 [workout list], 2373744, 2374045,
 *    2375483, 2375784, 2377153, 2377520 [challenge list], 2463634, 2464456, 2464600
 *    [custom list], plus the §5 quota site 2465237
 *    `"true"===this.state.premium||this.state.filterCustomWorkout.length<3`, plus the
 *    two Settings display sites at 1167932 and 1168486);
 * 2. `premium:window.localStorage.premium` → `premium:"true"` — class state seeds
 *    (5 occurrences: offsets 1126262 [WorkoutsContainer], 1164319 [SettingsContainer],
 *    2365159 [ChallengesContainer], 2379341 [ActivityContainer], 2459689
 *    [CustomContainer]);
 * 3. `useState)(window.localStorage.premium)` → `useState)("true")` — the
 *    PremiumContainer hook seed (1 occurrence: offset 1198850,
 *    `[p,d]=Object(o.useState)(window.localStorage.premium)`).
 *
 * The sole write site `window.localStorage.premium=!0` (1 occurrence) must stay intact:
 * it is the CdvPurchase verified callback and is the only writer, so this patch never
 * does a bare `window.localStorage.premium` substring replacement — only the two exact
 * read shapes above. Unlike the `store.js` `LocalReceipts.isOwned` / validator
 * pass-through (which is also local and forgeable), the predicate/flag flip is enough:
 * forcing the premium side short-circuits every gate without simulating a purchase,
 * and the stock Play Billing flow is left in place.
 *
 * Every count is asserted before writing, and post-checks verify zero remaining gate/seed
 * shapes and the intact write site — a build mismatch fails the patch instead of shipping
 * a partial unlock.
 */
@Suppress("unused")
val unlockPremiumPatch = rawResourcePatch(
    name = "Unlock Premium",
    description = "Unlocks all premium content by forcing every premium gate " +
        "(\u0022true\u0022\u003d\u003d\u003dthis.state.premium) and every premium flag seed " +
        "to true in the web bundle.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JUMPROPE)

    execute {
        val bundle = get(BUNDLE_PATH)
        if (!bundle.exists()) throw PatchException("$BUNDLE_PATH not found.")

        val text = bundle.readText(Charsets.UTF_8)

        // Anchors proving the right file/build before any edit.
        if (!text.contains("jumpchallengepro") || !text.contains("window.CdvPurchase")) {
            throw PatchException(
                "$BUNDLE_PATH does not contain the Jump Rope Challenge anchors " +
                    "(\"jumpchallengepro\", \"window.CdvPurchase\"); unsupported build."
            )
        }

        val gateCount = countOf(text, GATE)
        if (gateCount != 14) {
            throw PatchException(
                "Expected 14 occurrences of $GATE in $BUNDLE_PATH but found $gateCount."
            )
        }
        val seedCount = countOf(text, STATE_SEED)
        if (seedCount != 5) {
            throw PatchException(
                "Expected 5 occurrences of $STATE_SEED in $BUNDLE_PATH but found $seedCount."
            )
        }
        val hookCount = countOf(text, HOOK_SEED)
        if (hookCount != 1) {
            throw PatchException(
                "Expected 1 occurrence of $HOOK_SEED in $BUNDLE_PATH but found $hookCount."
            )
        }

        val patched = text
            .replace(GATE, "!0")
            .replace(STATE_SEED, "premium:\"true\"")
            .replace(HOOK_SEED, "useState)(\"true\")")

        // Post-checks: no gate/seed shapes remain and the purchase write site is intact.
        if (countOf(patched, GATE) != 0) {
            throw PatchException("Gate $GATE still present after patching; aborting.")
        }
        if (countOf(patched, STATE_SEED) != 0) {
            throw PatchException("State seed $STATE_SEED still present after patching; aborting.")
        }
        if (countOf(patched, HOOK_SEED) != 0) {
            throw PatchException("Hook seed $HOOK_SEED still present after patching; aborting.")
        }
        if (countOf(patched, WRITE_SITE) != 1) {
            throw PatchException(
                "Write site $WRITE_SITE must appear exactly once after patching."
            )
        }

        bundle.writeBytes(patched.toByteArray(Charsets.UTF_8))
    }
}
