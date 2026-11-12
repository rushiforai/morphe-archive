package app.template.patches.scores365.spoiler

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal const val GAME_OBJ = "Lcom/scores365/entitys/GameObj;"
internal const val GCM_NOTIFICATION = "Lcom/scores365/entitys/GCMNotificationObj;"
internal const val ABNORMAL_TEXTS = "Lcom/scores365/entitys/extensions/AbnormalGameStatusTexts;"
internal const val GAME_CENTER_ACTIVITY = "Lcom/scores365/gameCenter/GameCenterBaseActivity;"

/** The bell log line both toolbar builders share (match page and entity page). */
private const val BELL_ERROR = "Error adding notification bell"

/**
 * The notification manager's per-notification handler (15.0.0: com.scores365.c.w): every push
 * that FirebaseMessageService turns into a GCMNotificationObj ends up here before it is built and
 * posted. The "IAA silencing push notification" log line only exists in this handler.
 */
internal object NotificationHandlerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(GCM_NOTIFICATION, "Ljava/lang/Boolean;"),
    filters = listOf(string("IAA silencing push notification", StringComparisonType.STARTS_WITH)),
)

/**
 * GameCenterBaseActivity's toolbar builder (15.0.0: y0): it empties the given group and adds the
 * follow bell ImageView to it; the catch block logs [BELL_ERROR].
 */
internal object MatchToolbarFingerprint : Fingerprint(
    definingClass = GAME_CENTER_ACTIVITY,
    returnType = "V",
    parameters = listOf("Landroid/view/ViewGroup;"),
    filters = listOf(string(BELL_ERROR, StringComparisonType.STARTS_WITH)),
)

/**
 * The entity page header observer (15.0.0: oug.onChanged, an R8-merged lambda of the
 * "SingleEntityMainPage" fragment): one of its cases adds the follow bell to the header's
 * LinearLayoutCompat; the catch block logs [BELL_ERROR].
 */
internal object EntityHeaderFingerprint : Fingerprint(
    name = "onChanged",
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("SingleEntityMainPage"),
    filters = listOf(string(BELL_ERROR, StringComparisonType.STARTS_WITH)),
)

/**
 * The list rows' score formatter (15.0.0: static n87.c): (GameObj, boolean, AbnormalGameStatusTexts)
 * -> the kickoff time before the match, else "home - away".
 */
internal object RowScoreFormatterFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(GAME_OBJ, "Z", ABNORMAL_TEXTS),
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)
