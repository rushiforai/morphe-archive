/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.lyfta.premium

import app.morphe.patcher.Fingerprint

object GetSubscriptionTypeFingerprint : Fingerprint(
    definingClass = "Lcom/lyfta/util/helpers/Utils;",
    name = "getSubscriptionType"
)