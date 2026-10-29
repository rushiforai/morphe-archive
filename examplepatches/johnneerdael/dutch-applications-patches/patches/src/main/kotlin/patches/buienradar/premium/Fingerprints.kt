package patches.buienradar.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * `enum class PromotionsType { TODAY, SETTINGS }`
 */
internal object PromotionsTypeEnumFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    strings = listOf("TODAY", "SETTINGS")
)

/**
 * One-time WorkManager job that posts the "Buienradar Plus" trial notification,
 * linking to the promotions in Settings. Returns `ListenableWorker.Result`.
 */
internal object TrialNotificationWorkFingerprint : Fingerprint(
    definingClass = "Lnl/rtl/buienradar/data/components/notifications/OneTimeNotificationScheduleWorker;",
    parameters = listOf(),
    strings = listOf("trialChannelId")
)

/**
 * Promotions block state:
 * `data class ShowUI(val list: List<Promotion>, val type: PromotionsType) : PromotionsState`
 *
 * Siblings of the same sealed class: `object Loading` and `object Hide`.
 */
internal object PromotionsShowUiToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("ShowUI(list="),
        string(", type=")
    )
)
