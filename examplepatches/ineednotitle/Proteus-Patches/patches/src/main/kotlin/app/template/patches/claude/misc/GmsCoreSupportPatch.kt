package app.template.patches.claude.misc

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.CLAUDE_COMPATIBILITY
import app.template.patches.shared.gms.gmsCorePatch
import app.template.patches.shared.installer.spoofInstallSourcePatch
import app.template.patches.shared.signature.spoofSignatureVerificationPatch

// One switch for the install-time workarounds Claude needs when it is patched,
// re-signed and used with microG RE instead of Google Play Services.
//
// Claude's Google sign-in and push registration go through Google Play
// Services. On a re-signed build without Play Services, those flows break
// unless the calls are routed to a GmsCore implementation. This patch selects
// the existing shared patches so their options and behavior stay identical to
// every other app in the bundle:
//
//   • "GmsCore support (MicroG)"   — routes Play Services through microG RE
//     (default vendor) or another GmsCore, chosen in the shared patch's options.
//   • "Spoof app signature"        — reports the original signing certificate,
//     which Google sign-in checks on re-signed installs.
//   • "Spoof install source"       — reports the Play Store as installer.
//
// It does NOT bypass Play Integrity or server-side attestation. Google
// sign-in on Android 14+ may still refuse a re-signed build (Credential
// Manager checks), and Claude's own account backend is authoritative.
//
// Requires a GmsCore app (microG RE by default) installed and set up with a
// Google account on the device.
//
// Opt-in (default = false): it only matters if you sign in with Google or want
// push through microG; anonymous use of Claude does not need it.

@Suppress("unused")
val claudeGmsCoreSupportPatch = bytecodePatch(
    name = "GmsCore support (MicroG RE)",
    description = "Routes Google Play Services through microG RE so Google sign-in and push work on " +
        "a re-signed install. Applies the shared GmsCore, signature and install-source patches. " +
        "Does not bypass Play Integrity. Requires microG RE (or another GmsCore) on the device.",
    default = false,
) {
    compatibleWith(CLAUDE_COMPATIBILITY)

    dependsOn(
        gmsCorePatch,
        spoofSignatureVerificationPatch,
        spoofInstallSourcePatch,
    )
}
