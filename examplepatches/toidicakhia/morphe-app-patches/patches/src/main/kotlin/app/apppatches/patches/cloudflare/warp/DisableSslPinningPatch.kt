package app.apppatches.patches.cloudflare.warp

import app.apppatches.patches.shared.Constants.WARP_COMPATIBILITY
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableSslPinningPatch = bytecodePatch(
    name = "Disable SSL Pinning",
    description = "Bypasses OkHttp certificate pinning on Cloudflare API calls to allow TLS traffic inspection.",
    default = false
) {
    compatibleWith(WARP_COMPATIBILITY)

    execute {
        // The varargs and Function0 overloads delegate to this List overload.
        WarpCertificatePinnerCheckFingerprint.match().method.addInstructions(0, "return-void")
    }
}
