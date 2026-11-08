package semicoloncolonel.mobilestream.patches.truthsocial.misc

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.truthsocial.shared.Constants
import semicoloncolonel.mobilestream.patches.truthsocial.shared.modelConstructor
import semicoloncolonel.mobilestream.patches.truthsocial.shared.overrideJsonValues

// Truth Social 1.28.3. Posts marked sensitive show their media blurred
// until tapped. The patch reads every post as not sensitive, so media
// shows at once. Content warnings written by the author still show.
@Suppress("unused")
val showSensitiveMediaPatch = bytecodePatch(
    name = "Show sensitive media",
    description = "Shows media in posts marked sensitive without blurring it first.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        modelConstructor("Lcom/truthsocial/core/data/models/TruthStatus;").overrideJsonValues(mapOf("sensitive" to false))
    }
}
