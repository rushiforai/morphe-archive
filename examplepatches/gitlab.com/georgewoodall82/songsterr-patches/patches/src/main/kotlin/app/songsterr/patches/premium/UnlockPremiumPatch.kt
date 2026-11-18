package app.songsterr.patches.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnBoxedBooleanEarly
import app.morphe.patcher.util.returnEarly
import app.songsterr.patches.shared.Constants.COMPATIBILITY_SONGSTERR

/**
 * Unlocks Songsterr Plus/Premium for free.
 *
 * What it does (7.1.3, com.songsterr):
 * - User.getHasPlus/getHasPro/getHasSRA -> true (server flags, checked by
 *   Premium.h/i and Premium.b).
 * - CrackChecker.a() -> false (signature check that forces Premium.b() to
 *   return the locked tier Le2.e).
 * - Premium h/i/g/j (boxed Boolean) -> TRUE, k/l (boolean) -> true.
 *   These are the individual gates; forcing them makes Premium.b()
 *   return a premium tier on its own.
 * - Premium b() (tier getter) -> Le2.t (PLUS, ordinal 7). t is the tier most
 *   callers gate on (checkForPlus, TabPlayerModel c>=7, SearchViewModel,
 *   mixer, etc.). v (PRO, 9) also satisfies c>=7 but fails exact `==t`
 *   checks, so t is the safer single-value override. See Fingerprints.kt
 *   for the e/u/t/v/w mapping decoded from 7.1.3 bytecode.
 *
 * If a future Songsterr renames Lcom/songsterr/iap/f; or Le2, this patch
 * fails fast with a fingerprint mismatch (by design) instead of silently
 * doing nothing. See README "Retargeting".
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks Songsterr Plus/Premium features (multi-speed, solo/mute, loop, offline, no Plus paywall).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SONGSTERR)

    execute {
        // Server flags.
        UserHasPlusFingerprint.method.returnEarly(true)
        UserHasProFingerprint.method.returnEarly(true)
        UserHasSraFingerprint.method.returnEarly(true)

        // Tamper detection off.
        CrackCheckerFingerprint.method.returnEarly(false)

        // Individual Premium gates on.
        PremiumHasPlusFingerprint.method.returnBoxedBooleanEarly(true)
        PremiumHasSraFingerprint.method.returnBoxedBooleanEarly(true)
        PremiumOwnedGFingerprint.method.returnBoxedBooleanEarly(true)
        PremiumOwnedJFingerprint.method.returnBoxedBooleanEarly(true)
        PremiumManualSubFingerprint.method.returnEarly(true)
        PremiumGooglePlaySubFingerprint.method.returnEarly(true)

        // Central tier -> PLUS.
        // Le2 is the obfuscated tier enum in 7.1.3 (e=0 free, u=3 SRA,
        // t=7 PLUS, v=9 PRO, w=-1). Hardcoded for the pinned version;
        // update if the enum class is renamed (see README).
        PremiumTierFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Le2;->t:Le2;
                return-object v0
            """,
        )
    }
}
