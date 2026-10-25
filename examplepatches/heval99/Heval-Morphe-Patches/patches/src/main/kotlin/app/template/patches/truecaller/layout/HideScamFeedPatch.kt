package app.template.patches.truecaller.layout

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER

@Suppress("unused")
val hideScamFeedPatch = bytecodePatch(
    name = "Hide Scam feed",
    description = "Turns off the Scam feed, its tab and its notifications.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        ScamFeedFeatureFingerprint.method.returnEarly(false)
    }
}
