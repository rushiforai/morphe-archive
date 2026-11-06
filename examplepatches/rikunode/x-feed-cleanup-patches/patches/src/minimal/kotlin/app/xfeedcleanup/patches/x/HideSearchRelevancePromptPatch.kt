package app.xfeedcleanup.patches.x

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

/**
 * Suppresses only the Search timeline's inline "Is this post relevant?"
 * feedback item. Actual X 12.31/12.32 DEX identifies the item as
 * Lcom/x/models/timelines/items/m1; (UrtTimelineRelevancePrompt).
 */
private object HideSearchRelevancePromptExtensionFingerprint : Fingerprint(
    definingClass = FILTER_CLASS,
    name = "hideSearchRelevancePrompt",
    returnType = "Z",
    parameters = emptyList(),
)

@Suppress("unused")
val hideSearchRelevancePromptPatch = bytecodePatch(
    name = "Hide search relevance prompt",
    description = "Hides only the Is this post relevant to your search? Yes/No prompt in X Search results.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(recommendationFilterPatch)

    execute {
        HideSearchRelevancePromptExtensionFingerprint.method.returnEarly(true)
    }
}
