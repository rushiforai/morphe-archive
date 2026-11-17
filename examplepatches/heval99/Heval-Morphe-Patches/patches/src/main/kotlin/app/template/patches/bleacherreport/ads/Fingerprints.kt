package app.template.patches.bleacherreport.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// AdConfigInteractorImpl.getFeaturesAdConfig(List, Continuation) (11.12.0.33: interactor.ads.impl.b.a):
// the ad unit config for each ad feature (feed, splash, banners ...), read by every ad placement.
internal object AdConfigFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("getFeaturesAdConfig() ", StringComparisonType.STARTS_WITH),
        string("Returning hardcoded ad config", StringComparisonType.STARTS_WITH),
    ),
    custom = { method, _ -> method.parameterTypes.size == 2 && method.parameterTypes[0].toString() == "Ljava/util/List;" },
)

// AdContentInserterImpl.insert(content, ads, channelAdUnit, Z, AlertedAdContent, Z)ArrayList
// (11.12.0.33: ui.common.ads.b.a): mixes the ad slots into a feed. The anchor is the class's
// AdContentInserterImpl.kt source name plus the parameter shape: 11.12.0.33 also had the Kotlin
// null-check names "content" / "ads" / "channelAdUnit", but R8 turned those into getClass() calls
// in 11.14.0.35 (the only instance method returning ArrayList in that class).
internal object AdContentInserterFingerprint : Fingerprint(
    returnType = "Ljava/util/ArrayList;",
    custom = { method, classDef ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && classDef.sourceFile == "AdContentInserterImpl.kt" &&
            method.parameterTypes.map(CharSequence::toString).let { params ->
                params.size == 6 && params[0] == "Ljava/util/List;" && params[1] == "Ljava/util/List;" &&
                    params[2] == "Ljava/lang/String;" && params[3] == "Z" && params[4].startsWith("L") && params[5] == "Z"
            }
    },
)

// AdsManagerImpl.loadAd(AdModel, I, AdMetaData, Z, Function0)V (11.12.0.33: ui.common.ads.adsmanager.s.b):
// loads every banner (AdManagerAdView) and native custom-format ad.
internal object LoadAdFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(string("Ad Unit is missing in ", StringComparisonType.STARTS_WITH)),
)

// AdsManagerImpl.loadSplashAd(AdModel, AdMetaData, Continuation)Object (11.12.0.33: s.c). Its
// "Ad Unit is missing" branch answers Result.failure(IllegalArgumentException), which the splash
// task reports as "Load splash ad failed".
internal object LoadSplashAdFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("loadSplashAd() ad=", StringComparisonType.STARTS_WITH),
        string("Ad Unit is missing", StringComparisonType.EQUALS),
    ),
)

// AdsManagerImpl's Amazon Publisher Services (DTB) start-up (11.12.0.33: s.d(Continuation)Object).
internal object AmazonAdsInitFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(string("Amazon Services SDK could not be started", StringComparisonType.STARTS_WITH)),
    custom = { method, _ -> method.parameterTypes.size == 1 },
)
