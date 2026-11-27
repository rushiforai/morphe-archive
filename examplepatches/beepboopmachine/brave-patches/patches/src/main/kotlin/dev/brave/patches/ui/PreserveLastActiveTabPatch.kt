package dev.brave.patches.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

internal object BraveNtpOpeningScreenFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/ChromeTabbedActivity;",
    name = "g6",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("brave_new_tab_page_opening_screen")
    )
)

@Suppress("unused")
val preserveLastActiveTabPatch = patch(
    name = "Preserve Last Active Tab",
    description = "Disables Brave's new-tab opening-screen override after inactivity so your last active tab stays open."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    execute {
        BraveNtpOpeningScreenFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """.trimIndent()
            )
        }
    }
}
