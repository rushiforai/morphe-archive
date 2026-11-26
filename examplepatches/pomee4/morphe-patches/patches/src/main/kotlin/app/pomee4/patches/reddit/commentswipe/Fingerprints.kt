/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.pomee4.patches.reddit.commentswipe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.methodCall
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.newInstance
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * Reddit's main activity. Its onCreate starts watching the window's touch events.
 */
internal object RedditActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/launch/main/MainActivity;",
    name = "onCreate",
    returnType = "V",
)

private const val COMMENT_COMPOSABLES = "Lcom/reddit/comments/elements/usercomment/composables/"

private const val COMMENT_PRESS_LAMBDA =
    "${COMMENT_COMPOSABLES}UserCommentElement\$commentGestureHandling\$1\$3;"

/**
 * The comment row's PointerInputEventHandler. Reddit detects taps, long presses and double taps on
 * comments in it, and creates the press callback below.
 */
internal object CommentGestureHandlerFingerprint : Fingerprint(
    definingClass = COMMENT_COMPOSABLES,
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L", "L"),
    interfaces = listOf("Landroidx/compose/ui/input/pointer/PointerInputEventHandler;"),
    filters = listOf(
        newInstance(COMMENT_PRESS_LAMBDA)
    )
)

/**
 * The press callback of the comment row, called when the finger goes down with its position.
 */
internal object CommentPressFingerprint : Fingerprint(
    definingClass = COMMENT_PRESS_LAMBDA,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L", "J", "L")
)

/**
 * The main constructor of Comment, the one that sets every field.
 */
internal object CommentConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/domain/model/Comment;",
    name = "<init>",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IPUT_BOOLEAN,
            definingClass = "this",
            name = "saved"
        )
    )
)

/**
 * Comment events, by the start of their toString().
 */
internal class CommentEventFingerprint(toStringStart: String) : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string(toStringStart, StringComparisonType.STARTS_WITH)
    )
)

internal val VoteEventFingerprint = CommentEventFingerprint("OnClickVoteEvent(")
internal val ReplyEventFingerprint = CommentEventFingerprint("OnClickCommentReplyEvent(")
internal val SaveEventFingerprint = CommentEventFingerprint("OnClickSaveEvent(")
internal val UnsaveEventFingerprint = CommentEventFingerprint("OnClickUnsaveEvent(")
internal val ShareEventFingerprint = CommentEventFingerprint("OnClickShareEvent(")
internal val CollapseThreadEventFingerprint = CommentEventFingerprint("OnClickCollapseThreadEvent(")
internal val OverflowMenuEventFingerprint = CommentEventFingerprint("OnClickOverflowMenuEvent(")

/**
 * The event of a tap on a comment, which collapses the comment and its replies, or expands it if collapsed.
 */
internal val ClickCommentEventFingerprint = CommentEventFingerprint("OnClickCommentEvent(")

internal const val USER_SETTINGS_SECTION_CLASS =
    "Lcom/reddit/settings/usersettings/UserSettingsSection;"

/**
 * Constructor of the Compose settings row "Privacy policy", which is copied as the comment swipe
 * settings row. The class is shared with other rows of the About section. Reddit 2026.30.0+.
 */
internal object SettingRowConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    filters = listOf(
        string("key_pref_privacy_policy"),
        // Field of the row key.
        fieldAccess(
            opcode = Opcode.IPUT_OBJECT,
            type = "Ljava/lang/String;",
            location = InstructionLocation.MatchAfterImmediately()
        )
    )
)

/**
 * Parameters of the settings row composable: title, on click, modifier, ?, subtitle, leading icon,
 * trailing content, ?, ?, composer, changed, defaults. "L" is any object type.
 */
internal val SETTING_ROW_PARAMETERS = listOf(
    "Ljava/lang/String;",
    "Lkotlin/jvm/functions/Function0;",
    "L",
    "Z",
    "Ljava/lang/String;",
    "Lkotlin/jvm/functions/Function2;",
    "Lkotlin/jvm/functions/Function2;",
    "L",
    "Z",
    "L",
    "I",
    "I"
)

/**
 * Composable content of the rows of the "Privacy policy" row class.
 */
internal object SettingRowContentFingerprint : Fingerprint(
    classFingerprint = SettingRowConstructorFingerprint,
    returnType = "V",
    parameters = listOf("L", "L", "I"),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_STATIC_RANGE,
            returnType = "V",
            parameters = SETTING_ROW_PARAMETERS
        )
    )
)

/**
 * Section of the settings row.
 */
internal object SettingRowSectionFingerprint : Fingerprint(
    classFingerprint = SettingRowConstructorFingerprint,
    isStatic = false,
    returnType = USER_SETTINGS_SECTION_CLASS,
    parameters = listOf()
)

/**
 * Order of the settings row in its section.
 */
internal object SettingRowOrderFingerprint : Fingerprint(
    classFingerprint = SettingRowConstructorFingerprint,
    name = "getOrder",
    returnType = "I",
    parameters = listOf()
)

/**
 * Constructor of the registry of all Compose settings rows and sections (rows, sections).
 */
internal object SettingsRegistryConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf("Ljava/util/Set;", "Ljava/util/Set;"),
    filters = listOf(
        newInstance("Lcom/reddit/settings/usersettings/UserSettingsContributionException;")
    )
)

/**
 * Icon data of the Reddit icon set: (packed size, drawable resource id, auto mirrored).
 */
internal object IconDataToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("Icon(resourceId=")
    )
)

/**
 * Icon composable of the Reddit icon set.
 * (icon, content description, modifier, tint, ?, composer, changed, defaults)
 */
internal class IconComposableFingerprint(iconDataType: String) : Fingerprint(
    isStatic = true,
    returnType = "V",
    parameters = listOf(iconDataType, "Ljava/lang/String;", "L", "J", "Z", "L", "I", "I")
)

/**
 * The section of a post in every Reddit post list, by its toString.
 */
internal object FeedPostSectionToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("FeedPostSection(linkId=", StringComparisonType.STARTS_WITH)
    )
)

/**
 * The main constructor of Link (a post), the one that sets every field.
 */
internal object LinkConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/domain/model/Link;",
    name = "<init>",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IPUT_BOOLEAN,
            definingClass = "this",
            name = "saved"
        )
    )
)

/**
 * The Open comments event of feed posts.
 */
internal object OpenCommentsEventFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/feeds/impl/ui/events/OnClickOpenComments;",
    name = "toString",
    returnType = "Ljava/lang/String;",
)

/**
 * The section of a post preview (a text post shown with a header, a title and a preview of its text),
 * by its toString.
 */
internal object PostPreviewSectionToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("PostPreviewSection(data=", StringComparisonType.STARTS_WITH)
    )
)

/**
 * The section of a conversation post (a text post shown with its top comments), by its toString.
 */
internal object ConversationPostSectionToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("ConversationPostSection(element=", StringComparisonType.STARTS_WITH)
    )
)
