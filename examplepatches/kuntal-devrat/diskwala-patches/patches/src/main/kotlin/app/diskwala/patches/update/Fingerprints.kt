package app.diskwala.patches.update

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for forced update, anti-tamper, PairIP license checks, providers, and runtime stability.
 */

// 1. SignatureCheck
internal object SignatureCheckVerifyIntegrityFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifyIntegrity",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

internal object SignatureCheckVerifySignatureMatchesFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifySignatureMatches",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;")
)

// 2. StartupLauncher & VMRunner
internal object StartupLauncherLaunchFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/StartupLauncher;",
    name = "launch",
    returnType = "V"
)

// 3. License Content Providers (LicenseContentProvider & LicenseContentProvider1)
internal object LicenseContentProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider;",
    name = "onCreate",
    returnType = "Z"
)

internal object LicenseContentProvider1OnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider1;",
    name = "onCreate",
    returnType = "Z"
)

// 4. LicenseClient (checkLicense, initializeLicenseCheck, retryOrThrow, showPaywallOrThrow)
internal object LicenseClientCheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

internal object LicenseClientInitLicenseCheck1Fingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

internal object LicenseClientInitLicenseCheck2Fingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = listOf("Z")
)

internal object LicenseClientRetryOrThrowFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "retryOrThrow",
    returnType = "V"
)

internal object LicenseClientShowPaywallFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "showPaywallOrThrow",
    returnType = "V"
)

// 5. LicenseActivity (onCreate, showErrorDialog, showPaywallAndCloseApp)
internal object LicenseActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

internal object LicenseActivityShowErrorDialogFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseActivity;",
    name = "showErrorDialog",
    returnType = "V"
)

internal object LicenseActivityShowPaywallFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseActivity;",
    name = "showPaywallAndCloseApp",
    returnType = "V"
)

// 6. PlayIntegrity
internal object PlayIntegrityRequestTokenFingerprint : Fingerprint(
    definingClass = "Lcom/diskwalaapp/integrity/PlayIntegrityModule;",
    name = "requestToken",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Lcom/facebook/react/bridge/Promise;")
)

internal object PlayIntegrityLambdaRejectFingerprint : Fingerprint(
    definingClass = "Lcom/diskwalaapp/integrity/PlayIntegrityModule;",
    name = "requestToken\$lambda\$2",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/Promise;", "Ljava/lang/Exception;")
)

// 7. AppMetrica PreloadInfoContentProvider
internal object PreloadInfoContentProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lio/appmetrica/analytics/internal/PreloadInfoContentProvider;",
    name = "onCreate",
    returnType = "Z"
)

// 8. Firebase Crashlytics & App Content Providers
internal object RNFBCrashlyticsInitProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lio/invertase/firebase/crashlytics/ReactNativeFirebaseCrashlyticsInitProvider;",
    name = "onCreate",
    returnType = "Z"
)

internal object FirebaseInitProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/provider/FirebaseInitProvider;",
    name = "onCreate",
    returnType = "Z"
)

// 9. Ad & Analytics Content Providers (prevent crashes when native libs are bypassed)
internal object BigoAdsProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lsg/bigo/ads/controller/provider/BigoAdsProvider;",
    name = "onCreate",
    returnType = "Z"
)

internal object VungleProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/vungle/ads/VungleProvider;",
    name = "onCreate",
    returnType = "Z"
)

internal object IronSourceCrashProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/ironsource/environment/CrashProvider;",
    name = "onCreate",
    returnType = "Z"
)

internal object IronSourceLifecycleProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/ironsource/lifecycle/IronsourceLifecycleProvider;",
    name = "onCreate",
    returnType = "Z"
)

internal object IronSourceLevelPlayLifecycleProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/ironsource/lifecycle/LevelPlayActivityLifecycleProvider;",
    name = "onCreate",
    returnType = "Z"
)

internal object MBComponentLifecycleProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/mbridge/msdk/config/component/status/MBComponentLifecycleProvider;",
    name = "onCreate",
    returnType = "Z"
)

internal object AppMeasurementContentProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/measurement/AppMeasurementContentProvider;",
    name = "onCreate",
    returnType = "Z"
)

// 10. React Native BlobCollector
internal object BlobCollectorNativeInstallFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/modules/blob/BlobCollector;",
    name = "nativeInstall",
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;", "J")
)

internal object BlobCollectorInstallLambdaFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/modules/blob/BlobCollector;",
    name = "install\$lambda\$0",
    returnType = "V",
    parameters = listOf(
        "Lcom/facebook/react/bridge/ReactContext;",
        "Lcom/facebook/react/modules/blob/BlobModule;"
    )
)

internal object OkHttpCipherSuiteComparatorFingerprint : Fingerprint(
    definingClass = "Lokhttp3/CipherSuite\$Companion\$ORDER_BY_NAME\$1;",
    name = "compare",
    returnType = "I",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;")
)

internal object TransformAnimatedNodeConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/animated/TransformAnimatedNode;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Lcom/facebook/react/bridge/ReadableMap;",
        "Lcom/facebook/react/animated/NativeAnimatedNodesManager;"
    )
)

internal object GrpcMessageEncodingConstructorFingerprint : Fingerprint(
    definingClass = "Lnb/v;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Lnb/u;", "Z", "Lnb/v;")
)

internal object GrpcDnsResolverStaticInitializerFingerprint : Fingerprint(
    definingClass = "Lio/grpc/internal/D;",
    name = "<clinit>",
    returnType = "V"
)

internal object ReactTextInputEndEditingEventNameFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/views/textinput/ReactTextInputEndEditingEvent;",
    name = "getEventName",
    returnType = "Ljava/lang/String;"
)

