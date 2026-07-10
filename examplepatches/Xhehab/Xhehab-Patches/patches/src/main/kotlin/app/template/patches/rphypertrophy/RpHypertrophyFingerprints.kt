package app.template.patches.rphypertrophy

import app.morphe.patcher.Fingerprint

object RpHypertrophyWebViewClientClassFingerprint : Fingerprint(
    name = "onPageFinished",
    strings = listOf("webView")
)
