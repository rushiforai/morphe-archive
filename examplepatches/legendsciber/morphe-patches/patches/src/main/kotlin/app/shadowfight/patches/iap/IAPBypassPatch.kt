package app.shadowfight.patches.iap

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.shadowfight.patches.shared.Constants.COMPATIBILITY_SF2

@Suppress("unused")
val sfIAPBypassSmaliPatch = bytecodePatch(
    name = "Shadow Fight 2 IAP Bypass (Smali)",
    description = "Bypasses in-app purchases via smali patching.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SF2)
    execute {
        IAPBypassLaunchBillingFlowFingerprint.method.addInstructionsWithLabels(0, """
            const/4 v0, 0x0
            return v0
        """.trimIndent())
    }
}
