package app.template.patches.mubi.privacy

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MUBI_COMPATIBILITY
import app.template.patches.shared.drm.spoofDrmPatch

// Report a Widevine security level that MUBI's local checks accept.
//
// MUBI streams Widevine-protected content. The app (or the bundled ExoPlayer
// DRM session) can read MediaDrm properties such as "securityLevel" and
// "hdcpLevel" and refuse to request HD on L3-only devices, or after the device's
// L1 certificate has been revoked.
//
// This patch selects the bundle's shared "Spoof Widevine / DRM level" patch,
// which rewrites MediaDrm.getPropertyString / getPropertyByteArray results at
// their call sites. Its options (security level, HDCP level) are unchanged.
//
// REAL LIMITATION: Widevine licences and key release are decided by Google's
// licence server, not by the app. Spoofing the reported level only changes what
// the local code sees; it cannot raise the resolution MUBI's server grants, and
// apps that attest the device server-side will still detect L3. Treat this as a
// cosmetic / local-check workaround, not a quality unlock.
//
// Opt-in (default = false).

@Suppress("unused")
val mubiSpoofDrmLevelPatch = bytecodePatch(
    name = "Spoof Widevine level for MUBI",
    description = "Reports L1 / HDCP 2.2 to MUBI's local DRM checks. Server-side " +
        "licensing still decides the resolution, so HD may remain unavailable.",
    default = false,
) {
    compatibleWith(MUBI_COMPATIBILITY)

    dependsOn(spoofDrmPatch)
}
