package app.template.patches.fotmob.plus

import app.morphe.patcher.Fingerprint

/**
 * FotMob v229 uses obfuscated RevenueCat classes.
 * Class m4a implements interface jg5 and contains the subscription checks.
 */

object SubscriptionManagerFingerprint : Fingerprint(
    strings = listOf("purchase_status_changed")
)

object HasActiveEntitlementFingerprint : Fingerprint(
    classFingerprint = SubscriptionManagerFingerprint,
    name = "o",
    returnType = "Z",
    parameters = listOf()
)

object IsStaffAccountFingerprint : Fingerprint(
    classFingerprint = SubscriptionManagerFingerprint,
    name = "l",
    returnType = "Z",
    parameters = listOf()
)
