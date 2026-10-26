package app.morphe.patches.hdo.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.hdo.utils.COMPATIBILITY_HDO
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

/** Method channel prefix registered by the `unity_ads_plugin` Flutter plugin. */
private const val UNITY_ADS_PLUGIN_CHANNEL = "com.rebeloid.unity_ads"

private const val METHOD_CALL_HANDLER = "Lio/flutter/plugin/common/MethodChannel\$MethodCallHandler;"
private const val METHOD_CALL = "Lio/flutter/plugin/common/MethodCall;"
private const val METHOD_CHANNEL = "Lio/flutter/plugin/common/MethodChannel;"
private const val METHOD_CHANNEL_RESULT = "Lio/flutter/plugin/common/MethodChannel\$Result;"
private const val ADS_SDK_INITIALIZER = "Lcom/unity3d/services/core/configuration/AdsSdkInitializer;"

/** Methods of the plugin's `onMethodCall` dispatcher that are replaced by fake responses. */
private val AD_METHODS = listOf("init", "showVideo", "load", "isInitialized", "privacyConsent_set")

/**
 * Removes Unity Ads (the only ad network used by HDO Box).
 *
 * HDO Box is a Flutter app, so its ad UI is driven by the `unity_ads_plugin` method channel
 * handler rather than by app code. Instead of patching the Dart snapshot, every plugin method
 * is answered locally: `init` reports `initComplete`, `load` reports `loadComplete`,
 * `showVideo` reports `showStart` + `showComplete` (which is what releases the flow the ad was
 * gating), `isInitialized` and `privacyConsent_set` simply succeed. Unity Ads is therefore never
 * initialized, never downloads a single ad, and the app behaves as if every ad had been watched.
 */
@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes Unity Ads by answering the app's ad plugin locally, so no ad is ever " +
        "initialized, loaded or displayed.",
) {
    compatibleWith(*COMPATIBILITY_HDO)

    execute {
        val plugin = resolveUnityAdsPluginClass()
        val pluginType = plugin.type
        val mutablePlugin = mutableClassDefBy(plugin)

        val channelFieldName = resolveChannelFieldName(plugin)
        val (bridgeFieldName, bridgeType) = resolveAdEventBridge(plugin)
        val dispatchName = resolveAdEventDispatchName(bridgeType)
        val invokeMethodSignature = resolveInvokeMethodSignature()

        val onMethodCall = mutablePlugin.methods.single {
            it.isPluginMethodCallHandler()
        }
        onMethodCall.addInstructionsWithLabels(
            0,
            buildString {
                append(probeChain())
                AD_METHODS.forEach { method ->
                    append(
                        fakeHandler(
                            method,
                            pluginType,
                            channelFieldName,
                            bridgeFieldName,
                            bridgeType,
                            dispatchName,
                            invokeMethodSignature,
                        ),
                    )
                }
            },
            // Falls through to the original dispatcher for every other plugin method.
            ExternalLabel("hdo_original", onMethodCall.getInstruction(0)),
        )

        // Unity Ads also prepares itself from androidx.startup when the process starts.
        // Neutralise that initializer so nothing of the SDK is set up at all.
        val sdkInitializer = classDefByOrNull(ADS_SDK_INITIALIZER)
            ?: throw PatchException("$ADS_SDK_INITIALIZER not found")
        mutableClassDefBy(sdkInitializer).methods.filter { it.isSdkInitializerEntryPoint() }.forEach {
            it.returnEarly()
        }


    }
}

/**
 * Resolves the Unity Ads plugin method call handler: the only class that both registers the
 * `com.rebeloid.unity_ads` channel and implements `MethodChannel.MethodCallHandler`.
 */
private fun BytecodePatchContext.resolveUnityAdsPluginClass(): ClassDef {
    val candidates = classDefByStrings(UNITY_ADS_PLUGIN_CHANNEL).filter { classDef ->
        METHOD_CALL_HANDLER in classDef.interfaces &&
            classDef.methods.any { it.isPluginMethodCallHandler() }
    }
    return candidates.singleOrNull() ?: throw PatchException(
        "Expected exactly one Unity Ads plugin method call handler, found ${candidates.map { it.type }}",
    )
}

private fun Method.isPluginMethodCallHandler() =
    name == "onMethodCall" && returnType == "V" &&
        parameterTypes.joinToString("") == "$METHOD_CALL$METHOD_CHANNEL_RESULT"

/**
 * Resolves the name of the plugin's base `MethodChannel` field, which is the channel the plugin
 * reports initialization results on.
 */
private fun resolveChannelFieldName(plugin: ClassDef): String {
    val fields = plugin.fields.filter { field ->
        !AccessFlags.STATIC.isSet(field.accessFlags) && field.type == METHOD_CHANNEL
    }
    return fields.singleOrNull()?.name ?: throw PatchException(
        "Expected one base MethodChannel field on the Unity Ads plugin, found ${fields.map { it.name }}",
    )
}

/**
 * Resolves the plugin's ad event bridge: the non static field whose type declares a method
 * taking `(String eventName, String placementId, HashMap arguments)` and returning void.
 */
