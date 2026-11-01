package patches.detijd

import app.morphe.patcher.patch.resourcePatch

// Every byte range is pinned to the publisher bundle, its function header and
// function digest. Padding ends at an original instruction boundary.
internal val adsEdits = listOf(
    HermesEdit("insertVideoAd", 21474, 5705004, 180, 20, 2,
        "07a483df254740d55f906b2864e915bb73f9e0cc4635a4a750d40ae1e4cdad67",
        "89040144050400b4", "8900017600000000"),
    HermesEdit("insertBlogVideoAd", 21475, 5705184, 115, 18, 2,
        "860d26f4c73cab5175d198be5b7c4abcaa7c53eb1aaaeaf6179851e2978b02cf",
        "89020144030200b4", "8900017600000000"),
    HermesEdit("insertBillboardAd", 21476, 5705299, 225, 28, 2,
        "ca9d6a5f3fe90067be80c7f4ae0c2446d7985736f512d18c464bfc1367b1b572",
        "340d00890b01", "890001760000"),
    HermesEdit("insertAdsIntoFeed", 21452, 5703974, 252, 19, 2,
        "600b6ed7b4aeeae998a508ae34eb7d1d09b66a150afbd38b356eedb1a9a3f9cb",
        "340500890201", "890001760000"),
    HermesEdit("getVideoAdLink", 21453, 5704226, 433, 29, 6,
        "8e46782eea6684f71ad205d8a61ce1c72f995b8bb60a0f13ba14f0b3da4a3152",
        "3404003b070406", "9000da55760000"),
    HermesEdit("function 21170", 21170, 5674472, 1123, 48, 2,
        "de849628755e47eda7838dccb5705479e6b015bbf0bc40b912b42448e80c3dd2",
        "410c05000000", "940076000000"),
    HermesEdit("NativeAd", 24506, 6075714, 1332, 37, 2,
        "d4bca72ea8d77dd734d99ea7281a029f3d66462fe4b51bb76e011a939d9ed377",
        "340600400313", "940076000000"),
    HermesEdit("OutstreamVideo", 21484, 5706648, 1450, 48, 2,
        "da55c9617ef88ccb7444b4a8b048b2cd5ffd6eb1101953f123b1644a4f786f37",
        "340800890b01", "940076000000"),
    HermesEdit("function 3481", 3481, 3969465, 921, 21, 8,
        "368752c00b5ea66f0cb94b1a632e5656eeacadeace1ef1cda78fad1c2f431957",
        "40010f890402", "940076000000"),
)

// Keep AsyncSpawn and CreateGenerator wrappers intact. The three async
// callbacks mark their own state completed (3), then return the same iterator
// result shapes used by their original done paths: undefined for Snowplow,
// false for Mux consent, and an empty mapped keyword string for Admantx.
// The Airship screen-name path in fn36181 remains intact.
internal val trackingEdits = listOf(
    HermesEdit("trackSelfDescribingEvent", 15520, 5221651, 143, 19, 3,
        "d138b258e82ceef43c34f153483fb8dbfe38fd890028b3fd2c34fde36b2fef31",
        "340200890101", "930076000000"),
    HermesEdit("trackStruckEvent", 15521, 5221794, 154, 20, 4,
        "c0578a55cf198d8d8a5a7ce02b3706014e5e7b01233a2b0426ec6d15c082a403",
        "340200890101", "930076000000"),
    HermesEdit("updateScrollTracking", 15522, 5221948, 31, 13, 2,
        "efd0f8b8a2c3c4ea0afb30be7843c280ead7bba64184791c2bc8f244aa74d3ba",
        "3401003b03010e", "93007600000000"),
    HermesEdit("trackOnAppOpenWhenConsented", 36453, 7506965, 49, 11, 1,
        "d3bd79fd4f333f0005ef35252fb12ba1ccebfca689cafc817c4f863267880d86",
        "3401003b010103", "93007600000000"),
    HermesEdit("?anon_0_initSnowplowTracker", 36180, 7471886, 751, 25, 2,
        "0129791adbc19c74bc0795e08722b803495663ff1739d42c03d51a1072da9035",
        "3401003b0001041002008b0402d4d00200000004890002", "3400008b0103390004010200880900001be90100760000"),
    HermesEdit("?anon_0_muxConsentEnabled", 37219, 7564304, 534, 26, 1,
        "b849b08b48c926037be5816920c4f2638ac7ce418c060146601472f5cb309cd9",
        "3401003b0001041002008b0402d4f70100000004", "3400008b01033900040101008809c90076000000"),
    HermesEdit("?anon_0_t1", 38541, 7766607, 442, 24, 1,
        "647937e1da4421dc1256ea0aea4ce15617d2104c54d277fa9d81e9d76f182255",
        "3401003b0001031002008b0402d49b01000000048900028903011005028b0603", "3400008b010339000301020088090000261201009001da555200010076000000"),
)

