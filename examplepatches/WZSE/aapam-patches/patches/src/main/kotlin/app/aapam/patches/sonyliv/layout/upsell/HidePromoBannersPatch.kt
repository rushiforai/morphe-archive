package app.aapam.patches.sonyliv.layout.upsell

import app.aapam.patches.sonyliv.shared.Constants.COMPATIBILITY_SONYLIV
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hidePromoBannersPatch = bytecodePatch(
    name = "Hide promo banners",
    description = "Hides the CleverTap-driven subscribe/premium promo banners and promo trays on " +
        "the home screen. Content rows and CleverTap pop-ups/overlays are not affected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SONYLIV)

    execute {
        // 6.23.1 support: Force the home-screen getters to return null
        val returnNull = """
            const/4 v0, 0x0
            return-object v0
        """
        GetCTListRowDataFingerprint.methodOrNull?.addInstructions(0, returnNull)
        GetCTBannerRowDataFingerprint.methodOrNull?.addInstructions(0, returnNull)

        // 6.29.11+ support: Force empty banner model so isEmpty flag is set true
        GetCTBannerDataV2Fingerprint.methodOrNull?.let { method ->
            val bannerClass = method.returnType
            method.addInstructions(
                0,
                """
                    new-instance v0, $bannerClass
                    const-string v1, ""
                    invoke-direct { v0, v1, v1, v1 }, $bannerClass-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
                    return-object v0
                """,
            )
        }

        // 6.29.11+ support: Immediately hide the CleverTap list row tray
        PopulateCTListTrayV2Fingerprint.methodOrNull?.let { method ->
            val definingClass = method.definingClass
            method.addInstructions(
                0,
                """
                    invoke-virtual { p0 }, $definingClass->h()V
                    return-void
                """,
            )
        }
    }
}
