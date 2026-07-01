package app.paresh.patches.telegram.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.telegram.shared.Constants.COMPATIBILITY_TELEGRAM
import com.android.tools.smali.dexlib2.AccessFlags

private const val MSG_OBJ = "Lorg/telegram/messenger/MessageObject;"
private const val MSG = "Lorg/telegram/tgnet/TLRPC\$Message;"

// Prevent destroy timer and deletion
object IsSecretMediaFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSecretMedia", returnType = "Z", parameters = listOf(),
)

object IsSecretMediaStaticFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSecretMedia", returnType = "Z", parameters = listOf(MSG),
)

object IsSecretPhotoOrVideoFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSecretPhotoOrVideo", returnType = "Z", parameters = listOf(MSG),
)

// Store in normal cache
object ShouldEncryptPhotoOrVideoFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "shouldEncryptPhotoOrVideo", returnType = "Z", parameters = listOf("I", MSG),
)

// View-once voice and round video
object IsVoiceOnceFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isVoiceOnce", returnType = "Z",
)

object IsRoundOnceFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isRoundOnce", returnType = "Z",
)

// Block destruction callbacks
object SendSecretMediaDeleteFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatActivity;",
    name = "sendSecretMediaDelete",
    returnType = "Ljava/lang/Runnable;",
    accessFlags = listOf(AccessFlags.PRIVATE),
    parameters = listOf(MSG_OBJ),
)

object SendSecretMessageReadFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatActivity;",
    name = "sendSecretMessageRead",
    returnType = "Ljava/lang/Runnable;",
    accessFlags = listOf(AccessFlags.PRIVATE),
    parameters = listOf(MSG_OBJ, "Z"),
)

@Suppress("unused")
val antiDisappearingMediaPatch = bytecodePatch(
    name = "Anti-disappearing media",
    description = "Keeps view-once and self-destructing media viewable forever."
) {
    compatibleWith(COMPATIBILITY_TELEGRAM)

    execute {
        // Return false — prevent destruction and encrypted storage
        listOf(
            IsSecretMediaFingerprint,
            IsSecretMediaStaticFingerprint,
            IsSecretPhotoOrVideoFingerprint,
            ShouldEncryptPhotoOrVideoFingerprint,
            IsVoiceOnceFingerprint,
            IsRoundOnceFingerprint,
        ).forEach {
            it.method.addInstructions(0, """
                const/4 v0, 0x0
                return v0
            """)
        }

        // Return null — block destruction callbacks and read receipts
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
