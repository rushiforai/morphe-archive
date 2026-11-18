package app.jofslash.patches.quora.content

import app.jofslash.patches.quora.ads.PageFinishedFingerprint
import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/quora/HideContentPatch;"

/**
 * Quora renders its content in a WebView. Each patch injects a stylesheet or script into every page
 * that changes one thing about it.
 */
private fun pageScriptPatch(name: String, description: String, extensionMethod: String) = bytecodePatch(
    name = name,
    description = description,
    default = false
) {
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    execute {
        PageFinishedFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS->$extensionMethod(Landroid/webkit/WebView;)V"
        )
    }
}

@Suppress("unused")
val hideQuoraPlusAnswersPatch = pageScriptPatch(
    name = "Hide Quora+ answers",
    description = "Hides answers and posts that can only be read with a Quora+ subscription.",
    extensionMethod = "hideQuoraPlusAnswers",
)

@Suppress("unused")
val hideRelatedQuestionsPatch = pageScriptPatch(
    name = "Hide related questions",
    description = "Hides the related questions lists on question pages.",
    extensionMethod = "hideRelatedQuestions",
)

@Suppress("unused")
val hideSpacesSuggestionsPatch = pageScriptPatch(
    name = "Hide Spaces suggestions",
    description = "Hides the Spaces you might like suggestions in the feed.",
    extensionMethod = "hideSpacesSuggestions",
)

@Suppress("unused")
val hideAiAnswersPatch = pageScriptPatch(
    name = "Hide AI answers",
    description = "Hides answers written by Poe bots.",
    extensionMethod = "hideAiAnswers",
)

@Suppress("unused")
val hideSuggestedQuestionsPatch = pageScriptPatch(
    name = "Hide suggested questions",
    description = "Hides the questions for you to answer in the feed.",
    extensionMethod = "hideSuggestedQuestions",
)

@Suppress("unused")
val hideQuoraPlusPromotionsPatch = pageScriptPatch(
    name = "Hide Quora+ promotions",
    description = "Hides buttons that ask you to try or join Quora+.",
    extensionMethod = "hideQuoraPlusPromotions",
)

@Suppress("unused")
val hideDownvoteButtonPatch = pageScriptPatch(
    name = "Hide downvote button",
    description = "Hides the downvote button on answers and posts.",
    extensionMethod = "hideDownvoteButton",
)

@Suppress("unused")
val hidePoePatch = pageScriptPatch(
    name = "Hide Poe",
    description = "Hides links and buttons that open Poe or Quora's AI assistant.",
    extensionMethod = "hidePoe",
)

@Suppress("unused")
val hideCountsPatch = pageScriptPatch(
    name = "Hide counts",
    description = "Hides upvote, view and share counts on answers and posts.",
    extensionMethod = "hideCounts",
)

@Suppress("unused")
val enableTextSelectionPatch = pageScriptPatch(
    name = "Enable text selection",
    description = "Lets you select and copy text on every page.",
    extensionMethod = "enableTextSelection",
)
