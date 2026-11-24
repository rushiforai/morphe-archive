package app.jofslash.patches.listonic.assistant

import app.jofslash.patches.listonic.shared.Constants.COMPATIBILITY_LISTONIC
import app.jofslash.patches.listonic.shared.hideComposable
import app.morphe.patcher.patch.bytecodePatch

// The row of Assistant suggestions below a list ("Suggest missing products", "Quick dinner idea").
private const val SUGGESTIONS_WIDGET =
    "com.l.shared.ui.aichat.screen.components.AIChatSuggestionsWidget (AIChatSuggestionsWidget.kt:70)"

@Suppress("unused")
val hideAssistantSuggestionsPatch = bytecodePatch(
    name = "Hide Assistant suggestions",
    description = "Hides the Assistant's suggestions (such as \"Suggest missing products\" and \"Quick dinner " +
            "idea\") below your lists. The Assistant itself stays.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_LISTONIC)

    execute {
        hideComposable(SUGGESTIONS_WIDGET)
    }
}
