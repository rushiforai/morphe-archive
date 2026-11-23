package app.template.patches.xmind

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.newInstance
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Fingerprints for the Xmind subscription / entitlement model.
 *
 * All classes are R8-obfuscated in this build, so the obfuscated names below
 * are intentional. The companion Java names are noted in comments.
 *
 * Model recap (from decompiling the original APK):
 *  - rm.x    = Subscription(plan, status, expireTime, gateway)
 *  - rm.j0   = User profile, holds the Subscription in field `i`
 *  - rm.b0   = TeamProfile, holds plan (rm.y) and status (rm.a0)
 *  - gm.a    = EditorEntitlements(subscribed, premium, collaborate, sheetLimitBypass)
 *  - gm.h    = Plan tier enum: s=Free, t=Pro, u=Premium
 *  - im.e3   = Central helper that computes EditorEntitlements
 */

/** Subscription.isActive(): status is "sub"/"trialing" and not expired. */
object SubscriptionIsActiveFingerprint : Fingerprint(
    definingClass = "Lrm/x;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)

/** User.isPro(): active subscription with a plan above "Pro". */
object UserIsProFingerprint : Fingerprint(
    definingClass = "Lrm/j0;",
    name = "e",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)

/** User.isSubscribed(): active subscription on any paid plan. */
object UserIsSubscribedFingerprint : Fingerprint(
    definingClass = "Lrm/j0;",
    name = "f",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)

/** TeamProfile status is trialing/subscribed (isSubscribed on the team model). */
object TeamProfileIsActiveFingerprint : Fingerprint(
    definingClass = "La/a;",
    name = "Y",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Lrm/b0;"),
)

/** TeamProfile status active and plan above Personal (isPremium on the team model). */
object TeamProfileIsPremiumFingerprint : Fingerprint(
    definingClass = "La/a;",
    name = "X",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Lrm/b0;"),
)

/** im.e3.b(): computes the EditorEntitlements object used by the whole UI. */
object EditorEntitlementsFingerprint : Fingerprint(
    definingClass = "Lim/e3;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lgm/a;",
    parameters = emptyList(),
)

/** d8.a.I(): maps a Subscription to the Free/Pro/Premium plan tier. */
object PlanTierFingerprint : Fingerprint(
    definingClass = "Ld8/a;",
    name = "I",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Lgm/h;",
    parameters = listOf("Lrm/x;"),
)

/** gm.n.g(): builds the account screen plan label, e.g. "Free Plan". */
object PlanLabelFingerprint : Fingerprint(
    definingClass = "Lgm/n;",
    name = "g",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Lrm/b0;", "Ld1/o;"),
)

/**
 * eh.k0.P(): builds the subscription label from the raw user subscription.
 * This is a second, separate label source on the account screen and can still
 * return "Free Plan" even after gm.n.g() has been overridden.
 */
object SubscriptionLabelFingerprint : Fingerprint(
    definingClass = "Leh/k0;",
    name = "P",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Lrm/x;"),
)

/**
 * mn.j.b(): builds the account profile header, including the plan badge.
 * The `new-instance Lmn/k;` instruction is the single convergence point
 * after every badge-selection branch, so it is used as the patch anchor.
 */
object AccountBadgeFingerprint : Fingerprint(
    definingClass = "Lmn/j;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lmn/d;",
        "Lsh/a;",
        "Lp1/r;",
        "Lsh/a;",
        "F",
        "Ld1/o;",
        "I",
        "I",
    ),
    filters = listOf(newInstance("Lmn/k;")),
)

/**
 * PairIP entry point, called from the Application's attachBaseContext() and
 * from LicenseContentProvider. On a re-signed APK a failed license check
 * schedules an app shutdown and shows an error activity, so skip it.
 */
object PairIpLicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)
