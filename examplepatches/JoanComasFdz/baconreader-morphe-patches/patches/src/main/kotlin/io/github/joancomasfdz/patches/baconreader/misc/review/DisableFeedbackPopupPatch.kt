// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.misc.review

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

@Suppress("unused")
val disableFeedbackPopupPatch = bytecodePatch(
    name = "Disable feedback popup",
    description = "Disables the \"Please take a few moments to provide feedback about BaconReader\" popup.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    execute {
        // Every screen reports its time to ReviewLegacyImpl, which shows the popup once enough time was spent.
        // Stop the time tracking and the popup.
        listOf(ReviewResumeFingerprint, ReviewPauseFingerprint, ReviewShowFingerprint).forEach {
            it.method.addInstructions(0, "return-void")
        }
        ReviewIsAvailableFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
