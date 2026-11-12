package app.template.patches.shohay

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Shohay Pregnancy Health (health.shohay.pregnancy) 2.1.1, versionCode 179.
 *
 * Two features, both verified on device against the hand-built v6 .apks:
 *
 * 1) MicroG RE Google Sign-In. The app uses classic Google Sign-In
 *    (GoogleSignInClient). GoogleSignInClient picks a sign-in mode by probing
 *    for the com.google.android.gms package and its signature; MicroG RE
 *    (app.revanced.android.gms) fails both, so the mode must be forced to 4
 *    (normal GOOGLE_SIGN_IN) and the intent action/package redirected to
 *    app.revanced.android.gms. MicroG RE then sends the app's package name
 *    + signature digest to Google for the OAuth token, so a re-signed app
 *    also needs the SPOOFED_PACKAGE_SIGNATURE manifest meta-data (see
 *    ShohayManifestPatch) or Google rejects the token with error 8
 *    (INTERNAL_ERROR). The app never calls getIdToken(), so the ID token
 *    request is dropped as well (replaced by a second requestEmail call).
 *
 * 2) Premium unlock. Premium is a one-time purchase unlocking weekly videos,
 *    but the gate is evaluated LOCALLY: SubscribedWeeksDeriver.derive reads
 *    the local subscription rows and returns DerivedPremiumState
 *    (subscribedWeeks, remainingDays); isPremium = subscribedWeeks not
 *    empty. The patch returns all 42 weeks up front.
 *
 * Every fingerprint pins its defining class and method name. The Google
 * Sign-In classes use the obfuscated single-letter method names (zba, zbc),
 * so pinning is essential -- without it the patcher could match the wrong
 * method in another class.
 */

/**
 * GoogleSignInClient.<clinit> -- the static initializer that caches the
 * sign-in mode in the static field `zba`. Original:
 *   const/4 v0, 0x1
 *   sput v0, GoogleSignInClient->zba:I
 * The patch replaces the 0x1 with 0x4 (normal GOOGLE_SIGN_IN), so zba()
 * never runs the Play-Services-availability / signature check.
 */
object GoogleSignInClientClinitFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;",
    name = "<clinit>",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/android/gms/auth/api/signin/zba;",
            name = "<init>",
            parameters = listOf("[B"),
        ),
    )
)

/**
 * zbm.zba -- builds the sign-in Intent for the normal (mode 4) path.
 * Original:
 *   const-string v1, "com.google.android.gms.auth.GOOGLE_SIGN_IN"
 * The patch replaces the action with the MicroG RE action.
 */
object ZbmZbaFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/auth/api/signin/internal/zbm;",
    name = "zba",
    returnType = "Landroid/content/Intent;",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;",
    ),
    filters = listOf(
        string("com.google.android.gms.auth.GOOGLE_SIGN_IN"),
    )
)

/**
 * SignInHubActivity.zbc -- forwards the sign-in Intent to the Play
 * Services package. Original:
 *   const-string v1, "com.google.android.gms.auth.GOOGLE_SIGN_IN"
 *   ...
 *   const-string p1, "com.google.android.gms"
 *   invoke-virtual {p0, p1}, Intent->setPackage(String)Intent
 * The patch replaces both the action and the package with the MicroG RE
 * values.
 */
object SignInHubActivityZbcFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/auth/api/signin/internal/SignInHubActivity;",
    name = "zbc",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        string("com.google.android.gms.auth.GOOGLE_SIGN_IN"),
        string("com.google.android.gms"),
    )
)

/**
 * SignInHubActivity.onCreate -- dispatches on the incoming Intent action.
 * Original:
 *   const-string v2, "com.google.android.gms.auth.GOOGLE_SIGN_IN"
 * The patch replaces it with the MicroG RE action so the activity routes
 * the MicroG RE sign-in Intent to zbc.
 */
object SignInHubActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/auth/api/signin/internal/SignInHubActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        string("com.google.android.gms.auth.GOOGLE_SIGN_IN"),
    )
)

/**
 * GoogleSignInContract.createIntent -- the app's entry point for sign-in.
 * Builds GoogleSignInOptions with DEFAULT_SIGN_IN + requestIdToken(clientId)
 * + requestEmail(). Original (the three instructions to neutralise):
 *   const-string p2, "237758199076-...apps.googleusercontent.com"
 *   invoke-virtual {p0, p2}, Builder->requestIdToken(String)Builder
 *   move-result-object p0
 * The app never calls getIdToken() and never sends a token to its server,
 * so the ID-token request is pure overhead (and the part MicroG RE chokes
 * on). The patch replaces the requestIdToken call with a second
 * requestEmail() call -- same instruction size, harmless, idempotent.
 */
object GoogleSignInContractCreateIntentFingerprint : Fingerprint(
    definingClass = "Lhealth/shohay/pregnancy/auth/signin/GoogleSignInContract;",
    name = "createIntent",
    returnType = "Landroid/content/Intent;",
    parameters = listOf("Landroid/content/Context;", "Lkotlin/Unit;"),
    filters = listOf(
        methodCall(
            name = "requestIdToken",
            parameters = listOf("Ljava/lang/String;"),
        ),
    )
)

/**
 * SubscribedWeeksDeriver.derive -- the local premium gate. Original
 * filters the subscription rows to non-expired ones and returns
 * DerivedPremiumState(subscribedWeeks, remainingDays); an empty
 * subscribedWeeks means "not premium". The patch inserts an early return
 * at the method entry that returns all 42 weeks with 1000 days remaining,
 * so observeIsPremium is always true and every weekly video unlocks.
 */
object SubscribedWeeksDeriverDeriveFingerprint : Fingerprint(
    definingClass = "Lhealth/shohay/pregnancy/foundation/profile/SubscribedWeeksDeriver;",
    name = "derive",
    returnType = "Lhealth/shohay/pregnancy/foundation/profile/DerivedPremiumState;",
    parameters = listOf("Ljava/util/List;", "Lkotlin/time/Clock;"),
    filters = listOf(
        methodCall(
            name = "toSet",
            parameters = listOf("Ljava/lang/Iterable;"),
        ),
    )
)
