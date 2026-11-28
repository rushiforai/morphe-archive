/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.facer

import app.fakh.patches.facer.shared.Constants.COMPATIBILITY_FACER_PHONE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

/** `FeaturedStoreMessageCard` renders the "Welcome to Facer" and promotional cards on the home screen. */
private val welcomeCardFingerprint = Fingerprint(
    returnType = "V",
    strings = listOf("popup", "callbacks"),
    custom = { method, _ ->
        method.parameters.size == 6 && method.implementation != null
    },
)

@Suppress("unused")
val hideWelcomeCardPatch = patch(
    name = "Hide welcome card",
    description = "Removes the Welcome to Facer and promotional message cards on the home screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACER_PHONE)
    category("Home")

    execute {
        welcomeCardFingerprint.method.addInstructions(0, "return-void")
    }
}
