package app.twrailway.patches.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.twrailway.patches.shared.Constants.COMPATIBILITY_TRAIN_SCHEDULE

/**
 * 火車時刻表 is a Flutter app. Its ads are requested from Dart through the
 * google_mobile_ads plugin, which forwards every ad request over the
 * `plugins.flutter.io/google_mobile_ads` method channel to the native
 * Google Mobile Ads (Next-Gen) SDK. The native SDK is fully obfuscated, so the
 * patch hooks the plugin's method channel handler instead.
 *
 * Every `load*` call (loadBannerAd, loadInterstitialAd, loadNativeAd, loadAppOpenAd,
 * loadRewardedAd, ...) is answered without loading anything: the plugin reports an
 * `onAdFailedToLoad` event (no fill) for the ad, then `result.success(null)`.
 * The app handles the failure like any unfilled ad request, so no ad is shown and the
 * space reserved for the banner at the bottom of the screen is released.
 */
@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Stops the app from loading banner, interstitial, native and app open ads, " +
        "and removes the empty space reserved for the banner.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRAIN_SCHEDULE)

    execute {
        // AdInstanceManager.onAdFailedToLoad(int, FlutterLoadAdError)
        val onAdFailedToLoad = AdInstanceManagerOnAdFailedToLoadFingerprint.originalMethod
        val adInstanceManagerType = onAdFailedToLoad.definingClass
        val loadAdErrorType = onAdFailedToLoad.parameterTypes[1].toString()

        // FlutterLoadAdError(int code, String domain, String message, FlutterResponseInfo responseInfo)
        val loadAdErrorConstructor = classDefBy(loadAdErrorType).methods.singleOrNull { method ->
            method.name == "<init>" &&
                method.parameterTypes.size == 4 &&
                method.parameterTypes[0].toString() == "I" &&
                method.parameterTypes[1].toString() == "Ljava/lang/String;" &&
                method.parameterTypes[2].toString() == "Ljava/lang/String;"
        } ?: throw PatchException("Could not find FlutterLoadAdError constructor in $loadAdErrorType")
        val responseInfoType = loadAdErrorConstructor.parameterTypes[3].toString()

        GoogleMobileAdsPluginOnMethodCallFingerprint.method.apply {
            val pluginType = definingClass
            val methodCallType = parameterTypes[0].toString()
            val resultType = parameterTypes[1].toString()

            val instanceManagerField = classDefBy(pluginType).fields.singleOrNull { field ->
                field.type == adInstanceManagerType
            } ?: throw PatchException("Could not find AdInstanceManager field in $pluginType")

            // MethodCall has two fields: `method` (String) and `arguments` (Object).
            val methodCallFields = classDefBy(methodCallType).fields
            val methodNameField = methodCallFields.singleOrNull { field ->
                field.type == "Ljava/lang/String;"
            } ?: throw PatchException("Could not find MethodCall.method field in $methodCallType")
            val argumentsField = methodCallFields.singleOrNull { field ->
                field.type == "Ljava/lang/Object;"
            } ?: throw PatchException("Could not find MethodCall.arguments field in $methodCallType")

            // MethodChannel.Result: success(Object), error(String, String, Object), notImplemented().
            val successMethod = classDefBy(resultType).methods.singleOrNull { method ->
                method.returnType == "V" &&
                    method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;")
            } ?: throw PatchException("Could not find MethodChannel.Result.success in $resultType")

            val implementation = implementation
                ?: throw PatchException("onMethodCall has no implementation")
            if (implementation.registerCount - 3 < 8) {
                throw PatchException("onMethodCall has too few free registers")
            }

            addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v0, p1
                    iget-object v1, v0, $methodCallType->${methodNameField.name}:Ljava/lang/String;
                    if-eqz v1, :original
                    const-string v2, "load"
                    invoke-virtual { v1, v2 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
                    move-result v1
                    if-eqz v1, :original

                    # Report the ad as not filled, so the app releases the space reserved for it.
                    move-object/from16 v1, p0
                    iget-object v1, v1, $pluginType->${instanceManagerField.name}:$adInstanceManagerType
                    if-eqz v1, :respond
                    iget-object v2, v0, $methodCallType->${argumentsField.name}:Ljava/lang/Object;
                    instance-of v3, v2, Ljava/util/Map;
                    if-eqz v3, :respond
                    check-cast v2, Ljava/util/Map;
                    const-string v3, "adId"
                    invoke-interface { v2, v3 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v2
                    instance-of v3, v2, Ljava/lang/Integer;
                    if-eqz v3, :respond
                    check-cast v2, Ljava/lang/Integer;
                    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
                    move-result v2
                    new-instance v3, $loadAdErrorType
                    const/4 v4, 0x3
                    const-string v5, "com.google.android.libraries.ads.mobile.sdk"
                    const-string v6, "No fill."
                    const/4 v7, 0x0
                    invoke-direct { v3, v4, v5, v6, v7 }, $loadAdErrorType-><init>(ILjava/lang/String;Ljava/lang/String;$responseInfoType)V
                    invoke-virtual { v1, v2, v3 }, $adInstanceManagerType->${onAdFailedToLoad.name}(I$loadAdErrorType)V

                    :respond
                    move-object/from16 v0, p2
                    const/4 v1, 0x0
                    invoke-interface { v0, v1 }, $resultType->${successMethod.name}(Ljava/lang/Object;)V
                    return-void
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }
    }
}
