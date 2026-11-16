package io.github.jordanwoodson.patches.twitch.emotes

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import com.android.tools.smali.dexlib2.AccessFlags

internal const val TUID = "Ltv/twitch/android/models/Tuid;"
private const val EVENT_DISPATCHER = "Ltv/twitch/android/core/mvp/viewdelegate/EventDispatcher;"

// Builds a live chat line's render model (live messages, Twitch's own chat history and shared chat). It
// splits text at spaces and swaps each word found in the client-parsed emote set for an emote token.
internal object EmoteMatcherFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf(TUID, "L", "Ljava/lang/String;", "L"),
    strings = listOf("((?<= )|(?= ))", "gigantified-emote-message", "animated-message"),
)

// The live chat message data holding that set: its label in toString precedes the field read.
internal object LiveChatMessageDataFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("LiveChatMessageData(cheermotesHelper=", ", clientParsedEmotes="),
)

// The emote class the set holds: (id, token, owner, asset type, modified emotes, emote type).
internal object ClientEmoteFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("WithOwner(id=", ", token=", ", ownerId=", ", assetType="),
)

// Every native emote image URL is built here from an emote ID.
internal object EmoteUrlFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "L", "Ljava/lang/Float;"),
    strings = listOf("https://static-cdn.jtvnw.net/emoticons/v2/", "dark", "light"),
)

// VOD chat replay (and whispers, clip comments): the static builder in the matcher's class that renders a
// message's named MessageToken list.
internal object ReplayTokensFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "L",
    parameters = listOf("L", TUID, "L", "Ljava/lang/Integer;", "L", "I"),
    filters = listOf(methodCall(name = "getTokens", parameters = emptyList(), returnType = "Ljava/util/List;")),
)

// An emote's chat span: image plus the click span that opens Twitch's emote card.
internal object EmoteSpanFingerprint : Fingerprint(
    returnType = "Landroid/text/SpannableString;",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", TUID, "L", "Z", "Ljava/lang/Integer;", EVENT_DISPATCHER),
)

// Loads the images of a chat line's image spans (emotes, badges) with Glide, sized by each span's size class.
internal object ChatImageLoaderFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/util/List;",
    parameters = listOf("Landroid/content/Context;", "Landroid/text/Spanned;", "Landroid/widget/TextView;"),
    filters = listOf(methodCall(name = "isHeightConstrained", parameters = emptyList(), returnType = "Z")),
)

// React Native's WebSocket module: the listener that passes each received text frame to JavaScript. React
// Native chat (the Ultralight theatre) receives Twitch chat (IRC) through it.
internal object RnWebSocketTextFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "Ljava/lang/String;"),
    strings = listOf("websocketMessage", "data", "text"),
    custom = { _, classDef -> classDef.fields.any { it.type == "Lcom/facebook/react/modules/websocket/WebSocketModule;" } },
)

// React Native's image source: every RN image URI (including chat emotes) is parsed here.
internal object RnImageSourceFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "D", "D", "L"),
    filters = listOf(
        methodCall(definingClass = "Landroid/net/Uri;", name = "parse"),
        methodCall(definingClass = "Landroid/net/Uri;", name = "getScheme"),
    ),
)

// Chat starts connecting to a channel.
internal object ChatConnectFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(TUID),
    strings = listOf("chat_connectingfor_channel", "chat_connecting"),
)

// The emote picker's presenter (EmotePickerPresenter): its state machine names its reducer and action handler.
internal object EmotePickerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    strings = listOf("createEmotePickerState", "actionHandler"),
)

// An emote set owned by a channel (OwnerEmoteSet): the picker gives each owner a section with a named header.
internal object OwnerEmoteSetFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("OwnerEmoteSet(emoteOwner=", ", setId="),
)

// The owner of such a set (EmoteOwner): ID, login, display name and avatar URL, shown in the section header.
internal object EmoteOwnerFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("EmoteOwner(id=", ", login="),
)

// The chat input's autocomplete filter: asks its current source (users, emotes or commands) for matches.
internal object AutocompleteFilterFingerprint : Fingerprint(
    name = "performFiltering",
    returnType = "Landroid/widget/Filter\$FilterResults;",
    parameters = listOf("Ljava/lang/CharSequence;"),
    filters = listOf(methodCall(parameters = listOf("Ljava/lang/CharSequence;"), returnType = "Ljava/util/ArrayList;")),
    custom = { _, classDef -> classDef.superclass == "Landroid/widget/Filter;" },
)

// The emote autocomplete source: the user's emotes by code, matched after an optional leading ':'.
internal object EmoteAutocompleteFingerprint : Fingerprint(
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("Ljava/lang/CharSequence;"),
    strings = listOf(":"),
    filters = listOf(
        checkCast("Ljava/util/LinkedHashMap;"),
        fieldAccess(definingClass = "Ljava/util/Locale;", name = "ROOT"),
    ),
)

// Glide's OkHttp fetcher (OkHttpStreamFetcher), which loads every network image of the app: its response
// callback fails the load with Glide's own HttpException, a class R8 keeps by name.
internal object ImageFetcherResponseFingerprint : Fingerprint(
    name = "onResponse",
    returnType = "V",
    parameters = listOf("L", "L"),
    filters = listOf(newInstance("Lcom/bumptech/glide/load/HttpException;")),
    custom = { _, classDef -> classDef.methods.any { it.name == "onFailure" } },
)

// An emote item of the emote picker (EmoteUiModel): its ID and the clicked-emote model taps hand over.
internal object EmoteUiModelFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("EmoteUiModel(id=", ", clickedEmote="),
)

// An unlocked emote of the picker: the emote, what a tap inserts and its modifier variants (Twitch's long press).
internal object UnlockedEmoteFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("Unlocked(emote=", ", modifiedEmotes="),
)
