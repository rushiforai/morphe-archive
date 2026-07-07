package app.morphe.patches.kinestop

import app.morphe.patcher.Fingerprint

object Fingerprints {
    /**
     * com.urbandroid.kinestop.KineService$Companion -> isTrial(Context) : boolean
     *
     * The single gatekeeper for the entire trial/pro state. Non-obfuscated first-party
     * Kotlin (the app is not minified/obfuscated), so a minimal class + name fingerprint
     * is sufficient and stable across versions.
     *
     * Original logic: reads SharedPreferences key "u" (default 12); returns
     * `getInt("u", 12) != 42`. The app writes 42 on a completed purchase
     * (setTrial(ctx, false)) and -1 while on trial (setTrial(ctx, true)).
     * Every premium/limit/theme gate calls Companion.isTrial(...).
     *
     * Forcing this to return false flips every gate to the "pro / not trial" state,
     * unlocking all premium features and removing trial limits.
     */
    val IsTrialFingerprint = Fingerprint(
        definingClass = "Lcom/urbandroid/kinestop/KineService\$Companion;",
        name = "isTrial",
        returnType = "Z",
        parameters = listOf("Landroid/content/Context;"),
    )
}