package app.template.patches.blockbuster.misc.telemetry

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// Blockbuster is React Native with @react-native-firebase/analytics and the Sentry RN SDK. In this
// RN Firebase generation the analytics bridge is the TurboModule NativeRNFBTurboAnalytics, whose
// setAnalyticsCollectionEnabled(boolean, Promise) boxes the boolean and forwards it to
// UniversalFirebaseAnalyticsModule. The class and the @ReactMethod name are library API kept by
// R8, and the JS consent flow calls this entry, which would override the manifest switches.
internal object AnalyticsCollectionSwitchFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        !AccessFlags.STATIC.isSet(method.accessFlags) &&
            classDef.type == "Lio/invertase/firebase/analytics/NativeRNFBTurboAnalytics;" &&
            method.name == "setAnalyticsCollectionEnabled" &&
            method.parameterTypes.size == 2 &&
            method.parameterTypes[0].toString() == "Z" &&
            method.implementation != null
    },
)

// Sentry starts either from its auto-init provider or from RNSentryStart (the JS SDK). The manifest
// disables auto-init, so the RN path is the live one; every path ends in SentryAndroid.init(...),
// whose four overloads are the stable public API.
internal const val SENTRY_ANDROID = "Lio/sentry/android/core/SentryAndroid;"
