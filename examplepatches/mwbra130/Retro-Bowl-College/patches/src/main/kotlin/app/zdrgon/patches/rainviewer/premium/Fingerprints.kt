package app.zdrgon.patches.rainviewer.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// RainViewer 8.4.1 (44084), classes3.dex — both methods verified against the
// real dex on 2026-11-02. The premium status holder is Ltw7; and the status
// enum is Lhw7; (FREE, V1, "pro" V2, INTERSTITIAL, REFERRAL, NO_ADS,
// ESSENTIAL). The PRO value is the static field Lhw7;->e:Lhw7;.
//
// Morphe compares access flags by exact equality, and Kotlin suspend
// functions in this build are "public final" — both flags are required.

/**
 * Ltw7;->g(ZZLft0;)Ljava/lang/Enum; — the server status recompute. It GETs
 * mobile/purchases/android/actual, maps the response to a UserPremiumStatus
 * and, when non-null, that result wins the status sync. The
 * "premium_expired_work" string is scheduled from this method only, for real
 * subscribers' expiry.
 */
internal object ServerPremiumStatusFingerprint : Fingerprint(
    definingClass = "Ltw7;",
    name = "g",
    returnType = "Ljava/lang/Enum;",
    parameters = listOf("Z", "Z", "Lft0;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    strings = listOf("premium_expired_work"),
)

/**
 * Ltw7;->e(Lft0;)Ljava/lang/Enum; — the local status path. It computes the
 * status from Play Billing, then persists it: clears the "premium" and
 * "premium_v1" prefs, sets one of them from the status ordinal (1 ->
 * premium_v1, 2 -> premium) and returns the status. Those prefs are what the
 * widgets and PremiumFeaturesContentProvider read.
 */
internal object LocalPremiumStatusFingerprint : Fingerprint(
    definingClass = "Ltw7;",
    name = "e",
    returnType = "Ljava/lang/Enum;",
    parameters = listOf("Lft0;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    strings = listOf("premium_v1", "premium"),
)

/**
 * Leh5;->j(Lft0;Lhw7;Z)Ljava/lang/Object; — the single chokepoint every
 * premium status application funnels through: the tw7 sync (via h), and a
 * prefs-restore collector (Lv24;) that re-applies the persisted status int
 * straight into j, bypassing tw7 entirely. j logs the applied status and
 * pushes it into the StateFlows all feature gates read. Overwriting its
 * status parameter at entry pins every path at once.
 *
 * Register math verified from the dex: j has 13 registers; parameters sit
 * in the top four (v9 = this, v10 = continuation, v11 = status, v12 =
 * boolean), so the status register is registerCount - 2.
 */
internal object FeatureStatusApplyFingerprint : Fingerprint(
    definingClass = "Leh5;",
    name = "j",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lft0;", "Lhw7;", "Z"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    strings = listOf("UserPremiumStatus is now "),
)

/**
 * Leh5;->h(Lft0;Lhw7;Z)Ljava/lang/Object; — the guarded entry the tw7
 * sync uses: it skips j entirely when the incoming status equals the
 * current one, so pin h's status parameter too (8 registers, status at
 * registerCount - 2 = v6) to guarantee the pinned value always reaches j.
 */
internal object FeatureStatusUpdateFingerprint : Fingerprint(
    definingClass = "Leh5;",
    name = "h",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lft0;", "Lhw7;", "Z"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
)
