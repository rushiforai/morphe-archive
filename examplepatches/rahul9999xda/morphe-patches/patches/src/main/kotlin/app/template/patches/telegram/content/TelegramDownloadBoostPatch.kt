package app.template.patches.telegram.content

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.telegram.signature.telegramSpoofDependency
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.Telegram1331FileLoadOperationUpdateParamsFingerprint
import app.template.patches.telegram.FileLoadOperationUpdateParamsFingerprint
import app.template.patches.telegram.TelegramR8FileLoadOperationUpdateParamsNormalFingerprint
import app.template.patches.telegram.TelegramR8FileLoadOperationUpdateParamsWebFingerprint
import app.template.patches.telegram.PlusR8FileLoadOperationUpdateParamsFingerprint
import app.template.patches.telegram.TelegramPlus13221R8FileLoadOperationUpdateParamsFingerprint
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val telegramDownloadBoostPatch = bytecodePatch(
    name = "Download speed boost",
    description = "Increases download chunk size to 1 MB and max concurrent requests to 12.",
) {
    compatibleWith(TELEGRAM_COMPATIBILITY, TELEGRAM_WEB_COMPATIBILITY, TELEGRAM_PLUS_COMPATIBILITY)
    dependsOn(telegramSpoofDependency())

    execute {
        val currentR8Method =
            Telegram1331FileLoadOperationUpdateParamsFingerprint.methodOrNull
                ?: TelegramR8FileLoadOperationUpdateParamsNormalFingerprint.methodOrNull
                ?: TelegramR8FileLoadOperationUpdateParamsWebFingerprint.methodOrNull
        val plusR8Method = TelegramPlus13221R8FileLoadOperationUpdateParamsFingerprint.methodOrNull
            ?: PlusR8FileLoadOperationUpdateParamsFingerprint.methodOrNull

        if (currentR8Method != null || plusR8Method != null) {
            val targetMethod = currentR8Method ?: plusR8Method!!
            // Preserve each APK's stock decision tree, then override only its final
            // chunk/concurrency/CDN fields. Telegram/Web use n/o/p/q; Plus 13.2.2.1 uses wc.G0(); the older 13.2.1.0
            // uc.G0() layout remains a separate fallback with the same q/s/t/v fields. This runs after the
            // stock preload/force-small-chunk/experiment branches have completed.
            val implementation = requireNotNull(targetMethod.implementation) {
                "R8 FileLoadOperation.updateParams has no implementation"
            }
            val returnIndex = implementation.instructions.indexOfLast {
                it.opcode == Opcode.RETURN_VOID
            }
            require(returnIndex >= 0) { "R8 FileLoadOperation.updateParams has no RETURN_VOID" }
            val owner = targetMethod.definingClass.toString()
            val overrides = if (plusR8Method != null) {
                // Plus uses a different R8 field layout from Telegram/Web.
                // wc.G0() in 13.2.2.1 (uc.G0() in 13.2.1.0) computes q (chunk bytes), s/t (parallel requests), v (CDN cap).
                """
                    const/high16 v0, 0x100000
                    iput v0, p0, $owner->q:I
                    const/16 v0, 0xC
                    iput v0, p0, $owner->s:I
                    iput v0, p0, $owner->t:I
                    const/16 v0, 0x7D0
                    iput v0, p0, $owner->v:I
                """
            } else {
                """
                    const/high16 v0, 0x100000
                    iput v0, p0, $owner->n:I
                    const/16 v0, 0xC
                    iput v0, p0, $owner->o:I
                    iput v0, p0, $owner->p:I
                    const/16 v0, 0x7D0
                    iput v0, p0, $owner->q:I
                """
            }
            targetMethod.addInstructions(returnIndex, overrides)
        } else {
            // Named Telegram Plus / legacy owner. Kept separate from the R8 path.
            val method = requireNotNull(FileLoadOperationUpdateParamsFingerprint.methodOrNull) {
                "Missing FileLoadOperation.updateParams()V"
            }
            method.addInstructions(0, """
                const/high16 v0, 0x100000
                iput v0, p0, Lorg/telegram/messenger/FileLoadOperation;->downloadChunkSizeBig:I
                const/16 v0, 0xC
                iput v0, p0, Lorg/telegram/messenger/FileLoadOperation;->maxDownloadRequests:I
                iput v0, p0, Lorg/telegram/messenger/FileLoadOperation;->maxDownloadRequestsBig:I
                const/16 v0, 0x7D0
                iput v0, p0, Lorg/telegram/messenger/FileLoadOperation;->maxCdnParts:I
                return-void
            """)
        }
    }
}