internal val premiumEdits = listOf(
    HermesEdit("useServiceBannerIsVisible", 16246, 5304832, 256, 21, 1,
        "a47949be08986babf3d494cbf561ae23ec4257e52bab260747c9fa0abb14691e",
        "3404003b050400", "96007600000000"),
)

// Fn17047 and fn34405 share the same body offset. One edit suppresses both
// automatic setupUI callers. The manual privacy settings flow stays available.
internal val consentEdits = listOf(
    HermesEdit("_temp", 17047, 5367592, 27, 11, 1,
        "d1373700c9752e41e10bb68a70728f177a94d9490ba81f99083c96fc78ed09f6",
        "3401003b010102", "93007600000000"),
    HermesEdit("?anon_0_shouldShowAppTracking", 37795, 7639756, 550, 25, 1,
        "62a471c3fb92d342f9caa6d7c8d151108d8c8fccdcc11846abc1513ed50497b2",
        "3401003b0001051002008b0402d4070200000004", "3400008b01033900050101008809c90076000000"),
)

// Only the RootNavigator selector changes; stored account, subscription,
// first-launch and consent fields are never written by this policy.
internal val onboardingEdits = listOf(
    HermesEdit("_temp", 16251, 5305571, 11, 1, 2,
        "ecfb7e993c7c66ded6a718f8d932b7dfc81f97b7a4cae27480035d53ec447d2f",
        "89000145000000129e", "960076000000000000"),
)

// Preserve the original anonymous/subscribed requests and hasAccess result.
// Only this presentation predicate changes; the server response is untouched.
internal val articleEdits = listOf(
    HermesEdit("shouldShowPaywall", 25249, 6236057, 115, 7, 3,
        "5daa9c80642cd4d4f62d37199d3d7447c9f9d3def87013ac34d9664d05dc6c50",
        "890502b01d05", "960176010000"),
    // This feed is already fetched through the normal API. Skip only its
    // login/marketing-offer presentation gate; retain empty/weekend handling.
    HermesEdit("Moments delivered-feed presentation", 23982, 5943196, 1556, 32, 1,
        "a4a806637b426ed68ab70394b607cdaf6244d56c25ced7037b9dc3b8584783d8",
        "340700400b093b06070144060600048b002393016e080601003b06070b4506060121946c060601440a060246370b000a45110603b764370b01114509060468a43b06070c4506060541a8940316020a03930cb01702450d0a060ba516020d03930cb00802440c0d07b413020c130202b206021302096e06060102440e06024645100603b764370b02103b0607044506060815a86c060601440906093f3b0607124406060af16c0f06013b060702440c060bf66e150c0103370b0315440c060bf66e0c0c0101370b040c3b0c0703450d0c0c25616e0d0d01155e0d0800d50a0d0a5e120801ae17840d0b348297006108000a8b00016108000d10120d16020a039314b0080244140a0d515e0d0802d50a0d145e0d0803ae1b081301005a1314008b0002610800148b000361080013100d134406060ef56f060601120d5e060804d51206115e060805d50a06105e0d0806ae1f84060b35828b0004610800118b0005610800108b000661080006100d063b0607114510060f87966e1010010d4511101084964510101109664506061269a76e0606010d5e060807d512060f5e060808d50a06095e0d0809ae293b060715440606137f6f0606010f098b00076108000f8b0008610800098b000961080006100d063b06070e45060614ec716c0906013b06070d45060615b56a6c060601440606024616020a03930fb0170245120a060ba516021203930fb00802440f1207b413020fb0060f13020e390b050216040a03930fb0170445120a060ba516041203930fb00804440f1207b413040fb0090f13050e130405390b06043b0e070f45120e16c36e3b0f07186e1212010f370b0712450f0e16c36e3b0e07196e130f010e370b08135e0e080ad52a0e025e0e080bd5220e045e0e080cd51a0e135e0e080dd5120e125e0e080ed50a0e0a5e0e080fae34840f0b36828b000a610800028b000b610800048b000c610800138b000d610800128b000e6108000a8b000f6108000f100e0f450c0c174f596e0c0c010eb1ec02000004b39b02000009b19502000006",
        "340700400b093b06070144060600048b002393016e080601003b06070b4506060121946c060601440a060246370b000a45110603b764370b01114509060468a43b06070c4506060541a8940316020a03930cb01702450d0a060ba516020d03930cb00802440c0d07b413020c130202b206021302096e06060102440e06024645100603b764370b02103b0607044506060815a86c060601440906093f3b0607124406060af16c0f06013b060702440c060bf66e150c0103370b0315440c060bf66e0c0c0101370b040c3b0c0703450d0c0c25616e0d0d01155e0d0800d50a0d0a5e120801ae17840d0b348297006108000a8b00016108000d10120d16020a039314b0080244140a0d515e0d0802d50a0d145e0d0803ae1b081301005a1314008b0002610800148b000361080013100d134406060ef56f060601120d5e060804d51206115e060805d50a06105e0d0806ae1f84060b35828b0004610800118b0005610800108b000661080006100d063b0607114510060f87966e1010010d4511101084964510101109664506061269a76e0606010d5e060807d512060f5e060808d50a06095e0d0809ae293b060715440606137f6f0606010f098b00076108000f8b0008610800098b000961080006100d063b06070e45060614ec716c0906013b06070d45060615b56a6c060601440606024616020a03930fb0170245120a060ba516021203930fb00802440f1207b413020fb0060f13020e390b050216040a03930fb0170445120a060ba516041203930fb00804440f1207b413040fb0090f13050e130405390b06043b0e070f45120e16c36e3b0f07186e1212010f370b0712450f0e16c36e3b0e07196e130f010e370b08135e0e080ad52a0e025e0e080bd5220e045e0e080cd51a0e135e0e080dd5120e125e0e080ed50a0e0a5e0e080fae34840f0b36828b000a610800028b000b610800048b000c610800138b000d610800128b000e6108000a8b000f6108000f100e0f450c0c174f596e0c0c010eb1ec02000004af0c00000000000000000000"),
)

