package app.jefftek.patches.ringtonemaker

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Fingerprints for MP3 Cutter and Ringtone Maker (ringtone.maker.mp3.cutter.audio) v2.3.5.1.
 *
 * App is InShot's MP3 Cutter & Ringtone Maker. Code is partially obfuscated (hl3, v32),
 * so fingerprints pin to the exact version target.
 */

/**
 * `Lhl3;->e()Z` — the app-wide "is premium / feature unlocked" gate.
 *
 * Read at 8+ call sites (ContactsActivity, FinishActivity, PickerActivity, ringtone
 * category detail, etc.). Returning `false` triggers ad display and premium locks;
 * returning `true` unlocks features and skips premium-gated ads.
 *
 * Method shape (v2.3.5.1):
 * ```
 * .method public final e()Z
 *     iget v0, p0, Lhl3;->p:I
 *     const/4 v1, -0x1
 *     ...
 *     iget-object v0, p0, Lhl3;->a:Lzy0;
 *     iget-boolean v0, v0, Lzy0;->b:Z
 *     ...
 * ```
 */
object PremiumGateFingerprint : Fingerprint(
    definingClass = "/hl3;",
    name = "e",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "this",
            type = "Lzy0;"
        ),
    )
)

/**
 * `Lv32;->c()Z` — the master "are ads enabled" switch.
 *
 * Reads the `qaU9l5Yt` SharedPreferences flag (default `true` = ads ON) and caches it in
 * field `a`. Checked by SplashActivity (splash ads) and the `hs` ad scheduler
 * (interstitial/full-screen AdActivity). Returning `false` disables all scheduled ads.
 *
 * Method shape (v2.3.5.1):
 * ```
 * .method public final c()Z
 *     iget v0, p0, Lv32;->a:I
 *     const/4 v1, -0x1
 *     if-ne v0, v1, :cond_0
 *     const-string v0, "qaU9l5Yt"
 *     invoke-static {v0, v2}, Lf4;->j(Ljava/lang/String;Z)Z
 *     ...
 * ```
 */
object AdsEnabledFingerprint : Fingerprint(
    definingClass = "/v32;",
    name = "c",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    filters = listOf(
        string("qaU9l5Yt"),
    )
)

/**
 * `Lcom/inshot/videotomp3/BaseBannerAdActivity;->a0()V` — banner show/hide.
 *
 * All ~10 ad-bearing activities extend this class and call `a0()` from `onCreate`.
 * When field `D` (the "no ads" pref `kmgJSgyY`) is `true`, the banner container is
 * hidden (`c0` → visibility GONE). When `false`, the banner stays visible.
 * Forcing `D = true` hides the banner in every activity.
 *
 * Method shape (v2.3.5.1):
 * ```
 * .method public final a0()V
 *     iget-object v0, p0, ...->C:Landroid/view/ViewGroup;
 *     if-nez v0, :cond_0
 *     ...
 *     iget-boolean v0, p0, ...->D:Z
 *     if-eqz v0, :cond_1
 *     const/4 v0, 0x0
 *     invoke-virtual {p0, v0}, ...->c0(Z)V
 *     :cond_1
 *     return-void
 * ```
 */
object BannerDisplayFingerprint : Fingerprint(
    definingClass = "Lcom/inshot/videotomp3/BaseBannerAdActivity;",
    name = "a0",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET,
            definingClass = "this",
            type = "Landroid/view/ViewGroup;"
        ),
    )
)
