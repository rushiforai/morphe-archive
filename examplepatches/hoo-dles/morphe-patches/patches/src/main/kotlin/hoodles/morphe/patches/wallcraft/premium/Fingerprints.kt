/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.wallcraft.premium

import app.morphe.patcher.Fingerprint

object GetSubscriptionStateFingerprint : Fingerprint(
    name = "getSubscriptionStateByOptions",
    definingClass = "Lcom/wallpaperscraft/billing/core/SubscriptionManager;"
)