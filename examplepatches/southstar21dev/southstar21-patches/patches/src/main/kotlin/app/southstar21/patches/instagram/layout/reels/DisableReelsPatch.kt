package app.southstar21.patches.instagram.layout.reels

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.southstar21.patches.instagram.misc.extension.callThrough
import app.southstar21.patches.instagram.misc.extension.extensionStub
import app.southstar21.patches.instagram.misc.extension.hookReturnedObjects
import app.southstar21.patches.instagram.misc.extension.markPatchIncluded
import app.southstar21.patches.instagram.misc.extension.sharedExtensionPatch
import app.southstar21.patches.instagram.shared.Constants.COMPATIBILITY_INSTAGRAM

private fun stub(name: String) = extensionStub(EXTENSION_CLASS, name)

@Suppress("unused")
val disableReelsPatch = bytecodePatch(
    name = "Disable Reels",
    description = "Removes reels from the home feed and Explore, " +
            "and stops scrolling from one reel to the next. Each part is off until you switch it on in the settings.",
    default = true
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    dependsOn(sharedExtensionPatch)

    execute {
        // Let the extension read Instagram's obfuscated models.
        stub("feedItemType").method.callThrough(FeedItemTypeFingerprint.method)
        stub("feedItemMedia").method.callThrough(FeedItemMediaFingerprint.method)
        stub("productType").method.callThrough(MediaProductTypeFingerprint.method)

        // Home feed: drop reel items as they're parsed.
        ParseFeedItemFingerprint.method.apply {
            hookReturnedObjects(
                "$EXTENSION_CLASS->filterFeedItem(Ljava/lang/Object;)Ljava/lang/Object;",
                returnType
            )
        }

        // Explore: drop grid sections holding a reel as they're parsed.
        ParseExploreSectionFingerprint.method.hookReturnedObjects(
            "$EXTENSION_CLASS->filterExploreSection(Ljava/lang/Object;)Ljava/lang/Object;"
        )

        // Player.
        ClipsViewerFragmentOnViewCreatedFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onReelsViewerCreated(Landroid/view/View;)V"
        )
        ViewPager2SetAdapterFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onPagerAdapterSet(Landroid/view/View;)V"
        )
        ViewPager2SetUserInputEnabledFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS->pagerUserInputEnabled(Landroid/view/View;Z)Z
                move-result p1
            """
        )

        markPatchIncluded(EXTENSION_CLASS)
    }
}
