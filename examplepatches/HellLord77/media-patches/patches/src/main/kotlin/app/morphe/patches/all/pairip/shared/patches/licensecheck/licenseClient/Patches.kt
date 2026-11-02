package app.morphe.patches.all.pairip.shared.patches.licensecheck.licenseClient

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.matchSingle
import app.morphe.util.returnEarly

val checkLicensePatch =
    bytecodePatch {
        execute {
            CheckLicenseFingerprint.matchSingle().method.returnEarly()
        }
    }
