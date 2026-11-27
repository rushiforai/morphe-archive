// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.rifisfun.ads.disable

import app.edbfi.patches.rifisfun.RifPatchStrings
import app.edbfi.patches.rifisfun.rifIsFun
import app.reseam.patch.Type
import app.reseam.patch.alwaysReturn
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.dex.Opcode
import app.reseam.patch.klass
import app.reseam.patch.method
import app.reseam.patch.patch

private const val MAIN_ACTIVITY = "com.andrewshu.android.reddit.MainActivity"
private const val THEMED_ACTIVITY = "com.andrewshu.android.reddit.theme.BaseThemedActivity"
private const val THEME_MANIFEST = "com.andrewshu.android.reddit.theme.manifest.ThemeManifest"
private const val MOBILE_ADS_PROVIDER = "com.google.android.gms.ads.MobileAdsInitProvider"
private const val APPLOVIN_PROVIDER = "com.applovin.sdk.AppLovinInitProvider"

private val adHelpers = klass(MAIN_ACTIVITY).method("<clinit>") {
    opcode(Opcode.CONST_CLASS, Opcode.SPUT_OBJECT)
    calls { owner("java.lang.Class"); name("newInstance") }
}

internal val screenTransition = klass("rif screen transition enum") {
    enumConstants("FROM_THREADS_GO_HOME", "FROM_BROWSER_GO_FULLSCREEN")
}

private val allowBanner = method("rif banner ad eligibility") {
    inClass(screenTransition)
    params(MAIN_ACTIVITY)
    returns(Type.Boolean)
    flags(AccessFlags.PRIVATE)
    calls { owner(THEMED_ACTIVITY) }
}

private val allowNativeThreadAds = method("rif native thread ad eligibility") {
    params()
    returns(Type.Boolean)
    flags(AccessFlags.PROTECTED)
    calls { owner(THEMED_ACTIVITY); params(); returns(THEME_MANIFEST) }
    calls { owner(THEME_MANIFEST); params(); returns(Type.Boolean) }
}

private val startConsentSdk = klass("com.andrewshu.android.reddit.ads.AdsGdprHelper")
    .method("initAdsSdkWithListener") {
        params("android.content.Context", "com.applovin.sdk.AppLovinSdk\$SdkInitializationListener")
        returns(Type.Void)
    }

val disableAds = patch(RifPatchStrings.disableAds) {
    description(RifPatchStrings.disableAdsDescription)
    compatibleWith(rifIsFun)

    execute {
        // The activity initializer only installs optional ad helpers. Leaving those fields null
        // takes the existing no-helper path without changing the stored ads/feature preference.
        adHelpers.method
        allowBanner.method
        allowNativeThreadAds.method
        startConsentSdk.method
        manifest.edit {
            val providers = findByTag("provider")
            val mobileAds = providers.single { it["android:name"] == MOBILE_ADS_PROVIDER }
            val appLovin = providers.single { it["android:name"] == APPLOVIN_PROVIDER }
            mobileAds.setBool("android:enabled", false)
            appLovin.setBool("android:enabled", false)
        }
        adHelpers.alwaysReturn()
        allowBanner.alwaysReturn(false)
        // The listing loader inserts native ad rows independently of the activity's helper.
        allowNativeThreadAds.alwaysReturn(false)
        startConsentSdk.alwaysReturn()
    }
}
