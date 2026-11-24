/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.muslimpro

import app.fakh.patches.muslimpro.shared.Constants.COMPATIBILITY_MUSLIMPRO
import app.fakh.patches.shared.pairip.pairipLicenseCheckPatch
import app.morphe.patcher.patch.patch

@Suppress("unused")
val licenseCheckPatch = patch(
    name = "Disable Play license check",
    description = "Stops the Google Play license check from blocking the patched app with a \"Get this app from Play\" screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MUSLIMPRO)
    category("Feature")
    dependsOn(pairipLicenseCheckPatch)
}
