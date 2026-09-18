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
            //   - Disable Facebook SDK: FacebookInitProvider / AudienceNetworkContentProvider onCreate.
            //   - Block marketing notifications: PromotionModal / tennis promo bottom sheet
            //     onViewCreated dismiss the sheet before it renders.
            // The "Disable Play Integrity" patch was dropped: this build does not bundle the
            // Play Integrity classes (the AppsFlyer SDK only references them, behind a catch),
            // so the patch had nothing to patch.
            // All 5 patches apply cleanly; SofascoreSmokeTest asserts the emitted bytecode.
            AppTarget(
                version = "26.09.07",
                versionCode = 260907002
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
    val COMPATIBILITY_FOTMOB = Compatibility(
        name = "FotMob",
        packageName = "com.mobilefootie.wc2010",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00985F,
        targets = listOf(
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

    val COMPATIBILITY_MYFITNESSPAL = Compatibility(
        name = "MyFitnessPal",
        packageName = "com.myfitnesspal.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0072BC,
        // Drift 2026-09-17: GetPremiumPlusFingerprint no longer matches on 26.36.0;
        // target left open until re-anchored.
        targets = listOf(AppTarget(version = null))
    )

    val COMPATIBILITY_BOXBOX = Compatibility(
        name = "BoxBox",
        packageName = "club.boxbox.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF0000,
        // Drift 2026-09-17: on 5.4.15 Disable ads still applies but Disable telemetry
        // fails to match; target left open until the telemetry fingerprint is re-anchored.
        targets = listOf(AppTarget(version = null))
    )

    val COMPATIBILITY_SAPHELINK = Compatibility(
        name = "Saphe Link",
        packageName = "my.saphelink",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x000000,
        targets = listOf(AppTarget(version = "6.6.0", versionCode = 212620))
    )

    val COMPATIBILITY_ANYDESK = Compatibility(
        name = "AnyDesk",
        packageName = "com.anydesk.anydeskandroid",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xEF443B,
        targets = listOf(AppTarget(version = "9.0.0", versionCode = 90000))
    )

    // Verified 2026-08-19 against 365scores.apkm v14.8.8 (universal, Android 7.0+).
    // App uses Google Mobile Ads (AdMob) loaded via the Blaze GAM SDK wrapper.
    // MobileAds.initialize(Landroid/content/Context;)V and the (Context, Listener)
    // overload are both present unobfuscated in com.google.android.gms.ads.MobileAds.
    // Ad SDKs observed: Google Mobile Ads, Unity, InMobi, Vungle, Mintegral,
    // ByteDance Pangle, Meta Audience Network (all GAM-mediated).
    // Re-verified 2026-09-17 on 14.9.4 with morphe-cli -f: Disable ads still applies.
    val COMPATIBILITY_365SCORES = Compatibility(
        name = "365Scores",
        packageName = "com.scores365",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFFC107,
        targets = listOf(AppTarget(version = "14.9.4", versionCode = 1494))
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

    // Verified 2026-08-19 against brave.apkm v1.93.136 (arm64-v8a, Android 12L+).
    // All Brave Origin anchor strings and non-obfuscated classes
    // (BraveOriginPreferences, BraveOriginSettingsLauncherHelper, profiles/Profile)
    // are present. Obfuscated class names rotated vs dh6k's v1.92.140 target
    // (v42 -> ei2, d72 -> hk2, b12 -> ke2, lf2 -> rs2, pc2 -> vp2, lv1 -> t82),
    // but every fingerprint is string-based so resolves at patch time.
    // Drift 2026-09-17: v1.95.101 fails to match and is not listed.
    val COMPATIBILITY_BRAVE = Compatibility(
        name = "Brave Browser",
        packageName = "com.brave.browser",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF4500,
        targets = listOf(AppTarget(version = "1.93.136"))
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

    // Verified 2026-09-17 against org.swiftapps.swiftbackup 5.1.0 (versionCode 620) from
    // APKPure. Premium entitlement is stored in encrypted preferences; every gate reads the
    // obfuscated singleton org.swiftapps.swiftbackup.common.V, whose getA() is forced true.
    val COMPATIBILITY_SWIFTBACKUP = Compatibility(
        name = "Swift Backup",
        packageName = "org.swiftapps.swiftbackup",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1E88E5,
        targets = listOf(AppTarget(version = "5.1.0", versionCode = 620))
    )

    // Verified 2026-09-17 against org.kman.AquaMail 2.7.0 (versionCode 200700061) from
    // APKPure. LicenseManager computes a licence level (0 free / 10-20 Pro / 30 migration /
    // 40 Pro+ subscription) and LockFeatures answers the per-feature locks; both classes and
    // methods are unobfuscated.
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
}