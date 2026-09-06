package app.aapam.patches.telegram.shared

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

private const val MSG_OBJ = "Lorg/telegram/messenger/MessageObject;"
private const val MSG = "Lorg/telegram/tgnet/TLRPC\$Message;"

internal object IsSecretMediaFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSecretMedia",
    returnType = "Z",
    parameters = listOf(),
)

internal object IsSecretMediaStaticFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSecretMedia",
    returnType = "Z",
    parameters = listOf(MSG),
)

internal object IsSecretPhotoOrVideoFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSecretPhotoOrVideo",
    returnType = "Z",
    parameters = listOf(MSG),
)

internal object ShouldEncryptPhotoOrVideoFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "shouldEncryptPhotoOrVideo",
    returnType = "Z",
    parameters = listOf("I", MSG),
)

internal object IsVoiceOnceFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isVoiceOnce",
    returnType = "Z",
)

internal object IsRoundOnceFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isRoundOnce",
    returnType = "Z",
)

internal object SendSecretMediaDeleteFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatActivity;",
    name = "sendSecretMediaDelete",
    returnType = "Ljava/lang/Runnable;",
    accessFlags = listOf(AccessFlags.PRIVATE),
    parameters = listOf(MSG_OBJ),
)

// The read receipt must still reach the server so the sender's copy expires.
// Only the isSecretMedia() guard inside this method is bypassed (see the patch).
internal object SendSecretMessageReadFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatActivity;",
    name = "sendSecretMessageRead",
    returnType = "Ljava/lang/Runnable;",
    accessFlags = listOf(AccessFlags.PRIVATE),
    parameters = listOf(MSG_OBJ, "Z"),
)

// Neutralize the local destruction of the receiver's copy: these would otherwise
// either run the TTL countdown or empty the media when the server confirms read.
internal object CheckDeletingTaskFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkDeletingTask",
    returnType = "Z",
    parameters = listOf("Z"),
)

internal object DoDeleteShowOnceTaskFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "doDeleteShowOnceTask",
    returnType = "V",
    parameters = listOf("J", "J", "I"),
)

internal object EmptyMessagesMediaFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesStorage;",
    name = "emptyMessagesMedia",
    returnType = "V",
    parameters = listOf("J", "Ljava/util/ArrayList;"),
)