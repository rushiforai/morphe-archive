package app.template.patches.privacykit.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants
import app.template.patches.shared.returnEarly
import app.template.patches.privacykit.premium.HookEventReportFingerprint
import app.template.patches.privacykit.premium.J82GetLicenseStateFingerprint
import app.template.patches.privacykit.premium.LicenseRefreshWorkerFingerprint
import app.template.patches.privacykit.premium.LicenseRemotePostFingerprint

@Suppress("unused")
val privacyKitPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks all premium features",
) {
    compatibleWith(Constants.PRIVACYKIT_COMPATIBILITY)

    execute {
        IsProFingerprint.methodOrNull?.returnEarly(true)
        IsBlockedFingerprint.methodOrNull?.returnEarly(false)
        GetPlanFingerprint.methodOrNull?.addInstructions(0,
            "sget-object v0, Lcom/sal/privacykit/data/license/LicensePlan;->PRO:Lcom/sal/privacykit/data/license/LicensePlan;\n" +
            "return-object v0"
        )
        GetStateFingerprint.methodOrNull?.addInstructions(0,
            "sget-object v0, Lcom/sal/privacykit/data/license/LicenseState;->ACTIVE:Lcom/sal/privacykit/data/license/LicenseState;\n" +
            "return-object v0"
        )
        LicenseRemotePostFingerprint.methodOrNull?.addInstructions(0,
            "new-instance v0, Lorg/json/JSONObject;\n" +
            "invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V\n" +
            "return-object v0"
        )
        HookEventReportFingerprint.methodOrNull?.addInstructions(0,
            "return-void"
        )

        J82GetLicenseStateFingerprint.matchOrNull()?.let { match ->
            match.method.addInstructions(0,
                "sget-object v0, Lo82;->ACTIVE:Lo82;\n" +
                "return-object v0"
            )
        }

        LicenseRefreshWorkerFingerprint.matchOrNull()?.let { match ->
            match.method.addInstructions(0,
                "sget-object v0, Lo82;->ACTIVE:Lo82;\n" +
                "new-instance v1, Lp82;\n" +
                "sget-object v2, Lk72;->PRO:Lk72;\n" +
                "const-wide/16 v3, 0x0\n" +
                "const/4 v5, 0x0\n" +
                "const/4 v6, 0x0\n" +
                "const/4 v7, 0x0\n" +
                "const/4 v8, 0x0\n" +
                "const/4 v9, 0x0\n" +
                "const/4 v10, 0x0\n" +
                "const/4 v11, 0x0\n" +
                "const/4 v12, 0x0\n" +
                "const/4 v13, 0x0\n" +
                "const/4 v14, 0x0\n" +
                "const/16 v15, 0x800\n" +
                "invoke-direct/range {v1 .. v15}, Lp82;-><init>(Lk72;Lo82;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/util/List;Lj72;I)V\n" +
                "return-object v1"
            )
        }
    }
}