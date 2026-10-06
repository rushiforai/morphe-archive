package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SOFASCORE = Compatibility(
        name = "Sofascore", // App name as it appears in the Android launcher.
        packageName = "com.sofascore.results",
        apkFileType = ApkFileType.APK, // Preferred or recommended file type.
        appIconColor = 0x384CF4, // Icon color in Morphe Manager.
        targets = listOf(
            // "version = null" means the patch works with the latest app target
            // and is expected to work with all future app targets.
            //
            // It is highly recommended to always include the exact app version you developed your patches for
            // or the last version you have confirmed as 100% working.
            AppTarget(
                version = "26.07.27"
            ),
            // Verified 2026-09-17: 26.08.24 (the build users reported failing with a
            // NullPointerException in Disable telemetry - issue #7) patches cleanly with all
            // 5 patches. The crash came from returnEarly() being applied to an abstract
            // AppsFlyerLib.logEvent declaration; the fingerprint now requires an actual
            // method body, and the emitted bytecode was checked on this version.
            AppTarget(
                version = "26.08.24"
            ),
            // Verified 2026-09-17 against com.sofascore.results 26.09.07 (versionCode 260907002,
            // universal, Android 12L+). This build shuffled a lot: the app-level premium gates
            // the old "Enable Premium" fingerprints targeted (aiInsights/removeAds/PremiumToken/
            // isPremium) are gone, FirebaseAnalytics.logEvent was removed, Adjust is no longer
            // bundled and the Facebook/Crashlytics SDK classes are R8-renamed. The patches were
            // re-anchored:
            //   - Disable ads: unchanged; UserAccount getForceAds/getForceHideAds/getHasServerAds
            //     are still unobfuscated.
            //   - Enable Premium: forces UserAccount.getHasPremium() and ProfileData.getHasPremium(),
            //     the two boxed-Boolean flags every premium gate reads.
            //   - Disable telemetry: AppsFlyer Lib subclass logEvent, AppMeasurementSdk.logEvent,
            //     and Crashlytics (located via its collection-enabled SharedPreferences key).
            //   - Disable Facebook SDK: AudienceNetworkContentProvider onCreate only, plus
            //     manifest flags disabling FB auto-log/advertiser-ID. FacebookInitProvider
            //     must NOT be killed: the login screen builds FB Login handlers and crashes
            //     with "SDK has not been initialized" without sdkInitialize() (issue #24,
            //     fixed 2026-09-30; verified on 26.09.14).
            // The "Block marketing notifications" patch dismisses two in-app promo
            // sheets only; it cannot affect push. Missing match alerts on re-signed
            // builds traced to push delivery itself (issue #25): without Play Services,
            // FCM registration needs MicroG integration + signature spoofing.
            //   - Block marketing notifications: PromotionModal / tennis promo bottom sheet
            //     onViewCreated dismiss the sheet before it renders.
            // The "Disable Play Integrity" patch was dropped: this build does not bundle the
            // Play Integrity classes (the AppsFlyer SDK only references them, behind a catch),
            // so the patch had nothing to patch.
            // All 5 patches apply cleanly; SofascoreSmokeTest asserts the emitted bytecode.
            // Re-verified 2026-09-28 against 26.09.14 (versionCode 260914002, from
            // APKMirror): all 5 patches apply unchanged and the decompiled output shows
            // the same forced values (getHasPremium -> TRUE, ad flags false).
            AppTarget(
                version = "26.09.07",
                versionCode = 260907002
            ),
            AppTarget(
                version = "26.09.14",
                versionCode = 260914002
            )
        )
    )

    // FotMob phone build. Note the Wear OS build shares the same package and its versions
    // look like "236.253021660w..."; the APKPure/APKMirror *latest* lookups sometimes return
    // the watch APK, so always check android.hardware.type.watch before using an APK.
    // Verified 2026-09-17 against 236.17398.20260827 (versionCode 17398) and
    // 236.17338.20260822 (the build from issue #8) from APKMirror; both patch cleanly.
    // The subscription manager is R8-obfuscated; the patch anchors it on the staff-account
    // email strings and identifies the subscription getter structurally (see
    // fotmob/plus/Fingerprints.kt), so obfuscated name rotation no longer breaks it.
    // Verified 2026-09-18 against 237.17536.20260911 (versionCode 17536, the current APKMirror
    // phone build). This release swapped the storage layer under the getter (236 read
    // SharedPreferencesRepository.get(Z), 237 goes through a settings holder), so the getter
    // search is now storage-agnostic: the manager's only non-constant no-arg boolean method
    // that does not hold the staff email. Both old 236 targets were re-checked and still pass.
    val COMPATIBILITY_FOTMOB = Compatibility(
        name = "FotMob",
        packageName = "com.mobilefootie.wc2010",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00985F,
        targets = listOf(
            AppTarget(
                version = "237.17536.20260911",
                versionCode = 17536
            ),
            AppTarget(
                version = "236.17398.20260827",
                versionCode = 17398
            ),
            AppTarget(
                version = "236.17338.20260822",
                versionCode = 17338
            )
        )
    )

    // Verified 2026-09-18 against com.myfitnesspal.android 26.37.0 (versionCode 51401) from
    // APKPure. 26.37.0 removed the old local `SubscriptionPreferences.getPremiumPlusEnabled`
    // gate; premium is now server-driven through queryenvoy `FeatureState` objects
    // (feature + entitlement + tier). The patch overrides the two enum-companion parsers
    // (Entitlement -> Entitled, Tier -> PremiumPlus), which is the single conversion point
    // for every feature state deserialized from the server.
    // Re-verified 2026-09-28 against 26.38.0 (versionCode 51448) from APKPure: the same
    // companion parsers still match and the patched output returns Entitled/PremiumPlus.
    val COMPATIBILITY_MYFITNESSPAL = Compatibility(
        name = "MyFitnessPal",
        packageName = "com.myfitnesspal.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0072BC,
        targets = listOf(
            AppTarget(version = "26.37.0", versionCode = 51401),
            AppTarget(version = "26.38.0", versionCode = 51448)
        )
    )

    // Verified 2026-09-18 against club.boxbox.android 5.4.9 (versionCode 251, the current
    // APKMirror build) from APKMirror. The telemetry and interstitial patches used to call
    // returnEarly() on the first fingerprint match only - on 5.4.9 that hit an abstract
    // AppsFlyer declaration (patcher NPE) and the overridden showAd overload, leaving the
    // terminal showAd(String, String, Activity) alive. Both now patch every concrete match
    // by class scan; bytecode-verified in BoxBoxSmokeTest.
    val COMPATIBILITY_BOXBOX = Compatibility(
        name = "BoxBox",
        packageName = "club.boxbox.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF0000,
        targets = listOf(AppTarget(version = "5.4.9", versionCode = 251))
    )

    val COMPATIBILITY_SAPHELINK = Compatibility(
        name = "Saphe Link",
        packageName = "my.saphelink",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x000000,
        // Verified 2026-09-18 against 6.6.0 (versionCode 212620) from APKPure. The old
        // secondary SubscriptionManager.isPremium fingerprint does not exist in this build
        // and was removed; the primary FeatureToggleRouterImpl.userHasFeature gate is
        // mandatory now (no methodOrNull), so a future rename fails loudly and is
        // bytecode-verified in SapheLinkSmokeTest.
        targets = listOf(AppTarget(version = "6.6.0", versionCode = 212620))
    )

    // Verified 2026-08-19 against 365scores.apkm v14.8.8 (universal, Android 7.0+).
    // App uses Google Mobile Ads (AdMob) loaded via the Blaze GAM SDK wrapper.
    // MobileAds.initialize(Landroid/content/Context;)V and the (Context, Listener)
    // overload are both present unobfuscated in com.google.android.gms.ads.MobileAds.
    // Ad SDKs observed: Google Mobile Ads, Unity, InMobi, Vungle, Mintegral,
    // ByteDance Pangle, Meta Audience Network (all GAM-mediated).
    // Re-verified 2026-09-17 on 14.9.4 with morphe-cli -f: Disable ads still applies.
    // Re-verified 2026-09-28 on 14.9.5 (versionCode 1495, APKPure): both initialize
    // overloads are empty in the decompiled output.
    val COMPATIBILITY_365SCORES = Compatibility(
        name = "365Scores",
        packageName = "com.scores365",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFFC107,
        targets = listOf(
            AppTarget(version = "14.9.4", versionCode = 1494),
            AppTarget(version = "14.9.5", versionCode = 1495)
        )
    )

    // Verified 2026-08-20 against livescore.apk v9.9.1 (universal, Android 7.0+).
    // AdsRemovalSettings.areAdsDisabled()Z is the single ad gate checked by
    // BannerManagerImpl, InterstitialAdsUseCase, MpuAdsConfig, HeroPlacementUseCase,
    // CoverageSponsorshipSettings and AnnouncementBannerUseCase. Class and method
    // are un-obfuscated in com.livescore.ads.config.
    // Re-verified 2026-09-17 on 10.1 with morphe-cli -f: Disable ads still applies.
    val COMPATIBILITY_LIVESCORE = Compatibility(
        name = "Livescore",
        packageName = "com.livescore",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xC8102E,
        targets = listOf(AppTarget(version = "10.1", versionCode = 2144))
    )

    // Verified 2026-08-20 against FishBuddy v11.0.84 (universal, Android 7.0+).
    // Premium gate is User.hasPremium()Z (no.fishbuddy.app.data.models.User),
    // reads the server-populated `roles` HashMap for the "premium" entitlement.
    // Subscription managed via RevenueCat (no ad SDKs). Class + method names
    // un-obfuscated.
    // Re-verified 2026-09-17 on 11.0.101 with morphe-cli -f: Enable Premium still applies.
    val COMPATIBILITY_FISHBUDDY = Compatibility(
        name = "FishBuddy",
        packageName = "no.fishbuddy_playground.app",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0288D1,
        targets = listOf(AppTarget(version = "11.0.101", versionCode = 110101))
    )

    // Verified 2026-08-20 against ru.iptvremote.android.iptv apkm v9.1.25
    // (universal, Android 12L+). Free app package; separate Pro app
    // (ru.iptvremote.android.iptv.pro) unlocks features when installed.
    // Ad SDK: Wortise mediation (com.wortise.ads.WortiseSdk) wrapping AppLovin,
    // Yandex Mobile Ads, Google Mobile Ads. Pro/trial gate is
    // IptvFreeApplication.k()Z (R8-renamed; signature-identified).
    val COMPATIBILITY_IPTVREMOTE = Compatibility(
        name = "IPTV",
        packageName = "ru.iptvremote.android.iptv",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1976D2,
        targets = listOf(AppTarget(version = "9.1.25", versionCode = 5010))
    )

    // Verified 2026-08-19 against brave.apkm v1.93.136, re-anchored 2026-09-18 against
    // v1.95.104 (versionCode 429510404, the current APKMirror build). All Brave Origin
    // anchor strings and non-obfuscated classes (BraveOriginPreferences,
    // BraveOriginSettingsLauncherHelper, profiles/Profile) are present. Obfuscated class
    // names rotate between versions, but every fingerprint is string/shape-based so it
    // resolves at patch time. 1.95.104 swapped the parameter order of the package/product
    // pref writer from (Profile, String) to (String, Profile), which broke the fingerprint
    // pinning v1.93.136; the patch matches the new order and is bytecode-verified in
    // BraveSmokeTest.
    val COMPATIBILITY_BRAVE = Compatibility(
        name = "Brave Browser",
        packageName = "com.brave.browser",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF4500,
        targets = listOf(AppTarget(version = "1.95.104"))
    )

    // Verified 2026-08-27 against librepods_1.0.0-rc1-play-63 .apkm from APKMirror
    // (arm64-v8a + x86, Android 16+ / minSdk 36). App logic is R8-obfuscated into
    // top-level classes (e.g. PlayBillingProvider -> uo) around native protocol
    // libs (libbluetooth_socket.so, libl2c_fcr_hook.so). Premium gates all read
    // PurchaseUiState.isPremium which is fed solely by PlayBillingProvider's
    // _isPremium StateFlow written in processPurchases(); a FOSS variant of the
    // provider also ships in this build. In-app product:
    // "librepods.advanced_features.v2". No license server (upstream GPL-3.0,
    // github.com/librepods-org/librepods).
    val COMPATIBILITY_LIBREPODS = Compatibility(
        name = "LibrePods",
        packageName = "me.kavishdevar.librepods",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x406C5C,
        targets = listOf(
            AppTarget(
                version = "1.0.0-rc1-play",
                versionCode = 63
            )
        )
    )

    // Verified 2026-08-30 against easynotes..._1.3.59.0819-10565 .apkm from APKMirror
    // (arm64-v8a + armeabi-v7a, Android 6.0+ / minSdk 23). App code is NOT obfuscated:
    // 3,589 readable classes under notes.easy.android.mynotes.
    //
    // Entitlement is entirely local — there is no license server. Everything routes through
    // three public static booleans on notes.easy.android.mynotes.App:
    //   isVip()Z       38 call sites - master gate for premium assets (fonts, backgrounds,
    //                  stickers, drawing tools). Per-asset flags such as DrawPatternRes.isVip()
    //                  are only consulted *inside* an `if (!App.isVip())` check.
    //   isAdFree()Z    4 call sites  - gates banner loading in utils/AdManager
    //                  (e.g. the "notes_edit_banner" unit) and App$AppOpenAdManager.
    //   isGoogleVip()Z drives the "Google VIP" badge only.
    //
    // Both isVip() and isGoogleVip() reduce to
    //   userConfig.getHasBuyed() || userConfig.getHasSubscribe()
    // with isVip() additionally early-outing on getBillingMonthlyTestOpen() (false) and
    // isReferralVip() (true). State lives in SharedPreferences via constant/UserConfig
    // (keys has_buyed, has_subscribe, has_m_subscribe, has_y_subscribe).
    //
    // Important: billing/BillingManager runs queryPurchaseState() on startup and its
    // callbacks (BillingManager$5/$7/$8) write those prefs back from whatever Play reports,
    // so a non-payer gets them reset to false. That is why we patch the *consumers*
    // (App.isVip/isAdFree) rather than the writers — forced return values ignore the reset.
    //
    // SKUs: BILLING_MONTH / BILLING_YEAR / BILLING_LIFETIME / BILLING_MONTH_TO_YEAR /
    // BILLING_UP_TO_LIFETIME (analytics suffixes "1m", "1y", "lifetime").
    // Ad SDKs: Google Mobile Ads (app-open), Meta Audience Network, PubMatic.
    // Re-verified 2026-09-17 on 1.3.61.0907 with morphe-cli -f: both patches still apply.
    val COMPATIBILITY_EASYNOTES = Compatibility(
        name = "EasyNotes",
        packageName = "easynotes.notes.notepad.notebook.privatenotes.note",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x00ACFF,
        targets = listOf(
            AppTarget(
                version = "1.3.61.0907",
                versionCode = 10567
            )
        )
    )

    // Verified 2026-09-17 against eu.faircode.email 1.2337 (versionCode 2337) from APKPure.
    // FairEmail is FOSS and not obfuscated: the pro entitlement is a single SharedPreferences
    // boolean ("pro") read through ActivityBilling.isPro(Context). The billing client rewrites
    // the pref from Play on launch, so the patch forces the getter instead of the pref.
    // Note: Gmail OAuth cannot work on a re-signed build. FairEmail gets Gmail tokens through
    // AccountManager and Google only issues them to packages signed with the certificates
    // registered for the OAuth client (the Play/GitHub builds). For Gmail accounts use an app
    // password instead (Gmail requires 2FA for that); non-Google accounts are unaffected.
    val COMPATIBILITY_FAIREMAIL = Compatibility(
        name = "FairEmail",
        packageName = "eu.faircode.email",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2196F3,
        targets = listOf(AppTarget(version = "1.2337", versionCode = 2337))
    )

    // Verified 2026-09-17 against net.dinglisch.android.taskerm 6.6.18 (versionCode 5443)
    // from APKPure. Paid app: the Play purchase is validated with Google Play LVL plus a
    // licence server (Patreon keys). The licensing code is R8-obfuscated (rf.a0, rf.w$a),
    // so the fingerprints pin those names for this version.
    val COMPATIBILITY_TASKER = Compatibility(
        name = "Tasker",
        packageName = "net.dinglisch.android.taskerm",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4CAF50,
        targets = listOf(AppTarget(version = "6.6.18", versionCode = 5443))
    )

    // Verified 2026-09-17 against org.kman.AquaMail 2.7.0 (versionCode 200700061) from
    // APKPure. LicenseManager computes a licence level (0 free / 10-20 Pro / 30 migration /
    // 40 Pro+ subscription) and LockFeatures answers the per-feature locks; both classes and
    // methods are unobfuscated. The UI reads getLicenseLevel() directly, so the patch forces
    // the level to 40 as well as the derived booleans.
    val COMPATIBILITY_AQUAMAIL = Compatibility(
        name = "Aqua Mail",
        packageName = "org.kman.AquaMail",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00B0FF,
        targets = listOf(AppTarget(version = "2.7.0", versionCode = 200700061))
    )

    // Verified 2026-09-17 against com.wunderground.android.weather 6.20.1
    // (versionCode 2019070035) from APKPure. The ad-free purchase is evaluated locally by the
    // Adobe Airlock SDK ("ads.Ad Free" entitlement); the getters in AirlockValueUtil,
    // PremiumHelper and WUApplication are unobfuscated.
    val COMPATIBILITY_WUNDERGROUND = Compatibility(
        name = "Weather Underground",
        packageName = "com.wunderground.android.weather",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1565C0,
        targets = listOf(AppTarget(version = "6.20.1", versionCode = 2019070035))
    )

    // Verified 2026-09-17 against com.monefy.app.lite 1.22.11 (versionCode 2229) from APKPure.
    // The app code is R8-obfuscated but the entitlement helpers are readable:
    // ClearCashApplication.o() is the master pro check (pro-app package id or cached IAP flag),
    // GeneralSettingsProvider.F() reads the cached "MONEFY_PRO_IN_APP_BOUGHT" pref that the
    // RevenueCat callback writes, and zt.p() reports the subscription-expired state.
    val COMPATIBILITY_MONEFY = Compatibility(
        name = "Monefy",
        packageName = "com.monefy.app.lite",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x8BC34A,
        targets = listOf(AppTarget(version = "1.22.11", versionCode = 2229))
    )

    // Verified 2026-09-18 against com.rammigsoftware.bluecoins 13.1.79 (versionCode 33145)
    // from APKMirror. The app is not obfuscated: every premium check collects
    // BillingDomain.isPremiumVersionFlow(), whose only implementation is BillingDomainManager.
    // The manager delegates to an encrypted "premiumKey" preference; the patch returns a
    // constant flow of true instead, so all screens see premium without touching the
    // encrypted storage or the billing client.
    val COMPATIBILITY_BLUECOINS = Compatibility(
        name = "Bluecoins",
        packageName = "com.rammigsoftware.bluecoins",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2979FF,
        targets = listOf(AppTarget(version = "13.1.79", versionCode = 33145))
    )

    // Verified 2026-09-18 against Flashscore 26.9.2 (versionCode 517) supplied from
    // apks/flashscore. The app is obfuscated, but ads all go through Google's next-generation
    // Mobile Ads SDK (com.google.android.libraries.ads.mobile.sdk), whose class and method
    // names are stable library API; the "Disable ads" patch hooks that surface. There is no
    // Play Billing client at all - the subscription is validated server-side
    // (/api/v2/android/validate_subscription_v2), so premium cannot be unlocked client-side.
    val COMPATIBILITY_FLASHSCORE = Compatibility(
        name = "Flashscore",
        packageName = "eu.livesport.FlashScore_com",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1E88E5,
        targets = listOf(AppTarget(version = "26.9.2", versionCode = 517))
    )

    // Verified 2026-09-18 against OneFootball 15.142.0 (versionCode 1044958885) from APKMirror.
    // The app code is obfuscated; all ads run through Google Mobile Ads
    // (com.google.android.gms.ads), so the "Disable ads" patch hooks that stable library
    // surface (initialize, every load/loadAd and the app-open preloader). No premium tier
    // was found in the readable code - the patch targets ads only.
    val COMPATIBILITY_ONEFOOTBALL = Compatibility(
        name = "OneFootball",
        packageName = "de.motain.iliga",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00C853,
        targets = listOf(AppTarget(version = "15.142.0", versionCode = 1044958885))
    )

    // Verified 2026-09-18 against net.osmand 5.4.5 (versionCode 5405) from APKMirror.
    // Not obfuscated: InAppPurchaseHelper.isPurchased(String) walks the purchase list and
    // InAppPurchaseHelperImpl answers the cached local entitlement getters. applyPurchases()
    // derives the OSMAND_PRO_PURCHASED / OSMAND_MAPS_PURCHASED / LIVE_UPDATES_PURCHASED
    // settings from those same getters, so forcing them also stops the writer resetting them.
    val COMPATIBILITY_OSMAND = Compatibility(
        name = "OsmAnd",
        packageName = "net.osmand",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x7CB342,
        targets = listOf(AppTarget(version = "5.4.5", versionCode = 5405))
    )

    // Verified 2026-09-19 against com.textra 4.85 (versionCode 48561) from APKMirror.
    // Textra app code is R8-obfuscated. Purchase state is a single integer preference
    // (key "lc": -1 unknown, 0 free, 1 licensed) owned by a dedicated obfuscated class.
    // That class is the only one in the whole app declaring all four methods
    // g()Ljava/lang/Integer;, i(Ljava/lang/Integer;)V, k()Z and l()Z, so the patch finds
    // it structurally (no obfuscated names) and forces l() -> true (licensed) and
    // k() -> false (state 1). Every gate reads those: ad placement, settings visibility
    // and upgrade prompts.
    val COMPATIBILITY_TEXTRA = Compatibility(
        name = "Textra",
        packageName = "com.textra",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x5C6BC0,
        targets = listOf(AppTarget(version = "4.85", versionCode = 48561))
    )

    // Verified 2026-09-19 against com.jetappfactory.jetaudio 13.1.2 (versionCode 261320)
    // from APKMirror. Purchase state lives in one obfuscated class (default-package "uy",
    // compiled from JInAppInfo.java) holding per-plugin static booleans. The class is
    // located by its unique inline literal (IAB: QueryInventory info: ...) instead of its rotating
    // name. Leaf boolean getters (no args or a Context) are forced true; the compound
    // getters and the inverted upsell check OR those leaves and flip by themselves.
    val COMPATIBILITY_JETAUDIO = Compatibility(
        name = "jetAudio",
        packageName = "com.jetappfactory.jetaudio",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF6D00,
        targets = listOf(AppTarget(version = "13.1.2", versionCode = 261320))
    )

