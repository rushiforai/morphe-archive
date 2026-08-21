package app.hh.patches.punge

import app.hh.patches.shared.Constants.COMPATIBILITY_PUNGE
import app.hh.patches.shared.hideAdComponents
import app.hh.patches.shared.returnVoidEarly
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads for Punge",
    description = "Stops AdMob banners and interstitials from loading or showing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PUNGE)
    dependsOn(
        resourcePatch {
            compatibleWith(COMPATIBILITY_PUNGE)
            execute { hideAdComponents() }
        },
    )

    execute {
        var patched = 0

        // Skip MobileAds.initialize, but still fire the Flutter listener so
        // Dart's MobileAds.initialize Future completes.
        InitializationCompleteFingerprint.methodOrNull?.let { method ->
            method.addInstructions(
                0,
                """
                    iget-object v0, p0, Lio/flutter/plugins/googlemobileads/FlutterInitializationListener;->result:Lio/flutter/plugin/common/MethodChannel${'$'}Result;
                    const/4 v1, 0x0
                    invoke-interface { v0, v1 }, Lio/flutter/plugin/common/MethodChannel${'$'}Result;->success(Ljava/lang/Object;)V
                    return-void
                """.trimIndent(),
            )
            patched++
        }

        MobileAdsInitializeFingerprint.methodOrNull?.let { method ->
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    invoke-interface { p2, v0 }, Lcom/google/android/gms/ads/initialization/OnInitializationCompleteListener;->onInitializationComplete(Lcom/google/android/gms/ads/initialization/InitializationStatus;)V
                    return-void
                """.trimIndent(),
            )
            patched++
        }

        FlutterAdLoaderLoadFingerprint.matchAllOrNull()?.forEach { match ->
            if (match.method.returnVoidEarly()) patched++
        }

        FlutterAdLoadFingerprint.matchAllOrNull()?.forEach { match ->
            if (match.method.returnVoidEarly()) patched++
        }

        if (patched == 0) {
            throw PatchException(
                "Could not find Punge's AdMob loader. The app may have changed; no changes applied.",
            )
        }
    }
}

private object MobileAdsInitializeFingerprint : Fingerprint(
    definingClass = "Lio/flutter/plugins/googlemobileads/FlutterMobileAdsWrapper;",
    name = "initialize",
    returnType = "V",
)

private object FlutterAdLoaderLoadFingerprint : Fingerprint(
    definingClass = "Lio/flutter/plugins/googlemobileads/FlutterAdLoader;",
    custom = { method, _ -> method.name.startsWith("load") && method.returnType == "V" },
)

private object FlutterAdLoadFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type.startsWith("Lio/flutter/plugins/googlemobileads/Flutter") &&
            method.name == "load" &&
            method.returnType == "V" &&
            method.parameterTypes.isEmpty() &&
            method.implementation != null &&
            !AccessFlags.STATIC.isSet(method.accessFlags)
    },
)

private object InitializationCompleteFingerprint : Fingerprint(
    definingClass = "Lio/flutter/plugins/googlemobileads/FlutterInitializationListener;",
    name = "onInitializationComplete",
    returnType = "V",
)
