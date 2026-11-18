package app.morphe.patches.gpsmapcamera

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.gpsmapcamera.Constants.COMPATIBILITY

@Suppress("unused")
val gpsMapCameraPatch = bytecodePatch(
    name = "Premium Unlocked",
    description = "Full unredacted patch: Neutralizes PairIP licensing & anti-tamper, unlocks Pro VIP lifetime licenses, removes all watermarks, and silences all ad placements.",
    default = true
) {
    compatibleWith(COMPATIBILITY)

    execute {
        // ==========================================
        // 1. NEUTRALIZE PAIRIP LICENSE VERIFICATION
        // ==========================================

        PairIPLicenseContentProviderFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        PairIPCheckLicenseFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        PairIPScheduleAppShutdownFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        PairIPStartPaywallFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        PairIPStartErrorDialogFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        PairIPLocalCheckPassedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        PairIPStartupLauncherFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        PairIPVMRunnerFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )

        // ==========================================
        // 2. ROOT UNLOCK: SP PREFERENCE INTERCEPTOR
        // ==========================================

        SPGetBoolean2Fingerprint.method.addInstructions(
            0,
            """
                if-eqz p1, :check_sub
                const-string v0, "PURCHESH"
                invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v0
                if-eqz v0, :check_sub
                const/4 v0, 0x1
                return v0
                :check_sub
                if-eqz p1, :cont_orig
                const-string v0, "SUBSCRIBE"
                invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v0
                if-eqz v0, :cont_orig
                const/4 v0, 0x1
                return v0
                :cont_orig
            """
        )

        SPGetBoolean3Fingerprint.method.addInstructions(
            0,
            """
                if-eqz p1, :check_sub3
                const-string v0, "PURCHESH"
                invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v0
                if-eqz v0, :check_sub3
                const/4 v0, 0x1
                return v0
                :check_sub3
                if-eqz p1, :cont_orig3
                const-string v0, "SUBSCRIBE"
                invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v0
                if-eqz v0, :cont_orig3
                const/4 v0, 0x1
                return v0
                :cont_orig3
            """
        )

        // ==========================================
        // 3. FORCE MASTER PRO STATUS & AD ELIMINATION
        // ==========================================

        AllAdsApprovalIsProFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        val adsClass = AllAdsApprovalIsProFingerprint.classDef
        for (method in adsClass.methods) {
            val name = method.name
            if (name != "isPro" && name != "<init>" && name != "<clinit>" && method.returnType == "Z") {
                method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x0
                        return v0
                    """
                )
            }
        }

        // ==========================================
        // 4. IN-APP BILLING STATE HELPERS
        // ==========================================

        CommonFunctionIsAnyPackagePurchasedFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """
        )

        PurchaseModelGetPurchasedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
