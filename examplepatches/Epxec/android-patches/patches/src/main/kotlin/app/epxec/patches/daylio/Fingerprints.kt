package app.epxec.patches.daylio.Fingerprints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// ─────────────────────────────────────────────────────────────────────────────
// Fingerprints for the premium-status class (f0 / net.daylio.modules.purchases.f0)
// Identified via the "p_be_premium_lost" analytics string in kf().
// ─────────────────────────────────────────────────────────────────────────────

// Anchors on the kf() method which contains "p_be_premium_lost".
private object PremiumStatusClassFingerprint : Fingerprint(
    strings = listOf("p_be_premium_lost")
)

// Matches f0.<init>() — the constructor of the premium manager.
// We inject a write of IS_PRO_VERSION_PURCHASED = true here so all direct
// SharedPreferences readers (BackupActivity.Fl, MoodIconPackPreviewActivity.k4,
// MoodChartDetailActivity.Kk, etc.) see "true" without us needing to patch each one.
// Identified by: constructor in the same class as "p_be_premium_lost", no params, void.
// Access flags must include CONSTRUCTOR (0x10000) in addition to PUBLIC (0x1) — the
// patcher does an exact accessFlags match, so PUBLIC alone (0x1) won't match 0x10001.
// Injection is at index 1 (after the super <init> at index 0) to avoid VerifyError.
object DaylioPremiumInitFingerprint : Fingerprint(
    
    classFingerprint = PremiumStatusClassFingerprint,
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = "Ljava/util/HashSet;", name = "<init>")
    )
)

// Matches k4() — the single premium gate used everywhere in the app.
// Reads SharedPreferences key "IS_PRO_VERSION_PURCHASED" (ri.c.E) and returns it.
object DaylioPremiumStatusFingerprint : Fingerprint(
    classFingerprint = PremiumStatusClassFingerprint,
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf(),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = "Lri/c;", name = "E"),
        methodCall(definingClass = "Lri/c;", name = "l"),
        methodCall(definingClass = "Ljava/lang/Boolean;", name = "booleanValue")
    )
)

// Matches kf(fl.h) — "onPremiumLost" handler that sets IS_PRO_VERSION_PURCHASED = false.
// Skipping this prevents the premium flag from being revoked by billing validation.
object DaylioPreventPremiumRevokeFingerprint : Fingerprint(
    classFingerprint = PremiumStatusClassFingerprint,
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Lfl/h;"),
    strings = listOf("p_be_premium_lost")
)

// ─────────────────────────────────────────────────────────────────────────────
// Fingerprints for the subscription-expiry class (k0 / net.daylio.modules.purchases.k0)
// This is a SEPARATE class from f0. It manages the IS_PREMIUM_EXPIRED flag which
// controls the "Oh no, your premium has expired!" full-screen dialog shown by
// OverviewActivity -> Gk() -> m5.i() -> SubscriptionPremiumExpiredOrCancelledActivity.
// Anchored via "p_be_premium_expired" in S2().
// ─────────────────────────────────────────────────────────────────────────────

// Anchors on S2() which fires the "p_be_premium_expired" analytics event and
// sets IS_PREMIUM_EXPIRED = true. This is the only class with this string.
private object PremiumExpiredClassFingerprint : Fingerprint(
    strings = listOf("p_be_premium_expired")
)

// Matches Lh() — reads IS_PREMIUM_EXPIRED (ri.c.e1) and returns it.
// When true, OverviewActivity shows the "oh no" expired dialog.
// Patch: always return false so the expired screen never appears.
object DaylioPreventExpiredDialogFingerprint : Fingerprint(
    classFingerprint = PremiumExpiredClassFingerprint,
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf(),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = "Lri/c;", name = "e1"),
        methodCall(definingClass = "Lri/c;", name = "l"),
        methodCall(definingClass = "Ljava/lang/Boolean;", name = "booleanValue")
    )
)

// Matches S2() — sets IS_PREMIUM_EXPIRED = true when subscription expires.
// No-op this to prevent the flag from ever being written as true.
// Identified by: contains "p_be_premium_expired" string, returns void, no parameters.
object DaylioPreventExpiredFlagSetFingerprint : Fingerprint(
    classFingerprint = PremiumExpiredClassFingerprint,
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf(),
    strings = listOf("p_be_premium_expired")
)
