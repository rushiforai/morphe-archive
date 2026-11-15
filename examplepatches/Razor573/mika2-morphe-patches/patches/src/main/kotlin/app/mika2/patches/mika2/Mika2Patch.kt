package app.mika2.patches.mika2

import app.mika2.patches.shared.Constants.COMPATIBILITY_MIKA2
import app.morphe.patcher.patch.patch

/**
 * No-op patch for Mika 2.
 *
 * Purpose: Morphe Manager only offers to install an APK when at least one
 * patch in a patch source is compatible with it. Mika 2 has no patch, so
 * Morphe Manager shows "No patches available" and refuses to install it.
 * This patch exists only so Morphe Manager can install Mika 2, with
 * Morphe as the installer of record.
 *
 * It deliberately changes NOTHING in the app:
 * - No fingerprints, so no method is ever looked up or modified.
 * - No bytecode instructions are added, removed, or changed.
 * - No extension DEX is merged in.
 * - No resource, manifest, permission, or accessibility-service change.
 * - No installer spoofing, no signature spoofing, no InstallSourceInfo
 *   hooking, no network call, no telemetry.
 *
 * The only thing that changes on install is what Morphe itself does to
 * every app it installs: it re-signs the APK with a key it makes on the
 * phone, and records itself (app.morphe.manager) as the installer.
 * That is Morphe's normal install behaviour, not something this patch
 * does. Because the signature changes, this build cannot update over an
 * existing Mika 2 install: uninstall first, after exporting with Mika 2
 * v48 (Settings > My data > Backup & data), then import the ZIP after
 * the Morphe install.
 */
@Suppress("unused")
val mika2Patch = patch(
    name = "Mika 2 installer",
    description = "No-op patch so Morphe Manager can install Mika 2. Changes nothing in the app.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MIKA2)

    execute {
        // Intentionally empty. See the comment above.
    }
}
