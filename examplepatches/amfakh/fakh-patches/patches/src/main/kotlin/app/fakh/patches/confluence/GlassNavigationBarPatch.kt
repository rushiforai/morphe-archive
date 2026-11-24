/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.confluence

import app.fakh.patches.confluence.shared.Constants.BACKGROUND_BLUR
import app.fakh.patches.confluence.shared.Constants.COMPATIBILITY_CONFLUENCE
import app.fakh.patches.confluence.shared.Constants.GLASS_NAVBAR
import app.fakh.patches.shared.register
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch

private const val GLASS = "Lapp/fakh/extension/confluence/GlassNavigationBar;"

@Suppress("unused")
val glassNavigationBarPatch = patch(
    name = "Glass navigation bar",
    description = "Draws the navigation bar as a floating, translucent capsule with a sliding selection pill, and the Create button above it as glass.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CONFLUENCE)
    category("Theme")
    dependsOn(settingsPatch)

    execute {
        register(GLASS_NAVBAR, BACKGROUND_BLUR)
        // The main activity, named in the manifest, creates itself in onMAMCreate under the Intune wrapper. The call
        // goes first: R8 reuses the activity's register for other values further down.
        val create = mutableClassDefBy("Lcom/atlassian/confluence/MainActivity;").methods.singleOrNull {
            it.name == "onMAMCreate"
        } ?: throw PatchException("MainActivity.onMAMCreate not found")
        create.addInstructions(0, "invoke-static { p0 }, $GLASS->install(Landroid/app/Activity;)V")
    }
}
