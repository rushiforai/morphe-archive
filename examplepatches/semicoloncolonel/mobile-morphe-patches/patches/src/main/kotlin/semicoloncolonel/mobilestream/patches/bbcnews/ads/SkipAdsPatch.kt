package semicoloncolonel.mobilestream.patches.bbcnews.ads

import app.morphe.patcher.patch.rawResourcePatch
import semicoloncolonel.mobilestream.patches.bbcnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// ─────────────────────────────────────────────────────────────────────────────
// BBC: World News & Stories 2026.11.0 — Skip ads.
//
// The app is React Native, and its screens are Hermes bytecode (version 98)
// in assets/index.android.bundle. Google Ad Manager draws every display ad in
// a native view that these function components place:
//
//   AdSection            a feed section of type "advertisement"
//   ArticleAdSlot        an ad block in an article
//   BannerAd, NativeAdView
//                        the app's ad views, also used by sections that
//                        carry an ad of their own (adBlock)
//   SponsorAd, CollectionSponsorAd, AdvertisementStory
//                        sponsored cards
//
// Each now renders nothing, so no ad is requested. The ad library's own
// BannerAd and GAMBannerAd are classes, so returning from their constructors
// would not stop React from rendering them; they are reached only through
// the components above.
//
// The feed keeps a section only when COLLECTION_DICTIONARY has a component
// for its type, and the section renderer also returns nothing without one.
// The dictionary's "advertisement" entry (slot 19 of its object literal) now
// holds undefined, so ad sections are dropped and leave no blank, padded
// container behind.
//
// The app has no over-the-air JavaScript updates, so the patched bundle stays
// in use.
// ─────────────────────────────────────────────────────────────────────────────

private const val VERSION = 98

private fun bytes(vararg values: Int) = ByteArray(values.size) { values[it].toByte() }

private val AD_COMPONENTS = listOf(
    "ArticleAdSlot", "NativeAdView", "SponsorAd", "CollectionSponsorAd", "AdvertisementStory",
)

@Suppress("unused")
val skipAdsPatch = rawResourcePatch(
    name = "Skip ads",
    description = "Removes the ads in the news feeds and in articles, and the sponsored cards.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())

        // Three functions are named AdSection. Of the two named BannerAd, the
        // app's own reads preferredWidth; the other is the ad library's class.
        bundle.returnAtStartEvery("AdSection", HermesBundle.Value.NULL)
        bundle.returnAtStart("BannerAd", "preferredWidth", HermesBundle.Value.NULL)
        AD_COMPONENTS.forEach { bundle.returnAtStart(it, HermesBundle.Value.NULL) }

        // In the module that builds COLLECTION_DICTIONARY:
        //   GetByIdShort r33, r33, "default"; PutOwnBySlotIdx r1, r33, 19
        // becomes
        //   LoadConstUndefined r33; Mov r33, r33; PutOwnBySlotIdx r1, r33, 19
        bundle.replaceInstructions(
            "", listOf("COLLECTION_DICTIONARY", "radioSchedulePageSections"), VERSION,
            bytes(0x44, 0x21, 0x21, 0x02, 0x73, 0x52, 0x01, 0x21, 0x13),
            bytes(0x93, 0x21, 0x10, 0x21, 0x21, 0x52, 0x01, 0x21, 0x13),
        )

        file.writeBytes(bundle.toByteArray())
    }
}
