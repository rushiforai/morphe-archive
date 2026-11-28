package app.onlynazril.patches.tiktok.feedsearch

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.tiktok.shared.guardAtEntry
import app.onlynazril.patches.shared.Constants.COMPATIBILITY_TIKTOK

private const val BRIDGE = "Lapp/onlynazril/extension/tiktok/feedsearch/FeedSearchBridge;"
private const val PATCH = "Hide feed search suggestion"

/**
 * Hides the search suggestion bar TikTok adds under a video in the feed, the row that reads
 * `Search · <query>` above the bottom navigation.
 *
 * Both trigger versions gate the bar through one `(VideoItemParams) -> boolean` method. The patch
 * guards each trigger that is present: when the hide switch is on the method answers false, so the
 * bar is never added; when the switch is off the app's own answer stands.
 *
 * On by default. The switch is in Tweaks; turning it off restores the bar without a restart.
 */
@Suppress("unused")
val tiktokHideFeedSearchPatch = bytecodePatch(
    name = PATCH,
    description = "Adds a switch to hide the search suggestion bar TikTok adds under a video in " +
        "the feed. On by default; turn it off to show it again.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK)

    extendWith("extensions/tiktok.mpe")

    execute {
        val present = FeedSearchTriggerFingerprints.filter { (className, _) ->
            classDefByOrNull(className) != null
        }
        if (present.isEmpty()) {
            throw PatchException("$PATCH: no feed search bottom bar trigger was found.")
        }

        present.forEach { (className, fingerprint) ->
            val gate = fingerprint.methodOrNull ?: throw PatchException(
                "$PATCH: $className has no boolean (VideoItemParams) gate.",
            )
            gate.guardAtEntry(
                PATCH,
                "invoke-static {}, $BRIDGE->hidden()Z",
                """
                    const/4 v0, 0x0
                    return v0
                """.trimIndent(),
            )
        }
    }
}
