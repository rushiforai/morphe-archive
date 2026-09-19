package app.template.patches.fotmob.plus

import app.morphe.patcher.Fingerprint

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
    strings = listOf("norapps.as@"),
)
