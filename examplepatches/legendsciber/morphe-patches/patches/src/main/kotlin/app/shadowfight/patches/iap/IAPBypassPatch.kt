package app.shadowfight.patches.iap

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.shadowfight.patches.shared.Constants.COMPATIBILITY_SF2
import app.shadowfight.patches.iap.IAPBypassFingerprint

@Suppress("unused")
val sfIAPBypassPatch = rawResourcePatch(
    name = "Shadow Fight 2 IAP Bypass",
    description = "Bypasses Google Play billing. Intercepts Purchase and triggers OnPurchaseSucceeded directly.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SF2)
    execute {
        val soFile = get("lib/arm64-v8a/libShadowHardcode.so", true)
        val soBytes = IAPBypassSoBytes.part1() + IAPBypassSoBytes.part2()
        soFile.writeBytes(soBytes)
    }
}

@Suppress("unused")
val sfIAPBypassTriggerPatch = bytecodePatch(
    name = "Shadow Fight 2 IAP Bypass Trigger",
    description = "Loads IAP bypass native library.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SF2)
    execute {
        val idx = IAPBypassFingerprint.instructionMatches[0].index + 1
        IAPBypassFingerprint.method.addInstructions(idx, """
            const-string v0, "ShadowHardcode"
            invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
        """.trimIndent())
    }
}
