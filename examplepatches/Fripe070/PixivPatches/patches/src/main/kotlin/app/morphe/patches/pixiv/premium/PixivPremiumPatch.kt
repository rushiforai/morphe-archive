package app.morphe.patches.pixiv.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

val pixivPremiumPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv Premium Features",
    description = "Unlocks popularity sort sorting (popular_desc) in search, removes mute limits, and emulates client-side Pixiv Premium membership status.",
    default = true
) {
    compatibleWith(
        Compatibility(
            name = "Pixiv",
            packageName = "jp.pxv.android",
            targets = listOf(AppTarget("6.196.0"))
        )
    )

    execute {
        // 1. Hook OAuthUser.l0()Z -> always return true
        val oauthUserClass = mutableClassDefBy("Ljp/pxv/android/domain/auth/entity/OAuthUser;")
        val l0Method = oauthUserClass.methods.first { it.name == "l0" && it.returnType == "Z" }
        l0Method.addInstructions(
            1,
            """
            const/4 v0, 0x1
            return v0
            """.trimIndent()
        )

        // 2. Hook ProfileApiModel.f()Z -> always return true
        val profileApiClass = mutableClassDefBy("Ljp/pxv/android/data/userstate/remote/dto/ProfileApiModel;")
        val fMethod = profileApiClass.methods.first { it.name == "f" && it.returnType == "Z" }
        fMethod.addInstructions(
            1,
            """
            const/4 v0, 0x1
            return v0
            """.trimIndent()
        )
    }
}
