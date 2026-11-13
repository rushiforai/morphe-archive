package app.morphe.patches.pixiv.viewer

import app.morphe.patches.pixiv.shared.PixivConstants
import app.morphe.patches.pixiv.shared.fullResTargetFingerprint
import app.morphe.patches.pixiv.shared.fullScreenPagerItemFingerprint

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch

val pixivEnhancedViewerPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv Enhanced Viewer & Instant Zoom",
    description = "Shows the standard-resolution artwork as an instant placeholder while the " +
        "full-resolution image loads, so pinch-to-zoom and panning work right away and keep their " +
        "position when the full image replaces the placeholder.",
    default = true
) {
    compatibleWith(PixivConstants.PIXIV)
    extendWith("extensions/pixiv.mpe")

    execute {
        // p0 = illust, p1 = holder, p2 = page index (the same index the app forwards to the
        // viewer as "KEY_POSITION"), p3 = clicked view.
        val holderClass = mutableClassDefBy("Ljp/pxv/android/feature/illustviewer/detail/DetailImageViewHolder;")
        val clickMethod = holderClass.methods.first { it.name.contains("lambda") && it.parameterTypes.size == 4 }
        clickMethod.addInstructions(
            0,
            "invoke-static {p1, p0, p2}, Lapp/morphe/extension/pixiv/viewer/EnhancedViewerHelper;->onDetailImageClicked(Ljava/lang/Object;Ljava/lang/Object;I)V"
        )

        // instantiateItem() builds the photo layout (v3) and its attacher (v4) before returning v3.
        // The adapter's own class name is renamed every release, so the fingerprint finds the method
        // by the PixivImageView page it adds to the pager.
        // The page index is read from the tag the adapter set on the photo view.
        val instantiateMethod = fullScreenPagerItemFingerprint.method
        val instantiateReturnIdx = instantiateMethod.implementation?.instructions?.indexOfLast {
            it.opcode.name.startsWith("return")
        } ?: -1
        if (instantiateReturnIdx >= 0) {
            instantiateMethod.addInstructions(
                instantiateReturnIdx,
                "invoke-static {v3, v4}, Lapp/morphe/extension/pixiv/viewer/EnhancedViewerHelper;->onFullScreenItemCreated(Ljava/lang/Object;Ljava/lang/Object;)V"
            )
        }

        // Inserted before the drawable is installed, so the attacher still holds the placeholder state.
        // Pixiv has several targets for a PixivImageView and they all get renamed, so the fullscreen
        // page's is the one that both installs the drawable and hides the page's ProgressBar.
        val onResourceReady = fullResTargetFingerprint.method
        onResourceReady.addInstructions(
            1,
            "invoke-static {p0}, Lapp/morphe/extension/pixiv/viewer/EnhancedViewerHelper;->onFullResLoaded(Ljava/lang/Object;)V"
        )
    }
}
