package app.template.patches.timetune.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_TIMETUNE

/**
 * TimeTune caches its premium state in the app's billing preferences: `PREF_PREMIUM_SUBS` for the
 * `premium_subs` subscription and `PREF_DIALOG` for the legacy one-time purchase
 * (`dialog_title`). The public premium check ORs the two, and every premium screen in the app
 * (schedule, backup, calendar, widgets, settings) calls it.
 *
 * The patch makes the subscription getter answer true, so the public check is true everywhere.
 * The billing client, the preference writes and the one-time purchase path are untouched; nothing
 * is written back, so a cancelled subscription still reads as premium locally (that is the point).
 *
 * Verified 2026-10-28 against 5.6.3 (versionCode 584): smoke test, CLI without -f, a decompiled
 * check of the getter and a cold start on the emulator. See COMPATIBILITY_TIMETUNE.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks TimeTune Premium locally.",
) {
    compatibleWith(COMPATIBILITY_TIMETUNE)

    execute {
        PremiumStateFingerprint.method.returnEarly(true)
    }
}
