package app.morphe.patches.pixiv.downloader

import app.morphe.patches.pixiv.shared.PixivConstants

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch

val pixivDownloaderPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv Downloader",
    description = "Adds a save button to the illustration and manga detail screen that writes the " +
        "original artwork to Pictures/Pixiv, named after the work id, title and author. Android 9 and " +
        "older save into the app's private folder.",
    default = true
) {
    compatibleWith(PixivConstants.PIXIV)
    extendWith("extensions/pixiv.mpe")

    execute {
        val bottomBarClass = mutableClassDefBy("Ljp/pxv/android/feature/component/androidview/DetailBottomBarView;")
        val setWorkMethod = bottomBarClass.methods.first { it.name == "setWork" }
        setWorkMethod.addInstructions(
            1,
            "invoke-static/range {p0 .. p1}, Lapp/morphe/extension/pixiv/downloader/DownloaderHelper;->onDetailBottomBarBound(Landroid/view/View;Ljava/lang/Object;)V"
        )
    }
}
