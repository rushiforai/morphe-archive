package io.github.jordanwoodson.patches.twitch.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import io.github.jordanwoodson.patches.twitch.emotes.ChatImageLoaderFingerprint

private const val EVENT_DISPATCHER = "Ltv/twitch/android/core/mvp/viewdelegate/EventDispatcher;"
private const val RESTRICTIONS = "Ltv/twitch/android/shared/messageinput"
internal const val POINTS_MODEL = "Ltv/twitch/android/models/communitypoints/CommunityPointsModel;"

// Chat timestamps.

// The chat line builder's class: its constructor makes the "H:mm" time formatter (the only one in the app).
internal object ChatLineFormatterFingerprint : Fingerprint(
    name = "<init>", returnType = "V", filters = listOf(string("H:mm")),
)

// Turns a chat message into a list item. Its fourth parameter shows the time: true for chat history only.
internal object ChatLineItemFingerprint : Fingerprint(
    returnType = "L", parameters = listOf("L", "Z", "L", "Z", "L", EVENT_DISPATCHER, EVENT_DISPATCHER),
    strings = listOf("client-nonce", "gifs"),
)

// Show deleted messages.

// Builds a chat line's spans. A message that is already deleted gets the "<message deleted>" placeholder.
internal object DeletedMessageSpansFingerprint : Fingerprint(
    classFingerprint = ChatLineFormatterFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    filters = listOf(resourceLiteral(ResourceType.STRING, "chat_message_deleted"), string("<"), string(">")),
)

// Re-renders a shown line when its message is deleted later: keeps the name, replaces the message.
internal object DeletedMessageLineFingerprint : Fingerprint(
    returnType = "Landroid/text/Spanned;",
    parameters = listOf("Ljava/lang/String;", "Landroid/text/SpannedString;", "Landroid/content/Context;", EVENT_DISPATCHER, "Z"),
    filters = listOf(resourceLiteral(ResourceType.STRING, "chat_message_deleted")),
)

// The IRC parser: one IRC line to a chat event. CLEARCHAT without a target user clears the whole chat.
internal object IrcEventParserFingerprint : Fingerprint(
    returnType = "L", parameters = listOf("L", "L", "L", "L", "Z"),
    strings = listOf("target-user-id", "target-msg-id", " but no target-msg-id in tags found"),
)

// Anonymous chat.

// The IRC login: the nickname and OAuth token the chat client sends after connecting.
internal object IrcCredentialsFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("UserCredentials(nickname=", ", oauthToken="),
)

// Sends CAP, PASS and NICK once the chat WebSocket connects. A null token is sent as "PASS listen".
internal object IrcLoginFingerprint : Fingerprint(
    name = "emit", returnType = "Ljava/lang/Object;", parameters = listOf("Ljava/lang/Object;", "L"),
    strings = listOf("Enqueueing IRC auth flow commands (CAP, NICK, PASS)", "listen", "oauth:", "PASS ", "NICK "),
)

// Picks the restriction shown in place of the chat input and checked before a message is sent.
internal object ChatRestrictionFingerprint : Fingerprint(
    returnType = "$RESTRICTIONS/pub/chatrestrictions/ChatRestrictionsDisplayType;",
    parameters = listOf("$RESTRICTIONS/impl/chatrestrictions/ChatRestrictionsState;", "L", "Z"),
    filters = listOf(
        methodCall(name = "getForceHideRestrictionsBanner"),
        methodCall(name = "getBypassSendChatMessageRestrictions"),
        fieldAccess(definingClass = "$RESTRICTIONS/pub/chatrestrictions/ChatRestrictionsDisplayType\$LOGIN;", name = "INSTANCE"),
    ),
)

// The text above the native chat input for each restriction. The log-in one reads "Login to Chat".
internal object ChatRestrictionLabelFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "chat_input_label_login"),
        methodCall(definingClass = "Landroid/content/Context;", name = "getString"),
        resourceLiteral(ResourceType.STRING, "chat_input_label_emote"),
    ),
)

// The GraphQL mutation every typed chat message (and /me) is sent with.
internal object SendChatMessageMutationFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    filters = listOf(string("SendChatMessageMutation(input=")),
)

/** The only method that builds the send mutation: (channel, message, nonce, reply parent, continuation). */
internal fun sendChatMessageFingerprint(mutation: String) = Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "L"),
    filters = listOf(newInstance(mutation)),
)

// Auto-claim channel points.

// The presenter behind the channel points button in chat. It holds the claim action. The whole string:
// Morphe Patcher 2.0 compares fingerprint strings exactly.
internal object PointsButtonPresenterFingerprint : Fingerprint(
    name = "<init>", returnType = "V",
    strings = listOf(
        "processStateUpdate(Ltv/twitch/android/shared/community/points/presenters/CommunityPointsButtonStateProvider\$State;" +
            "Ltv/twitch/android/shared/community/points/presenters/CommunityPointsButtonStateProvider\$UpdateEvent;)" +
            "Ltv/twitch/android/core/mvp/presenter/StateAndAction;",
    ),
)

