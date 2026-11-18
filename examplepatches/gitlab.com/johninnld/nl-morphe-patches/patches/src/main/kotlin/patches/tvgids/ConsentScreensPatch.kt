package patches.tvgids

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val skipConsentScreens = bytecodePatch(
    name = "Skip consent screens",
    description = "Skips automatic privacy-consent screens after disabling ads and tracking. Records no consent choice and preserves manual cookie settings and existing choices.",
) {
    dependsOn(originalInput, disableTracking, consentNative)
    compatibleWith(tvgids)
}
