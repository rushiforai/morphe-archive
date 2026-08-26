package app.mix.patches.reddit.sync.discussions

import app.mix.patches.reddit.sync.shared.Constants.COMPATIBILITY_SYNC
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.indexOfFirstStringInstructionOrThrow

private const val NEW_BASE = "https://oauth.reddit.com/"
private const val NEW_PATH = "search.json?q=url%3A"

// Allow the patch to be run
// on an already patched app.
private val LEGACY_BASES = listOf(
    "https://ssl.reddit.com/",
    "https://www.reddit.com/",
)

@Suppress("unused")
val fixOtherDiscussionsPatch = bytecodePatch(
    name = "Fix Other discussions",
    description = "Fixes the 'Other discussions' tab showing '403 error loading page' by updating the API endpoint.",
) {
    compatibleWith(COMPATIBILITY_SYNC)

    execute {
        val method = OtherDiscussionsFingerprint.method

        // The fingerprint matches a method that contains "submit.json?url=",
        // which only appears in this branch of the URL builder. That branch
        // must also contain one of the legacy base URLs. Try both and fail
        // loudly if neither is found — silently skipping would let a broken
        // APK through with the "Other discussions" still 403'ing.
        val baseIndex = LEGACY_BASES
            .firstNotNullOfOrNull { legacyBase ->
                runCatching { method.indexOfFirstStringInstructionOrThrow(legacyBase) }.getOrNull()
            }
            ?: error("None of $LEGACY_BASES found in the 'Other discussions' URL builder")
        method.replaceInstruction(baseIndex, "const-string v3, \"$NEW_BASE\"")

        val pathIndex = method.indexOfFirstStringInstructionOrThrow(OLD_PATH)
        method.replaceInstruction(pathIndex, "const-string v3, \"$NEW_PATH\"")
    }
}
