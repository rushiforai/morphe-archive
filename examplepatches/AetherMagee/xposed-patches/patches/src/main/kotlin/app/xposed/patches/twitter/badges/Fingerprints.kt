package app.xposed.patches.twitter.badges

import app.morphe.patcher.Fingerprint
import app.xposed.patches.twitter.Constants.HOOKS_CLASS
import com.android.tools.smali.dexlib2.Opcode

/** TweetHeaderView.setData(name, username, timestamp, badges). */
internal object TweetHeaderSetDataFingerprint : Fingerprint(
    definingClass = "Lcom/twitter/ui/tweet/TweetHeaderView;",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/List;"),
)

/** UsernameBadge.toString(); its class holds the (ImageSpan, String) constructor. */
internal object UsernameBadgeToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("UsernameBadge(span="),
)

/** DefaultAboutProfileRepository's user mapper; other mappers share the string. */
internal object AboutProfileRepositoryFingerprint : Fingerprint(
    strings = listOf("Missing GraphqlUser.screen_name for "),
    custom = { _, classDef ->
        classDef.methods.any { method ->
            method.parameterTypes.map { it.toString() } ==
                listOf("Ljava/lang/String;", "Lkotlin/coroutines/jvm/internal/ContinuationImpl;")
        }
    },
)

/** GraphqlApiImpl constructor; the instance is the app's authenticated GraphQL client. */
internal object GraphqlApiConstructorFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf("apolloService", "transactionEnforcer", "accountSuspensionHandler"),
)

internal object UsernameBadgeClassExtensionFingerprint : Fingerprint(
    definingClass = HOOKS_CLASS,
    name = "usernameBadgeClass",
)

internal object AboutRepositoryClassExtensionFingerprint : Fingerprint(
    definingClass = HOOKS_CLASS,
    name = "aboutRepositoryClass",
)

/** TwitterUser.toString(); names the user id and username fields. */
internal object TwitterUserToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("TwitterUser{userId=", ", username='"),
)

/** ScribeLog's JSON writer; names the items field. The thrift LogEvent serializer shares its keys. */
internal object ScribeLogSerializeFingerprint : Fingerprint(
    strings = listOf("_category_", "format_version", "referring_event", "items", "hardware_information"),
    custom = { _, classDef -> classDef.type.startsWith("Lcom/twitter/analytics/") },
)

/** ScribeLog's event name getter: "android:" + name. */
internal object ScribeLogEventNameFingerprint : Fingerprint(
    classFingerprint = ScribeLogSerializeFingerprint,
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("android:"),
)

/** ScribeItem's JSON writer; names the tweet details and author id fields. */
internal object ScribeItemSerializeFingerprint : Fingerprint(
    strings = listOf("item_type", "promoted_id", "tweet_details", "author_id"),
    custom = { _, classDef -> classDef.type.startsWith("Lcom/twitter/analytics/") },
)

/** The composite event reporter every client event goes through. */
internal object EventDispatchFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/twitter/util/user/UserIdentifier;", "Lcom/twitter/util/eventreporter/f;"),
    custom = { method, classDef ->
        val instructions = method.implementation?.instructions?.toList().orEmpty()
        // The buffering reporter has the same signature but synchronizes instead of fanning out.
        classDef.type.startsWith("Lcom/twitter/util/eventreporter/") &&
            instructions.none { it.opcode == Opcode.MONITOR_ENTER } &&
            instructions.any { it.opcode == Opcode.INVOKE_INTERFACE }
    },
)

internal object TwitterUserFieldsExtensionFingerprint : Fingerprint(
    definingClass = HOOKS_CLASS,
    name = "twitterUserFields",
)

internal object ScribeFieldsExtensionFingerprint : Fingerprint(
    definingClass = HOOKS_CLASS,
    name = "scribeFields",
)
