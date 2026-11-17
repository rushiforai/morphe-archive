package app.zdrgon.patches.moises.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Plan state — Moises 2.141.0 (versionCode 1868) ──────────────────
//
// Moises sells Premium and Pro through RevenueCat (Play Billing
// underneath; RC Paywalls renders the paywall; entitlement IDs are
// the literal strings "premium" and "pro"; Play product IDs are
// server-configured through RC offerings and do not appear in the
// APK). But the app's feature gates do not read RevenueCat: the
// canonical plan state is the backend-issued User object from
// https://api.moises.ai/ (Apollo GraphQL), Moshi-deserialized into
// ai.moises.data.user.model.User. The GraphQL mappers
// (defpackage/lbh in classes.dex, defpackage/mbj in classes3.dex)
// build User$UserSubscription from the response fragments — plan
// derived from the fragment booleans (isPro -> Pro, else isPremium
// -> Premium, else Free) — and every local gate then reads the
// plan back through the UserSubscription getters: switch-maps over
// SubscriptionPlan ordinals (x3d, ged, tyd, wv6, y06, mbh, uad),
// direct plan comparisons (wp7 reacts to plan == Pro, hed reads
// user -> subscription -> plan, ht6 checks == Free), the credit
// pre-check in pq9 (reads getAvailableCredits), and the on-demand
// credit readers mfd / vid (getOnDemandCredits().getRemaining()).
//
// All eight getters below are declared "public final" (0x0011)
// with 1-register bodies in classes.dex (verified 2026-11-16 with
// androguard against the exact 2.141.0 XAPK), so each pin uses
// v0 only. Morphe fingerprints compare access flags by EXACT
// equality.
//
// What the pins cannot do: the plan and the credit balance are
// ALSO server-side account state. Stem separation is executed by
// Moises' cloud (CreateJobMutation with a workflow name — the
// Hi-Fi and drum-part variants are workflow parameters), and the
// server meters the account's real balance per job
// (separation_credits_used_in_current_month). The pins grant the
// Pro client — every local gate, picker and display — not the
// Pro service. Full per-feature table in the workdir RECON.md.

private const val USER_SUBSCRIPTION = "Lai/moises/data/user/model/User\$UserSubscription;"
private const val ON_DEMAND_CREDITS = "Lai/moises/data/user/model/User\$UserSubscription\$OnDemandCredits;"
private const val SUBSCRIPTION_PLAN = "Lai/moises/data/user/model/User\$SubscriptionPlan;"

/** isPro()Z on the subscription — pinned true. */
object IsProFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = USER_SUBSCRIPTION,
    name = "isPro"
)

/** isPremium()Z on the subscription — pinned true. */
object IsPremiumFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = USER_SUBSCRIPTION,
    name = "isPremium"
)

/** isAccountHold()Z on the subscription — pinned false. */
object IsAccountHoldFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = USER_SUBSCRIPTION,
    name = "isAccountHold"
)

/** getSubscriptionPlan() — pinned to the Pro enum constant. */
object SubscriptionPlanFingerprint : Fingerprint(
    returnType = SUBSCRIPTION_PLAN,
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = USER_SUBSCRIPTION,
    name = "getSubscriptionPlan"
)

/** getAvailableCredits() — pinned to Integer(999999); defeats the local credit pre-check in pq9. */
object AvailableCreditsFingerprint : Fingerprint(
    returnType = "Ljava/lang/Integer;",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = USER_SUBSCRIPTION,
    name = "getAvailableCredits"
)

/** getMonthlyUsage() — pinned to Integer(0), so usage displays read as a fresh month. */
object MonthlyUsageFingerprint : Fingerprint(
    returnType = "Ljava/lang/Integer;",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = USER_SUBSCRIPTION,
    name = "getMonthlyUsage"
)

/** OnDemandCredits.getRemaining()I — pinned to 999999 (read by mfd / vid). */
object OnDemandRemainingFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = ON_DEMAND_CREDITS,
    name = "getRemaining"
)

/** OnDemandCredits.getTotal()I — pinned to 999999, consistent with getRemaining. */
object OnDemandTotalFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = ON_DEMAND_CREDITS,
    name = "getTotal"
)

