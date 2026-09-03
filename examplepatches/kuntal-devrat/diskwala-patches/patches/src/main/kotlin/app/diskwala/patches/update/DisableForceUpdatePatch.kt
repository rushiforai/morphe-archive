package app.diskwala.patches.update

import app.diskwala.patches.shared.Constants.COMPATIBILITY_DISKWALA
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue
import com.android.tools.smali.dexlib2.iface.value.EncodedValue
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

/**
 * Removes forced update, anti-tamper, PairIP licensing, content provider crashes, and runtime instability.
 */
@Suppress("unused")
val disableForceUpdatePatch = bytecodePatch(
    name = "Disable forced update",
    description = "Bypasses PairIP license check ('Download from Play Store'), Play Integrity, and signature verification to allow modified and sideloaded app usage.",
    default = true
) {
    compatibleWith(COMPATIBILITY_DISKWALA)

    execute {
        // 1) PairIP Startup VM bypass
        runCatching { StartupLauncherLaunchFingerprint.method.addInstructions(0, "return-void") }

        // 2) Signature checks - always return success
        runCatching { SignatureCheckVerifyIntegrityFingerprint.method.addInstructions(0, "return-void") }
        runCatching {
            SignatureCheckVerifySignatureMatchesFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        // 3) PairIP License Content Providers (LicenseContentProvider & LicenseContentProvider1)
        runCatching {
            LicenseContentProviderOnCreateFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
        runCatching {
            LicenseContentProvider1OnCreateFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        // 4) PairIP License Client (checkLicense, initializeLicenseCheck, retryOrThrow, showPaywallOrThrow)
        runCatching { LicenseClientCheckLicenseFingerprint.method.addInstructions(0, "return-void") }
        runCatching { LicenseClientInitLicenseCheck1Fingerprint.method.addInstructions(0, "return-void") }
        runCatching { LicenseClientInitLicenseCheck2Fingerprint.method.addInstructions(0, "return-void") }
        runCatching { LicenseClientRetryOrThrowFingerprint.method.addInstructions(0, "return-void") }
        runCatching { LicenseClientShowPaywallFingerprint.method.addInstructions(0, "return-void") }

        // 5) PairIP License Activity (onCreate, showErrorDialog, showPaywallAndCloseApp)
        runCatching {
            LicenseActivityOnCreateFingerprint.method.addInstructions(
                0,
                """
                    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                    return-void
                """
            )
        }
        runCatching { LicenseActivityShowErrorDialogFingerprint.method.addInstructions(0, "return-void") }
        runCatching { LicenseActivityShowPaywallFingerprint.method.addInstructions(0, "return-void") }

        // 6) AppMetrica PreloadInfo Content Provider (Prevents crash when PairIP VM is not initialized)
        runCatching {
            PreloadInfoContentProviderOnCreateFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        // 7) Firebase & Crashlytics Content Providers
        runCatching {
            RNFBCrashlyticsInitProviderOnCreateFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
        // 8) Ad and Analytics Startup Providers
        runCatching {
            BigoAdsProviderOnCreateFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
        runCatching {
            VungleProviderOnCreateFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
        runCatching {
            IronSourceCrashProviderOnCreateFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
        runCatching {
            IronSourceLifecycleProviderOnCreateFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
        runCatching {
            IronSourceLevelPlayLifecycleProviderOnCreateFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
        runCatching {
            MBComponentLifecycleProviderOnCreateFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
        runCatching {
            AppMeasurementContentProviderOnCreateFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        // 9) PairIP Application & MainApplication clean startup (Bypasses PairIP Method.invoke crashes)
        runCatching {
            PairIPApplicationAttachBaseContextFingerprint.method.addInstructions(
                0,
                """
                    invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V
                    return-void
                """
            )
        }
        runCatching {
            MainApplicationOnCreateFingerprint.method.addInstructions(
                0,
                """
                    invoke-super {p0}, Landroid/app/Application;->onCreate()V

                    sget-object v0, Lcom/facebook/react/soloader/OpenSourceMergedSoMapping;->INSTANCE:Lcom/facebook/react/soloader/OpenSourceMergedSoMapping;
                    invoke-static {p0, v0}, Lcom/facebook/soloader/SoLoader;->init(Landroid/content/Context;Lcom/facebook/soloader/ExternalSoMapping;)V

                    :try_start_rn
                    const-string v0, "reactnative"
                    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
                    :try_end_rn
                    .catch Ljava/lang/Throwable; {:try_start_rn .. :try_end_rn} :catch_rn
                    goto :after_rn
                    :catch_rn
                    :after_rn

                    :try_start_ht
                    const-string v0, "hermestooling"
                    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
                    :try_end_ht
                    .catch Ljava/lang/Throwable; {:try_start_ht .. :try_end_ht} :catch_ht
                    goto :after_ht
                    :catch_ht
                    :after_ht

                    :try_start_am
                    const-string v0, "appmodules"
                    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
                    :try_end_am
                    .catch Ljava/lang/Throwable; {:try_start_am .. :try_end_am} :catch_am
                    goto :after_am
                    :catch_am
                    :after_am

                    :try_start_qc
                    const-string v0, "reactnativequickcrypto"
                    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
                    :try_end_qc
                    .catch Ljava/lang/Throwable; {:try_start_qc .. :try_end_qc} :catch_qc
                    goto :after_qc
                    :catch_qc
                    :after_qc

                    :try_start_init
                    invoke-static {}, Lcom/facebook/react/bridge/ReactNativeJniCommonSoLoader;->staticInit()V
                    invoke-static {}, Lcom/facebook/react/bridge/BridgeSoLoader;->staticInit()V
                    :try_end_init
                    .catch Ljava/lang/Throwable; {:try_start_init .. :try_end_init} :catch_init
                    goto :after_init
                    :catch_init
                    :after_init

                    const/4 v0, 0x0
                    invoke-static {v0, v0, v0}, Lcom/facebook/react/defaults/DefaultNewArchitectureEntryPoint;->load(ZZZ)V

                    return-void
                """
            )
        }
        runCatching {
            MainActivityOnCreateFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    invoke-super {p0, v0}, Lcom/facebook/react/ReactActivity;->onCreate(Landroid/os/Bundle;)V
                    return-void
                """
            )
        }

        // 9b) VMRunner stub - return null instead of executing PairIP VM programs
        runCatching {
            VMRunnerInvokeFingerprint.method.addInstructions(
                0,
                """
                    const/4 p0, 0x0
                    return-object p0
                """
            )
        }
        runCatching { VMRunnerSetContextFingerprint.method.addInstructions(0, "return-void") }

        // 9c) OpenSourceMergedSoMapping.invokeJniOnload stub
        runCatching { OpenSourceMergedSoMappingInvokeJniOnloadFingerprint.method.addInstructions(0, "return-void") }

        // 9d) ReactMarker.notifyNativeMarker stub
        runCatching { ReactMarkerNotifyNativeMarkerFingerprint.method.addInstructions(0, "return-void") }

        // 9e) InspectorFlags stubs
        runCatching {
            InspectorFlagsGetFuseboxEnabledFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }
        runCatching {
            InspectorFlagsGetIsProfilingBuildFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }

        // 9f) Keep malformed native-map entries from aborting UIManager
        // constant conversion. A placeholder preserves the value without
        // passing a null key into Kotlin's non-null WritableNativeMap API.
        runCatching {
            ArgumentsAddEntryFingerprint.method.addInstructions(
                0,
                """
                    if-nez p1, :cond_args_key_ok
                    const-string p1, "__diskwala_null_key__"
                    :cond_args_key_ok
                """
            )
        }

        // PairIP's string-table fields are otherwise left null by Morphe.
        // Restore the table values needed by React Native and common SDK code.
        runCatching {
            val strings = mapOf(
                "vGJsbKNOZNUs" to ",",
                "atjdFgibR" to "kotlinx.coroutines.semaphore.maxSpinCycles",
                "NoRPzzBxaOriDN" to "UTF-8",
                "kUjeFPxSYsqTYj" to "UTF-8",
                "chKk" to "UTF-8",
                "RwSGPNCyK" to ".*",
                "bunFFcOP" to ".*",
                "aqNiPYIgREz" to "os.name",
                "aYOwt" to "os.name",
                "PZtkidzwPHFDfz" to "android.text.EmojiConsistency",
                "kRnVqMj" to "matrix",
                "TsJGojv" to "detailMessage",
                "ZnbUz" to "customerInfo",
                "FLg" to "apiKey",
                "CcEESTrXMArHyXc" to "locale",
                "MeRDfZUAkvBNAFH" to "billingConfig",
                "dXURmAwKIXAMUdV" to "activity",
                "wAAmuC" to "view",
                "xVksFlSCHmlnWgV" to "purchases",
                "pLgEmsBSXqJYjEx" to "descriptor",
                "GYWtWD" to "channel",
                "kSImNbwsnyUac" to "key",
                "oNcMEZvslKum" to "value",
                "WxcMawMfvzxQK" to "error",
                "cSyzEKzLmu" to "tag",
                "Ynt" to "eventName",
                "ZRUWY" to "url",
                "CDBxDhHziOFivd" to "adUnit",
                "SxfdxQEM" to "action",
                "doM" to "setting",
                "imSqba" to "javascript",
                "MhicdH" to "verification",
                "TFqaaPJ" to "data",
                "Xvahkiq" to "config",
                "YFE" to "sessionId"
            )
            val table = mutableClassDefBy(
                "Landroidx/work/impl/workers/jT/WViRlFMhwyJlhr;"
            )
            table.fields.forEach { field ->
                val value = strings[field.name] ?: return@forEach
                val encoded = object : StringEncodedValue {
                    override fun getValue(): String = value
                    override fun getValueType(): Int = 0x17
                    override fun compareTo(other: EncodedValue): Int =
                        value.compareTo((other as StringEncodedValue).value)
                }
                field.setInitialValue(MutableStringEncodedValue(encoded))
            }
        }

        // 9h) ReactTextInputShadowNode.createInternalEditText safe fallback
        runCatching {
            ReactTextInputShadowNodeCreateInternalEditTextFingerprint.method.addInstructions(
                0,
                """
                    invoke-virtual {p0}, Lcom/facebook/react/uimanager/ReactShadowNodeImpl;->getThemedContext()Lcom/facebook/react/uimanager/ThemedReactContext;
                    move-result-object v0
                    new-instance v1, Landroid/widget/EditText;
                    const/4 v2, 0x0
                    const/4 v3, 0x0
                    invoke-direct {v1, v0, v2, v3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
                    return-object v1
                """
            )
        }

        // 10) Play Integrity Token bypass
        runCatching {
            PlayIntegrityRequestTokenFingerprint.method.addInstructions(
                0,
                """
                    const-string v0, "diskwala_stub_integrity_token"
                    invoke-interface {p3, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                    return-void
                """
            )
        }
        runCatching {
            PlayIntegrityLambdaRejectFingerprint.method.addInstructions(
                0,
                """
                    const-string v0, "diskwala_stub_integrity_token"
                    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                    return-void
                """
            )
        }

        // 11) BlobCollector nativeInstall stub
        runCatching {
            BlobCollectorNativeInstallFingerprint.method.addInstructions(0, "return-void")
        }
        runCatching {
            BlobCollectorInstallLambdaFingerprint.method.addInstructions(0, "return-void")
        }

        // Some patched TLS data can contain a null cipher-suite entry. Keep
        // OkHttp's ordering comparator total so HTTPS setup does not abort.
        runCatching {
            OkHttpCipherSuiteComparatorFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }

        // A malformed transform entry currently throws NoSuchKeyException and
        // kills the process during the first React render. Keep the manager
        // reference but disable only transform animations so startup survives.
        runCatching {
            TransformAnimatedNodeConstructorFingerprint.method.addInstructions(
                0,
                """
                    invoke-direct {p0}, Lcom/facebook/react/animated/AnimatedNode;-><init>()V
                    iput-object p2, p0, Lcom/facebook/react/animated/TransformAnimatedNode;->nativeAnimatedNodesManager:Lcom/facebook/react/animated/NativeAnimatedNodesManager;
                    invoke-static {}, Lzc/v;->m()Ljava/util/List;
                    move-result-object v0
                    iput-object v0, p0, Lcom/facebook/react/animated/TransformAnimatedNode;->transformConfigs:Ljava/util/List;
                    return-void
                """
            )
        }

        // The protected build can leave the optional gRPC message-encoding
        // name null. Initialize the object as an empty encoding registry so
        // asynchronous network startup cannot crash in String.contains().
        runCatching {
            GrpcMessageEncodingConstructorFingerprint.method.addInstructions(
                0,
                """
                    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
                    new-instance v0, Ljava/util/LinkedHashMap;
                    const/4 v1, 0x0
                    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V
                    iput-object v0, p0, Lnb/v;->a:Ljava/util/Map;
                    new-array v0, v1, [B
                    iput-object v0, p0, Lnb/v;->b:[B
                    return-void
                """
            )
        }

        // The protected APK can leave gRPC's system-property name null. Use
        // the normal gRPC defaults and avoid the null-key System.getProperty
        // call during class initialization.
        runCatching {
            GrpcDnsResolverStaticInitializerFingerprint.method.addInstructions(
                0,
                """
                    const-class v0, Lio/grpc/internal/D;
                    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;
                    move-result-object v1
                    invoke-static {v1}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;
                    move-result-object v1
                    sput-object v1, Lio/grpc/internal/D;->s:Ljava/util/logging/Logger;
                    const-string v1, "clientLanguage"
                    const-string v2, "percentage"
                    const-string v3, "clientHostname"
                    const-string v4, "serviceConfig"
                    filled-new-array {v1, v2, v3, v4}, [Ljava/lang/String;
                    move-result-object v1
                    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
                    move-result-object v1
                    new-instance v2, Ljava/util/HashSet;
                    invoke-direct {v2, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
                    invoke-static {v2}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;
                    move-result-object v1
                    sput-object v1, Lio/grpc/internal/D;->t:Ljava/util/Set;
                    const-string v1, "true"
                    sput-object v1, Lio/grpc/internal/D;->u:Ljava/lang/String;
                    const-string v1, "false"
                    sput-object v1, Lio/grpc/internal/D;->v:Ljava/lang/String;
                    sput-object v1, Lio/grpc/internal/D;->w:Ljava/lang/String;
                    const/4 v1, 0x1
                    sput-boolean v1, Lio/grpc/internal/D;->x:Z
                    const/4 v1, 0x0
                    sput-boolean v1, Lio/grpc/internal/D;->y:Z
                    sput-boolean v1, Lio/grpc/internal/D;->z:Z
                    return-void
                """
            )
        }

        // The bundled legacy JS event table does not register topEndEditing.
        // Map this native-only event to the legacy event understood by that
        // bundle instead of crashing the React bridge.
        runCatching {
            ReactTextInputEndEditingEventNameFingerprint.method.addInstructions(
                0,
                "const-string v0, \"topChange\"\nreturn-object v0"
            )
        }

        // 12) DefaultNewArchitectureEntryPoint load stub
        runCatching {
            DefaultNewArchitectureEntryPointLoadFingerprint.method.addInstructions(0, "return-void")
        }

        // Prevent all React Native new-architecture accessors from reaching
        // the absent react_featureflagsjni implementation.
        runCatching { RNEnableBridgelessArchitectureFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0") }
        runCatching { RNEnableFabricRendererFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0") }
        runCatching { RNIsNewArchitectureStrictModeEnabledFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0") }
        runCatching { RNUseFabricInteropFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0") }
        runCatching { RNUseTurboModuleInteropFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0") }
        runCatching { RNUseTurboModulesFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0") }
        runCatching { RNEnableEagerRootViewAttachmentFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0") }
        runCatching { RNCxxNativeAnimatedEnabledFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0") }

        // CxxAccessor is a Java wrapper around react_featureflagsjni. The
        // standalone patched APK does not contain that JNI implementation.
        // Patch every wrapper method, not only the handful used during the
        // first startup path; otherwise the next view manager reaches a
        // different native method and aborts React context creation.
        runCatching {
            val accessor = mutableClassDefBy(
                "Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsCxxAccessor;"
            )
            accessor.methods.forEach { method ->
                if (method.name == "<init>") return@forEach
                val implementation = method.implementation ?: return@forEach
                val size = implementation.instructions.count()
                if (size > 0) method.removeInstructions(0, size)
                when (method.returnType) {
                    "V" -> method.addInstructions("return-void")
                    "Z", "B", "S", "I", "F", "C" ->
                        method.addInstructions("const/4 v0, 0x0\nreturn v0")
                    "J", "D" -> method.addInstructions("const-wide/16 v0, 0x0\nreturn-wide v0")
                    else -> method.addInstructions("const/4 v0, 0x0\nreturn-object v0")
                }
            }
        }

        // These callers can reach native feature flags directly; bypass the
        // optional inspector/module fallback paths when that JNI library is
        // absent from the standalone APK.
        runCatching {
            ReactInstanceManagerInspectorTargetFingerprint.method.addInstructions(
                0, "const/4 v0, 0x0\nreturn-object v0"
            )
        }
        // 13) FreeRASP native modules stub
        runCatching {
            FreeRaspCreateNativeModulesFingerprint.method.addInstructions(
                0,
                """
                    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;
                    return-object v0
                """
            )
        }

        // 14) React Native Shadow Nodes (Switch measurement crash-proofing)
        runCatching {
            ReactSwitchShadowNodeMeasureFingerprint.method.addInstructions(
                0,
                """
                    const/16 v0, 0x80
                    const/16 v1, 0x48
                    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaMeasureOutput;->make(II)J
                    move-result-wide v0
                    return-wide v0
                """
            )
        }

        // 15) SystemProps Null Safety (Prevents "key can't be null" NPE in System.getProperty when PairIP strings are bypassed)
        runCatching {
            SystemPropsGetPropertyGFingerprint.method.addInstructions(
                0,
                """
                    if-nez p0, :cond_g_null
                    const/4 v0, 0x0
                    return-object v0
                    :cond_g_null
                """
            )
        }
        runCatching {
            SystemPropsGetPropertyFFingerprint.method.addInstructions(
                0,
                """
                    if-nez p0, :cond_f_null
                    const/4 v0, 0x0
                    return-object v0
                    :cond_f_null
                """
            )
        }
        runCatching {
            SystemPropsGetPropertyF2Fingerprint.method.addInstructions(
                0,
                """
                    if-nez p0, :cond_f2_null
                    return-object p1
                    :cond_f2_null
                """
            )
        }
        runCatching {
            SystemPropsGetPropertyHFingerprint.method.addInstructions(
                0,
                """
                    if-nez p0, :cond_h_null
                    return-object p1
                    :cond_h_null
                """
            )
        }
    }
}
