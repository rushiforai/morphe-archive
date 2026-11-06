package app.template.patches.meesho.misc

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MEESHO_COMPATIBILITY
import app.template.patches.shared.gms.gmsCorePatch
import app.template.patches.shared.installer.spoofInstallSourcePatch
import app.template.patches.shared.signature.spoofSignatureVerificationPatch

// One switch for the three install-time workarounds a patched Meesho may need.
//
// A patched Meesho APK is re-signed and may be installed from a file manager
// or a third-party store. Meesho checks:
//   • the signing certificate (Shield anti-fraud / own-cert checks),
//   • the installer package (offers, attribution),
//   • Google Play Services availability (login, payments, Cast-less GMS APIs).
//
// This patch simply selects the existing shared patches, so their options and
// behavior stay identical to every other app in the bundle:
//   • "Spoof app signature"        — reports the original certificate
//   • "Spoof install source"       — reports com.android.vending as installer
//   • "GmsCore support (MicroG)"   — routes Play Services through MicroG
//
// It does NOT bypass Play Integrity, Shield server-side checks, or make JusPay
// payments work on a re-signed build. Those are backend checks.
//
// Opt-in (default = false).

@Suppress("unused")
val meeshoToolkitPatch = bytecodePatch(
    name = "Packaging toolkit (signature, install source, MicroG)",
    description = "Applies the shared signature, install-source and GmsCore/MicroG " +
        "patches to Meesho in one step. Does not bypass Play Integrity, Shield or " +
        "fix payments.",
    default = false,
) {
    compatibleWith(MEESHO_COMPATIBILITY)

    dependsOn(
        spoofSignatureVerificationPatch,
        spoofInstallSourcePatch,
        gmsCorePatch,
    )
}
