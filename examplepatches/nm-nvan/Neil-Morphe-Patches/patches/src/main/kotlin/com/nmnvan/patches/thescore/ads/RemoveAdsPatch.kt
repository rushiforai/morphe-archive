package com.nmnvan.patches.thescore.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.nmnvan.patches.thescore.shared.Constants.COMPATIBILITY_THESCORE
import com.nmnvan.patches.thescore.shared.Constants.EXTENSION_PACKAGE
import com.nmnvan.patches.thescore.shared.isFrom
import com.nmnvan.patches.thescore.shared.sharedExtensionPatch

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/patches/HideAdsPatch;"

/** Makes a suspend ad loader report "no ad" (Boolean.FALSE) without requesting anything. */
private fun MutableMethod.returnNoAd() = addInstructions(
    0,
    """
        sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
        return-object v0
    """
)

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes ads everywhere: the startup splash, banners and large ads on every screen, " +
        "sponsor ads, full-screen ads and video ads.",
    default = true
) {
    compatibleWith(COMPATIBILITY_THESCORE)

    dependsOn(sharedExtensionPatch)

    execute {
        // region Ad gateway: every theScore ad of any type is loaded through ScoreAdWrapper.load().
        // Make every implementation report "failed to load" right away, the app's normal no-fill
        // result, so nothing is requested and every placement falls back to showing nothing.

        val adFailedType = AdFailedResultToStringFingerprint.originalClassDef.type

        val wrapperInterface = classDefBy { classDef ->
            classDef.isFrom(AD_WRAPPER_SOURCE_FILE) && AccessFlags.INTERFACE.isSet(classDef.accessFlags)
        }
        val loadMethod = wrapperInterface.methods.singleOrNull { method ->
            AccessFlags.ABSTRACT.isSet(method.accessFlags) &&
                method.returnType == "V" &&
                method.parameterTypes.size == AD_WRAPPER_LOAD_PARAMETERS_AFTER_AD_TYPE.size + 2 &&
                method.parameterTypes.subList(1, AD_WRAPPER_LOAD_PARAMETERS_AFTER_AD_TYPE.size + 1)
                    .map { it.toString() } == AD_WRAPPER_LOAD_PARAMETERS_AFTER_AD_TYPE
        } ?: throw PatchException("ScoreAdWrapper load method not found")

        val loadParameters = loadMethod.parameterTypes.map { it.toString() }
        val callbackType = loadParameters.last()
        classDefBy(callbackType).methods.singleOrNull { it.name == "invoke" && it.parameterTypes.size == 1 }
            ?: throw PatchException("Ad callback $callbackType has no invoke(Object)")

        val wrapperImplementations = buildList {
            classDefForEach { if (wrapperInterface.type in it.interfaces) add(it) }
        }
        if (wrapperImplementations.isEmpty()) throw PatchException("No ScoreAdWrapper implementations found")

        wrapperImplementations.forEach { implementation ->
            val load = mutableClassDefBy(implementation).methods.single { method ->
                method.name == loadMethod.name &&
                    method.parameterTypes.map { it.toString() } == loadParameters &&
                    method.implementation != null
            }
            // The callback is the last parameter and may be in a high register, so copy it to v1.
            load.addInstructions(
                0,
                """
                    move-object/from16 v1, p${loadParameters.size}
                    new-instance v0, $adFailedType
                    const/4 v2, 0x0
                    invoke-direct { v0, v2 }, $adFailedType-><init>(Ljava/lang/Integer;)V
                    invoke-interface { v1, v0 }, $callbackType->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                    return-void
                """
            )
        }

        // endregion

        // region Startup splash. A null SplashAd is the app's own "nothing to show" path.

        GetSplashAdFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )

        // endregion

        // region List ad slots. Drop ad items before the adapter diffs the list, so an ad that
        // never loads doesn't leave an empty slot behind.

        ListAdapterSetDataFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p1 }, $EXTENSION_CLASS->filterListAds(Ljava/util/List;)Ljava/util/List;
                move-result-object p1
            """
        )

        // endregion

        // region Extra layers. Applied when present; skipped if a future app version changes them,
        // since the ad gateway above already blocks these ads.

        MastheadAdLoadFingerprint.methodOrNull?.returnNoAd()
        MastheadAdDeferredLoadFingerprint.methodOrNull?.returnNoAd()
        BigBoxAdLoadFingerprint.methodOrNull?.returnNoAd()
        PresentedByAdLoadFingerprint.methodOrNull?.returnNoAd()

        // Video pre-roll: no ad tag, and always build the plain (ad-free) media item.
        VideoAdTagFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )
        // p2 (the ad tag Uri) can be above v15, so const/16 instead of const/4.
        VideoMediaItemFingerprint.methodOrNull?.addInstruction(0, "const/16 p2, 0x0")

        // Full-screen interstitials: never allowed to show.
        InterstitialCanShowFingerprint.methodOrNull?.returnNoAd()

        // Teads (articles): never load into the container.
        TeadsLoadAdFingerprint.methodOrNull?.addInstruction(0, "return-void")

        // endregion
    }
}
