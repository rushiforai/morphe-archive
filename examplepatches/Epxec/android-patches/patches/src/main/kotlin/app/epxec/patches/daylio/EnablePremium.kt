package app.epxec.patches.daylio

import app.epxec.patches.daylio.Fingerprints.DaylioPremiumStatusFingerprint
import app.epxec.patches.daylio.Fingerprints.DaylioPreventPremiumRevokeFingerprint
import app.epxec.patches.daylio.Fingerprints.DaylioPreventExpiredDialogFingerprint
import app.epxec.patches.daylio.Fingerprints.DaylioPreventExpiredFlagSetFingerprint
import app.epxec.patches.shared.Constants.COMPATIBILITY_Daylio
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.epxec.patches.shared.hoodles.microG

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks all premium features in Daylio.",
    default = true
) {
    compatibleWith(COMPATIBILITY_Daylio)

    dependsOn(changePackageInstallerPatch(), microG)

    execute {
        // ── Patch 1: k4() ────────────────────────────────────────────────────
        // Force k4() to always return true — this is the single premium gate
        // checked everywhere in the app via b().k4().
        //
        // We also persist IS_PRO_VERSION_PURCHASED = true into SharedPreferences
        // here (ri.c.p(ri.c.E, Boolean.TRUE)) before the early return. This
        // ensures the 20+ places that read ri.c.E directly (BackupActivity.Fl,
        // MoodIconPackPreviewActivity.k4, MoodChartDetailActivity.Kk, dj/p0,
        // etc.) also see the premium flag as true.
        //
        // This replaces the previous Patch 0 which injected into f0.<init>().
        // Constructor injection is unsafe: Dalvik's verifier rejects instructions
        // that run before or interact with registers shifted by super.<init>() in
        // a constructor with a tight register count, producing VerifyError.
        // k4() is a safe regular method with no such restrictions.
        DaylioPremiumStatusFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lri/c;->E:Lri/c${'$'}a;
                sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-static {v0, v1}, Lri/c;->p(Lri/c${'$'}a;Ljava/lang/Object;)V
                const/4 v0, 0x1
                return v0
            """
        )

        // ── Patch 2: kf(fl.h) ────────────────────────────────────────────────
        // Prevent kf() from setting IS_PRO_VERSION_PURCHASED = false
        // when billing validation fails or subscription expires.
        DaylioPreventPremiumRevokeFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // ── Patch 3: Lh() ────────────────────────────────────────────────────
        // Force Lh() to always return false — this is the IS_PREMIUM_EXPIRED
        // gate. When true, OverviewActivity shows the "Oh no, your premium has
        // expired!" full-screen dialog via m5.i(). Returning false ensures the
        // dialog never appears regardless of what is stored in SharedPreferences.
        DaylioPreventExpiredDialogFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // ── Patch 4: S2() ────────────────────────────────────────────────────
        // No-op S2() so it can never write IS_PREMIUM_EXPIRED = true into
        // SharedPreferences in the first place. This prevents the flag from
        // accumulating across app restarts even if somehow Patch 3 were bypassed.
        DaylioPreventExpiredFlagSetFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
