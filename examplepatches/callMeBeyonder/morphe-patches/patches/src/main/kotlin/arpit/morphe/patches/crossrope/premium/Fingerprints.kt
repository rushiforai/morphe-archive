package arpit.morphe.patches.crossrope.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Matches the session class's `isPremium()` accessor.
 *
 * The obfuscated session/account store (`Le6/e2;`) keeps the account state in a
 * `SharedPreferences` file and exposes the paid flag as a zero-argument boolean
 * method that ORs `is_premium` with `just_bought_premium`:
 *
 * ```
 * getBoolean("is_premium", false) || getBoolean("just_bought_premium", false)
 * ```
 *
 * Both keys are R8 literals and survive name obfuscation, which makes this method
 * identifiable across builds. Roughly two dozen app classes (screens, ViewModels,
 * settings, workout preview) call it to decide whether paid content is playable,
 * so forcing it true is the single highest-leverage gate.
 */
object PremiumFlagFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("is_premium", "just_bought_premium")
)

/**
 * Matches the session class's membership tier getter.
 *
 * Feature access in this app is not decided by a boolean alone. `Le6/V0;` is the
 * feature-flag store; its `b(Le6/T0;)Z` gate first requires `Le6/e2;->r()Z`
 * (the `is_logged_in` preference), then branches on the enum returned by
 * `Le6/e2;->j()LU5/A;`:
 *
 * ```
 * ordinal 0 -> LU5/A.A  "free"      -> every flag false
 * ordinal 1 -> LU5/A.B  "lite"      -> a fixed small subset of flags
 * ordinal 2 -> LU5/A.C  "Standard"  -> every flag true
 * ```
 *
 * The flags cover `WorkoutLock`, `WorkoutPreview`, `ClassLock`, `ClassPreview`,
 * `ProgramLock`, `ProgramPreview`, `ProgramWorkoutLock`, `Benchmark`, `Counting`
 * and `Profile`. Forcing the tier to `Standard` therefore opens every gated
 * surface, including the program day that otherwise routes to `PremiumActivity`.
 *
 * `j()` reads the `membership_tier` preference and maps it through
 * `LU5/A$a;->a(Ljava/lang/String;)LU5/A;`, so the pref key is the stable handle
 * here; the obfuscated return type only narrows the match within this version.
 */
object MembershipTierFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "LU5/A;",
    parameters = listOf(),
    strings = listOf("membership_tier")
)
