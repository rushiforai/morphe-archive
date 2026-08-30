package app.iptv.patches.unlock

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

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
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    // B() just delegates to A(), fingerprint via method call to A
    filters = listOf(
        string("subscription_needed") // will match via A() cross-ref, fallback
    )
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
