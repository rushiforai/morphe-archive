package app.template.patches.easynotes.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

/**
 * Matches [notes.easy.android.mynotes.App.isAdFree].
 *
 * The single ad gate in this app. `utils/AdManager` checks it before loading the
 * "notes_edit_banner" unit and before showing its second placement, and `App$AppOpenAdManager`
 * checks it before showing the app-open ad. Forcing it true skips ad loading entirely.
 *
 * Resolved by the `"adshow_switch"` Firebase Remote Config key it reads as its last fallback
 * (`isReferralVip() || getHasBuyed() || getHasSubscribe() || RemoteConfig.getLong(...) != 0`).
 * That literal occurs exactly once in the whole APK, so the fingerprint survives R8 renaming.
 */
object AppIsAdFreeFingerprint : Fingerprint(
    strings = listOf(string("adshow_switch", StringComparisonType.CONTAINS)),
    returnType = "Z",
    parameters = emptyList(),
)
