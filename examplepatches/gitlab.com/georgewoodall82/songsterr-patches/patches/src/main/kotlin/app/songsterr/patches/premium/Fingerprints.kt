package app.songsterr.patches.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Fingerprints for Songsterr 7.1.3 (versionCode 2012282384).
 *
 * Verified with androguard against base.apk inside:
 * com.songsterr_7.1.3-2012282384_4arch_6dpi_24lang_*.apkm
 *
 * Class name reality in 7.1.3:
 * - Lcom/songsterr/domain/json/User; is stable (server model).
 * - Lcom/songsterr/CrackChecker; is stable.
 * - Lcom/songsterr/iap/f; is the obfuscated `Premium` class.
 *   Its single-letter methods are (7.1.3 only):
 *     b()Lf2;  = premium-tier getter (returns Le2 enum: e=free, u=SRA, t=PLUS, v=PRO, w=unknown)
 *     g()Ljava/lang/Boolean; = has owned IAP products (Set non-empty OR manual sub)
 *     h()Ljava/lang/Boolean; = server hasPlus (User.getHasPlus)
 *     i()Ljava/lang/Boolean; = server hasSRA (User.getHasSRA)
 *     j()Ljava/lang/Boolean; = has owned IAP products (f() Set non-empty OR manual sub)
 *     k()Z = has manual subscription (BRAINTREE/STRIPE/PAYPAL)
 *     l()Z = has Google Play subscription (GOOGLE_PLAY && j()==TRUE)
 *     f()Ljava/util/Set; = owned product IDs
 *
 * Single-letter names WILL change between releases. The fingerprints below pin
 * `definingClass` + `name` for 7.1.3 on purpose (plus stable string/method
 * filters as sanity checks), and Constants.kt marks newer versions as
 * experimental. To retarget a new version: dump strings/dex (see README),
 * find the new `Premium` class in `com.songsterr.iap.*` that calls
 * `User.getHasPlus/getHasSRA/getHasPro`, and update definingClass/names.
 */

// --- Server user model (stable names) ---

object UserHasPlusFingerprint : Fingerprint(
    definingClass = "Lcom/songsterr/domain/json/User;",
    name = "getHasPlus",
    returnType = "Z",
    parameters = listOf(),
    isStatic = false,
)

object UserHasProFingerprint : Fingerprint(
    definingClass = "Lcom/songsterr/domain/json/User;",
    name = "getHasPro",
    returnType = "Z",
    parameters = listOf(),
    isStatic = false,
)

object UserHasSraFingerprint : Fingerprint(
    definingClass = "Lcom/songsterr/domain/json/User;",
    name = "getHasSRA",
    returnType = "Z",
    parameters = listOf(),
    isStatic = false,
)

// --- Tamper detection (stable class, obfuscated method pinned to 7.1.3) ---

object CrackCheckerFingerprint : Fingerprint(
    definingClass = "Lcom/songsterr/CrackChecker;",
    name = "a",
    returnType = "Z",
    parameters = listOf(),
    isStatic = false,
    filters = listOf(
        methodCall(
            definingClass = "Lcom/songsterr/CrackChecker;",
            name = "getFirstPackageSignatureHashCode",
        ),
        literal(1046298818),
    ),
)

// --- Premium (obfuscated) ---

// h(): server hasPlus.
object PremiumHasPlusFingerprint : Fingerprint(
    definingClass = "Lcom/songsterr/iap/f;",
    name = "h",
    returnType = "Ljava/lang/Boolean;",
    parameters = listOf(),
    isStatic = false,
    filters = listOf(
        methodCall(
            definingClass = "Lcom/songsterr/domain/json/User;",
            name = "getHasPlus",
        ),
    ),
)

// i(): server hasSRA.
object PremiumHasSraFingerprint : Fingerprint(
    definingClass = "Lcom/songsterr/iap/f;",
    name = "i",
    returnType = "Ljava/lang/Boolean;",
    parameters = listOf(),
    isStatic = false,
    filters = listOf(
        methodCall(
            definingClass = "Lcom/songsterr/domain/json/User;",
            name = "getHasSRA",
        ),
    ),
)

// g(): owned-products OR manual-sub check (field-backed Set path).
object PremiumOwnedGFingerprint : Fingerprint(
    definingClass = "Lcom/songsterr/iap/f;",
    name = "g",
    returnType = "Ljava/lang/Boolean;",
    parameters = listOf(),
    isStatic = false,
    filters = listOf(
        methodCall(name = "isEmpty"),
    ),
)

// j(): owned-products OR manual-sub check (f() Set path).
object PremiumOwnedJFingerprint : Fingerprint(
    definingClass = "Lcom/songsterr/iap/f;",
    name = "j",
    returnType = "Ljava/lang/Boolean;",
    parameters = listOf(),
    isStatic = false,
    filters = listOf(
        methodCall(name = "isEmpty"),
    ),
)

// k(): BRAINTREE/STRIPE/PAYPAL manual subscription.
object PremiumManualSubFingerprint : Fingerprint(
    definingClass = "Lcom/songsterr/iap/f;",
    name = "k",
    returnType = "Z",
    parameters = listOf(),
    isStatic = false,
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/songsterr/domain/json/Subscription\$SubscriptionType;",
            name = "BRAINTREE",
        ),
        fieldAccess(
            definingClass = "Lcom/songsterr/domain/json/Subscription\$SubscriptionType;",
            name = "STRIPE",
        ),
    ),
)

// l(): GOOGLE_PLAY subscription && j()==TRUE.
object PremiumGooglePlaySubFingerprint : Fingerprint(
    definingClass = "Lcom/songsterr/iap/f;",
    name = "l",
    returnType = "Z",
    parameters = listOf(),
    isStatic = false,
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/songsterr/domain/json/Subscription\$SubscriptionType;",
            name = "GOOGLE_PLAY",
        ),
    ),
)

// b(): central tier getter. Only method in Premium class containing both
// "Debug lock happened" and "Cracked" plus a getHasPro call.
object PremiumTierFingerprint : Fingerprint(
    definingClass = "Lcom/songsterr/iap/f;",
    name = "b",
    // Lf2; is obfuscated (base type of Le2 enum). Use "L" (any object)
    // so the fingerprint survives a rename of the tier type; the
    // definingClass + strings + getHasPro call keep it unique.
    returnType = "L",
    parameters = listOf(),
    isStatic = false,
    filters = listOf(
        string("Debug lock happened"),
        string("Cracked"),
        methodCall(
            definingClass = "Lcom/songsterr/domain/json/User;",
            name = "getHasPro",
        ),
    ),
)
