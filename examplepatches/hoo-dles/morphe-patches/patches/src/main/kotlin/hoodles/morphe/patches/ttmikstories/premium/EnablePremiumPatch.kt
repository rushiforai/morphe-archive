/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.ttmikstories.premium

import app.morphe.patcher.patch.rawResourcePatch
import hoodles.morphe.compatibility.Compat
import hoodles.morphe.patches.shared.misc.hermes.hermesPatch

@Suppress("unused")
val enablePremiumPatch = rawResourcePatch(
    name = "Enable Premium",
    description = "Enables app features locked behind the subscription paywall. Requirements: strict apk version"
) {
    compatibleWith(Compat.TTMIK_STORIES)

    dependsOn(hermesPatch {
        //  Call1           r3, r3, r4
        //      --> LoadConstTrue r3
        //      --> Nop
        //      --> Nop
        //  PutNewOwnById   r0, r3, "isWhiteListUser"
        setOf("51 03 03 04 40 00 03 F5 77" to "78 03 61 61 40 00 03 F5 77")
    })
}