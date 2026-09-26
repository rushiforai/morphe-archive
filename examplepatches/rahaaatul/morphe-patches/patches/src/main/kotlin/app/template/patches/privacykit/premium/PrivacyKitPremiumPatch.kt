package app.template.patches.privacykit.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants
import app.template.patches.shared.returnEarly
import app.template.patches.privacykit.premium.HookEventReportFingerprint
import app.template.patches.privacykit.premium.LicenseRemotePostFingerprint

@Suppress("unused")
val privacyKitPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks all premium features",
) {
    compatibleWith(Constants.PRIVACYKIT_COMPATIBILITY)

    execute {
        IsProFingerprint.method.returnEarly(true)
        IsBlockedFingerprint.method.returnEarly(false)
        GetPlanFingerprint.method.addInstructions(0,
            "sget-object v0, Lcom/sal/privacykit/data/license/LicensePlan;->PRO:Lcom/sal/privacykit/data/license/LicensePlan;\n" +
            "return-object v0"
        )
        GetStateFingerprint.method.addInstructions(0,
            "sget-object v0, Lcom/sal/privacykit/data/license/LicenseState;->ACTIVE:Lcom/sal/privacykit/data/license/LicenseState;\n" +
            "return-object v0"
        )
        LicenseRemotePostFingerprint.method.addInstructions(0,
            "new-instance v0, Lorg/json/JSONObject;\n" +
            "invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V\n" +
            "return-object v0"
        )
        HookEventReportFingerprint.method.addInstructions(0,
            "return-void"
        )
    }
}