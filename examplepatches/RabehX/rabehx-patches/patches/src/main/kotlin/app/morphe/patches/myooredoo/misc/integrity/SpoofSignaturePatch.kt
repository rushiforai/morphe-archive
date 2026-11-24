/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.myooredoo.misc.integrity

import app.morphe.patcher.patch.patch
import app.morphe.patches.all.misc.fix.spoofsignature.spoofSignaturePatch
import app.morphe.patches.myooredoo.shared.Constants

@Suppress("unused")
val spoofOoredooSignaturePatch = patch(
    name = "Spoof signature",
    description = "Spoofs PackageManager signing certificate queries with the original Play Store " +
            "certificate via Morphe's signature extension. Requires an unmodified stock APK.",
    default = false,
) {
    category("Security")
    compatibleWith(Constants.COMPATIBILITY_MYOOREDOO)
    dependsOn(spoofSignaturePatch)
}
