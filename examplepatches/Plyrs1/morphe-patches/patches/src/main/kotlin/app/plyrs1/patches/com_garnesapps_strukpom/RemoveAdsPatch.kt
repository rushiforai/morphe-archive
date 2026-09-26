package app.plyrs1.patches.com_garnesapps_strukpom

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_STRUKPOM

@Suppress("unused")
val removeAllAdsPatch = bytecodePatch(
    name = "Remove All Ads",
    description = "Disables all AdMob preloading, bypasses interstitial ads, and auto-removes the watermark on receipt screens without user interaction.",
    default = true
) {
    compatibleWith(COMPATIBILITY_STRUKPOM)
    dependsOn(brandCreditPatch)

    execute {
        // 1. Short-circuit background ad preloading in MyApplication
        AdPreloadFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // 2. Bypass interstitial ad in PomActivity.showInter(i, str, str2) -> call goAs directly
        PomActivityShowInterFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "sudah"
                invoke-virtual {p0, p1, p2, p3, v0}, Lcom/garnesapps/strukpom/PomActivity;->goAs(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
                return-void
            """
        )

        // 3. Bypass interstitial ad in StrukActivity.showInter(i) -> call goAs directly
        StrukActivityShowInterFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "sudah"
                invoke-virtual {p0, p1, v0}, Lcom/garnesapps/strukpom/StrukActivity;->goAs(ILjava/lang/String;)V
                return-void
            """
        )

        // 4. Bypass interstitial ad in HistoriActivity.showInter(i, i2) -> call goAs directly
        HistoriActivityShowInterFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "sudah"
                invoke-virtual {p0, p1, p2, v0}, Lcom/garnesapps/strukpom/HistoriActivity;->goAs(IILjava/lang/String;)V
                return-void
            """
        )

        // 5. Force hadiah = "sudah" in all goAs methods
        PomActivityGoAsFingerprint.method.addInstructions(
            0,
            """
                const-string p4, "sudah"
            """
        )

        StrukActivityGoAsFingerprint.method.addInstructions(
            0,
            """
                const-string p2, "sudah"
            """
        )

        HistoriActivityGoAsFingerprint.method.addInstructions(
            0,
            """
                const-string p3, "sudah"
            """
        )

        // 6. Auto-remove watermark: hide the hapus view during onCreate().
        //    loadBanner() is called from every activity's onCreate() after binding
        //    is initialized. Receipt activities (Format1-9, Custom1-3) contain the
        //    hapus view; other activities do not, so check for null.
        //    R.id.hapus = 0x7f0a014b, View.GONE = 8
        LoadBannerFingerprint.matchAllOrNull()?.forEach { match ->
            match.method.addInstructions(
                0,
                """
                    const v0, 0x7f0a014b
                    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                    move-result-object v1
                    if-nez v1, :cond_hide
                    return-void
                    :cond_hide
                    const/16 v2, 0x8
                    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V
                    return-void
                """
            )
        }
    }
}
