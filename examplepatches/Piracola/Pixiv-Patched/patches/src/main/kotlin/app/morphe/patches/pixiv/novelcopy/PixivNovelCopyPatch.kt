package app.morphe.patches.pixiv.novelcopy

import app.morphe.patches.pixiv.shared.PixivConstants

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch

private const val HELPER = "Lapp/morphe/extension/pixiv/novelcopy/NovelCopyHelper;"

val pixivNovelCopyPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv Novel Text Copy",
    description = "Re-enables text handling on the novel reader: long-press selection in the body, caption and series description, and a reader menu with copy title, copy author and download-full-text (title, caption, link and body saved as a .txt in Downloads).",
    default = true
) {
    compatibleWith(PixivConstants.PIXIV)
    extendWith("extensions/pixiv.mpe")

    execute {
        // --- Reader: selectable toolbar title, extra menu items, menu click handler ---
        val readerClass = mutableClassDefBy("Ljp/pxv/android/feature/novelviewer/noveltext/NovelTextActivity;")

        // onCreate has 35 registers, so p0 lives above the 4-bit range of a plain invoke.
        readerClass.methods.first { it.name == "onCreate" && it.parameterTypes.size == 1 }
            .addInstructions(0, "invoke-static/range {p0 .. p0}, $HELPER->onScreenCreated(Landroid/app/Activity;)V")

        readerClass.methods.first { it.name == "onCreateOptionsMenu" && it.returnType == "Z" }
            .addInstructions(0, "invoke-static {p1}, $HELPER->onCreateOptionsMenu(Landroid/view/Menu;)V")

        // u(activity, item) is the body behind the toolbar's OnMenuItemClickListener. Unknown ids
        // fall through to super and return false, so handling the click first is enough.
        readerClass.methods.first { it.name == "u" && it.parameterTypes.size == 2 && it.returnType == "Z" }
            .addInstructions(0, "invoke-static {p0, p1}, $HELPER->onMenuItemClicked(Landroid/app/Activity;Landroid/view/MenuItem;)V")

        // --- Novels and illustrations share this caption view. b(String) installs
        // LinkMovementMethod and only then sets the text, silently dropping the
        // textIsSelectable="true" the layout declares. The hook has to run after that call,
        // so it goes right before the method returns.
        val captionMethod = mutableClassDefBy("Ljp/pxv/android/feature/component/androidview/DetailCaptionAndTagsView;")
            .methods.first { it.name == "b" && it.parameterTypes.size == 1 && it.returnType == "V" }
        val captionReturnIndex = captionMethod.implementation?.instructions?.indexOfLast {
            it.opcode.name.startsWith("return")
        } ?: -1
        if (captionReturnIndex >= 0) {
            captionMethod.addInstructions(
                captionReturnIndex,
                "invoke-static {p0}, $HELPER->onCaptionBound(Landroid/view/View;)V"
            )
        }

        // --- Novel body: a WebView running pixiv's own page, the only place selection is a web concern ---
        mutableClassDefBy("Lyl6;")
            .methods.first { it.name == "onPageFinished" && it.returnType == "V" }
            .addInstructions(0, "invoke-static {p1}, $HELPER->onPageFinished(Landroid/webkit/WebView;)V")

        // --- Series detail: its own 22 registers also need the wider invoke ---
        mutableClassDefBy("Ljp/pxv/android/feature/novelseriesdetail/NovelSeriesDetailActivity;")
            .methods.first { it.name == "onCreate" && it.parameterTypes.size == 1 }
            .addInstructions(0, "invoke-static/range {p0 .. p0}, $HELPER->onScreenCreated(Landroid/app/Activity;)V")
    }
}
