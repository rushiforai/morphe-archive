package app.mctoolbox.patches.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.mctoolbox.patches.shared.Constants.COMPATIBILITY_MCTOOLBOX

/**
 * Watch Ad Instant Reward — pressing "Watch ad" grants +15 min premium instantly.
 *
 * STATUS: TESTING — needs further verification on real device.
 *
 * Premium works with two keys:
 *   1) "internal/premium/remaining_time" (float) — written via S()
 *   2) "internal/premium_unlocked" (boolean) — set to true via R()
 *
 * Then bridge.b.a(bridge) refreshes the ya0.Q flag so features unlock immediately.
 *
 * Four-layer patch:
 *
 * 1. vs0.a()Z → always returns true (ad duration considered complete).
 *
 * 2. vs0.b()Z → always returns true (early-close permission granted).
 *
 * 3. r2$b.b()V → when an ad source fails:
 *    writes premium time via S() + sets unlocked=true via R() + refreshes via a()
 *    + dismisses dialog via tv$a.a().
 *
 * 4. n21$a.b()V → when all ad sources fail:
 *    writes premium time via S() + sets unlocked=true via R() + refreshes via a().
 *    Original code shows toast + dismisses dialog.
 */
@Suppress("unused")
val mctoolboxWatchAdInstantRewardPatch = bytecodePatch(
    name = "Watch Ad Instant Reward",
    description = "Pressing \"Watch ad\" grants +15 min premium instantly without loading ads. (TESTING)",
    default = false
) {
    compatibleWith(COMPATIBILITY_MCTOOLBOX)

    execute {
        // 1. vs0.a() → always true
        Vs0TimeElapsedFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """.trimIndent())

        // 2. vs0.b() → always true
        Vs0CanCloseFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """.trimIndent())

        // 3. r2$b.b() → on failure: write premium + unlock + refresh + dismiss
        // .locals 4: v0-v3 available
        AdLoadFailFingerprint.method.addInstructions(0, """
            sget-object v0, Lio/mrarm/mctoolbox/bridge/b;->h:Lio/mrarm/mctoolbox/bridge/b;
            const-string v1, "internal/premium/remaining_time"
            invoke-virtual {v0, v1}, Lio/mrarm/mctoolbox/bridge/b;->n(Ljava/lang/String;)F
            move-result v2
            const/high16 v3, 0x44610000
            add-float v2, v2, v3
            invoke-virtual {v0, v1, v2}, Lio/mrarm/mctoolbox/bridge/b;->S(Ljava/lang/String;F)V
            const-string v1, "internal/premium_unlocked"
            const/4 v2, 0x1
            invoke-virtual {v0, v1, v2}, Lio/mrarm/mctoolbox/bridge/b;->R(Ljava/lang/String;Z)V
            invoke-static {v0}, Lio/mrarm/mctoolbox/bridge/b;->a(Lio/mrarm/mctoolbox/bridge/b;)V
            iget-object v0, p0, Lr2${'$'}b;->c:Ltv${'$'}a;
            invoke-interface {v0}, Ltv${'$'}a;->a()V
            return-void
        """.trimIndent())

        // 4. n21$a.b() → all sources failed: write premium + unlock + refresh
        // .locals 3: v0-v2 available
        AdAllSourcesFailedFingerprint.method.addInstructions(0, """
            sget-object v0, Lio/mrarm/mctoolbox/bridge/b;->h:Lio/mrarm/mctoolbox/bridge/b;
            const-string v1, "internal/premium/remaining_time"
            const/high16 v2, 0x44610000
            invoke-virtual {v0, v1, v2}, Lio/mrarm/mctoolbox/bridge/b;->S(Ljava/lang/String;F)V
            const-string v1, "internal/premium_unlocked"
            const/4 v2, 0x1
            invoke-virtual {v0, v1, v2}, Lio/mrarm/mctoolbox/bridge/b;->R(Ljava/lang/String;Z)V
            invoke-static {v0}, Lio/mrarm/mctoolbox/bridge/b;->a(Lio/mrarm/mctoolbox/bridge/b;)V
        """.trimIndent())
    }
}
