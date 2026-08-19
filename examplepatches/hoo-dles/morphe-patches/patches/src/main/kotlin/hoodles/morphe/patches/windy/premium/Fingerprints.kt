/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.windy.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

object IsPremiumForWidgetFingerprint : Fingerprint(
    strings = listOf("subscription", "", "premium"),
    returnType = "Z"
)

object ShouldInterceptRequestFingerprint : Fingerprint(
    definingClass = "/BridgeWebViewClient;",
    name = "shouldInterceptRequest"
)