package app.template.patches.taskito.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_TASKITO

/**
 * Taskito (formerly Reflog) decides "premium" locally. The server entitlement is cached in the
 * `entitlement` SharedPreferences (`premium` and `sku_<id>`) and verified Play orders in
 * `orders` / `order_tokens`, and one Boolean getter on the purchase keeper answers the question
 * for the whole app: the feature-gate implementation ORs it into every unlock check.
 *
 * The patch makes that getter answer true. The billing client, the entitlement sync and the
 * cached values are untouched; the account record on the server is not consulted, so anything
 * that needs a real account (cloud sync) still needs one.
 *
 * Verified 2026-10-28 against 1.3.3 (versionCode 1331): smoke test, CLI without -f, a decompiled
 * check of the getter and a cold start on the emulator. See COMPATIBILITY_TASKITO.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Taskito's premium features locally (account sync still needs an account).",
) {
    compatibleWith(COMPATIBILITY_TASKITO)

    execute {
        PremiumStateFingerprint.method.returnEarly(true)
    }
}
