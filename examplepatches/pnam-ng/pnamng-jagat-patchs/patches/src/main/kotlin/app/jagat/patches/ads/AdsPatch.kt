package app.jagat.patches.ads

import app.jagat.patches.shared.Constants.COMPATIBILITY_JAGAT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch

private const val EXTENSION_CLASS = "Lapp/jagat/extension/AdBlocker;"

@Suppress("unused")
val jagatAdBlockPatch = patch(
    name = "Chặn quảng cáo (Block Ads)",
    description = "Triệt tiêu toàn bộ quảng cáo TopOn, ScreenAdActivity, nạp video nền, banner và startup ads trong Jagat.",
    default = true
) {
    compatibleWith(COMPATIBILITY_JAGAT)

    extendWith("extensions/extension.mpe")

    execute {
        // 1. Hook TopOnAdManager (Trình quản lý trung tâm mediation ad của Jagat)
        mutableClassDefByOrNull("Lio/jagat/lite/ad/max/TopOnAdManager;")?.let { adManagerClass ->
            adManagerClass.methods.firstOrNull { it.name == "start" }?.addInstructions(
                0,
                """
                    return-void
                """
            )

            adManagerClass.methods.firstOrNull { it.name == "init" }?.addInstructions(
                0,
                """
                    return-void
                """
            )

            adManagerClass.methods.firstOrNull { it.name == "loadSplashAd" }?.addInstructions(
                0,
                """
                    return-void
                """
            )

            adManagerClass.methods.firstOrNull { it.name == "loadBannerAd" }?.addInstructions(
                0,
                """
                    return-void
                """
            )

            adManagerClass.methods.firstOrNull { it.name == "loadInterstitialAd" }?.addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // 2. Hook ScreenAdActivity (Activity quảng cáo full màn hình)
        mutableClassDefByOrNull("Lio/jagat/lite/ad/ScreenAdActivity;")?.let { screenAdClass ->
            screenAdClass.methods.firstOrNull { it.name == "onCreate" }?.addInstructions(
                0,
                """
                    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                    return-void
                """
            )
        }

        // 3. Hook ScreenAdFetch (Dịch vụ tự động tải ngầm file video quảng cáo)
        mutableClassDefByOrNull("Lio/jagat/lite/ad/ScreenAdFetch;")?.let { fetchClass ->
            fetchClass.methods.firstOrNull { it.name == "checkScreenAd" }?.addInstructions(
                0,
                """
                    return-void
                """
            )

            fetchClass.methods.firstOrNull { it.name == "downloadFileInBackground" }?.addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // 4. Hook AdConfigManager (Cấu hình hiển thị quảng cáo từ server)
        mutableClassDefByOrNull("Lio/jagat/lite/utils/AdConfigManager;")?.let { configClass ->
            configClass.methods.firstOrNull { it.name == "getConfigIsShow" }?.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }

        // 5. Hook UserAdsBannerView & AdsView (View chứa quảng cáo trong User Center)
        mutableClassDefByOrNull("Lio/jagat/lite/usercenter/view/UserAdsBannerView;")?.let { bannerClass ->
            bannerClass.methods.firstOrNull { it.name == "showAds" }?.addInstructions(
                0,
                """
                    const/16 v0, 0x8
                    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V
                    return-void
                """
            )
        }

        mutableClassDefByOrNull("Lio/jagat/lite/usercenter/view/AdsView;")?.let { adsViewClass ->
            adsViewClass.methods.firstOrNull { it.name == "showAd" }?.addInstructions(
                0,
                """
                    const/16 v0, 0x8
                    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V
                    return-void
                """
            )

            adsViewClass.methods.firstOrNull { it.name == "showOperationAd" }?.addInstructions(
                0,
                """
                    const/16 v0, 0x8
                    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V
                    return-void
                """
            )
        }
    }
}
