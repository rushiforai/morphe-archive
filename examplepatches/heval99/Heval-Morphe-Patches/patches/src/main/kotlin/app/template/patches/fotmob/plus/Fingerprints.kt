package app.template.patches.fotmob.plus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

/**
 * FotMob's subscription manager is R8-obfuscated and its class/method names rotate on every
 * release (the previous patch pinned `o`/`l` from v229 and broke immediately).
 *
 * This anchors the class on the staff-account email check, whose address strings are unique
 * in the APK. EnablePlusPatch then finds the subscription getter structurally inside that
 * class: it is the only no-arg boolean method that is neither the staff check nor a
 * constant-false stub. The getter reads the `valid_subscription` flag that the RevenueCat
 * customer-info listener writes after `Entitlements.getActive()` comes back, so forcing the
 * getter unlocks the paywall regardless of obfuscation rotation. The getter's storage layer
 * is deliberately not matched: 236 read SharedPreferencesRepository.get, while 237 goes
 * through a settings holder, so the shape-based search survives those swaps too.
 */
object StaffAccountFingerprint : Fingerprint(
    strings = listOf(string("norapps.as@", StringComparisonType.CONTAINS)),
)

/**
 * The Compose lambda that draws MembershipActivity's content. It switches on the RevenueCat
 * entitlement state; three entitlement branches end with the "Exclusive app icons" picker, the
 * NoEntitlement branch only shows this hard-coded text (no string resource), so the literal is
 * unique to the lambda (`pp8.invoke` in 238.17794, `xp8.invoke` in 238.17666). Optional: builds
 * without this screen just skip the app-icon step.
 */
object MembershipScreenFingerprint : Fingerprint(
    strings = listOf(string(NO_SUBSCRIPTION_TEXT, StringComparisonType.CONTAINS)),
)

internal const val NO_SUBSCRIPTION_TEXT = "No active subscriptions found"
