package app.template.patches.mubi.misc

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MUBI_COMPATIBILITY
import app.template.patches.shared.gms.gmsCorePatch
import app.template.patches.shared.installer.spoofInstallSourcePatch
import app.template.patches.shared.signature.spoofSignatureVerificationPatch

// One switch for the three install-time workarounds MUBI needs after patching.
//
// A patched MUBI APK is re-signed and may be installed from a file manager or a
// third-party store. MUBI checks:
//   • the signing certificate (Play integrity / own-cert checks),
//   • the installer package (offers, billing, attribution),
//   • Google Play Services availability (login, Cast, billing).
//
// This patch simply selects the existing shared patches, so their options and
// behavior stay identical to every other app in the bundle:
//   • "Spoof app signature"        — reports the original certificate
//   • "Spoof install source"       — reports com.android.vending as installer
//   • "GmsCore support (MicroG)"   — routes Play Services through MicroG
//
// It does NOT bypass Play Integrity or server-side attestation, and it cannot
// make Play Billing work on a re-signed build. Those are backend checks.
//
// Opt-in (default = false): MicroG requires a MicroG/GmsCore app on the device,
// and spoofing the signature is unnecessary if you only want the players patched.
//
// Note: the shared patches are also individually available in the patch list.
// Enabling this patch enables them as dependencies; their own options are still
// applied when the bundle builds.

@Suppress("unused")
val mubiToolkitPatch = bytecodePatch(
    name = "Packaging toolkit (signature, install source, MicroG)",
    description = "Applies the shared signature, install-source and GmsCore/MicroG " +
        "patches to MUBI in one step. Does not bypass Play Integrity or fix Play Billing.",
    default = false,
) {
    compatibleWith(MUBI_COMPATIBILITY)

    dependsOn(
        spoofSignatureVerificationPatch,
        spoofInstallSourcePatch,
        gmsCorePatch,
    )
}