// 11. DefaultNewArchitectureEntryPoint
internal object DefaultNewArchitectureEntryPointLoadFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/defaults/DefaultNewArchitectureEntryPoint;",
    name = "load",
    returnType = "V",
    // The zero/one/two-argument overloads delegate into this actual entrypoint.
    // Match the three-boolean method specifically so the JNI feature-flag path
    // cannot be reached after patching.
    parameters = listOf("Z", "Z", "Z")
)

// React Native's new-architecture facade delegates these accessors to the
// feature-flags JNI library, which is intentionally absent from this APK.
internal object RNEnableBridgelessArchitectureFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/internal/featureflags/ReactNativeNewArchitectureFeatureFlags;",
    name = "enableBridgelessArchitecture",
    returnType = "Z"
)

internal object RNEnableFabricRendererFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/internal/featureflags/ReactNativeNewArchitectureFeatureFlags;",
    name = "enableFabricRenderer",
    returnType = "Z"
)

internal object RNIsNewArchitectureStrictModeEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/internal/featureflags/ReactNativeNewArchitectureFeatureFlags;",
    name = "isNewArchitectureStrictModeEnabled",
    returnType = "Z"
)

internal object RNUseFabricInteropFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/internal/featureflags/ReactNativeNewArchitectureFeatureFlags;",
    name = "useFabricInterop",
    returnType = "Z"
)

internal object RNUseTurboModuleInteropFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/internal/featureflags/ReactNativeNewArchitectureFeatureFlags;",
    name = "useTurboModuleInterop",
    returnType = "Z"
)

internal object RNUseTurboModulesFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/internal/featureflags/ReactNativeNewArchitectureFeatureFlags;",
    name = "useTurboModules",
    returnType = "Z"
)

internal object RNEnableEagerRootViewAttachmentFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsCxxAccessor;",
    name = "enableEagerRootViewAttachment",
    returnType = "Z"
)

internal object RNCxxNativeAnimatedEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsCxxAccessor;",
    name = "cxxNativeAnimatedEnabled",
    returnType = "Z"
)

internal object ReactInstanceManagerInspectorTargetFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/ReactInstanceManager;",
    name = "getOrCreateInspectorTarget",
    returnType = "Lcom/facebook/react/bridge/ReactInstanceManagerInspectorTarget;"
)

// 12. ReactSwitch & TextInput Shadow Nodes
internal object ReactSwitchShadowNodeMeasureFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/views/switchview/ReactSwitchShadowNode;",
    name = "measure",
    returnType = "J"
)

internal object ReactTextInputShadowNodeCreateInternalEditTextFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/views/textinput/ReactTextInputShadowNode;",
    name = "createInternalEditText",
    returnType = "Landroid/widget/EditText;"
)

// 13. FreeRASP
internal object FreeRaspCreateNativeModulesFingerprint : Fingerprint(
    definingClass = "LEa/i;",
    name = "createNativeModules",
    returnType = "Ljava/util/List;"
)

// 14. SystemProps Null Safety (Prevents "key can't be null" NPE in System.getProperty when PairIP strings are bypassed)
internal object SystemPropsGetPropertyGFingerprint : Fingerprint(
    definingClass = "Ldd/G;",
    name = "b",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;")
)

internal object SystemPropsGetPropertyFFingerprint : Fingerprint(
    definingClass = "Ldd/F;",
    name = "d",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;")
)

internal object SystemPropsGetPropertyF2Fingerprint : Fingerprint(
    definingClass = "Ldd/F;",
    name = "e",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;")
)

internal object SystemPropsGetPropertyHFingerprint : Fingerprint(
    definingClass = "Ldd/H;",
    name = "c",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;")
)

// 15. MainApplication, PairIP Application & MainActivity
internal object MainApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/diskwalaapp/MainApplication;",
    name = "onCreate",
    returnType = "V"
)

internal object PairIPApplicationAttachBaseContextFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/application/Application;",
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/diskwalaapp/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

// 16. VMRunner (PairIP VM execution)
internal object VMRunnerInvokeFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/VMRunner;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "[Ljava/lang/Object;")
)

internal object VMRunnerSetContextFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/VMRunner;",
    name = "setContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

// 17. OpenSourceMergedSoMapping
internal object OpenSourceMergedSoMappingInvokeJniOnloadFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/soloader/OpenSourceMergedSoMapping;",
    name = "invokeJniOnload",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

// 18. ReactMarker
internal object ReactMarkerNotifyNativeMarkerFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/bridge/ReactMarker;",
    name = "notifyNativeMarker",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/ReactMarkerConstants;", "Ljava/lang/String;", "I")
)

// 19. InspectorFlags
internal object InspectorFlagsGetFuseboxEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/devsupport/InspectorFlags;",
    name = "getFuseboxEnabled",
    returnType = "Z"
)

internal object InspectorFlagsGetIsProfilingBuildFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/devsupport/InspectorFlags;",
    name = "getIsProfilingBuild",
    returnType = "Z"
)

// 20. Arguments null-key safety
internal object ArgumentsAddEntryFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/bridge/Arguments;",
    name = "addEntry",
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/WritableNativeMap;", "Ljava/lang/String;", "Ljava/lang/Object;")
)

// 21. WritableNativeMap null-key safety
internal object WritableNativeMapPutMapFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/bridge/WritableNativeMap;",
    name = "putMap",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lcom/facebook/react/bridge/ReadableMap;")
)

internal object WritableNativeMapPutArrayFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/bridge/WritableNativeMap;",
    name = "putArray",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lcom/facebook/react/bridge/ReadableArray;")
)
