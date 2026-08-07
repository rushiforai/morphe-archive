/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.webster.premium

import app.morphe.patcher.Fingerprint

internal const val SUBSCRIPTION_CLASS = "Lcom/merriamwebster/dictionary/bean/MWSubscription;"

object GetSubscriptionFingerprint : Fingerprint(
    strings = listOf("PREF_CURRENT_SUBSCRIPTION"),
    returnType = SUBSCRIPTION_CLASS
)
