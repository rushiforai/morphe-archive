// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.vodafone.integrity

import app.keropatches.core.PatchCategory
import app.keropatches.vodafone.VodafoneApp
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The static entry point of the bundled licence gate.
 *
 * The application's `Application` subclass calls it once from
 * `attachBaseContext`, before any screen is created. It is the only entry point
 * on the startup path; a second one exists in a content provider that this
 * build does not register in the manifest.
 */
private object LicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    isStatic = true,
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * Skips the store licence check that runs before the application starts.
 *
 * The stock build wraps its `Application` in a licence client. On startup that
 * client binds to the licensing service of the Play Store and validates that
 * the installation was obtained from the store. A repackaged build cannot pass
 * that check: the client reports the package as invalid, shows an error dialog,
 * and terminates the application shortly after.
 *
 * The check is a single call and has no other purpose in this build: it does not
 * initialise libraries, read configuration or warm any cache. Answering it with
 * an immediate return therefore leaves startup exactly as it is otherwise, with
 * none of the dialog, retry or shutdown paths reachable.
 *
 * This removes a local gate. It does not make the application a licensed copy
 * and it does not change anything the server is told; features the server gates
 * by entitlement are still gated by the server.
 */
@Suppress("unused")
val skipLicenseCheckPatch = bytecodePatch(
    name = "Skip the store licence check",
    description = "Stops the bundled licence client from validating the installation before the application starts.",
    default = true,
) {
    compatibleWith(VodafoneApp.compatibility)
    category(PatchCategory.STORE.label)

    execute {
        LicenseCheckFingerprint.method.returnEarly()
    }
}
