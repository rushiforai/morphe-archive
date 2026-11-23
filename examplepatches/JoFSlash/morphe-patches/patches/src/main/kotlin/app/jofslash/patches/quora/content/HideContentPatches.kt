package app.jofslash.patches.quora.content

import app.jofslash.patches.quora.ads.PageFinishedFingerprint
import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.jofslash.patches.quora.video.InitWebViewFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/quora/HideContentPatch;"

/**
 * Quora renders its content in a WebView. Each patch injects a stylesheet or script into every page
 * that changes one thing about it.
 */
private fun pageScriptPatch(
    patchCategory: String,
    name: String,
    description: String,
    extensionMethod: String,
    default: Boolean = false,
) = bytecodePatch(
    name = name,
    description = description,
    default = default
) {
    category(patchCategory)
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/quora.mpe")

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
    patchCategory = "Feed",
    description = "Hides answers and posts that show only their start, with a Quora+ lock over the rest.",
    extensionMethod = "hideQuoraPlusAnswers",
    default = true,
)

@Suppress("unused")
val hideAskBoxPatch = pageScriptPatch(
    name = "Hide ask box",
    patchCategory = "Feed",
    description = "Hides the \"What do you want to ask or share?\" box with Ask, Answer and Post at the top of the feed.",
    extensionMethod = "hideAskBox",
    default = true,
)

@Suppress("unused")
val hideCommentBoxPatch = pageScriptPatch(
    name = "Hide comment box",
    patchCategory = "Reading",
    description = "Hides the \"Add a comment…\" field under answers and posts. Comments still open from the comment button.",
    extensionMethod = "hideCommentBox",
)

@Suppress("unused")
val hideDismissedQuestionsPatch = bytecodePatch(
    name = "Hide dismissed questions",
    description = "When you close a feed item with its × and pick \"Not interested in this question\", the feed " +
            "doesn't show answers to that question again. Undo brings it back. The list stays on your phone, " +
            "under Dismissed questions in Patch settings.",
    default = false
) {
    category("Feed")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/quora.mpe")

    execute {
        PageFinishedFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS->hideDismissedQuestions(Landroid/webkit/WebView;)V"
        )
        // The list is kept by the app, which the page reaches through this.
        InitWebViewFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, Lapp/jofslash/extension/quora/PatchSettings;->bind(Landroid/webkit/WebView;)V"
        )
    }
}

@Suppress("unused")
val hideRelatedQuestionsPatch = pageScriptPatch(
    name = "Hide related questions",
    patchCategory = "Feed",
    description = "Hides the related questions lists on question pages.",
    extensionMethod = "hideRelatedQuestions",
)

@Suppress("unused")
val hideSpacesSuggestionsPatch = pageScriptPatch(
    name = "Hide Spaces suggestions",
    patchCategory = "Feed",
    description = "Hides the Spaces you might like suggestions in the feed.",
    extensionMethod = "hideSpacesSuggestions",
)

@Suppress("unused")
val hideAiAnswersPatch = pageScriptPatch(
    name = "Hide AI answers",
    patchCategory = "Feed",
    description = "Hides answers written by Poe bots.",
    extensionMethod = "hideAiAnswers",
    default = true,
)

@Suppress("unused")
val hideSuggestedQuestionsPatch = pageScriptPatch(
    name = "Hide suggested questions",
    patchCategory = "Feed",
    description = "Hides the questions for you to answer in the feed.",
    extensionMethod = "hideSuggestedQuestions",
)

@Suppress("unused")
val hideQuoraPlusPromotionsPatch = pageScriptPatch(
    name = "Hide Quora+ promotions",
    patchCategory = "Feed",
    description = "Hides buttons that ask you to try or join Quora+.",
    extensionMethod = "hideQuoraPlusPromotions",
    default = true,
)

@Suppress("unused")
val hideDownvoteButtonPatch = pageScriptPatch(
    name = "Hide downvote button",
    patchCategory = "Feed",
    description = "Hides the downvote button on answers and posts.",
    extensionMethod = "hideDownvoteButton",
)

@Suppress("unused")
val hidePoePatch = pageScriptPatch(
    name = "Hide Poe",
    patchCategory = "Feed",
    description = "Hides links and buttons that open Poe or Quora's AI assistant.",
    extensionMethod = "hidePoe",
    default = true,
)

@Suppress("unused")
val hideCountsPatch = pageScriptPatch(
    name = "Hide counts",
    patchCategory = "Feed",
    description = "Hides upvote, view and share counts on answers and posts.",
    extensionMethod = "hideCounts",
)

@Suppress("unused")
val enableTextSelectionPatch = pageScriptPatch(
    name = "Enable text selection",
    patchCategory = "Reading",
    description = "Lets you select and copy text on every page.",
    extensionMethod = "enableTextSelection",
    default = true,
)

@Suppress("unused")
val wordCountPatch = pageScriptPatch(
    name = "Word count",
    patchCategory = "Writing",
    description = "Shows how many words and characters you have written while you write an answer or a post.",
    extensionMethod = "wordCount",
)

@Suppress("unused")
val hideCommentPreviewsPatch = pageScriptPatch(
    name = "Hide comment previews",
    patchCategory = "Feed",
    description = "Hides the \"123 comments from … and more\" row under answers. Comments still open from the comment button.",
    extensionMethod = "hideCommentPreviews",
)

@Suppress("unused")
val hideSpacesPostsPatch = pageScriptPatch(
    name = "Hide Spaces posts",
    patchCategory = "Feed",
    description = "Hides posts from Spaces in the feed, so it shows answers to questions only.",
    extensionMethod = "hideSpacesPosts",
)

@Suppress("unused")
val hideFollowButtonsPatch = pageScriptPatch(
    name = "Hide Follow buttons",
    patchCategory = "Feed",
    description = "Hides the small \"Follow\" next to author and Space names. Profiles and Space pages keep theirs.",
    extensionMethod = "hideFollowButtons",
)

@Suppress("unused")
val hideCredentialsPatch = pageScriptPatch(
    name = "Hide credentials",
    patchCategory = "Feed",
    description = "Hides the line under authors' names, such as \"Lives in Vienna\", and \"Upvoted by\" lines. The date stays.",
    extensionMethod = "hideCredentials",
)

@Suppress("unused")
val hideSurveysPatch = pageScriptPatch(
    name = "Hide surveys",
    patchCategory = "Feed",
    description = "Hides Quora's surveys in the feed, such as \"How satisfied are you with your home feed?\" " +
            "and \"Was this worth your time?\" under answers.",
    extensionMethod = "hideSurveys",
    default = true,
)