/** The presenter's subscriber for points updates: a lambda holding the presenter that receives the model. */
internal fun pointsUpdateFingerprint(presenter: String) = Fingerprint(
    name = "invoke", returnType = "Ljava/lang/Object;", parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(checkCast(POINTS_MODEL)),
    custom = { _, classDef -> classDef.fields.count { it.type == presenter } == 1 },
)

// Chat keywords and Chat appearance.

// A live chat line's render model: id, type, tags, badges, color, sender, tokens, time, flags, ...
internal object LiveChatLineFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("LiveChatMessage(messageId=", ", sender=", ", messageTokens="),
)

// The spans of one native chat line, in the order they are shown.
internal object ChatLineSpansFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("ChatMessageSpanGroup(timestampSpan=", ", senderSpan=", ", messageSpan="),
)

// A chat line's sender: user ID, login and display name.
internal object ChatLineSenderFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("ChatMessageUser(userId=", ", username=", ", displayName="),
)

// Builds one native chat line (live chat, chat history, VOD chat replay) from its sender, tokens, style and
// flags. It is in the class that makes the chat time formatter, and builds the "<message deleted>" placeholder.
internal object ChatLineBuilderFingerprint : Fingerprint(
    classFingerprint = ChatLineFormatterFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    filters = listOf(resourceLiteral(ResourceType.STRING, "chat_message_deleted")),
)

// Binds a native chat line to its row: text style, padding, text, and the background of a selected line.
internal object ChatRowBinderFingerprint : Fingerprint(
    returnType = "V", parameters = listOf("L", "Z"),
    filters = listOf(
        resourceLiteral(ResourceType.STYLE, "ChatMessageView"),
        methodCall(definingClass = "Landroid/widget/TextView;", name = "setText"),
        resourceLiteral(ResourceType.COLOR, "selected_message_color"),
    ),
)

// Binds a VOD chat replay line to its row: text, overflow button, and a pressed or transparent background.
internal object ReplayRowBinderFingerprint : Fingerprint(
    returnType = "V", parameters = listOf("L"),
    filters = listOf(
        methodCall(definingClass = "Landroid/widget/TextView;", name = "setText", parameters = listOf("Ljava/lang/CharSequence;")),
        resourceLiteral(ResourceType.STRING, "chomment_overflow_username"),
        methodCall(definingClass = "Landroid/view/View;", name = "setBackgroundColor", parameters = listOf("I")),
    ),
)

// The landscape chat panel's layout, which switches it between letterbox and overlay mode.
internal object LandscapeChatLayoutFingerprint : Fingerprint(
    returnType = "V", parameters = listOf("Z"),
    filters = listOf(resourceLiteral(ResourceType.STRING, "transition_landscape_chat_overlay_mode_show")),
)

// Sizes the landscape chat panel: 20% of the screen's long side on tablets, 30% on phones.
internal object LandscapeChatWidthFingerprint : Fingerprint(
    classFingerprint = LandscapeChatLayoutFingerprint,
    returnType = "V", parameters = emptyList(),
    filters = listOf(
        literal(20),
        literal(30),
        methodCall(parameters = listOf("I", "Landroid/view/View;"), returnType = "V", opcode = Opcode.INVOKE_STATIC),
    ),
)

// The size in pixels of a chat image span's box (emote, badge, notice icon), in the chat image loader's class: its
// size class's dp size, or the landscape one where the size class has one.
internal object ChatImageBoxFingerprint : Fingerprint(
    classFingerprint = ChatImageLoaderFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "L"),
    filters = listOf(
        methodCall(name = "getLandscapeSizeDp", parameters = emptyList(), returnType = "Ljava/lang/Float;"),
        methodCall(name = "getSizeDp", parameters = emptyList(), returnType = "F"),
    ),
)

// Emote and badge info.

// Twitch's badge image registry: a badge set and version's image URL for a channel, from the channel's badges
// first, then the global ones (two map lookups each).
internal object BadgeUrlFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ltv/twitch/android/models/Tuid;"),
    filters = listOf(
        methodCall(definingClass = "Ljava/util/concurrent/ConcurrentHashMap;", name = "get"),
        methodCall(definingClass = "Ljava/util/Map;", name = "get"),
        methodCall(definingClass = "Ljava/util/concurrent/ConcurrentHashMap;", name = "get"),
        methodCall(definingClass = "Ljava/util/Map;", name = "get"),
    ),
)

// Lays out the native theatre. In landscape the chat column starts at a guideline: 70% of the width, 80% on
// tablets (the one-chat overlay is placed after).
internal object TheatreLayoutFingerprint : Fingerprint(
    returnType = "V", parameters = listOf("L"),
    filters = listOf(
        literal(0.8f),
        literal(0.7f),
        resourceLiteral(ResourceType.ID, "one_chat_overlay_container"),
    ),
)
