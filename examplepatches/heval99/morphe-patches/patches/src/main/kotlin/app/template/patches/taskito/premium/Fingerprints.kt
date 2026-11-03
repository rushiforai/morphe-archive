package app.template.patches.taskito.premium

import app.morphe.patcher.Fingerprint

/**
 * Taskito's (formerly Reflog) local premium answer. The class lives in the app's own, unshrunk
 * package (`com.fenchtose.reflog.features.purchase`), but the method is R8-renamed, so the anchor
 * is the shape plus the preference key it reads: the cached server entitlement (`entitlement`
 * prefs: `premium` and `sku_<id>`) and the Play order cache (`orders`/`order_tokens`).
 *
 * In 1.3.3 it is `com.fenchtose.reflog.features.purchase.d.d()Z`, the single implementation of
 * the purchase-keeper interface; `features.purchases.g.q()` is its only caller and ORs it into
 * every feature gate (the `t7.e` implementation in `features.purchases.g`).
 */
internal object PremiumStateFingerprint : Fingerprint(
    definingClass = "Lcom/fenchtose/reflog/features/purchase/d;",
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("premium", "sku_"),
)
