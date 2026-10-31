package app.asana.patches.login

import app.asana.patches.shared.Constants.COMPATIBILITY_ASANA_REBEL
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

@Suppress("unused")
val skipGdprPatch = bytecodePatch(
    name = "Skip privacy consent screen",
    description = "A fresh guest account has no privacyPolicy/termsOfService flags, so the app " +
        "would open the consent screen right after the splash. This disables that check.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ASANA_REBEL)

    execute {
        GdprStatusFingerprint.method.returnEarly()
    }
}
