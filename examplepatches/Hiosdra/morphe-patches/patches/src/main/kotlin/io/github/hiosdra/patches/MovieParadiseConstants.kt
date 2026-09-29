package io.github.hiosdra.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal const val MOVIE_PARADISE_PACKAGE = "com.techkitlabs.movieparadise"

// PairIP (Google Play Automatic Integrity Protection) — injected at publish time.
// LicenseClient.checkLicense() runs from Application.attachBaseContext before any
// app code and, on a repackaged/resigned APK, tears the process down. Neutralising
// it is a prerequisite for running any Morphe-patched build of this app.
internal const val PAIRIP_LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

// RevenueCat (purchases_flutter). These Java classes live in the DEX. NOTE: per the
// teardown, the app's source of truth for premium is the server-side `is_premium`
// field from its own /me endpoint (read in the Dart/AOT layer of libapp.so), not
// RevenueCat on the client. Forcing entitlements here is an experiment, not a
// guaranteed unlock — see MovieParadisePremiumPatch.
internal const val RC_ENTITLEMENT_INFO = "Lcom/revenuecat/purchases/EntitlementInfo;"

internal const val MOVIE_PARADISE_MAIN_ACTIVITY = "Lcom/techkitlabs/movieparadise/MainActivity;"

// GmsCore (MicroG-RE, Morphe variant) support. Redirects the app's Google Play
// Services references to the microG package so Google sign-in / GMS works without
// stock Play Services. Vendor id kept as "app.revanced" for MicroG-RE compatibility.
internal const val GMS_CORE_VENDOR = "app.revanced"
internal const val MICROG_PACKAGE = "app.revanced.android.gms"
internal const val GMS_EXTENSION_CLASS =
    "Lio/github/hiosdra/patches/extension/gms/GmsCoreSupport;"

// Original developer signing certificate SHA-1 of the Play-distributed APK
// (verified: base.apk carries a valid Google Play source stamp; DN "CN=Android,
// O=Google Inc." is the standard Play App Signing key DN). microG spoofs this to
// Google so sign-in still validates after Morphe repackages/resigns the APK.
internal const val MOVIE_PARADISE_ORIGINAL_SIGNATURE = "d274a756435991a765f58b4b94d9310dc0478b30"

internal const val MOVIE_PARADISE_VERSION = "5.2.0"
internal const val MOVIE_PARADISE_VERSION_CODE = 38

internal val COMPATIBILITY_MOVIE_PARADISE = Compatibility(
    name = "Movie Paradise",
    packageName = MOVIE_PARADISE_PACKAGE,
    description = "Movie Paradise (Flutter) — distributed as split APK (XAPK)",
    apkFileType = ApkFileType.XAPK,
    appIconColor = 0x111827,
    targets = listOf(
        AppTarget(
            version = MOVIE_PARADISE_VERSION,
            minSdk = 24,
            description = "versionCode $MOVIE_PARADISE_VERSION_CODE",
        ),
    ),
)
