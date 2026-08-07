/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.hypertrophy.premium

import app.morphe.patcher.Fingerprint

object WebViewClientClassFingerprint : Fingerprint(
    name = "onPageFinished",
    strings = listOf("webView")
)