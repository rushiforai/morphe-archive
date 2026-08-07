/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.myfitnesspal.premium

import app.morphe.patcher.Fingerprint

object GetPremiumPlusFingerprint : Fingerprint(
    name = "getPremiumPlusEnabled",
    definingClass = "/SubscriptionPreferences;"
)