internal val allHermesEdits: List<HermesEdit> = adsEdits + trackingEdits + premiumEdits + consentEdits + onboardingEdits + articleEdits + accountTabEdits + newspaperShortcutEdits

@Suppress("unused")
val hideAds = resourcePatch(
    name = "Hide ads",
    description = "Suppresses the inventoried native, banner and outstream ad hosts and client ad insertion.",
) {
    dependsOn(originalInput, nativeAds)
    compatibleWith(detijd)
    execute { patchHermes(get("assets/index.android.bundle"), adsEdits) }
}

@Suppress("unused")
val disableTracking = resourcePatch(
    name = "Disable tracking",
    description = "Stops inventoried Gemius, Snowplow, Firebase, Admantx and Mux measurement while preserving account and push initialization.",
) {
    dependsOn(originalInput, nativeTracking, hideAds)
    compatibleWith(detijd)
    execute { patchHermes(get("assets/index.android.bundle"), trackingEdits) }
}

@Suppress("unused")
val hidePremiumBanner = resourcePatch(
    name = "Hide Premium banner",
    description = "Hides the service banner and automatic in-app promotions while preserving push notifications and account access.",
) {
    dependsOn(originalInput, nativePromotions)
    compatibleWith(detijd)
    execute { patchHermes(get("assets/index.android.bundle"), premiumEdits) }
}

@Suppress("unused")
val skipConsentScreens = resourcePatch(
    name = "Skip consent screens",
    description = "Skips automatic consent UI and the tracking explainer without granting consent or changing saved choices.",
) {
    dependsOn(originalInput, disableTracking)
    compatibleWith(detijd)
    execute { patchHermes(get("assets/index.android.bundle"), consentEdits) }
}

@Suppress("unused")
val skipOnboarding = resourcePatch(
    name = "Skip onboarding",
    description = "Opens the app navigator directly, preserving anonymous account and subscription state.",
) {
    dependsOn(originalInput)
    compatibleWith(detijd)
    execute { patchHermes(get("assets/index.android.bundle"), onboardingEdits) }
}

@Suppress("unused")
val readFullArticles = resourcePatch(
    name = "Read full articles",
    description = "Displays delivered article paragraphs and the De essentie feed without changing account state or normal access requests.",
) {
    dependsOn(originalInput, hideAds)
    compatibleWith(detijd)
    execute { patchHermes(get("assets/index.android.bundle"), articleEdits) }
}