// ── PairIP signature check — Moises 2.141.0 ─────────────────────────
//
// This build carries the FULL PairIP (VMRunner + VmDecryptor +
// libpairipcore.so + StartupLauncher), not ContentCam's light
// licensecheck SDK: there is no com.pairip.licensecheck package
// and no LICENSED terminal state. The Java-layer protection is
// Lcom/pairip/SignatureCheck; (top-level package in this variant):
// the manifest Application (Lcom/pairip/application/Application;)
// calls verifyIntegrity from attachBaseContext, before super. It
// digests the app's signing certificate and compares it against
// static expected values; a mismatch throws
// SignatureTamperedException. Its success path is falling off the
// end of the method, so pinning the entry to return-void IS the
// genuine pass state. verifyIntegrity is "public static" (0x0009),
// 3 registers, and attachBaseContext is its only caller (verified
// 2026-11-16). The native VM startup program (StartupLauncher ->
// VMRunner.invoke, called from MainApplication.<clinit> and
// CoreComponentFactory.<clinit>) is a separate layer this pin
// does not touch; whether it blocks re-signed builds is an
// on-device question (DiskWala precedent), disclosed in RECON.md.

/** The PairIP Java signature check. Pinning it to return-void is its genuine pass state. */
object VerifyIntegrityFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifyIntegrity"
)

// ── Telemetry — Moises 2.141.0 ──────────────────────────────────────
//
// Census verified 2026-11-16 across all four base dexes (the
// three XAPK splits are config-only and carry no code):
//
// Singular is the one attribution SDK whose public API survived
// R8 with real names, and it is the one the app actually drives:
// defpackage/w1g builds a SingularConfig (with an SDID accessor)
// and calls Singular.init; defpackage/sw dispatches
// Singular.event / eventJSON / setCustomUserId /
// setFCMDeviceToken. All Singular methods below are
// "public static" (0x0009); the (String, Object...) event
// overload is 0x0089 (public static varargs). Descriptors
// verified with androguard.
//
// Firebase Analytics + Crashlytics are present but expose no
// pin-able event surface in this build (FirebaseAnalytics has no
// logEvent here — same as Luminar), so they are killed with the
// vendor manifest collection flags instead (see the patch file).
//
// Documented residuals (see RECON.md §5): AppsFlyer (262 classes)
// and PostHog (118 classes) are in the dexes, but neither public
// entry class (AppsFlyerLib / PostHog) is DEFINED in any dex —
// both were consumed with their public APIs renamed — and no SDK
// capture call sites exist in app code, so there is no verifiable
// funnel to pin. RudderStack and Segment have endpoint/name
// strings only, zero SDK classes. Customer.io is the push
// channel (app function). Chucker is a local HTTP inspector.

private const val SINGULAR = "Lcom/singular/sdk/Singular;"

/** Singular.init(Context, SingularConfig)Z — pinned to false so the SDK never starts. */
object SingularInitConfigFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Lcom/singular/sdk/SingularConfig;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = SINGULAR,
    name = "init"
)

/** Singular.init(Context, String, String)Z — pinned to false. */
object SingularInitKeysFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = SINGULAR,
    name = "init"
)

/** Singular.event(String)Z — pinned to false. */
object SingularEventFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = SINGULAR,
    name = "event"
)

/** Singular.event(String, String)Z — pinned to false. */
object SingularEventNamedFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = SINGULAR,
    name = "event"
)

/** Singular.event(String, Object...)Z — pinned to false (varargs overload). */
object SingularEventVarargsFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "[Ljava/lang/Object;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.VARARGS),
    definingClass = SINGULAR,
    name = "event"
)

/** Singular.eventJSON(String, JSONObject)Z — pinned to false. */
object SingularEventJsonFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "Lorg/json/JSONObject;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = SINGULAR,
    name = "eventJSON"
)

/** Singular.setCustomUserId(String)V — pinned to return immediately. */
object SingularSetCustomUserIdFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = SINGULAR,
    name = "setCustomUserId"
)

/** Singular.unsetCustomUserId()V — pinned to return immediately. */
object SingularUnsetCustomUserIdFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = SINGULAR,
    name = "unsetCustomUserId"
)
