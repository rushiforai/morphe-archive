package app.xposed.patches.twitter.badges

import app.morphe.patcher.Fingerprint
import app.xposed.patches.twitter.util.Abstract
import app.xposed.patches.twitter.util.RegisterFlow
import app.xposed.patches.twitter.util.instructionList
import app.xposed.patches.twitter.util.isInterface
import app.xposed.patches.twitter.util.methodRef
import com.android.tools.smali.dexlib2.Opcode

internal const val MODIFIER = "Landroidx/compose/ui/Modifier;"
internal const val COMPOSER = "Landroidx/compose/runtime/Composer;"
internal const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
internal const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"
internal const val STRING = "Ljava/lang/String;"
internal const val OBJECT = "Ljava/lang/Object;"
internal const val LAYOUT_PACKAGE = "Landroidx/compose/foundation/layout/"
internal const val LOG_EVENT = "Lcom/x/thrift/clientapp/gen/LogEvent;"

/** XApplication.onCreate. */
internal object ApplicationOnCreateFingerprint : Fingerprint(
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
    custom = { _, classDef -> classDef.superclass == "Landroid/app/Application;" },
)

/** A GraphqlApiImpl method; its instances are the app's authenticated GraphQL clients. */
internal object GraphqlApiFingerprint : Fingerprint(
    strings = listOf("GraphqlApiImpl-unresolved-"),
)

/** The about-profile repository's user mapper; other mappers share the string. */
internal object AboutRepositoryFingerprint : Fingerprint(
    strings = listOf("Missing GraphqlUser.screen_name for "),
    custom = { _, classDef ->
        classDef.methods.any { method ->
            method.parameterTypes.map { it.toString() } ==
                listOf(STRING, "Lkotlin/coroutines/jvm/internal/ContinuationImpl;")
        }
    },
)

internal object UserWithAboutToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("UserWithProfileAboutMetadata(user="),
)

internal object AboutMetadataToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("ProfileAboutMetadata(basedInCountry="),
)

internal object AffiliateDataToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("AffiliateData(url="),
)

internal object MinimalUserToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("MinimalUser(id="),
)

/** The Affiliate item of a name's badge list. */
internal object AffiliateBadgeToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("Affiliate(contentDescription="),
)

internal object AvailablePostToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("AvailablePost(entryId="),
)

internal object CanonicalPostToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("CanonicalPost(id="),
)

internal object ProfileUserToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("ProfileUser(id="),
)

internal object RelationshipCountsToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("RelationshipCounts(following="),
)

/** The signed-in account's relationship to a user, from the timeline's relationship_perspectives. */
internal object FriendshipToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("Friendship(isFollowedByMe="),
)

/** A user item of a URT timeline: Followers, Following, people search, Who to follow. */
internal object TimelineUserStateToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("TimelineUserState(user="),
)

/** A user item of a List's members timeline, wrapping a [TimelineUserStateToStringFingerprint] item. */
internal object ListMembersUserStateToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("ListMembersTimelineUserState(timelineUserState="),
)

/** A user's highlighted label, such as the badge of the organization it is affiliated with. */
internal object UserLabelToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("UserLabel(type="),
)

/** A label's link to a web page. */
internal object ExternalUrlToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("ExternalUrl(url="),
)

/** A label's deep link. */
internal object DeeplinkToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("Deeplink(url="),
)

internal object PostEntityListToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("PostEntityList(mentions="),
)

internal object UrlEntityToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("UrlEntity(displayUrl="),
)

/** The code point range of a post's text that X shows, without reply mentions and media links. */
internal object DisplayTextRangeToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("DisplayTextRange(startIdx="),
)

/** A photo of a post. */
internal object MediaContentImageToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("MediaContentImage(mediaId="),
)

/** An entry of a post's action bar, with its count. */
internal object InlineActionEntryToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("InlineActionEntry(actionType="),
)

