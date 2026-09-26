package app.plyrs1.patches.com_ogestudio_strukpertamini

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_STRUKPERTAMINI

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove Ads",
    description = "Removes all banner and interstitial ads by unlocking ad-free premium status and disabling AdMob loaders.",
    default = true
) {
    compatibleWith(COMPATIBILITY_STRUKPERTAMINI)
    dependsOn(brandCreditPatch)

    execute {
        // 1. Force AppPreference.isPremium() to always return true
        AppPreferenceIsPremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // 2. Prevent BillingManager from resetting premium status when no subscription is found
        BillingManagerSetFreeAccountFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // 3. Prevent BannerAdsHelper from requesting or displaying banner ads
        BannerAdsHelperLoadFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/ogestudio/strukpertamini/admob/BannerAdsHelper;->layoutBanner:Landroid/view/ViewGroup;
                if-eqz v0, :cond_skip
                const/16 v1, 0x8
                invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V
                :cond_skip
                return-void
            """
        )

        // 4. Prevent InterstitialHelper from preloading fullscreen ads into memory
        InterstitialHelperLoadFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // 5. Neutralize PairIP / Google Play Integrity license check (LicenseContentProvider & LicenseClient)
        // Returning true from ContentProvider.onCreate() without starting the license check prevents the "Something went wrong" popup.
        LicenseContentProviderOnCreateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        LicenseClientInitializeLicenseCheckFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        LicenseClientStartErrorDialogActivityFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
