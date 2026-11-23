package io.github.xxlc.patches.grok

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode

private object VideoDownloadUrlFingerprint : Fingerprint(
    definingClass = GrokNames.VIDEO_DOWNLOADER,
    name = GrokNames.VIDEO_DOWNLOAD_METHOD,
    isStatic = false,
    returnType = "Ljava/lang/Object;",
    parameters = listOf(GrokNames.DOWNLOAD_JOB, GrokNames.DOWNLOAD_SOURCE, GrokNames.SUSPEND_CONTINUATION),
)

@Suppress("unused")
val bestVideoQualityPatch = bytecodePatch(
    name = "Download best video quality",
    description = "Select the highest-quality video URL the app already received, keeping captions and music overlays and falling back to the original URL when needed. Images have a single URL and are unchanged. Not tested on a device.",
    default = true,
) {
    compatibleWith(grokCompatibility)
    val enabled by enabledOption(default = true)

    execute {
        if (enabled != true) return@execute
        VideoDownloadUrlFingerprint.method.apply {
            requireRegisterCount(32) // .locals 28, preserve p0..p3 = v28..v31.
            val urlIndex = indexOfReference(Opcode.INVOKE_VIRTUAL, GrokNames.SELECTED_VIDEO_URL)
            val exportIndex = indexOfReference(Opcode.INVOKE_DIRECT, GrokNames.NEW_VIDEO_EXPORT)
            requireRegisters(urlIndex, 1)
            requireRegisters(urlIndex + 1, 1)
            requireRegisters(exportIndex, 10, 12, 1)
            check(exportIndex == urlIndex + 2 &&
                implementation!!.instructions[urlIndex + 1].opcode == Opcode.MOVE_RESULT_OBJECT) {
                "Video file build branch does not match original smali."
            }
            val videoIndex = indexOfReference(Opcode.IGET_OBJECT, GrokNames.SELECTED_VIDEO)
            requireRegisters(videoIndex, 12, 12)
            check(videoIndex == urlIndex - 2) { "Video source does not match URL selection point." }
            // v13..v15 are dead after v13/v14 are copied to v6/v7.
            // try_start_10 handler uses v0, v3, v5..v9, does not read v13..v15.
            addInstructionsWithLabels(
                urlIndex,
                """
                    sget-object v13, ${GrokNames.BEST_VIDEO_QUALITY}
                    iget-object v14, v1, ${GrokNames.VIDEO_CAPTION}
                    iget-object v15, v1, ${GrokNames.VIDEO_MUSIC}
                    invoke-static {v12, v13, v14, v15}, ${GrokNames.BEST_VIDEO_URL}
                    move-result-object v13
                    if-eqz v13, :d2_best_original_url
                    move-object v1, v13
                    goto :d2_best_export
                    :d2_best_original_url
                    nop
                """,
                ExternalLabel("d2_best_export", exportIndex),
            )
        }
    }
}
