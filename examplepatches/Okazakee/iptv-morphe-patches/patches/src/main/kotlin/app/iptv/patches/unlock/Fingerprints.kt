package app.iptv.patches.unlock

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// ---------------------------------------------------------------------------
// Legacy app targets (<= 2.7.21)
// ---------------------------------------------------------------------------

/**
 * O7/j.A()Z checks Firebase Remote Config "subscription_needed"
 * If true, the app gates playlists/player behind paywall.
 * Fingerprint targets the unique literal.
 */
object SubscriptionNeededAFingerprint : Fingerprint(
    definingClass = "LO7/j;",
    name = "A",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        string("subscription_needed")
    )
)

object SubscriptionNeededBFingerprint : Fingerprint(
    definingClass = "LO7/j;",
    name = "B",
    returnType = "Z"
)

/**
 * O7/h.x(Z) and O7/h.w() check RevenueCat entitlement "pro" -> isActive()
 * Two distinct methods contain "pro" literal.
 */
object ProEntitlementWFingerprint : Fingerprint(
    definingClass = "LO7/h;",
    name = "w",
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("pro")
    )
)

object ProEntitlementXFingerprint : Fingerprint(
    definingClass = "LO7/h;",
    name = "x",
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("pro")
    )
)

// ---------------------------------------------------------------------------
// App target 2.7.24+ (rewritten subscription layer)
// ---------------------------------------------------------------------------

/**
 * 2.7.24 dropped the small O7/j boolean getters and inlined the check in the
 * coroutine gate, which reads the flag through this shared Remote Config
 * boolean reader (`c(String)Z`). We hook the reader itself so only the
 * "subscription_needed" key is forced to false; every other remote flag keeps
 * its real value.
 */
object RemoteConfigBooleanReaderFingerprint : Fingerprint(
    definingClass = "Ls43;",
    name = "c",
    parameters = listOf("Ljava/lang/String;"),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

/**
 * RevenueCat "pro" entitlement check in 2.7.24+ (previously O7/h.x()):
 * awaits CustomerInfo, reads entitlements["pro"] and returns isActive().
 */
object ProEntitlement2724Fingerprint : Fingerprint(
    definingClass = "Lqh7;",
    name = "l",
    parameters = listOf("Z", "Lel1;"),
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

// ---------------------------------------------------------------------------
// App target 2.7.27+ (second obfuscation reshuffle)
// ---------------------------------------------------------------------------

/**
 * 2.7.27+ moved the Remote Config boolean reader to Lk53; (same
 * `c(String)Z` shape as the 2.7.24 Ls43; version). The old s43/qh7 classes
 * still exist but are now coroutine continuation wrappers with no c()/l()
 * logic methods, so the previous fingerprints no longer match.
 */
object RemoteConfigBooleanReader2728Fingerprint : Fingerprint(
    definingClass = "Lk53;",
    name = "c",
    parameters = listOf("Ljava/lang/String;"),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

/**
 * RevenueCat "pro" entitlement check in 2.7.27+: moved to Lei7; l(Z,Lfl1;),
 * same body (entitlements["pro"] -> isActive()) — continuation type is fl1.
 */
object ProEntitlement2728Fingerprint : Fingerprint(
    definingClass = "Lei7;",
    name = "l",
    parameters = listOf("Z", "Lfl1;"),
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

// ---------------------------------------------------------------------------
// App target 2.7.27 (intermediate build, its own obfuscation map)
// ---------------------------------------------------------------------------

/**
 * 2.7.27 uses Lj53; for the Remote Config boolean reader and Ldi7; for the
 * RevenueCat entitlement check — same shapes as 2.7.28, different class map.
 * Kept as separate fingerprints so every declared target stays patchable.
 */
object RemoteConfigBooleanReader2727Fingerprint : Fingerprint(
    definingClass = "Lj53;",
    name = "c",
    parameters = listOf("Ljava/lang/String;"),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)

object ProEntitlement2727Fingerprint : Fingerprint(
    definingClass = "Ldi7;",
    name = "l",
    parameters = listOf("Z", "Lfl1;"),
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)
