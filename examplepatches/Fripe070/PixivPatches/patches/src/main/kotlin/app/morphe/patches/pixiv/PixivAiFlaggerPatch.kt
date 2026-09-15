package app.morphe.patches.pixiv

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

val pixivAiFlaggerPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv AI Work Flagger",
    description = "Identifies AI-generated works, dims thumbnails with an [AI] badge (or hides them completely), shows floating [AI] badge on artwork viewer, adds title [AI] pill, auto-blocks AI artists, and provides in-app settings with tag editor.",
    default = true
) {
    compatibleWith(
        Compatibility(
            name = "Pixiv",
            packageName = "jp.pxv.android",
            targets = listOf(AppTarget("6.196.0"))
        )
    )
    extendWith("extensions/pixiv.mpe")

    execute {
        // --- Hook 1: ThumbnailView.d (Feed and Search cards dimming / hide / badge) ---
        val thumbnailClass = mutableClassDefBy("Ljp/pxv/android/feature/commonlist/view/ThumbnailView;")
        val dMethod = thumbnailClass.methods.first { it.name == "d" }
        dMethod.addInstructions(
            1,
            "invoke-static/range {p0 .. p1}, Lapp/morphe/extension/pixiv/aiflag/AiUiHelper;->onThumbnailBound(Landroid/view/ViewGroup;Ljava/lang/Object;)V"
        )

        // --- Hook 2: DetailCaptionAndTagsView.setIllust (Artwork detail screen tag pill) ---
        val detailClass = mutableClassDefBy("Ljp/pxv/android/feature/component/androidview/DetailCaptionAndTagsView;")
        val setIllustMethod = detailClass.methods.first { it.name == "setIllust" }
        val instructions = setIllustMethod.implementation?.instructions

        val targetIndex = instructions?.indexOfFirst {
            it is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
            (it.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference)?.let { ref ->
                ref.definingClass == "Ljp/pxv/android/feature/component/androidview/TagListView;" && ref.name == "b"
            } == true
        } ?: -1

        if (targetIndex != -1) {
            setIllustMethod.addInstructions(
                targetIndex,
                """
                invoke-static/range {p1 .. p1}, Lapp/morphe/extension/pixiv/aiflag/AiDetectionHelper;->isAi(Ljava/lang/Object;)Z
                move-result v7
                """.trimIndent()
            )
        }

        // --- Hook 3: AiShowSettingActivity.onCreate (Pixiv Settings screen override) ---
        val settingsClass = mutableClassDefBy("Ljp/pxv/android/feature/setting/aishow/AiShowSettingActivity;")
        val onCreateMethod = settingsClass.methods.first { it.name == "onCreate" }
        onCreateMethod.addInstructions(
            1,
            """
            invoke-static/range {p0 .. p0}, Lapp/morphe/extension/pixiv/aiflag/AiFilterSettingsView;->setup(Landroid/app/Activity;)V
            return-void
            """.trimIndent()
        )

        // --- Hook 4: DetailImageViewHolder.bind (Floating top-left [AI] badge on artwork viewer) ---
        val detailImageHolderClass = mutableClassDefBy("Ljp/pxv/android/feature/illustviewer/detail/DetailImageViewHolder;")
        val holderBindMethod = detailImageHolderClass.methods.first { it.name == "bind" && it.parameterTypes.size == 1 }
        holderBindMethod.addInstructions(
            1,
            "invoke-static/range {p0 .. p1}, Lapp/morphe/extension/pixiv/aiflag/AiUiHelper;->onDetailImageBound(Ljava/lang/Object;Ljava/lang/Object;)V"
        )

        // --- Hook 5: DetailBottomBarView.setWork ([AI] pill next to title and artist name in metadata header) ---
        val bottomBarClass = mutableClassDefBy("Ljp/pxv/android/feature/component/androidview/DetailBottomBarView;")
        val setWorkMethod = bottomBarClass.methods.first { it.name == "setWork" }
        setWorkMethod.addInstructions(
            1,
            "invoke-static/range {p0 .. p1}, Lapp/morphe/extension/pixiv/aiflag/AiUiHelper;->onDetailBottomBarBound(Landroid/view/View;Ljava/lang/Object;)V"
        )
    }
}
