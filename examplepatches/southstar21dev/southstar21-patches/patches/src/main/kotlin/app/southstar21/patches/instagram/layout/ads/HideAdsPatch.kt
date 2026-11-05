package app.southstar21.patches.instagram.layout.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.southstar21.patches.instagram.layout.reels.FeedItemTypeFingerprint
import app.southstar21.patches.instagram.layout.reels.ParseFeedItemFingerprint
import app.southstar21.patches.instagram.misc.extension.callThrough
import app.southstar21.patches.instagram.misc.extension.extensionStub
import app.southstar21.patches.instagram.misc.extension.hookReturnedObjects
import app.southstar21.patches.instagram.misc.extension.markPatchIncluded
import app.southstar21.patches.instagram.misc.extension.sharedExtensionPatch
import app.southstar21.patches.instagram.shared.Constants.COMPATIBILITY_INSTAGRAM

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Removes sponsored posts, stories and reels, and ad units in the home feed. " +
            "Each part can be switched off in the settings.",
    default = true
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    dependsOn(sharedExtensionPatch)

    execute {
        // Sponsored content: drop every batch of ads as it's delivered.
        SponsoredContentDeliveredFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p5 .. p5 }, $EXTENSION_CLASS->filterSponsoredContent(Ljava/util/List;)Ljava/util/List;
                move-result-object p5
            """
        )

        // Home feed: drop ad units as they're parsed.
        extensionStub(EXTENSION_CLASS, "feedItemType").method.callThrough(FeedItemTypeFingerprint.method)
        ParseFeedItemFingerprint.method.apply {
            hookReturnedObjects(
                "$EXTENSION_CLASS->filterFeedItem(Ljava/lang/Object;)Ljava/lang/Object;",
                returnType
            )
        }

        markPatchIncluded(EXTENSION_CLASS)
    }
}
