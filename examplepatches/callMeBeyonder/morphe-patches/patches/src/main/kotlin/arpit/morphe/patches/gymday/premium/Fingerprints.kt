package arpit.morphe.patches.gymday.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Matches the app's single premium predicate — the `()Z` method that reads the
 * `"PREMIUM_ENABLED"` SharedPreferences boolean and ORs it with the coach flag.
 *
 * Gym Day stores its whole entitlement in that one local boolean:
 *
 * - the RevenueCat entitlement id `"premium"` is consumed in only two places
 *   (`MainApplication.onReceived` and `PremiumViewModel$purchase$2`), and both
 *   funnel into the same setter that writes this pref;
 * - 34 call sites in 22 classes read this getter — schedules, home, schedule
 *   detail/overview, statistics, body, exercise/workout notes, export data,
 *   Google sign-in, coach weeks, AI exercise tips, onboarding and the plate
 *   calculator all branch on it;
 * - premium schedules and their workouts ship inside the APK, so the read is the
 *   only gate.
 *
 * The class and method names are R8-obfuscated (`hm.f()` in 1.62.0) and change
 * between releases, so the fingerprint anchors exclusively on Android SDK types
 * and the preference-key literal, which are never renamed.
 *
 * Verified against `analysis/gymday/smali/smali_classes2/hm.smali` (method at
 * line 1732, `.registers 4`, access flags exactly `public`, no parameters):
 *
 * ```smali
 * iget-object v0, p0, Lhm;->a:Landroid/content/SharedPreferences;
 * const-string v1, "PREMIUM_ENABLED"
 * const/4 v2, 0x0
 * invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
 * move-result v0
 * if-nez v0, :cond_13
 * ```
 *
 * The `"PREMIUM_ENABLED"` literal occurs exactly twice in the whole APK (this
 * getter and the setter matched by [PremiumPrefWriterFingerprint]), and only this
 * one returns `Z`, so `returnType`/`accessFlags`/`parameters` already leave no
 * candidate when the body is filtered too.
 */
object PremiumGateFingerprint : Fingerprint(
    // Exact smali bitmask: `.method public f()Z` — no final, no static.
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        // The backing `SharedPreferences` field (`hm.a`, name not referenced).
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "this",
            type = "Landroid/content/SharedPreferences;",
        ),
        string("PREMIUM_ENABLED"),
        methodCall(
            definingClass = "Landroid/content/SharedPreferences;",
            name = "getBoolean",
            returnType = "Z",
        ),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        opcode(Opcode.IF_NEZ),
    ),
)

/**
 * Matches the app's single premium preference writer — the `(Z)V` method that
 * persists `"PREMIUM_ENABLED"` through a `SharedPreferences.Editor`.
 *
 * Its only two callers are the RevenueCat `UpdatedCustomerInfoListener`
 * (`MainApplication.onReceived`) and the post-purchase coroutine
 * (`PremiumViewModel$purchase$2`), so it is the one place where the server's
 * entitlement verdict can overwrite the local flag.
 *
 * Verified against `analysis/gymday/smali/smali_classes2/hm.smali` (method at
 * line 897, `.registers 3`, access flags exactly `public`, one `Z` parameter):
 *
 * ```smali
 * .method public Q(Z)V
 *     .registers 3
 *     iget-object p0, p0, Lhm;->a:Landroid/content/SharedPreferences;
 *     invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
 *     move-result-object p0
 *     const-string v0, "PREMIUM_ENABLED"
 *     invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
 *     ...
 *     return-void
 * .end method
 * ```
 */
object PremiumPrefWriterFingerprint : Fingerprint(
    // Exact smali bitmask: `.method public Q(Z)V` — no final, no static.
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        string("PREMIUM_ENABLED"),
        methodCall(
            definingClass = "Landroid/content/SharedPreferences\$Editor;",
            name = "putBoolean",
            returnType = "Landroid/content/SharedPreferences\$Editor;",
        ),
    ),
)
