package app.jouss.patches.plusmessenger.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.jouss.patches.plusmessenger.shared.Constants.COMPATIBILITY_PLUS_MESSENGER

private const val MSG = "Lorg/telegram/tgnet/TLRPC\$Message;"
private const val MSG_OBJ = "Lorg/telegram/messenger/MessageObject;"

object IsSecretMediaFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSecretMedia",
    returnType = "Z",
    parameters = listOf(),
)

object NeedDrawBluredPreviewFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "needDrawBluredPreview",
    returnType = "Z",
    parameters = listOf(),
)

object IsSecretMediaStaticFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSecretMedia",
    returnType = "Z",
    parameters = listOf(MSG),
)

object IsSecretPhotoOrVideoFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSecretPhotoOrVideo",
    returnType = "Z",
    parameters = listOf(MSG),
)

object ShouldEncryptPhotoOrVideoFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "shouldEncryptPhotoOrVideo",
    returnType = "Z",
    parameters = listOf("I", MSG),
)

object IsVoiceOnceFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isVoiceOnce",
    returnType = "Z",
)

object IsRoundOnceFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isRoundOnce",
    returnType = "Z",
)

object SendSecretMediaDeleteFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatActivity;",
    name = "sendSecretMediaDelete",
    returnType = "Ljava/lang/Runnable;",
    parameters = listOf(MSG_OBJ),
)

object SendSecretMessageReadFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatActivity;",
    name = "sendSecretMessageRead",
    returnType = "Ljava/lang/Runnable;",
    parameters = listOf(MSG_OBJ, "Z"),
)

@Suppress("unused")
val antiDisappearingMediaPatch = bytecodePatch(
    name = "Anti-disappearing media",
    description = "Keeps view-once and self-destructing media viewable forever."
) {
    compatibleWith(COMPATIBILITY_PLUS_MESSENGER)

    execute {
        listOf(
            IsSecretMediaFingerprint,
            IsSecretMediaStaticFingerprint,
            IsSecretPhotoOrVideoFingerprint,
            ShouldEncryptPhotoOrVideoFingerprint,
            IsVoiceOnceFingerprint,
            IsRoundOnceFingerprint,
            NeedDrawBluredPreviewFingerprint,
        ).forEach {
            it.method.addInstructions(0, """
                const/4 v0, 0x0
                return v0
            """)
        }

        listOf(
            SendSecretMediaDeleteFingerprint,
            SendSecretMessageReadFingerprint,
        ).forEach {
            it.method.addInstructions(0, """
                const/4 v0, 0x0
                return-object v0
            """)
        }
    }
}
