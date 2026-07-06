package app.morphe.patches.youtube.checks

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.youtube.dpi.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.dpi.Constants.COMPATIBILITY_YOUTUBE_MUSIC

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/shared/patches/ExperimentalAppNoticePatch;"

@Suppress("unused")
val disableExperimentalNoticePatch = bytecodePatch(
    "Disable experimental notice",
    "Removes the morphe experimental-version warning dialog, which otherwise nags on every " +
        "re-patched build whose version differs from the recommended one.",
    false,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE, COMPATIBILITY_YOUTUBE_MUSIC)

    finalize {
        val noticeClass = mutableClassDefByOrNull(EXTENSION_CLASS) ?: return@finalize
        noticeClass.methods
            .filter { it.name == "showExperimentalNoticeIfNeeded" }
            .forEach { it.addInstructions(0, "return-void") }
    }
}
