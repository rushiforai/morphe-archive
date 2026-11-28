/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.fakh.patches.github.shared.Constants.HIDE_COPILOT_DISCLAIMER
import app.fakh.patches.shared.register
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch

/** Has the note under a comment by Copilot drawn by the extension's text view, which can leave it out. */
private val copilotDisclaimerViewPatch = patch {
    extendWith("extensions/extension.mpe")

    execute {
        document("res/layout/list_item_ai_disclaimer.xml").use { document ->
            val note = document.getElementsByTagName("TextView").item(0)
                ?: throw PatchException("GitHub: the text of the Copilot note not found")
            document.renameNode(note, null, "app.fakh.extension.github.CopilotDisclaimerView")
        }
    }
}

@Suppress("unused")
val hideCopilotDisclaimerPatch = patch(
    name = "Hide Copilot disclaimer",
    description = "Removes the line under Copilot's comments that says it is powered by AI and can make mistakes.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch, copilotDisclaimerViewPatch)

    execute {
        register(HIDE_COPILOT_DISCLAIMER)
    }
}
