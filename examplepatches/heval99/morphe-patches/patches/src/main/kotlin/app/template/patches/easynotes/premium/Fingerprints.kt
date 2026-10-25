package app.template.patches.easynotes.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

/**
 * Matches [notes.easy.android.mynotes.App.isVip].
 *
 * The master premium gate — 38 call sites across the app (DrawConfig, EasyNoteManager,
 * PhotoEditActivity, BaseActivity, the VipBilling activities, and more). Consumers use it as the
 * outer check, e.g. `if (!App.isVip()) { if (asset.isVip()) { /* downgrade */ } }`, so forcing it
 * true keeps every premium asset unlocked.
 *
 * Resolved by the `"isVip "` string literal (note the trailing space) that is appended to the
 * Crashlytics message in this method's catch block. That literal occurs exactly once in the whole
 * APK, so the fingerprint is stable even though R8 is free to rename the method. It is a
 * concatenation piece, so it is matched with CONTAINS, as patcher 1.8.0 matched raw `strings`
 * (patcher 2.0 compares raw `strings` with the whole constant).
 */
object AppIsVipFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(string("isVip ", StringComparisonType.CONTAINS)),
)

/**
 * Matches [notes.easy.android.mynotes.App.isGoogleVip].
 *
 * Same entitlement expression as [AppIsVipFingerprint] minus the two early-outs; it only drives the
 * "Google VIP" badge in the UI. Best-effort: unlike [AppIsVipFingerprint] it carries no unique
 * string literal, so it is matched on class + method name and is allowed to fail resolution
 * without failing the patch.
 */
object AppIsGoogleVipFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lnotes/easy/android/mynotes/App;" &&
            method.name == "isGoogleVip" &&
            method.returnType == "Z" &&
            method.parameters.isEmpty()
    },
)
