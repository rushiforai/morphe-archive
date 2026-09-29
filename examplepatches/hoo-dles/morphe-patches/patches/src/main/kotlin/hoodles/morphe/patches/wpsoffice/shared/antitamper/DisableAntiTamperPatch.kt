/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.wpsoffice.shared.antitamper

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

val disableAntiTamperPatch = bytecodePatch {
    execute {
        SecurityCheck1Fingerprint.method.returnEarly()
        SecurityCheck2Fingerprint.method.returnEarly()
    }
}