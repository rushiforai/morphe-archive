package app.template.patches.telegram.content

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.MessageObjectIsMusicFingerprint
import app.template.patches.telegram.Telegram1331DocumentIsMusicNormalFingerprint
import app.template.patches.telegram.Telegram1331DocumentIsMusicWebFingerprint
import app.template.patches.telegram.TelegramR8DocumentIsMusicNormalFingerprint
import app.template.patches.telegram.TelegramR8DocumentIsMusicWebFingerprint
import app.template.patches.telegram.TelegramPlusR8DocumentIsMusicFingerprint
import app.template.patches.telegram.TelegramPlus13221R8DocumentIsMusicFingerprint
import app.template.patches.telegram.signature.telegramSpoofDependency

/**
 * Makes voice-note documents eligible for the music-player path without changing
 * Telegram's voice-message classification used by Raise-to-Listen/proximity logic.
 */
@Suppress("unused")
val telegramVoiceToMusicPatch = bytecodePatch(
    name = "Voice to music",
    description = "Plays voice notes through the music-player path while preserving Raise-to-Listen.",
    default = true,
) {
    compatibleWith(
        TELEGRAM_COMPATIBILITY,
        TELEGRAM_PLUS_COMPATIBILITY,
        TELEGRAM_WEB_COMPATIBILITY,
    )

    dependsOn(telegramSpoofDependency())

    execute {
        val currentDocumentClassifier =
            Telegram1331DocumentIsMusicNormalFingerprint.methodOrNull
                ?: Telegram1331DocumentIsMusicWebFingerprint.methodOrNull
                ?: TelegramR8DocumentIsMusicNormalFingerprint.methodOrNull
                ?: TelegramR8DocumentIsMusicWebFingerprint.methodOrNull
                ?: TelegramPlus13221R8DocumentIsMusicFingerprint.methodOrNull
                ?: TelegramPlusR8DocumentIsMusicFingerprint.methodOrNull

        if (currentDocumentClassifier != null) {
            // The audited Android/Web J3(Document) and Plus R5(Document) classifiers
            // return false for voice audio attributes. Promote only that case; all other
            // documents fall through to the original native classifier.
            currentDocumentClassifier.addInstructions(0, """
                if-eqz p0, :morphe_voice_music_original
                iget-object v0, p0, Lorg/telegram/tgnet/TLRPC${'$'}Document;->attributes:Ljava/util/ArrayList;
                if-eqz v0, :morphe_voice_music_original
                const/4 v1, 0x0
                :morphe_voice_music_loop
                invoke-virtual {v0}, Ljava/util/ArrayList;->size()I
                move-result v2
                if-ge v1, v2, :morphe_voice_music_original
                invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
                move-result-object v2
                instance-of v3, v2, Lorg/telegram/tgnet/TLRPC${'$'}TL_documentAttributeAudio;
                if-eqz v3, :morphe_voice_music_next
                iget-boolean v3, v2, Lorg/telegram/tgnet/TLRPC${'$'}DocumentAttribute;->voice:Z
                if-eqz v3, :morphe_voice_music_original
                const/4 v0, 0x1
                return v0
                :morphe_voice_music_next
                add-int/lit8 v1, v1, 0x1
                goto :morphe_voice_music_loop
                :morphe_voice_music_original
                nop
            """)
        } else {
            // Older named-class builds retain their independent MessageObject hook.
            MessageObjectIsMusicFingerprint.method.addInstructions(
                0,
                """
                    iget-object v0, p0, Lorg/telegram/messenger/MessageObject;->messageOwner:Lorg/telegram/tgnet/TLRPC${'$'}Message;
                    invoke-static { v0 }, Lorg/telegram/messenger/MessageObject;->isVoiceMessage(Lorg/telegram/tgnet/TLRPC${'$'}Message;)Z
                    move-result v0
                    if-eqz v0, :morphe_voice_to_music_not_voice
                    const/4 v0, 0x1
                    return v0
                    :morphe_voice_to_music_not_voice
                    nop
                """,
            )
        }
    }
}
