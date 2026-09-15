package app.morphe.patches.pixiv.downloader

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

val pixivDownloaderPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv Downloader",
    description = "Adds a button to the illustration and manga detail view to download original full-quality artwork directly to your Photos library with clean metadata filenames.",
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
        // Hook DetailBottomBarView.setWork to inject the Save button
        val bottomBarClass = mutableClassDefBy("Ljp/pxv/android/feature/component/androidview/DetailBottomBarView;")
        val setWorkMethod = bottomBarClass.methods.first { it.name == "setWork" }
        setWorkMethod.addInstructions(
            1,
            "invoke-static/range {p0 .. p1}, Lapp/morphe/extension/pixiv/downloader/DownloaderHelper;->onDetailBottomBarBound(Landroid/view/View;Ljava/lang/Object;)V"
        )
    }
}
