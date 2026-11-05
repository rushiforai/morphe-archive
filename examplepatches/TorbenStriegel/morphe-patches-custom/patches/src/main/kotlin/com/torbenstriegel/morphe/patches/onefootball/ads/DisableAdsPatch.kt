package com.torbenstriegel.morphe.patches.onefootball.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.torbenstriegel.morphe.patches.shared.Constants.COMPATIBILITY_ONEFOOTBALL

// OneFootball's app code is obfuscated, but every ad runs through Google Mobile Ads
// (com.google.android.gms.ads), whose class and method names are stable library API.
// This patch hooks that surface: the SDK never initializes, direct loads become no-ops
// and the app-open preloader reports failure.
// Written without app.morphe.util.returnEarly so it also runs on patcher-runtime 1.14.1.
private const val GMA = "Lcom/google/android/gms/ads/"

private val AD_CLASSES = mapOf(
    "BaseAdView" to listOf("loadAd"), "AdView" to emptyList(),
    "AdLoader" to listOf("loadAd", "loadAds"), "interstitial/InterstitialAd" to listOf("load"),
    "rewarded/RewardedAd" to listOf("load"), "rewardedinterstitial/RewardedInterstitialAd" to listOf("load"),
    "appopen/AppOpenAd" to listOf("load"), "admanager/AdManagerAdView" to listOf("loadAd"),
    "admanager/AdManagerInterstitialAd" to listOf("load"),
)

private fun BytecodePatchContext.methods(relative: String): Set<MutableMethod> =
    mutableClassDefByOrNull(GMA + relative + ";")?.methods.orEmpty()

private const val COMPONENT = "Lcom/onefootball/experience/core/model/ComponentModel;"
private val parseParameters = listOf("Ljava/lang/String;", "I", COMPONENT, "Lcom/google/protobuf/Any;")
private val adParsers = listOf(
    Fingerprint(definingClass = "Lcom/onefootball/experience/component/advertising/AdvertisingComponentParser;", name = "parse", returnType = COMPONENT, parameters = parseParameters),
    Fingerprint(definingClass = "Lcom/onefootball/experience/component/advertising/placeholder/AdvertisingPlaceholderComponentParser;", name = "parse", returnType = COMPONENT, parameters = parseParameters),
)
private const val CALL = "Lio/flutter/plugin/common/MethodCall;"
private const val RESULT = "Lio/flutter/plugin/common/MethodChannel\$Result;"
private val handlers = listOf(
    Fingerprint(definingClass = "Lcom/onefootball/core/flutter/methodhandlers/GetAdDataMethodHandler;", name = "handle", returnType = "V", parameters = listOf(CALL, RESULT)) to "getAdData",
    Fingerprint(definingClass = "Lcom/onefootball/core/flutter/methodhandlers/GetOMPAdDataMethodHandler;", name = "handle", returnType = "V", parameters = listOf(CALL, RESULT)) to "getOMPAdData",
)

// Adapted from heval99/Heval-Morphe-Patches; fail if the smali assembler drops instructions.
private fun MutableMethod.checkedInsert(smali: String, expected: Int, label: ExternalLabel? = null) {
    val impl = implementation ?: throw PatchException("Missing implementation: $definingClass->$name")
    val before = impl.instructions.count { it.opcode != Opcode.NOP }
    if (label == null) addInstructions(0, smali.trimIndent())
    else addInstructionsWithLabels(0, smali.trimIndent(), label)
    val added = impl.instructions.count { it.opcode != Opcode.NOP } - before
    if (added != expected) throw PatchException("Incomplete injection into $definingClass->$name: $added/$expected")
}

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables banner, interstitial, native, app-open and rewarded ads."
) {
    compatibleWith(COMPATIBILITY_ONEFOOTBALL)

    execute {
        // Prevent calls to uninitialized SDK statics as well as init itself.
        val statics = methods("MobileAds").filter {
            it.implementation != null && AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" && it.name != "<clinit>"
        }
        for (required in listOf("initialize", "openDebugMenu")) {
            if (statics.none { it.name == required }) throw PatchException("Missing MobileAds.$required")
        }
        statics.forEach { it.checkedInsert("return-void", 1) }
        methods("MobileAds").filter { it.name == "putPublisherFirstPartyIdEnabled" && it.returnType == "Z" && it.implementation != null }
            .forEach { it.checkedInsert("const/4 v0, 0x0\nreturn v0", 2) }

        // Direct loads become no-ops.rest
        for ((relative, required) in AD_CLASSES) {
            val loads = methods(relative)
                .filter { it.implementation != null }
                .filter { (it.name == "load" || it.name == "loadAd" || it.name == "loadAds") && it.returnType == "V" }
            for (name in required) if (loads.none { it.name == name }) throw PatchException("Missing $relative.$name")
            loads.forEach { it.checkedInsert("return-void", 1) }
        }

        // Nothing is preloaded for app-open ads:report false immediately.
        methods("appopen/AppOpenAdPreloader")
            .filter { it.implementation != null }
            .filter { it.name == "start" && it.returnType == "Z" }
            .forEach {
                it.addInstructions(
                    0,
                    """
                        const/4 v0, 0x0
                        return v0
                    """.trimIndent()
                )
            }

        adParsers.forEach { it.method.checkedInsert("const/4 v0, 0x0\nreturn-object v0", 2) }
        for ((fingerprint, channel) in handlers) {
            val handle = fingerprint.method
            handle.checkedInsert("""
                move-object/from16 v2, p1
                move-object/from16 v3, p2
                const-string v0, "$channel"
                iget-object v1, v2, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;
                invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :original
                const-string v0, "Ad Blocked"
                const/4 v1, 0x0
                invoke-interface {v3, v0, v1, v1}, Lio/flutter/plugin/common/MethodChannel${'$'}Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
                return-void
            """, 11, ExternalLabel("original", handle.getInstruction(0)))
        }
    }
}