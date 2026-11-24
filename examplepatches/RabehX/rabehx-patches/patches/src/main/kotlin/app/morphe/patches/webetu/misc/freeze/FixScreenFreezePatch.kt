/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.webetu.misc.freeze

import app.morphe.patcher.patch.patch
import app.morphe.patches.all.misc.hermes.hermesPatch
import app.morphe.patches.webetu.shared.WebetuConstants

@Suppress("unused")
val fixScreenFreezePatch = patch(
    name = "Fix screen freeze",
    description = "Fixes dashboard buttons becoming disabled after resuming from the background.",
    default = true,
) {
    category("Fixes")
    compatibleWith(WebetuConstants.COMPATIBILITY_WEBETU)

    // Home.renderItem (HBC v96, fn 21507): flip LoadConstFalse (0x79) -> LoadConstTrue (0x78)
    // before PutNewOwnById 'activated' (string 23687). hermesPatch also updates the SHA-1 footer.
    dependsOn(
        hermesPatch {
            setOf(
                "49 05 07 06 90 05 05 79 05 40 01 05 87 5c" to
                    "49 05 07 06 90 05 05 78 05 40 01 05 87 5c",
            )
        },
    )
}
