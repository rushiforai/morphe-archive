package app.plyrs1.patches.com_doovera_eujianbrowser

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_EUJIANBROWSER

/**
 * Bypasses the pre-exam installed app blacklist scanner and permission prompts.
 *
 * ## Root Cause of Crash
 * The previous version referenced field `LV0/j;->f1006a:Ljava/lang/Object;`, which
 * was a JADX deobfuscator artifact. In the actual DEX bytecode, the Kotlin Unit
 * singleton field is `LV0/j;->a:LV0/j;`. This resulted in:
 *   java.lang.NoSuchFieldError: No static field f1006a of type Ljava/lang/Object; in class LV0/j;
 *
 * Furthermore, returning early from `q0.v.invokeSuspend` without invoking `MainActivity.t()`
 * prevented the exam from launching altogether.
 *
 * ## Fix
 * 1. In `q0.v.invokeSuspend`:
 *    - Fetch `this.d` (`MainActivity`)
 *    - Invoke `mainActivity.t()` directly (skipping the blacklist API call,
 *      package manager scan, and internet connectivity checks)
 *    - Return `LV0/j;->a:LV0/j;` (the real Unit singleton)
 *
 * 2. In `MainActivity.t()`:
 *    - Bypass the overlay permission dialog (`Settings.canDrawOverlays`),
 *      DND dialog (`NotificationManager.getCurrentInterruptionFilter`), and
 *      ringer dialog (`AudioManager.getRingerMode`)
 *    - Retrieve `tenant_code` and `tenant_is_v3` from SharedPreferences
 *    - Construct the `ExamActivity` Intent with `EXAM_URL`, `TENANT_CODE`, and `IS_V3`
 *    - Call `startActivity(intent)` and return immediately
 */
@Suppress("unused")
val bypassBlacklistScanPatch = bytecodePatch(
    name = "Bypass App Blacklist Scan",
    description = "Skips the pre-exam scan that blocks exam start if blacklisted apps " +
            "(AnyDesk, TeamViewer, screen recorders, floating apps) are installed, " +
            "and launches the exam directly without overlay/DND/ringer prompts.",
    default = true
) {
    compatibleWith(COMPATIBILITY_EUJIANBROWSER)

    execute {
        // 1. Bypass blacklist scan & connectivity check in q0.v.invokeSuspend:
        //    Calls mainActivity.t() directly and returns the valid Unit singleton.
        BlacklistScanFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lq0/v;->d:Lcom/doovera/eujianbrowser/MainActivity;
                invoke-virtual {v0}, Lcom/doovera/eujianbrowser/MainActivity;->t()V
                sget-object v0, LV0/j;->a:LV0/j;
                return-object v0
            """
        )

        // 2. In MainActivity.t(): bypass overlay, DND, and ringer checks and launch ExamActivity directly.
        MainActivityStartExamFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/doovera/eujianbrowser/MainActivity;->A:LB0/f;
                if-eqz v0, :cond_none
                iget-object v0, v0, LB0/f;->b:Ljava/lang/Object;
                check-cast v0, Landroid/content/SharedPreferences;
                const-string v1, "tenant_code"
                const/4 v2, 0x0
                invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                move-result-object v0
                if-eqz v0, :cond_none
                iget-object v1, p0, Lcom/doovera/eujianbrowser/MainActivity;->A:LB0/f;
                iget-object v1, v1, LB0/f;->b:Ljava/lang/Object;
                check-cast v1, Landroid/content/SharedPreferences;
                const-string v2, "tenant_is_v3"
                const/4 v3, 0x0
                invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
                move-result v1
                invoke-static {v0, v1}, Lu0/e;->a(Ljava/lang/String;Z)Ljava/lang/String;
                move-result-object v2
                new-instance v3, Landroid/content/Intent;
                const-class v4, Lcom/doovera/eujianbrowser/ExamActivity;
                invoke-direct {v3, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
                const-string v4, "EXAM_URL"
                invoke-virtual {v3, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
                const-string v2, "TENANT_CODE"
                invoke-virtual {v3, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
                const-string v0, "IS_V3"
                invoke-virtual {v3, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
                invoke-virtual {p0, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
                :cond_none
                return-void
            """
        )
    }
}
