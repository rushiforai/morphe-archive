package com.bestweb.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

val WEIBO_COMPATIBILITY = app.morphe.patcher.patch.Compatibility(
    packageName = "com.sina.weibo",
    name = "Weibo",
    appIconColor = 0xFF6600,
    targets = listOf(
        app.morphe.patcher.patch.AppTarget(version = "16.9.0")
    )
)

val hideSplashAd = bytecodePatch(
    name = "Hide splash ads",
    description = "Blocks splash/flash ads by finishing the ad activities immediately",
    default = true
) {
    compatibleWith(WEIBO_COMPATIBILITY)

    execute {
        val flashAdActivityFingerprint = Fingerprint(
            definingClass = "Lcom/sina/weibo/mobileads/view/FlashAdActivity;",
            returnType = "V",
            parameters = listOf("Landroid/os/Bundle;")
        )

        flashAdActivityFingerprint.method.apply {
            addInstructions(0, """
                invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                return-void
            """.trimIndent())
        }

        val flashAdAlphaActivityFingerprint = Fingerprint(
            definingClass = "Lcom/sina/weibo/mobileads/view/FlashAdAlphaActivity;",
            returnType = "V",
            parameters = listOf("Landroid/os/Bundle;")
        )

        flashAdAlphaActivityFingerprint.method.apply {
            addInstructions(0, """
                invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                return-void
            """.trimIndent())
        }
    }
}
