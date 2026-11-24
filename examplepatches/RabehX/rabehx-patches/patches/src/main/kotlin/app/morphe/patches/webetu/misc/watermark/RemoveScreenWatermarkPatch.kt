/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.webetu.misc.watermark

import app.morphe.patcher.patch.patch
import app.morphe.patches.all.misc.hermes.hermesPatch
import app.morphe.patches.webetu.shared.WebetuConstants

@Suppress("unused")
val removeScreenWatermarkPatch = patch(
    name = "Remove screen watermark",
    description = "Removes the diagonal student registration number watermark overlaid on screens.",
    default = true,
) {
    category("UI")
    compatibleWith(WebetuConstants.COMPATIBILITY_WEBETU)

    // ScreenWatermark (HBC v96, fn 25772): redirect JmpTrue +5 -> +3 so it lands on Ret r0 (null)
    // right after useUpdatedLastDia() runs. hermesPatch also updates the SHA-1 footer.
    dependsOn(
        hermesPatch {
            setOf(
                "37 01 02 03 28 4c 2a 07 00 01 90 05 01 5c 00" to
                    "37 01 02 03 28 4c 2a 07 00 01 90 03 01 5c 00",
            )
        },
    )
}
