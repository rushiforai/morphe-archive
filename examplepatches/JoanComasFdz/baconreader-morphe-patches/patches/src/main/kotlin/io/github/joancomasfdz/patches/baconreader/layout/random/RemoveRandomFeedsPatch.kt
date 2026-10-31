// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.random

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

@Suppress("unused")
val removeRandomFeedsPatch = bytecodePatch(
    name = "Remove Random feeds",
    description = "Removes Random and My Random from the feed list. " +
        "Reddit removed r/random and r/myrandom in December 2024, so they never load.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    execute {
        FeedAdapterResetFingerprint.let { fingerprint ->
            // list.add(feed): its result is not used.
            listOf(1, 3).forEach { filter ->
                fingerprint.method.replaceInstruction(fingerprint.instructionMatches[filter].index, "nop")
            }
        }
    }
}
