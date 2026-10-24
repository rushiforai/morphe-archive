/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.yuka.misc.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.shared.misc.requireArm64RootMount
import app.morphe.patches.shared.misc.smali.parameterRegister
import app.morphe.patches.yuka.misc.pairip.guardVirtualizedTasksPatch
import app.morphe.util.matchSingle
import app.morphe.util.returnEarly

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium (root)",
    description = "Unlocks food preferences, diet alerts and the full history. " +
        "Search and offline downloads need a paid subscription. Requires a root mount install.",
) {
    compatibleWith(AppCompatibilities.YUKA)

    availability(requireArm64RootMount)

    dependsOn(guardVirtualizedTasksPatch)

    execute {
        YukaUserConstructorFingerprint.matchSingle().method.apply {
            addInstructions(0, "const/16 ${parameterRegister(parameterTypes.lastIndex)}, 0x1")
        }

        CachedPremiumFingerprint.matchSingle().method.returnEarly(true)
    }
}
