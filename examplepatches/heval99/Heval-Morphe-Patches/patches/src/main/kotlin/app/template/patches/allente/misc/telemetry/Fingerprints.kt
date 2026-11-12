package app.template.patches.allente.misc.telemetry

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// Allente is React Native with @react-native-firebase/analytics. The JS consent flow calls
// setAnalyticsCollectionEnabled(...) at runtime, which overrides the manifest (the app ships
// collection enabled), so the native module entry is pinned. The module class and its @ReactMethod
// name are library API, not R8-renamed.
internal object AnalyticsCollectionSwitchFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        !AccessFlags.STATIC.isSet(method.accessFlags) &&
            classDef.type == "Lio/invertase/firebase/analytics/ReactNativeFirebaseAnalyticsModule;" &&
            method.name == "setAnalyticsCollectionEnabled" &&
            method.parameterTypes.size == 2 &&
            method.parameterTypes[0].toString() == "Ljava/lang/Boolean;" &&
            method.implementation != null
    },
)
