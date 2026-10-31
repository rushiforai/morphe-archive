package app.aapam.patches.mygate.plan

import app.aapam.patches.mygate.shared.Constants
import app.aapam.patches.mygate.shared.FlatGetHomePageEnableAdSdkFingerprint
import app.aapam.patches.mygate.shared.FlatGetNotificationEnableAdSdkFingerprint
import app.aapam.patches.mygate.shared.FlatGetProductPackageFingerprint
import app.aapam.patches.mygate.shared.FlatGetSocietyPlanFingerprint
import app.aapam.patches.mygate.shared.FloatingBannerAdLoadFingerprint
import app.aapam.patches.mygate.shared.FloatingBannerAdShowFingerprint
import app.aapam.patches.mygate.shared.FloatingBannerSetupDataFingerprint

import app.aapam.patches.mygate.shared.MygateAdLoaderGetAdDataFingerprint
import app.aapam.patches.mygate.shared.MygateAdLoaderGetMultiAdDataFingerprint
import app.aapam.patches.mygate.shared.MygateAdLoaderLoadAdFingerprint
import app.aapam.patches.mygate.shared.MygateAdLoaderLoadImageAdFingerprint
import app.aapam.patches.mygate.shared.MygateAdLoaderLoadMastheadFingerprint
import app.aapam.patches.mygate.shared.MygateAdSdkGetBaseUrlFingerprint
import app.aapam.patches.mygate.shared.MygateAdSdkGetMetricBaseUrlFingerprint
import app.aapam.patches.mygate.shared.NotificationEngineGetAdCreativeFingerprint
import app.aapam.patches.mygate.shared.PremiumPlanCheckFingerprint
import app.aapam.patches.mygate.shared.SocietyPlanGetCodeFingerprint
import app.aapam.patches.mygate.shared.SocietyPlanGetNameFingerprint
import app.aapam.patches.mygate.shared.UserInfoPojoTempGetAdTierLabelFingerprint
import app.aapam.patches.mygate.shared.UserInfoPojoTempGetHomePageEnableAdSdkFingerprint
import app.aapam.patches.mygate.shared.UserInfoPojoTempGetNotificationEnableAdSdkFingerprint
import app.aapam.patches.mygate.shared.UserInfoPojoTempGetProductPackageFingerprint
import app.aapam.patches.mygate.shared.UserInfoPojoTempGetSocietyHighestPlanFingerprint
import app.aapam.patches.mygate.shared.UserInfoPojoTempGetSocietyPlanFingerprint
import app.aapam.patches.mygate.shared.UserInfoPojoTempGetUserPlanFingerprint
import app.aapam.patches.mygate.shared.UserProfileGetAdTierLabelFingerprint
import app.aapam.patches.mygate.shared.UserProfileGetCombinedPlanFingerprint
import app.aapam.patches.mygate.shared.UserProfileGetSocietyHighestPlanFingerprint
import app.aapam.patches.mygate.shared.UserProfileGetUserPlanFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPlanPatch = bytecodePatch(
    name = "Unlock Premium Plan",
    description = "Enables premium resident status and removes promotional banners.",
) {
    compatibleWith(Constants.COMPATIBILITY_MYGATE)

    execute {
        // --- Tier 1: Core Gatekeeper ---
        // Return true (0x1) immediately at the start of KotlinUtils.Companion.u()Z
        PremiumPlanCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // --- Tier 2: Plan Code & UserProfile Resolvers ---
        // SocietyPlan.getCode() -> "SOCIETY_PREMIUM_PLAN"
        SocietyPlanGetCodeFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "SOCIETY_PREMIUM_PLAN"
                return-object v0
            """,
        )

        // SocietyPlan.getName() -> "Premium Plan"
        SocietyPlanGetNameFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "Premium Plan"
                return-object v0
            """,
        )

        // UserProfile.getCombinedUserPlanStatus() -> "SOCIETY_PREMIUM_PLAN"
        UserProfileGetCombinedPlanFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "SOCIETY_PREMIUM_PLAN"
                return-object v0
            """,
        )

        // UserProfile.getAdTierLabel() -> "Premium"
        UserProfileGetAdTierLabelFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "Premium"
                return-object v0
            """,
        )

        // UserProfile.getUserPlan() -> always ensure non-null SocietyPlan
        UserProfileGetUserPlanFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserProfile;->userPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                if-nez v0, :cond_has_user_plan
                new-instance v0, Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                invoke-direct {v0}, Lcom/mygate/user/modules/flats/entity/SocietyPlan;-><init>()V
                iput-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserProfile;->userPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                :cond_has_user_plan
                return-object v0
            """,
        )

        // UserProfile.getSocietyHighestPlan() -> always ensure non-null SocietyPlan
        UserProfileGetSocietyHighestPlanFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserProfile;->societyHighestPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                if-nez v0, :cond_has_soc_plan
                new-instance v0, Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                invoke-direct {v0}, Lcom/mygate/user/modules/flats/entity/SocietyPlan;-><init>()V
                iput-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserProfile;->societyHighestPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                :cond_has_soc_plan
                return-object v0
            """,
        )

        // Flat.getProductPackage() -> "PREMIUM"
        FlatGetProductPackageFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "PREMIUM"
                return-object v0
            """,
        )

        // Flat.getHomePageEnableAdSdk() -> "0"
        FlatGetHomePageEnableAdSdkFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "0"
                return-object v0
            """,
        )

        // Flat.getNotificationEnableAdSdk() -> "0"
        FlatGetNotificationEnableAdSdkFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "0"
                return-object v0
            """,
        )

        // Flat.getSocietyPlan() -> ensure non-null SocietyPlan
        FlatGetSocietyPlanFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/mygate/user/modules/flats/entity/Flat;->societyPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                if-nez v0, :cond_has_flat_soc_plan
                new-instance v0, Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                invoke-direct {v0}, Lcom/mygate/user/modules/flats/entity/SocietyPlan;-><init>()V
                iput-object v0, p0, Lcom/mygate/user/modules/flats/entity/Flat;->societyPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                :cond_has_flat_soc_plan
                return-object v0
            """,
        )

        // UserInfoPojoTemp.getAdTierLabel() -> "Premium"
        UserInfoPojoTempGetAdTierLabelFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "Premium"
                return-object v0
            """,
        )

        // UserInfoPojoTemp.getHomePageEnableAdSdk() -> "0"
        UserInfoPojoTempGetHomePageEnableAdSdkFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "0"
                return-object v0
            """,
        )

        // UserInfoPojoTemp.getNotificationEnableAdSdk() -> "0"
        UserInfoPojoTempGetNotificationEnableAdSdkFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "0"
                return-object v0
            """,
        )

        // UserInfoPojoTemp.getProductPackage() -> "PREMIUM"
        UserInfoPojoTempGetProductPackageFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "PREMIUM"
                return-object v0
            """,
        )

        // UserInfoPojoTemp.getSocietyPlan() -> ensure non-null SocietyPlan
        UserInfoPojoTempGetSocietyPlanFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;->societyPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                if-nez v0, :cond_has_temp_soc_plan
                new-instance v0, Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                invoke-direct {v0}, Lcom/mygate/user/modules/flats/entity/SocietyPlan;-><init>()V
                iput-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;->societyPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                :cond_has_temp_soc_plan
                return-object v0
            """,
        )

        // UserInfoPojoTemp.getUserPlan() -> ensure non-null SocietyPlan
        UserInfoPojoTempGetUserPlanFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;->userPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                if-nez v0, :cond_has_temp_user_plan
                new-instance v0, Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                invoke-direct {v0}, Lcom/mygate/user/modules/flats/entity/SocietyPlan;-><init>()V
                iput-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;->userPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                :cond_has_temp_user_plan
                return-object v0
            """,
        )

        // UserInfoPojoTemp.getSocietyHighestPlan() -> ensure non-null SocietyPlan
        UserInfoPojoTempGetSocietyHighestPlanFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;->societyHighestPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                if-nez v0, :cond_has_temp_high_plan
                new-instance v0, Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                invoke-direct {v0}, Lcom/mygate/user/modules/flats/entity/SocietyPlan;-><init>()V
                iput-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;->societyHighestPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                :cond_has_temp_high_plan
                return-object v0
            """,
        )


        // --- Tier 3: Client-side Ad Suppression ---
        // Point base ad URLs to localhost sinkhole so network requests fail immediately
        MygateAdSdkGetBaseUrlFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "http://127.0.0.1:9/"
                return-object v0
            """,
        )

        MygateAdSdkGetMetricBaseUrlFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "http://127.0.0.1:9/"
                return-object v0
            """,
        )

        // MygateAdLoader single ad request -> no-op
        MygateAdLoaderGetAdDataFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        // MygateAdLoader multi ad request -> no-op
        MygateAdLoaderGetMultiAdDataFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        // MygateAdLoader scratch/image ad load -> no-op
        MygateAdLoaderLoadAdFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        // MygateAdLoader global masthead ad load -> no-op
        MygateAdLoaderLoadMastheadFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        // MygateAdLoader image ad load -> no-op
        MygateAdLoaderLoadImageAdFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        // FloatingBannerAdHandler loadAd -> no-op
        FloatingBannerAdLoadFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        // FloatingBannerAdHandler showAd -> no-op
        FloatingBannerAdShowFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        // FloatingBannerAdHandler setupData -> no-op
        FloatingBannerSetupDataFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        // NotificationEngine approval alert / creative request -> no-op
        NotificationEngineGetAdCreativeFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )
    }
}
