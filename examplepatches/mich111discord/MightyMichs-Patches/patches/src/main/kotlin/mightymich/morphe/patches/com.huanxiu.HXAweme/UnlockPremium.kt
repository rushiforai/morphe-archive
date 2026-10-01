package mightymich.morphe.patches.com.huanxiu.hxaweme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock SVIP Features",
    description = "Unlocks Huanxiu SVIP by forcing getSvipStatus to return 3 (SVIP).",
    default = true
) {
    compatibleWith(HuanxiuCompatibility.HUANXIU)


    val getSvipStatusFingerprint = Fingerprint(
        name = "getSvipStatus",
        returnType = "I"
    )

    execute {
        getSvipStatusFingerprint.let { fingerprint ->
            val method = fingerprint.method
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x3
                    return v0
                """
            )
        }
    }
}
