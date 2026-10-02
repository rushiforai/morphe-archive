package io.github.bakwudo.uyu.patches.twitch.emotes

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal const val CHANNEL_CONNECTION_KEY =
    "Ltv/twitch/android/shared/chat/pub/messages/data/ChannelChatConnectionKey;"
internal const val CHAT_TEXT_SETTER =
    "Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView\$BufferType;)V"

internal object ChannelConnectionConstructorFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        custom = { _, classDef -> classDef.type == CHANNEL_CONNECTION_KEY },
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

internal object MessageRecyclerItemClassFingerprint : Fingerprint(
    strings = listOf(
        "MessageRecyclerItem(messageId=",
        ", sourceChannelId=",
    ),
)
