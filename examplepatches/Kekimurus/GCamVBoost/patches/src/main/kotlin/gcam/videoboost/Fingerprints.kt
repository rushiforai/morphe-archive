package gcam.videoboost

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Matches the startup reset in the camera activity controller (`ife.I()` in 11.1.040).
 * On every launch it switches Video Boost off:
 *
 *   const-string v1, "resetStartupSettingsForAllModules"
 *   ...
 *   invoke-static {v1}, Lkrt;->k(Lksf;)V                      # Video Boost eligibility check
 *   iget-object v1, p0, Life;->at:Lusf;                        # Video Boost state
 *   invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)...      # false
 *   move-result-object v2
 *   invoke-interface {v1, v2}, Lusf;->a(Ljava/lang/Object;)V   # state = false
 */
internal object StartupSettingsResetFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("resetStartupSettingsForAllModules")
    )
)