/** The composer's arguments for quoting a post. */
internal object QuoteAPostToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("QuoteAPost(quotedPostId="),
)

/** Code that reads X's reply extra from a share intent. */
internal object ReplyExtraFingerprint : Fingerprint(
    strings = listOf("replied_tweet_id"),
)

/**
 * Candidates for the composer's handling of share intents (SEND and SEND_MULTIPLE). X 12.40 reads
 * the reply extra in the handler itself, 12.41 in a helper it calls.
 */
internal object ComposerShareIntentFingerprint : Fingerprint(
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("android.intent.action.SEND_MULTIPLE"),
)

/** The client event reporter every LogEvent goes through. */
internal object EventReporterFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(LOG_EVENT, "Z"),
    strings = listOf("Skipping event with empty event name"),
)

/** The User interface's default handle(): "@" + screenName(). */
internal object UserHandleFingerprint : Fingerprint(
    returnType = STRING,
    parameters = listOf(),
    strings = listOf("@"),
    custom = { method, classDef ->
        val first = method.instructionList.firstOrNull()
        classDef.isInterface() &&
            first?.opcode == Opcode.INVOKE_INTERFACE &&
            first.methodRef!!.let { it.definingClass == classDef.type && it.parameterTypes.isEmpty() && it.returnType == STRING } &&
            classDef.methods.any { it.name == "getId" && it.parameterTypes.isEmpty() }
    },
)

/** CanvasDrawScope.DrawParams. */
internal object DrawParamsToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("DrawParams(density="),
)

/** Modifier.drawBehind, drawWithContent and drawWithCache. */
internal object DrawModifierFactoryFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/ui/draw/",
    isStatic = true,
    returnType = MODIFIER,
    parameters = listOf(MODIFIER, FUNCTION1),
)

/** Modifier.Companion, the empty modifier. */
internal object EmptyModifierToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = STRING,
    parameters = listOf(),
    strings = listOf("Modifier"),
    custom = { _, classDef -> MODIFIER in classDef.interfaces },
)

/**
 * Modifier.size(width, height), which is SizeElement(minWidth = width, minHeight = height,
 * maxWidth = width, maxHeight = height, enforceIncoming = true). requiredSize passes false.
 */
internal object SizeModifierFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/foundation/layout/",
    isStatic = true,
    returnType = MODIFIER,
    parameters = listOf(MODIFIER, "F", "F"),
    custom = { method, _ ->
        val flow = RegisterFlow(method)
        val width = setOf(Abstract.Parameter(1))
        val height = setOf(Abstract.Parameter(2))
        val calls = flow.instructions.indices.filter { i ->
            flow.instructions[i].methodRef?.let {
                it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("F", "F", "F", "F", "Z")
            } == true
        }
        calls.size == 1 && flow.argumentsAt(calls[0]) == listOf(width, height, width, height, setOf(Abstract.Literal(1)))
    },
)

/**
 * Modifier.clickable with default arguments: (modifier, enabled, onClickLabel, role,
 * interactionSource, onClick, defaults mask). It builds ClickableElement(interactionSource,
 * indicationNodeFactory, useLocalIndication, enabled, onClickLabel, role, onClick).
 */
internal object ClickableModifierFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/foundation/",
    isStatic = true,
    returnType = MODIFIER,
    parameters = listOf(MODIFIER, "Z", STRING, "L", "L", FUNCTION0, "I"),
    custom = { method, _ ->
        method.instructionList.any { instruction ->
            (instruction.opcode == Opcode.INVOKE_DIRECT || instruction.opcode == Opcode.INVOKE_DIRECT_RANGE) && instruction.methodRef!!.let {
                val types = it.parameterTypes.map(CharSequence::toString)
                it.name == "<init>" && types.size == 7 && types[2] == "Z" && types[3] == "Z" &&
                    types[4] == STRING && types[6] == FUNCTION0
            }
        }
    },
)

/** ParcelableSnapshotMutableIntState. */
internal object MutableIntStateToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("MutableIntState(value="),
)