// Verified 2026-09-19 against com.Relmtech.Remote 3.25.1 (versionCode 325001) from
// APKMirror. The app code is R8-obfuscated (`bh0` here); "Full" is a
// `License.Status` SharedPreferences int (0 = Free, 1 = Locked, 2 = Full) and the
// canonical Full check is the single `Z(Context)` method that reads it through the
// same-class `I(Context)` getter - called from ~20 feature sites. The patch locates
// that class by the unique "License.Status" literal and forces the check true.
// (RevenueCat only feeds the paywall UI for actual buyers - non-buyers get an empty
// entitlements map, so an `isActive()` force can never unlock anything here.)
    val COMPATIBILITY_UNIFIEDREMOTE = Compatibility(
        name = "Unified Remote",
        packageName = "com.Relmtech.Remote",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2962FF,
        targets = listOf(AppTarget(version = "3.25.1", versionCode = 325001))
    )

    // Verified 2026-09-27 against com.futbin 27.02 (versionCode 7002, user-supplied
    // APKPure APK). The app code is obfuscated, but all ads run through Google Mobile
    // Ads (the app's own `x.cv3` ad manager only calls the GMA surface, and the Nimbus
    // mediation SDK renders AdMob through it), so the "Disable ads" patch hooks that
    // stable library surface (initialize, every load/loadAd and the app-open
    // preloader). Futbin+ premium is account-linked (Play purchase is linked to the
    // Futbin account server-side), so premium is out of reach - ads only.
    val COMPATIBILITY_FUTBIN = Compatibility(
        name = "Futbin",
        packageName = "com.futbin",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x26A69A,
        targets = listOf(AppTarget(version = "27.02", versionCode = 7002))
    )

    // Verified 2026-09-27 against com.pocketcolorwheel.PCW 3.26 (versionCode 57,
    // user-supplied APKPure APK). The free app has no premium gate: no billing client,
    // no license checks and no references to the separate Pro package - it monetizes
    // purely through Google Mobile Ads initialized from `ApplicationClass.onCreate`.
    // The "Disable ads" patch hooks that stable library surface (initialize, every
    // load/loadAd and the app-open preloader). The Pro app
    // (com.pocketcolorwheelpro.pro) is a standalone paid listing that mirrors do not
    // serve, so there is nothing to verify against it.
    val COMPATIBILITY_PCW = Compatibility(
        name = "Pocket Color Wheel",
        packageName = "com.pocketcolorwheel.PCW",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x9C27B0,
        targets = listOf(AppTarget(version = "3.26", versionCode = 57))
    )

    // Verified 2026-09-28 against com.camerasideas.trimmer 1.716.1222 (versionCode 1222)
    // from APKMirror. The billing code keeps readable names: the central subscribed
    // check is `store/billing/c.d(Context)`, which reads the "SubscribePro" preference
    // and falls back to the "com.camerasideas.trimmer.vip" purchase flag. It gates the
    // export/watermark flow, template unlocks, the ads manager and the paywall, so
    // forcing it true unlocks Pro everywhere including watermark-free export.
    val COMPATIBILITY_YOUCUT = Compatibility(
        name = "YouCut",
        packageName = "com.camerasideas.trimmer",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF5722,
        targets = listOf(AppTarget(version = "1.716.1222", versionCode = 1222))
    )

    // Verified 2026-09-29 against com.streema.simpleradio 6.2.0 (versionCode 872,
    // APKPure universal). App code is not obfuscated. Premium state is entirely local:
    // SimpleRadioBaseActivity.isPremium() returns mIabService.isInitialized() &&
    // mIabService.c(), and the IAB service (b9/j) answers c() from SharedPreferences
    // ("iab_premium" boolean OR "iab_subscription_date_end" timestamp in the future).
    // Ads run through AppLovin MAX mediation (the SDK init key is inline) plus Google
    // Mobile Ads (AdMob native/interstitial), so "Disable ads" hooks those stable
    // library surfaces (MobileAds.initialize overloads, MaxInterstitialAd loadAd/showAd).
    val COMPATIBILITY_SIMPLERADIO = Compatibility(
        name = "Simple Radio",
        packageName = "com.streema.simpleradio",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF6D00,
        targets = listOf(AppTarget(version = "6.2.0", versionCode = 872))
    )

    // Verified 2026-09-29 against com.farproc.wifi.analyzer 3.10.5-L (versionCode 999,
    // APKPure). Tiny single-dex app, not obfuscated. Banner ads are gated by
    // Settings.a(Context), which reads the "next_show_ad_time_millisec" preference and
    // returns true once the hide-until date passes; MainScreen.N() shows the legacy
    // AdMob banner (com.google.android.gms.ads.e) only when the gate is true. Forcing
    // the gate false hides the banner everywhere.
    val COMPATIBILITY_WIFIANALYZER = Compatibility(
        name = "WiFi Analyzer",
        packageName = "com.farproc.wifi.analyzer",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00ACC1,
        targets = listOf(AppTarget(version = "3.10.5-L", versionCode = 999))
    )

    // Verified 2026-09-29 against com.Project100Pi.themusicplayer 3.2.0.0_release_2
    // (versionCode 32001, APKPure universal). Premium state is a static boolean flag
    // plus a 5-element purchase list in an R8-obfuscated holder class (`v7/g` here):
    // a() checks the list size, b() returns flag && a(), and ~20 call sites read the
    // flag field directly. Purchases (remove_ads / combo SKUs) set the flag via c(Z);
    // a temp-ad-free resetter clears it when the trial timestamp expires. The patch
    // forces a()/b() true, neuters the resetter and seeds the flag true in <clinit>,
    // so every consumer sees premium without touching Play Billing.
    // Ads run through AppLovin MAX mediation plus Google Mobile Ads, so "Disable ads"
    // hooks those stable library surfaces (MobileAds.initialize overloads, GMA loads,
    // MaxInterstitialAd loadAd/showAd).
    val COMPATIBILITY_PIMUSICPLAYER = Compatibility(
        name = "Pi Music Player",
        packageName = "com.Project100Pi.themusicplayer",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x3F51B5,
        targets = listOf(AppTarget(version = "3.2.0.0_release_2", versionCode = 32001))
    )
}