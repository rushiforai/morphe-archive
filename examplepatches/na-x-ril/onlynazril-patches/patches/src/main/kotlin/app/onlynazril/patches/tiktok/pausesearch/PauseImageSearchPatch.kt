package app.onlynazril.patches.tiktok.pausesearch

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.tiktok.shared.guardAtEntry
import app.morphe.util.findMutableMethodOf
import app.onlynazril.patches.shared.Constants.COMPATIBILITY_TIKTOK

private const val BRIDGE = "Lapp/onlynazril/extension/tiktok/pausesearch/PauseImageSearchBridge;"
private const val PATCH = "Pause image search"

/**
 * Hides the image-search entries TikTok adds while a video is paused.
 *
 * There are two surfaces. The pause item manager, whose constructor asks the real-named
 * `IPhotoSearchService` for its item, builds the pause panel's search row. The visual search tag
 * trigger adds the `Find similar` / `Search this image` pill to the feed's interact area. The patch
 * guards both: when the disable switch is on each one answers with no item/false, so neither
 * surface is built; when the switch is off the app's own answer stands.
 *
 * On by default, so a fresh build hides both surfaces. The switch is in Tweaks; turning it off
 * restores TikTok's entries on the next pause without a restart.
 */
@Suppress("unused")
val tiktokPauseImageSearchPatch = bytecodePatch(
    name = PATCH,
    description = "Adds a switch to disable the image-search entries TikTok shows while a video " +
        "is paused, including the pause-panel row and the visual search pill. On by default; " +
        "turn it off to show them again.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK)

    extendWith("extensions/tiktok.mpe")

    execute {
        val manager = PauseItemManagerFingerprint.matchOrNull()
            ?: throw PatchException("$PATCH: the pause item manager was not found.")
        val classDef = manager.originalClassDef
        val listMethod = classDef.methods.singleOrNull { method ->
            method.returnType == "Ljava/util/List;" &&
                method.parameterTypes.size == 1 &&
                method.parameterTypes[0].startsWith("L") &&
                method.implementation != null
        } ?: throw PatchException(
            "$PATCH: ${classDef.type} has no single list-returning pause item method.",
        )

        mutableClassDefBy(classDef.type)
            .findMutableMethodOf(listMethod)
            .guardAtEntry(
                PATCH,
                "invoke-static {}, $BRIDGE->hidden()Z",
                """
                    new-instance v0, Ljava/util/ArrayList;
                    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                    return-object v0
                """.trimIndent(),
            )

        val tag = VisualSearchTagFingerprint.methodOrNull
            ?: throw PatchException("$PATCH: the visual search tag trigger was not found.")
        tag.guardAtEntry(
            PATCH,
            "invoke-static {}, $BRIDGE->hidden()Z",
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )
    }
}
