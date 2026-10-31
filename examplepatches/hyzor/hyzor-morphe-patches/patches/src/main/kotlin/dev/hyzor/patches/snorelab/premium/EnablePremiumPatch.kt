package dev.hyzor.patches.snorelab.premium

import app.morphe.patcher.patch.bytecodePatch
import dev.hyzor.patches.snorelab.shared.Constants.SNORELAB
import dev.hyzor.patches.util.returnEarly

/**
 * SnoreLab keeps the "is this account premium" decision on the device. The billing library
 * (`lib-billing`, `pl.c`/`BasePremiumRepository`) merges two sources:
 *
 *   Play Billing (`pl.m`)            local cross-platform data (`mp.d`)
 *            \                       /
 *             `pl.c.flowPremiumState()` -> `Premium` / `Expired` / `Free`
 *                                  |
 *                `vp.h.q()`  `remotePremiumActive` (boolean pref)
 *                `mp.d.p()`  `remotePremiumExpirationDate > now`
 *
 * The local source is the one the server writes through the user-data repository, so it is
 * also the one a re-signed sideload can influence. Forcing its two inputs makes it report
 * `Premium`, which the merge in `pl.c` treats as a winning result even when Play Billing
 * returns nothing. `pl.c.isPremium()` and `pl.a0.isPremium()` then report `true`, and every
 * feature that asks the premium repository is unlocked.
 *
 * This is the same hook set as hoo-dles' 2.27.3.6291 patch, re-resolved for 2.33.5.7814.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables app features locked behind the subscription paywall.",
    default = true,
) {
    compatibleWith(SNORELAB)

    execute {
        // `remotePremiumActive` is what the cross-platform source reads, and it also feeds
        // `CrossPlatformCloudEnabled`. It is cleared by `mp.d.l()` and by the repository when
        // the server says there is no expiry date, so override the getter instead of the pref.
        IsRemotePremiumActiveFingerprint.method.returnEarly(true)

        // The expiry half of the local premium state. A null or past date would otherwise make
        // `mp.d` emit `Expired` instead of `Premium` even when `remotePremiumActive` is true.
        IsPremiumDateValidFingerprint.method.returnEarly(true)
    }
}
