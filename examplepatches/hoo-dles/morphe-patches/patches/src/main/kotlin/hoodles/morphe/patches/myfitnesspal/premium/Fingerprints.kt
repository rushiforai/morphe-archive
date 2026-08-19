/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.myfitnesspal.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess

object GetPremiumPlusFingerprint : Fingerprint(
    parameters = emptyList(),
    returnType = "Z",
    filters = listOf(
        fieldAccess(
            name = "premiumPlusEnabled_"
        )
    )
)