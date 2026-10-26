package app.apppatches.patches.httpmock

import app.apppatches.patches.shared.Constants.HTTPMOCK_COMPATIBILITY
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockVipPatch = bytecodePatch(
    name = "Unlock VIP",
    description = "Forces permanent professional VIP tier, removes ads and upgrade popups, bypasses PairIP.",
    default = true
) {
    compatibleWith(HTTPMOCK_COMPATIBILITY)

    execute {
        val vipConfigClass = classDefBy("Lcom/mock/sample/respository/model/VipConfigModel;")

        listOf(IsVipValidFingerprint, IsPermanentVipValidFingerprint, IsVipUserFingerprint).forEach { fingerprint ->
            fingerprint.match(vipConfigClass).method.apply {
                removeInstructions(0, instructions.count())
                addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            }
        }

        val vipType = vipConfigClass.fields.single { it.name == "vipType" }.type
        GetVipTypeFingerprint.match(vipConfigClass).method.apply {
            removeInstructions(0, instructions.count())
            addInstructions(
                0,
                "sget-object v0, $vipType->PERMANENT:$vipType\nreturn-object v0"
            )
        }

        CheckLicenseFingerprint.match().method.addInstructions(0, "return-void")

        SecurityCheckFingerprint.match().method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
