package app.stayfree.patches.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Settings "More" section (`Lxx1;->g(Object, Object, Object)` in 20.16.1, case 0 of a merged
 * Compose lambda class). It draws three `wt9.b` rows: Storage, App Info (summary = the version
 * name, click = `new nn0(sj4, ns0, 16)` → the App Info screen `ud9.g`) and Get Help (click =
 * `nn0` case 17, the HelpScout Beacon). `app_info_title` and `get_help` together are unique to it.
 */
object SettingsMoreSectionFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(
        fieldAccess(definingClass = R_STRING, name = "app_info_title"),
        fieldAccess(definingClass = R_STRING, name = "get_help"),
    ),
)

/**
 * Settings > App Info > Data Privacy content (`Loo6;->d(Object, Object, Object)` in 20.16.1): the
 * "Opt-Out of Data Collection" switch row (`wt9.b` with a Boolean value and an `oh` case 7
 * change lambda) followed by the "Privacy Policy" row.
 */
object DataPrivacyScreenFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(
        fieldAccess(definingClass = R_STRING, name = "data_privacy_opt_out"),
        fieldAccess(definingClass = R_STRING, name = "privacy_policy_title"),
    ),
)

/**
 * `s20.optOut(String installId, boolean optOut)` — the only caller of the SensorTower usage API
 * `AnalyticsService.optout` (`GET analytics/optout?install_id=…&opt_out=…`). Fired by the usage
 * SDK preference listener (`dp9` case 13) whenever `usage-sdk-opt-out` is written, i.e. on
 * every opt-in or opt-out, and it reports the install id to StayFree.
 */
object AnalyticsOptOutRequestFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Z"),
    filters = listOf(methodCall(name = "optout")),
)

/**
 * Data-collection opt-in (`Lhd8;->p(Ljava/lang/String;)V` in 20.16.1): writes
 * `opt_out_data_collection = false`, flips the usage SDK opt-out to false through `qr7.c(false)`
 * (which also fires the `analytics/optout` report) and logs `DATA_COLLECTION_OPT_IN`. Every
 * "Opt-In" button of the "Opt-In for Data Collection" dialogs ends here. The opt-out
 * counterpart, `jd8.M()`, takes no arguments, so the String parameter tells them apart.
 */
object DataCollectionOptInFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("opt_out_data_collection"),
)
