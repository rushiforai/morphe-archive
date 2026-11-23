package app.template.patches.fotmob.spoiler

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * FotMob's push handler (manifest-named service, Firebase override): every FCM data message,
 * including goal, card and result alerts, enters here before FotMob copies the data map into the
 * Bundle its notification pipeline reads ("m" match id, "lid"/"plid" league ids, "hs"/"as" score,
 * "status" the MatchStatus name).
 */
internal object PushMessageReceivedFingerprint : Fingerprint(
    definingClass = "Lcom/fotmob/android/feature/notification/push/PushMessagingService;",
    name = "onMessageReceived",
    returnType = "V",
    parameters = listOf("Lcom/google/firebase/messaging/RemoteMessage;"),
)

/** The aggregate score text of the main match row ("( 2 - 3 )" with thin spaces and a direction mark). */
internal const val AGGREGATE_FORMAT = "( %d %s- %d )"

/**
 * The main match row's live binder (242: n58.A(l58)V): it shows the aggregate score of a two-legged
 * tie when the match has one, then hands the score to the row's score setter. The exact aggregate
 * format is its only string (the event row's "%s ( %d %s- %d )" differs).
 */
internal object MatchRowAggregateFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(string(AGGREGATE_FORMAT)),
)

/**
 * The match share text (242: foc.e(Activity, Match)String): "Home 2 - 1 Away #FotMob" once the match
 * has started, else the kickoff date and time. The Match parameter plus the hashtag keeps out the
 * event share text (Match, MatchFactEvent) that ends with the same tag.
 */
internal object MatchShareTextFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/app/Activity;", "Lcom/fotmob/models/Match;"),
    strings = listOf(" #FotMob"),
)
