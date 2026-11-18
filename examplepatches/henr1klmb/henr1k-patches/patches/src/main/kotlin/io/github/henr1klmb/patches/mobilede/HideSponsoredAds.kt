package io.github.henr1klmb.patches.mobilede

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val RETURN_FALSE = """
    const/4 p0, 0x0
    return p0
"""

private const val RETURN_VOID = "return-void"

@Suppress("unused")
val hideSponsoredAdsPatch = patch(
    name = "Hide sponsored ads",
    description = "Hides sponsored listings, ads, and in-feed ad banners.",
) {
    compatibleWith(MOBILE_DE_COMPATIBILITY)

    execute {
        // Force top-ad and sponsored flags to false on SRP car listings
        SrpListingIsTopAdFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        SrpListingIsTopOfPageAdFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        SrpListingIsOnePageAdFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        MobeeSrpListingItemIsTopAdFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        SrpListingReferenceDataIsSponsoredFingerprint.methodOrNull?.addInstructions(
            0,
            """
                sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object p0
            """.trimIndent(),
        )

        // Neutralize advertisement container and facade ad loading
        AdvertisementContainerLoadPublisherAdFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        DefaultAdvertisingFacadeLoadPublisherAdFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        // Collapse and hide inline advertisement viewholders in search results
        InlineAdvertisementViewHolderBindFingerprint.methodOrNull?.addInstructions(
            0,
            """
                invoke-virtual {p0}, Lde/mobile/android/srp/ui/adapter/InlineAdvertisementViewHolder;->hideAdView()V
                return-void
            """.trimIndent(),
        )
    }
}
