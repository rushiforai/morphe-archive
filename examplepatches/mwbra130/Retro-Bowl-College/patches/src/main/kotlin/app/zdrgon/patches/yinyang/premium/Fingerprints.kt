package app.zdrgon.patches.yinyang.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Enable Premium funnel — Yin Yang Launcher 5.13.1 (189) ────────────
//
// Premium is RevenueCat (entitlement "pro_v1") merged on-device with a
// direct Play Billing ownership query (PlayOwnershipChecker ->
// PlayAnswerSource -> PlayProCheck -> PlayProLogic, Decision:
// USE_REVENUECAT / USE_PLAY / KEEP_CURRENT). SessionManager
// .updateSubscriptionSession folds both into a YSubscription
// (Lwa/log; isPremium / isLifetime / isPlayOnly), and emitSession then
// builds the object every feature gate in the app reads:
//
//   Loc/for;  "SessionFlowData(yUser, ySubscription, isPremiumUser)"
//     fields: for = yUser, new = ySubscription, try = isPremiumUser
//     emitSession computes try = ySubscription.isPremium && app flag.
//
// Feature gates (appearance EditLook clocks/fonts/live wallpapers/
// icons, homescreen, MindfulPause / MindfulTimer / MindSpace, MySpace,
// TPWidgets, PromoCheckWorker, AllAppsList) read ONLY
// SessionFlowData.isPremiumUser — verified by a full field-read census
// across all three dexes of the merged app. But the YSubscription
// object itself is ALSO consumer-visible state: SessionManager stores
// it (field throw) and the paywall / profile surfaces read its
// isPremium and isLifetime fields directly, and the premium ->
// non-premium transition check compares stored subscriptions. The
// v1.52.0 patch pinned only the SessionFlowData constructor, so every
// gate opened but the subscription the app derives everything from
// stayed non-premium / non-lifetime, and on-device the app never
// presented a granted Lifetime (Matsen, 2026-11-03: patched with
// v1.52.0, lifetime NOT granted).
//
// FIX (this file's second fingerprint): pin BOTH objects at their
// single constructors, so every derivation agrees:
//
//   Lwa/log;  "YSubscription(isPremium, latestExpirationDate,
//             managementUrl, willRenew, periodType, billingPeriod,
//             isLifetime, isPlayOnly)"
//     fields: for = isPremium, this = isLifetime
//     Exactly 2 construction sites in the whole app, both inside
//     SessionManager$updateSubscriptionSession$1$1 (the RevenueCat
//     build and the Play-only fallback build), and both pass through
//     this one constructor:
//
//   .method public constructor <init>(ZLjava/util/Date;Landroid/net/Uri;ZLcom/revenuecat/purchases/PeriodType;Ljava/lang/String;ZZ)V
//       invoke-static {p5, "periodType"}, Lkotlin/jvm/internal/break;->this(...)V
//       invoke-direct {p0}, Ljava/lang/Object;-><init>()V
//       iput-boolean p1, p0, Lwa/log;->for:Z      <-- isPremium
//       ...
//       iput-boolean p7, p0, Lwa/log;->this:Z     <-- isLifetime
//       iput-boolean p8, p0, Lwa/log;->with:Z
//       return-void
//
//   Loc/for;  single constructor (verified in classes3.dex smali):
//
//   .method public constructor <init>(Lcom/yinyang/launcher/features/auth/repo/YUser;Lwa/log;Z)V
//       .locals 0
//       invoke-direct {p0}, Ljava/lang/Object;-><init>()V
//       iput-object  p1, p0, Loc/for;->for:...
//       iput-object  p2, p0, Loc/for;->new:Lwa/log;
//       iput-boolean p3, p0, Loc/for;->try:Z     <-- isPremiumUser
//       return-void
//
// Fallback/default instances of both classes built inside feature code
// pass through these same constructors, so forcing the parameters here
// makes EVERY subscription and EVERY session the app ever builds
// report a premium Lifetime user — precisely what a real Lifetime
// ($29.99) buyer's state carries. Neither register is read again after
// its store in either constructor, so the forced values are safe.
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality;
// the dex record for a constructor is PUBLIC | CONSTRUCTOR (0x10001).

/** The single SessionFlowData constructor — the isPremiumUser funnel. */
object SessionFlowDataConstructorFingerprint : Fingerprint(
    definingClass = "Loc/for;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Lcom/yinyang/launcher/features/auth/repo/YUser;",
        "Lwa/log;",
        "Z",
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
)

/** The single YSubscription constructor — the isPremium / isLifetime source. */
object YSubscriptionConstructorFingerprint : Fingerprint(
    definingClass = "Lwa/log;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Z",
        "Ljava/util/Date;",
        "Landroid/net/Uri;",
        "Z",
        "Lcom/revenuecat/purchases/PeriodType;",
        "Ljava/lang/String;",
        "Z",
        "Z",
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
)
