package app.morphe.patches.pixiv

import app.morphe.patches.pixiv.shared.PixivConstants

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch

val pixivAiFlaggerPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv AI Work Flagger",
    description = "Identifies AI-generated works from Pixiv's illustAiType field, dims their thumbnails " +
        "with an [AI] badge or hides them, adds a warning banner and an [AI] title pill on the detail " +
        "screen, and can auto-block AI artists or drop works whose tags match a blacklist. " +
        "Adjustable in the Pixiv-Patched page.",
    default = true
) {
    compatibleWith(PixivConstants.PIXIV)
    extendWith("extensions/pixiv.mpe")

    execute {
        // --- Hook 1: ThumbnailView.d (Feed and Search cards dimming / hide / badge) ---
        val thumbnailClass = mutableClassDefBy("Ljp/pxv/android/feature/commonlist/view/ThumbnailView;")
        val dMethod = thumbnailClass.methods.first {
            it.name == "d" && it.parameterTypes.size == 3
        }
        dMethod.addInstructions(
            1,
            "invoke-static/range {p0 .. p1}, Lapp/morphe/extension/pixiv/aiflag/AiUiHelper;->onThumbnailBound(Landroid/view/ViewGroup;Ljava/lang/Object;)V"
        )

        // --- Hook 2: DetailBottomBarView.setWork (Single AI warning banner & [AI] title pill) ---
        val bottomBarClass = mutableClassDefBy("Ljp/pxv/android/feature/component/androidview/DetailBottomBarView;")
        val setWorkMethod = bottomBarClass.methods.first { it.name == "setWork" }
        setWorkMethod.addInstructions(
            1,
            "invoke-static/range {p0 .. p1}, Lapp/morphe/extension/pixiv/aiflag/AiUiHelper;->onDetailBottomBarBound(Landroid/view/View;Ljava/lang/Object;)V"
        )

        // --- Hook 4: DetailImageViewHolder.bind (Inline AI banner) ---
        val detailImageHolderClass = mutableClassDefBy("Ljp/pxv/android/feature/illustviewer/detail/DetailImageViewHolder;")
        val holderBindMethod = detailImageHolderClass.methods.first { it.name == "bind" && it.parameterTypes.size == 1 }
        holderBindMethod.addInstructions(
            1,
            "invoke-static/range {p0 .. p1}, Lapp/morphe/extension/pixiv/aiflag/AiUiHelper;->onDetailImageBound(Ljava/lang/Object;Ljava/lang/Object;)V"
        )
    }
}
