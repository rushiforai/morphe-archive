package io.github.jordanwoodson.patches.rumble.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import io.github.jordanwoodson.patches.rumble.shared.composableFingerprint
import io.github.jordanwoodson.patches.shared.compose.dtoGetterFingerprint

private const val LIVE_CHAT = "Lcom/rumble/network/dto/livechat"

// The messages of a live chat event, and the history sent on joining a chat.
internal val LiveChatMessagesFingerprint =
    dtoGetterFingerprint("$LIVE_CHAT/LiveChatMessageData;", "messages", "Ljava/util/List;")
internal val LiveChatHistoryFingerprint =
    dtoGetterFingerprint("$LIVE_CHAT/LiveChatInitData;", "messages", "Ljava/util/List;")

// A chat user's badge names (verified, sub, supporter, ...).
internal val ChatBadgesFingerprint = dtoGetterFingerprint("$LIVE_CHAT/LiveChatUser;", "badges", "Ljava/util/List;")

// Video.liveChatDisabled (is_chat_disabled): true hides the live chat of a stream.
internal val LiveChatDisabledFingerprint =
    dtoGetterFingerprint("Lcom/rumble/network/dto/video/Video;", "liveChatDisabled", "Ljava/lang/Boolean;")

// The pinned message above the chat, and a creator's sponsor read (host_ad_read events).
internal val PinnedMessageSectionFingerprint =
    composableFingerprint("com.rumble.battles.livechat.presentation.content.PinnedMessageSectionView")
internal val HostReadsMessageFingerprint =
    composableFingerprint("com.rumble.battles.livechat.presentation.hostreads.HostReadsMessageView")

// The row content of a chat message: (modifier, ..., message, userName, badges, ...).
internal val LiveChatContentViewFingerprint =
    composableFingerprint("com.rumble.battles.livechat.presentation.content.LiveChatContentView")

// The live chat message entity Rumble builds from each message.
internal object ChatMessageEntityFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("LiveChatMessageEntity(messageId="),
)

// The views that draw "Message was removed by moderator": the deleted message row and the Rant row.
internal object DeletedMessageLabelFingerprint : Fingerprint(
    filters = listOf(resourceLiteral(ResourceType.STRING, "live_chat_deleted_message")),
)

// The live chat event mapper: (time, event, baseUrl, currentUserId, creatorName). Signed in, currentUserId
// is "_u" and the user ID in base 36.
internal object ChatEventMapperFingerprint : Fingerprint(
    parameters = listOf("J", "$LIVE_CHAT/LiveChatEvent;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
    strings = listOf("baseUrl", "currentUserId", "creatorName"),
)

// A regular live chat message row: (modifier, message entity, ...).
internal val LiveChatMessageViewFingerprint =
    composableFingerprint("com.rumble.battles.livechat.presentation.content.LiveChatMessageView")

// A Rant row, which paints its background with Modifier.background. Another composable has the same label.
internal val RantMessageViewFingerprint =
    composableFingerprint("com.rumble.battles.livechat.presentation.rant.RantMessageView")

// The coroutine that opens the chat's event stream: an HttpURLConnection with Accept: text/event-stream and
// the session's cookies.
internal object ChatStreamRequestFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("Accept", "text/event-stream", "Cookie"),
)

// The chat data source's send, for messages and Rants: suspend (url, body, chat API provider).
internal object ChatSendFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "$LIVE_CHAT/LiveChatMessageBody;", "L", "L"),
    custom = { method, _ -> method.implementation != null },
)
