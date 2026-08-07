/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.macrofactor.premium

import app.morphe.patcher.Fingerprint

object BuildCustomerInfoFingerprint : Fingerprint(
    name = "buildCustomerInfo",
    definingClass = "/CustomerInfoFactory;",
    strings = listOf("subscriptions")
)