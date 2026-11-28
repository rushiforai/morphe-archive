/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.facer

import app.fakh.patches.facer.shared.Constants.COMPATIBILITY_FACER_PHONE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch

@Suppress("unused")
val stopFeaturedLooksAutoplayPatch = patch(
    name = "Stop Featured Looks autoplay",
    description = "Pauses Featured Looks videos on the home screen at 1 second instead of autoplaying them.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACER_PHONE)
    category("Feature")
    dependsOn(looksAutoplayHookPatch)

    execute {
        var appHooked = 0
        classDefForEach { classDef ->
            if (classDef.type != "Lcom/jeremysteckling/facerrel/App;") return@classDefForEach
            mutableClassDefBy(classDef).methods
                .filter { it.name == "onCreate" && it.parameters.isEmpty() }
                .forEach { m ->
                    m.addInstructions(0, "invoke-static {}, Lapp/fakh/extension/facer/FacerAutoplay;->disableFeaturedLooks()V")
                    appHooked++
                }
        }
        if (appHooked != 1) throw PatchException("App.onCreate not found")
    }
}
