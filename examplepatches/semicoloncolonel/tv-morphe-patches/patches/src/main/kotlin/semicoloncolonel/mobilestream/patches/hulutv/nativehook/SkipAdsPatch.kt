package semicoloncolonel.mobilestream.patches.hulutv.nativehook

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.hulutv.misc.fixRecommendationsCrashPatch
import semicoloncolonel.mobilestream.patches.hulutv.shared.Constants

// Removes the ads Hulu stitches into its Android TV on-demand manifests.
//
// Hulu TV runs on a native WebKit engine, so there is no Java player to patch.
// Instead this loads a bundled native library (libhuluhook.so) at
// WKFapplication.onCreate; the library hooks SSL_read inside libwkf_support.so
// and strips the ad Periods from each DASH manifest in-process before Hulu's
// native parser reads it, padding the result to the manifest's original length
// so the HTTP body size is unchanged. No root.
//
// The injection design and the bundle/load patches follow ajstrick81's
// native-adstrip-toolkit (GPL-3.0). See the NOTICE file. Live broadcast
// commercials are part of the broadcast and still play.
@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads (experimental)",
    description = "Removes the ads Hulu stitches into its on-demand videos, through an " +
        "in-process native hook, with no root. It removed the ad breaks from an on-demand episode in testing, " +
        "but it has not been tested widely and may not remove every ad. It only " +
        "removes explicit ad periods, so it does not affect ad-free content. Live " +
        "broadcast commercials are part of the broadcast and still play. Sign in " +
        "with the activation code at hulu.com/activate.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(bundleNativeHookPatch, fixRecommendationsCrashPatch)

    extendWith("extensions/extension.mpe")

    execute {
        ApplicationOnCreateFingerprint.method.addInstructions(
            0,
            "invoke-static {}, " +
                "Lsemicoloncolonel/mobilestream/extension/hulutv/nativehook/NativeHookLoader;->load()V",
        )
    }
}
