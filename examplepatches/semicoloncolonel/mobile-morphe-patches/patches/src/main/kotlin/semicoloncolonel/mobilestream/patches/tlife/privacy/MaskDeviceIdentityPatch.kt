package semicoloncolonel.mobilestream.patches.tlife.privacy

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import semicoloncolonel.mobilestream.patches.shared.privacy.hideIds
import semicoloncolonel.mobilestream.patches.tlife.shared.Constants

// T-Life runs ThreatMetrix at sign-in. It fingerprints the device, and a
// re-signed, identifier-spoofed app can look like a new or untrusted device,
// which raises the account's risk score and makes T-Mobile step up to identity
// verification (uploading a photo of your ID). The ANDROID_ID is one of the
// signals it reads, so spoofing it is the part most likely to trip the check.
//
// This patch masks the advertising ID either way, and the mode chooses whether
// the ANDROID_ID is also spoofed:
//
//   Relaxed (default): zeroes the advertising ID only. The ANDROID_ID stays
//     genuine, so the fraud check reads the same device it always has. This is
//     meant to keep sign-in working.
//   Aggressive: zeroes the advertising ID and gives the app a random
//     ANDROID_ID. Stronger against fingerprinting, but it is the configuration
//     that can force identity verification at sign-in.
//
// The Widevine DRM ID is left alone in both modes. This is T-Life only, so the
// shared "Hide device identifiers" patch no longer covers T-Life.

@Suppress("unused")
val maskDeviceIdentityPatch: BytecodePatch = bytecodePatch(
    name = "Mask device identity",
    description = "Masks the IDs T-Life reads from your phone. " +
        "Relaxed keeps sign-in working; Aggressive hides more but can force ID verification at sign-in.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    val mode = stringOption(
        key = "mode",
        default = "relaxed",
        values = mapOf(
            "Relaxed (keeps sign-in working)" to "relaxed",
            "Aggressive (can force ID verification)" to "aggressive",
        ),
        title = "Masking level",
        description = "Relaxed zeroes the advertising ID and keeps your real Android ID, so T-Mobile's sign-in " +
            "fraud check still recognizes the device. Aggressive also randomizes the Android ID, which hides more " +
            "but can make T-Mobile require identity verification (an ID upload) to sign in.",
        required = true,
    )

    execute {
        hideIds(spoofAndroidId = mode.value == "aggressive")
    }
}
