/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.facer

import app.fakh.patches.facer.shared.Constants.COMPATIBILITY_FACER_PHONE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

/** `FeaturedStoreHeroSection` renders the promotional banner carousel at the top of the home screen. */
private val heroCarouselFingerprint = Fingerprint(
    returnType = "V",
    strings = listOf("heroSections", "callbacks"),
    custom = { method, _ ->
        method.parameters.size == 9 && method.implementation != null
    },
)

@Suppress("unused")
val hideHeroCarouselPatch = patch(
    name = "Hide hero carousel",
    description = "Removes the promotional banner carousel at the top of the home screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACER_PHONE)
    category("Home")

    execute {
        heroCarouselFingerprint.method.addInstructions(0, "return-void")
    }
}
