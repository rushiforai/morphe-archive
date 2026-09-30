package app.morphe.patches.pixiv.viewer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

val pixivEnhancedViewerPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv Enhanced Viewer & Instant Zoom",
    description = "Displays the standard-resolution artwork as an instant placeholder while the full-resolution image loads, allows immediate pinch-to-zoom/pan preserving zoom coordinates upon high-res load, and shows a discreet loading indicator.",
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
        // --- Hook 1: DetailImageViewHolder.bind$lambda$0 (Capture detail bitmap on image click) ---
        val holderClass = mutableClassDefBy("Ljp/pxv/android/feature/illustviewer/detail/DetailImageViewHolder;")
        val clickMethod = holderClass.methods.first { it.name.contains("lambda") && it.parameterTypes.size == 4 }
        clickMethod.addInstructions(
            0,
            "invoke-static {p1, p0}, Lapp/morphe/extension/pixiv/viewer/EnhancedViewerHelper;->onDetailImageClicked(Ljava/lang/Object;Ljava/lang/Object;)V"
        )

        // --- Hook 2: zr4.instantiateItem (Fullscreen instant placeholder & discreet loading badge) ---
        val zr4Class = mutableClassDefBy("Lzr4;")
        val instantiateMethod = zr4Class.methods.first { it.name == "instantiateItem" }
        val instantiateReturnIdx = instantiateMethod.implementation?.instructions?.indexOfLast {
            it.opcode.name.startsWith("return")
        } ?: -1
        if (instantiateReturnIdx >= 0) {
            instantiateMethod.addInstructions(
                instantiateReturnIdx,
                "invoke-static {v3, v4}, Lapp/morphe/extension/pixiv/viewer/EnhancedViewerHelper;->onFullScreenItemCreated(Ljava/lang/Object;Ljava/lang/Object;)V"
            )
        }

        // --- Hook 3: yr4.d (Full-res image swap, matrix & zoom preservation, loading badge dismissal) ---
        val yr4Class = mutableClassDefBy("Lyr4;")
        val dMethod = yr4Class.methods.first { it.name == "d" }
        dMethod.addInstructions(
            1,
            "invoke-static {p0}, Lapp/morphe/extension/pixiv/viewer/EnhancedViewerHelper;->onFullResLoaded(Ljava/lang/Object;)V"
        )
    }
}
