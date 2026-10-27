package app.template.patches.football433.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal const val METHOD_CALL = "Lio/flutter/plugin/common/MethodCall;"
internal const val METHOD_RESULT = "Lio/flutter/plugin/common/MethodChannel\$Result;"

// UXCam's public SDK class keeps its name and its static API (startWithConfiguration, ...).
internal const val UXCAM = "Lcom/uxcam/UXCam;"

// Airship keeps its config builder; getAnalyticsEnabled() is the Kotlin getter the
// AirshipConfigOptions constructor reads into the public analyticsEnabled field.
internal const val AIRSHIP_CONFIG_BUILDER = "Lcom/urbanairship/AirshipConfigOptions\$Builder;"

// Plugin classes are R8-renamed (2.3.548: n7/c for flutter_uxcam, l3/z for flutter_branch_sdk),
// so they are found by the method-channel strings they read and by shape.

// flutter_uxcam's "startWithConfiguration" handler (2.3.548: n7/c.m(Map, Result)): it adds a
// verification listener that answers the Dart future, builds a UXConfig from the map and calls
// UXCam.startWithConfigurationCrossPlatform. Its catch block answers false.
internal object UxcamStartWithConfigurationFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/util/Map;", METHOD_RESULT),
    strings = listOf(
        string("userAppKey", StringComparisonType.CONTAINS),
        string("enableMultiSessionRecord", StringComparisonType.CONTAINS),
        string("enableCrashHandling", StringComparisonType.CONTAINS),
    ),
    // An instance method, so the Result is p2 (the patch writes to it by that name).
    custom = { method, _ -> method.implementation != null && !AccessFlags.STATIC.isSet(method.accessFlags) },
)

// flutter_branch_sdk's two readers of the Dart "branchAttributionLevel" argument: init
// (2.3.548: l3/z.Z(MethodCall, Result), "triggered setupBranch") and
// setConsumerProtectionAttributionLevel (l3/z.P(MethodCall)). Both pass the string to
// BranchAttributionLevel.valueOf and then to Branch's setConsumerProtectionAttributionLevel.
internal object BranchAttributionLevelFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf(
        string("FlutterBranchSDK", StringComparisonType.CONTAINS),
        string("branchAttributionLevel", StringComparisonType.CONTAINS),
    ),
    custom = { method, _ ->
        method.implementation != null && method.parameterTypes.firstOrNull()?.toString() == METHOD_CALL
    },
)
