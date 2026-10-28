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
