package hooman.morphe.patches.twitch.chat

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object LegacyChatMessageRendererFingerprint : Fingerprint(
    strings = listOf("channelId", "data", "messageInfo", "animation-id", "gigantified-emote-message"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lem5;",
    parameters = listOf("Ljava/lang/String;", "Lrol;", "Ljava/lang/String;", "Lyo5;"),
)

object PublicChatMessageRendererFingerprint : Fingerprint(
    strings = listOf("message", "getMessageType(...)", "getTokens(...)", "getChatMessageTags(...)"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lem5;",
    parameters = listOf("Lss5;", "I", "Lfq5;", "Ljava/lang/Integer;", "Lxk6;", "I"),
)

object GiphyRenderingEnabledFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    name = "a",
    returnType = "Z",
    parameters = emptyList(),
    custom = { _, classDef -> classDef.type == "Laqh;" },
)

object EmoteUrlResolverFingerprint : Fingerprint(
    strings = listOf("https://static-cdn.jtvnw.net/emoticons/v2/"),
    accessFlags = listOf(AccessFlags.PUBLIC),
    name = "q",
    returnType = "Lsw0;",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Lrw0;", "Ljava/lang/Float;"),
)

object PickerSectionsFingerprint : Fingerprint(
    strings = listOf("emoteSets"),
    accessFlags = listOf(AccessFlags.PUBLIC),
    name = "e",
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
    custom = { _, classDef -> classDef.type == "Lkrs;" },
)

object EmotePickerCreateFingerprint : Fingerprint(
    strings = listOf("EmotePickerFragment_args", "Argument not found but required: ChannelInfo"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

object MessageInputBindFingerprint : Fingerprint(
    strings = listOf("viewDelegate", "emoteAutoCompleteMapProvider", "animatedEmotesUrlUtil"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    name = "U2",
    returnType = "V",
    parameters = listOf("Lxan;", "Lml00;", "Lvfs;"),
)

object CurrentUserIdFingerprint : Fingerprint(
    strings = listOf("userIdInt"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "I",
    parameters = emptyList(),
    custom = { _, classDef -> classDef.type == "Ljd10;" },
)

object EmoteCardCreateFingerprint : Fingerprint(
    strings = listOf("emoteId", "parcelableEmoteCardTrackingMetadata", "parcelableChatModeMetadata"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    custom = { _, classDef ->
        classDef.type == "Ltv/twitch/android/shared/chat/emotecard/EmoteCardDialogFragment;"
    },
)

object BareAutocompleteOpenFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    name = "K",
    returnType = "Z",
    parameters = listOf("Ljava/lang/CharSequence;"),
    custom = { _, classDef -> classDef.type == "Ltee;" },
)

object BareAutocompleteStartFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    name = "L",
    returnType = "I",
    parameters = listOf("Ljava/lang/CharSequence;"),
    custom = { _, classDef -> classDef.type == "Ltee;" },
)

object ZeroWidthDrawFingerprint : Fingerprint(
    strings = listOf("canvas", "text", "paint"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    name = "draw",
    returnType = "V",
    parameters = listOf(
        "Landroid/graphics/Canvas;", "Ljava/lang/CharSequence;", "I", "I", "F", "I", "I", "I",
        "Landroid/graphics/Paint;",
    ),
    custom = { _, classDef -> classDef.type == "Lkf4;" },
)

object ZeroWidthSizeFingerprint : Fingerprint(
    strings = listOf("paint", "text", "getBounds(...)"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    name = "getSize",
    returnType = "I",
    parameters = listOf(
        "Landroid/graphics/Paint;", "Ljava/lang/CharSequence;", "I", "I",
        "Landroid/graphics/Paint\$FontMetricsInt;",
    ),
    custom = { _, classDef -> classDef.type == "Lkf4;" },
)
