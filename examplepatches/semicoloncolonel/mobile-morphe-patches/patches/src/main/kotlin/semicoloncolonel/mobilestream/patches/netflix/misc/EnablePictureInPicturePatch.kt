package semicoloncolonel.mobilestream.patches.netflix.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.netflix.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// Netflix can turn picture-in-picture off per device through a server config
// flag (DeviceConfigData.shouldDisablePip). The player reads it through the
// config service's getShouldDisablePip() passthrough. Forcing that getter to
// report "not disabled" keeps picture-in-picture available even where Netflix
// switched it off. It is a plain boolean read with no DRM or server round
// trip; picture-in-picture itself uses the standard Android APIs.
private object ShouldDisablePipFingerprint : Fingerprint(
    definingClass = "Lcom/netflix/mediaclient/service/webclient/model/leafs/DeviceConfigData;",
    name = "getShouldDisablePip",
    returnType = "Z",
)

@Suppress("unused")
val enablePictureInPicturePatch = bytecodePatch(
    name = "Picture-in-Picture always on",
    description = "Keeps picture-in-picture available even when Netflix turns it off for your " +
        "device, so a video can shrink to a floating window when you leave the app.",
    default = false,
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val method = ShouldDisablePipFingerprint.methodOrNull
            ?: throw PatchException("Netflix getShouldDisablePip not found")
        method.returnEarly("const/4 v0, 0x0\nreturn v0")
    }
}
