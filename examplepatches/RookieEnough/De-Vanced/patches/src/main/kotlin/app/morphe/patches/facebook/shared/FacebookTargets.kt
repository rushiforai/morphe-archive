/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.patches.facebook.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.SupportedAbi

object FacebookTargets {
    const val V580 = "580.0.0.51.74"
    const val V580_TESTED_CODE = 475019344
    const val V578 = "578.0.0.40.75"

    val PATCH_TARGETS = listOf(
        AppTarget(
            version = V580,
            versionCodes = mapOf(
                SupportedAbi.ARM64_V8A to V580_TESTED_CODE,
            ),
        ),
    )
}
