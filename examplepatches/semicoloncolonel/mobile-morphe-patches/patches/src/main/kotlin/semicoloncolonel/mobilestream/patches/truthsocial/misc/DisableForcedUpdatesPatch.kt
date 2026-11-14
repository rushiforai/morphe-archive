package semicoloncolonel.mobilestream.patches.truthsocial.misc

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.truthsocial.shared.Constants
import semicoloncolonel.mobilestream.patches.truthsocial.shared.modelConstructor
import semicoloncolonel.mobilestream.patches.truthsocial.shared.overrideJsonValues

// Truth Social 1.28.3. The server names the lowest app version it accepts
// (api/get_android_version), and whether to force the update. When the
// app's own version (1279) is lower, MinAppVersionManager asks for, or
// forces, an update from the Play Store, which a patched app cannot take.
// The patch reads every answer as "minimum 0, not forced".
@Suppress("unused")
val disableForcedUpdatesPatch = bytecodePatch(
    name = "Disable forced updates",
    description = "Keeps the app from requiring a newer version before it opens.",
) {
    category("Setup")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        modelConstructor("Lcom/truthsocial/core/data/models/MinAppVersion;")
            .overrideJsonValues(mapOf("minimum" to 0, "forced" to false))
    }
}
