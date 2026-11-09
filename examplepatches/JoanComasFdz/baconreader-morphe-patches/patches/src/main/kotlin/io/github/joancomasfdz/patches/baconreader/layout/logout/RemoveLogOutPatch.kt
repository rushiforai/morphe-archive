// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.logout

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

// "Log out" in the menu's accounts logs out of every account at once and keeps them listed, each to be logged in to
// again. It's rarely needed, and sits right above the accounts. Each account's ✕ still removes that account.
@Suppress("unused")
val removeLogOutPatch = bytecodePatch(
    name = "Remove Log out",
    description = "Removes \"Log out\", which logs out of every account at once, from the menu's accounts.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    execute {
        DrawerHandlerUpdateDrawerFingerprint.let { fingerprint ->
            // items.add(item): its result is not used.
            fingerprint.method.replaceInstruction(fingerprint.instructionMatches[1].index, "nop")
        }
    }
}
