package app.paresh.patches.telegram.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.telegram.shared.Constants.COMPATIBILITY_TELEGRAM

object UpdateParamsFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/FileLoadOperation;",
    name = "updateParams",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val downloadBoostPatch = bytecodePatch(
    name = "Download speed boost",
    description = "Increases download chunk size and max concurrent requests."
) {
    compatibleWith(COMPATIBILITY_TELEGRAM)

    execute {
        // Replace entire method — always use big chunk size (512KB) and 8 max requests
        UpdateParamsFingerprint.method.addInstructions(0, """
            const/high16 v0, 0x80000
            iput v0, p0, Lorg/telegram/messenger/FileLoadOperation;->downloadChunkSizeBig:I
            const/16 v0, 0x8
            iput v0, p0, Lorg/telegram/messenger/FileLoadOperation;->maxDownloadRequests:I
            iput v0, p0, Lorg/telegram/messenger/FileLoadOperation;->maxDownloadRequestsBig:I
            const-wide/32 v0, 0x7d000000
            iget v2, p0, Lorg/telegram/messenger/FileLoadOperation;->downloadChunkSizeBig:I
            int-to-long v2, v2
            div-long/2addr v0, v2
            long-to-int v0, v0
            iput v0, p0, Lorg/telegram/messenger/FileLoadOperation;->maxCdnParts:I
            return-void
        """)
    }
}