private fun BytecodePatchContext.resolveAdEventBridge(plugin: ClassDef): Pair<String, String> {
    val fields = plugin.fields.filter { field ->
        !AccessFlags.STATIC.isSet(field.accessFlags) &&
            classDefByOrNull(field.type)?.methods?.any { it.isAdEventDispatch() } == true
    }
    val field = fields.singleOrNull() ?: throw PatchException(
        "Expected one ad event bridge field on the Unity Ads plugin, found ${fields.map { it.name }}",
    )
    return field.name to field.type
}

private fun Method.isAdEventDispatch() =
    returnType == "V" && parameterTypes ==
        listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/HashMap;")

/** The (obfuscated) name of the ad event dispatch method on the bridge class. */
private fun BytecodePatchContext.resolveAdEventDispatchName(bridgeType: String): String =
    classDefBy(bridgeType).methods.single { it.isAdEventDispatch() }.name

/**
 * Resolves `MethodChannel.invokeMethod(String, Object)` from the embedding, because its return
 * type changed from `void` to `Future` across Flutter releases.
 */
private fun BytecodePatchContext.resolveInvokeMethodSignature(): String {
    val method = classDefBy(METHOD_CHANNEL).methods.singleOrNull {
        it.name == "invokeMethod" && it.parameterTypes == listOf("Ljava/lang/String;", "Ljava/lang/Object;")
    } ?: throw PatchException("$METHOD_CHANNEL has no invokeMethod(String, Object)")
    return "${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}"
}

/** Reads the placement id from the plugin's `MethodCall` arguments into `v0`. */
private val extractPlacementId = """
    iget-object v0, p1, $METHOD_CALL->arguments:Ljava/lang/Object;
    check-cast v0, Ljava/util/Map;
    const-string v1, "placementId"
    invoke-interface { v0, v1 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/String;
""".trimIndent()

/** Reports success to the plugin and returns from `onMethodCall` without running the original code. */
private val succeedAndReturn = """
    const/4 v3, 0x1
    invoke-static { v3 }, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v3
    invoke-interface { p2, v3 }, $METHOD_CHANNEL_RESULT->success(Ljava/lang/Object;)V
    return-void
""".trimIndent()

/** Builds the method name comparison chain that branches to each fake handler. */
private fun probeChain(): String = buildString {
    appendLine("iget-object v0, p1, $METHOD_CALL->method:Ljava/lang/String;")
    AD_METHODS.forEach { method ->
        appendLine(
            """
            const-string v1, "$method"
            invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v2
            if-nez v2, :hdo_$method
            """.trimIndent(),
        )
    }
    appendLine("goto :hdo_original")
}

/**
 * Builds the fake handler for a single plugin method, preceded by its branch label.
 *
 * @param method The plugin method being replaced.
 */
private fun fakeHandler(
    method: String,
    pluginType: String,
    channelFieldName: String,
    bridgeFieldName: String,
    bridgeType: String,
    dispatchName: String,
    invokeMethodSignature: String,
): String {
    val handler = when (method) {
        // The plugin normally forwards initialization results to its base channel.
        "init" -> """
            iget-object v3, p0, $pluginType->$channelFieldName:$METHOD_CHANNEL
            const-string v4, "initComplete"
            new-instance v5, Ljava/util/HashMap;
            invoke-direct { v5 }, Ljava/util/HashMap;-><init>()V
            invoke-virtual { v3, v4, v5 }, $METHOD_CHANNEL->$invokeMethodSignature
            $succeedAndReturn
            """.trimIndent()

        // A requested ad is reported as ready immediately.
        "load" -> """
            $extractPlacementId
            ${bridgeEvent("loadComplete", pluginType, bridgeFieldName, bridgeType, dispatchName)}
            $succeedAndReturn
            """.trimIndent()

        // Both the start and the successful completion of the ad are reported, which is what
        // the app uses to continue the flow the ad was gating.
        "showVideo" -> """
            $extractPlacementId
            ${bridgeEvent("showStart", pluginType, bridgeFieldName, bridgeType, dispatchName)}
            ${bridgeEvent("showComplete", pluginType, bridgeFieldName, bridgeType, dispatchName)}
            $succeedAndReturn
            """.trimIndent()

        // Reported as initialized so the app does not wait for an initialization that never happens.
        "isInitialized" -> succeedAndReturn

        // Consent flags are only ever read by the Unity SDK.
        "privacyConsent_set" -> succeedAndReturn

        else -> throw PatchException("Unknown Unity Ads plugin method: $method")
    }

    return ":hdo_$method\n$handler\n"
}

/** Sends an ad event for the placement held in `v0` through the plugin's event bridge. */
private fun bridgeEvent(
    event: String,
    pluginType: String,
    bridgeFieldName: String,
    bridgeType: String,
    dispatchName: String,
): String = """
    iget-object v3, p0, $pluginType->$bridgeFieldName:$bridgeType
    const-string v4, "$event"
    new-instance v5, Ljava/util/HashMap;
    invoke-direct { v5 }, Ljava/util/HashMap;-><init>()V
    invoke-virtual { v3, v4, v0, v5 }, $bridgeType->$dispatchName(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
""".trimIndent()



/**
 * Matches the androidx.startup entry points of the Unity Ads SDK initializer.
 *
 * Only the `void` overloads are matched; the `create(Context)` bridge delegates to the same
 * implementation, so neutralising it is enough.
 */
private fun Method.isSdkInitializerEntryPoint() =
    parameterTypes == listOf("Landroid/content/Context;") &&
        returnType == "V" && name != "dependencies" && name != "<init>"
