package semicoloncolonel.mobilestream.patches.hulutv.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.hulutv.misc.fixRecommendationsCrashPatch
import semicoloncolonel.mobilestream.patches.hulutv.nativehook.ApplicationOnCreateFingerprint
import semicoloncolonel.mobilestream.patches.hulutv.shared.Constants

// Block analytics & tracking (OPT-IN, default OFF) for Hulu on Android TV.
//
// The native TV app sends its telemetry through libcurl in libwkf_support.so.
// This loads a small native library (libhulutrack.so) at WKFapplication.onCreate
// that hooks curl_easy_setopt and redirects requests bound for pure-telemetry
// hosts (Hulu doppler/vortex, Conviva, Adobe demdex) to a dead local address, so
// nothing is sent. Confirmed on-device to stop those requests with no effect on
// playback. Content, auth, manifest, media and view-progress hosts are untouched.
//
// A separate library and patch from the ad-strip, so the two toggle
// independently. Uses ShadowHook (MIT); see the NOTICE file.
@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking (experimental)",
    description = "Blocks the app's analytics and tracking " +
        "requests (Hulu telemetry, Conviva, and Adobe) through an in-process " +
        "native hook, with no root. Functional traffic is untouched.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(bundleTrackerHookPatch, fixRecommendationsCrashPatch)

    extendWith("extensions/extension.mpe")

    execute {
        ApplicationOnCreateFingerprint.method.addInstructions(
            0,
            "invoke-static {}, " +
                "Lsemicoloncolonel/mobilestream/extension/hulutv/privacy/NativeTrackerLoader;->load()V",
        )
    }
}
