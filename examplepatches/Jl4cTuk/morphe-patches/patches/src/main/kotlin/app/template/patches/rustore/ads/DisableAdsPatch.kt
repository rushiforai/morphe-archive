package app.template.patches.rustore.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.all.analytics.childrenNamed
import app.template.patches.all.analytics.disableComponentsByPrefix
import app.template.patches.all.analytics.removeChildren
import app.template.patches.rustore.loyalty.disableLoyaltyProgram
import app.template.patches.rustore.navigation.hideFeaturedAndGamesTabs
import app.template.patches.rustore.notifications.hideNotificationButtons
import app.template.patches.rustore.shared.Constants.COMPATIBILITY_RUSTORE
import org.w3c.dom.Element
import java.util.logging.Logger

private val logger = Logger.getLogger("DisableRuStoreAds")
private const val NULL_ADVERTISING_ID = "00000000-0000-0000-0000-000000000000"

private val disableRuStoreAdvertisingManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_RUSTORE)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val adIdPermissions = manifest
                .childrenNamed("uses-permission", "uses-permission-sdk-23")
                .filter {
                    it.getAttribute("android:name") ==
                        "com.google.android.gms.permission.AD_ID"
                }
            manifest.removeChildren(adIdPermissions)

            val application = manifest.childrenNamed("application").single() as Element
            val disabledComponents = application.disableComponentsByPrefix(
                "com.my.target.",
                "com.inappstory.sdk.",
            )
            logger.info(
                "Removed ${adIdPermissions.size} AD_ID permissions and disabled " +
                    "$disabledComponents advertising components",
            )
        }
    }
}

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description =
        "Removes advertisements and search recommendations, clears advertising " +
            "identifiers, keeps advertising consent disabled, and removes the " +
            "unsolicited VK ID prompt, with options for additional interface cleanup.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)
    dependsOn(disableRuStoreAdvertisingManifestPatch)

    val disableLoyaltyProgramOption by booleanOption(
        key = "disableLoyaltyProgram",
        default = true,
        title = "Disable loyalty program",
        description =
            "Disables loyalty onboarding, points, notifications, links, and " +
                "cashback banners.",
    )
    val hideFeaturedAndGamesTabsOption by booleanOption(
        key = "hideFeaturedAndGamesTabs",
        default = true,
        title = "Hide Featured and Games tabs",
        description = "Removes the Featured and Games tabs and opens Apps by default.",
    )
    val hideNotificationButtonsOption by booleanOption(
        key = "hideNotificationButtons",
        default = true,
        title = "Hide notification buttons",
        description = "Removes notification buttons from the search bar and Mine screen.",
    )

    execute {
        AdvertisementIdsConstructorFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                """
                    const-string p1, "$NULL_ADVERTISING_ID"
                    const-string p2, "$NULL_ADVERTISING_ID"
                    const/4 p3, 0x0
                    const/4 p4, 0x0
                    const/4 p5, 0x0
                """.trimIndent(),
            )

        AdvertisingSettingConstructorFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "const/4 p6, 0x0")

        AdvertisingAgreementSettingConstructorFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "const/4 p3, 0x0")

        GoogleAdvertisingIdInfoConstructorFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                """
                    const-string p1, "$NULL_ADVERTISING_ID"
                    const/4 p2, 0x1
                """.trimIndent(),
            )

        GoogleAdvertisingIdLookupFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                """
                    new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;
                    const-string v1, "$NULL_ADVERTISING_ID"
                    const/4 v2, 0x1
                    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;-><init>(Ljava/lang/String;Z)V
                    return-object v0
                """.trimIndent(),
            )

        GoogleAdvertisingIdInternalLookupFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                """
                    new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;
                    const-string v1, "$NULL_ADVERTISING_ID"
                    const/4 p0, 0x1
                    invoke-direct {v0, v1, p0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;-><init>(Ljava/lang/String;Z)V
                    return-object v0
                """.trimIndent(),
            )

        GoogleAdvertisingIdDebugLookupFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """.trimIndent(),
            )

        MyTargetAutoInitFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """.trimIndent(),
            )

        InAppStoryInitializerFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                """
                    sget-object v0, Lut0/e0;->a:Lut0/e0;
                    return-object v0
                """.trimIndent(),
            )

        RawAdvertisementRepoGetFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                """
                    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                    move-result-object v0
                    return-object v0
                """,
            )

        PersonalRecommendationAdvertisementRepoGetFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                """
                    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                    move-result-object v0
                    check-cast v0, Ljava/io/Serializable;
                    return-object v0
                """,
            )

        PromoRepositoryGetFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                """
                    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                    move-result-object v0
                    check-cast v0, Ljava/io/Serializable;
                    return-object v0
                """,
            )

        SearchZeroContentConstructorFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(
                0,
                """
                    const/4 p1, 0x0
                    const/4 p2, 0x0
                    const/4 p4, 0x0
                """,
            )

        if (disableLoyaltyProgramOption != false) {
            disableLoyaltyProgram()
        }
        if (hideFeaturedAndGamesTabsOption != false) {
            hideFeaturedAndGamesTabs()
        }
        if (hideNotificationButtonsOption != false) {
            hideNotificationButtons()
        }
    }
}
