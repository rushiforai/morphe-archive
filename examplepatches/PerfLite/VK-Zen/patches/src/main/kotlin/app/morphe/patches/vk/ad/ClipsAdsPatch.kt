package app.morphe.patches.vk.ad

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vk.shared.Constants.COMPATIBILITY_VK

private const val EXTENSION_CLASS = "Lapp/morphe/extension/vk/clips/ClipsAdsFilter;"

// Feed init result handler (i in 8.195 and 8.201); the name is obfuscated, the shape is not
internal object ClipsFeedInitActionDelegateFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "FeedInitActionDelegate.kt" && !classDef.type.contains("$") },
    returnType = "V",
    parameters = listOf("L", "Ljava/util/List;", "L", "L", "L", "Ljava/lang/String;", "L", "Ljava/util/List;")
)

// Feed load page result handler (c in 8.195 and 8.201); handles pagination when scrolling clips
internal object ClipsFeedLoadPageActionDelegateFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "FeedLoadPageActionDelegate.kt" },
    returnType = "V",
    parameters = listOf("L", "L", "Ljava/util/List;", "L", "Z", "L", "Ljava/util/List;")
)

// Guards ClipsOwnerSwipePagerAdapter$a.onInserted against IndexOutOfBoundsException when scrolling clips with ads
internal object ClipsOwnerSwipePagerAdapterOnInsertedFingerprint : Fingerprint(
    custom = { _, classDef ->
        classDef.sourceFile == "ClipsOwnerSwipePagerAdapter.kt" && classDef.type.contains("$")
    },
    name = "onInserted",
    parameters = listOf("I", "I")
)

// Guards ClipsOwnerSwipePagerAdapter$a.onChanged against IndexOutOfBoundsException when scrolling clips with ads
internal object ClipsOwnerSwipePagerAdapterOnChangedFingerprint : Fingerprint(
    custom = { _, classDef ->
        classDef.sourceFile == "ClipsOwnerSwipePagerAdapter.kt" && classDef.type.contains("$")
    },
    name = "onChanged",
    parameters = listOf("I", "I", "Ljava/lang/Object;")
)

// Guards ClipsOwnerSwipePagerAdapter$a.onRemoved against IndexOutOfBoundsException when scrolling clips with ads
internal object ClipsOwnerSwipePagerAdapterOnRemovedFingerprint : Fingerprint(
    custom = { _, classDef ->
        classDef.sourceFile == "ClipsOwnerSwipePagerAdapter.kt" && classDef.type.contains("$")
    },
    name = "onRemoved",
    parameters = listOf("I", "I")
)

// Guards ClipsOwnerSwipePagerAdapter$a.onMoved against IndexOutOfBoundsException when scrolling clips with ads
internal object ClipsOwnerSwipePagerAdapterOnMovedFingerprint : Fingerprint(
    custom = { _, classDef ->
        classDef.sourceFile == "ClipsOwnerSwipePagerAdapter.kt" && classDef.type.contains("$")
    },
    name = "onMoved",
    parameters = listOf("I", "I")
)

// Guards UiTrackingFragmentStateAdapter.removeItem against IndexOutOfBoundsException
internal object UiTrackingFragmentStateAdapterRemoveItemFingerprint : Fingerprint(
    custom = { _, classDef ->
        classDef.sourceFile == "UiTrackingFragmentStateAdapter.kt" && !classDef.type.contains("$")
    },
    name = "removeItem",
    parameters = listOf("I")
)

@Suppress("unused")
val clipsAdsPatch = bytecodePatch(
    name = "Hide clips ads",
    description = "Removes commercial video ads, market promos, and sponsored content from VK Clips."
) {
    compatibleWith(COMPATIBILITY_VK)

    extendWith("extensions/vk.mpe")

    execute {
        // Filter out ads from initial feed items list in clips MVI reducer
        ClipsFeedInitActionDelegateFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static/range { p2 .. p2 }, $EXTENSION_CLASS->filterFeedItems(Ljava/util/List;)Ljava/util/List;
                    move-result-object p2
                    invoke-static/range { p8 .. p8 }, $EXTENSION_CLASS->filterFeedItems(Ljava/util/List;)Ljava/util/List;
                    move-result-object p8
                """
            )
        }

        // Filter out ads from paginated feed items list when scrolling clips
        ClipsFeedLoadPageActionDelegateFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static/range { p3 .. p3 }, $EXTENSION_CLASS->filterFeedItems(Ljava/util/List;)Ljava/util/List;
                    move-result-object p3
                    invoke-static/range { p7 .. p7 }, $EXTENSION_CLASS->filterFeedItems(Ljava/util/List;)Ljava/util/List;
                    move-result-object p7
                """
            )
        }

        // Prevent IndexOutOfBoundsException crash in ClipsOwnerSwipePagerAdapter when scrolling clips with ads
        ClipsOwnerSwipePagerAdapterOnInsertedFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static/range { p0 .. p2 }, $EXTENSION_CLASS->shouldHandleOnInserted(Ljava/lang/Object;II)Z
                    move-result v0
                    if-nez v0, :cond_safe_insert
                    return-void
                    :cond_safe_insert
                """
            )
        }

        ClipsOwnerSwipePagerAdapterOnChangedFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static/range { p0 .. p2 }, $EXTENSION_CLASS->shouldHandleOnChanged(Ljava/lang/Object;II)Z
                    move-result v0
                    if-nez v0, :cond_safe_change
                    return-void
                    :cond_safe_change
                """
            )
        }

        ClipsOwnerSwipePagerAdapterOnRemovedFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static/range { p0 .. p2 }, $EXTENSION_CLASS->shouldHandleOnRemoved(Ljava/lang/Object;II)Z
                    move-result v0
                    if-nez v0, :cond_safe_remove
                    return-void
                    :cond_safe_remove
                """
            )
        }

        ClipsOwnerSwipePagerAdapterOnMovedFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static/range { p0 .. p2 }, $EXTENSION_CLASS->shouldHandleOnMoved(Ljava/lang/Object;II)Z
                    move-result v0
                    if-nez v0, :cond_safe_move
                    return-void
                    :cond_safe_move
                """
            )
        }

        // Safely remove item from internal fragment list to prevent IndexOutOfBoundsException
        UiTrackingFragmentStateAdapterRemoveItemFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static { p0, p1 }, $EXTENSION_CLASS->safeRemoveItem(Ljava/lang/Object;I)V
                    return-void
                """
            )
        }
    }
}
