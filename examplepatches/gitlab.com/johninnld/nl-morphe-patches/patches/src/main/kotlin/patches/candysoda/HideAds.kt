package patches.candysoda

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.Opcode

internal const val REWARD_MODULE = "Lcom/king/abm/adprovider/AdProviderModuleAndroid;"
internal const val SDK_MODULE = "Lcom/king/abm/adprovider/AdProviderSDKAndroid;"

private val adsResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        // Without ads there is no consent decision to make; remove the advertising ID
        // permission the ad SDKs read.
        document("AndroidManifest.xml").use { manifest ->
            val permissions = manifest.getElementsByTagName("uses-permission")
            val adId = (0 until permissions.length).map { permissions.item(it) as org.w3c.dom.Element }
                .filter { it.getAttributeNS("http://schemas.android.com/apk/res/android", "name") ==
                    "com.google.android.gms.permission.AD_ID" }
            // Disable tracking removes it too when both patches are selected.
            check(adId.size <= 1) { "Expected at most one advertising ID permission, found ${adId.size}" }
            adId.forEach { it.parentNode.removeChild(it) }
        }
    }
}

/**
 * Every full-screen ad (rewarded and interstitial adapters alike) reaches the ad networks
 * through the ABM JNI boundary: AdProviderSDKAndroid.init starts an ad SDK, and
 * AdProviderModuleAndroid.load fills an ad. Reporting the game's own no-fill callback keeps the
 * engine's ad state machine on its standard "no ad available" path, and no SDK ever starts.
 */
internal val candySodaAdsGate = bytecodePatch {
    dependsOn(originalInput, adsResources)

    execute {
        val reward = mutableClassDefBy(REWARD_MODULE)
        val load = reward.methods.singleOrNull {
            it.name == "load" && it.returnType == "V" && it.parameterTypes.size == 3
        } ?: error("Candy ad load entry changed")
        check(load.implementation?.instructions?.firstOrNull()?.opcode != Opcode.RETURN_VOID) {
            "Candy ad load already patched"
        }
        // (long address, String[], String[]) -> the address occupies two parameter registers.
        load.addInstructions(
            0,
            """
            const/4 v0, 0x0
            const-string v1, "ads disabled"
            invoke-static { p1, p2, v0, v1 }, $REWARD_MODULE->onLoadFailed(JILjava/lang/String;)V
            return-void
            """,
        )

        val sdk = mutableClassDefBy(SDK_MODULE)
        check(sdk.fields.any { it.name == "mAdProviderAddress" && it.type == "J" }) {
            "Candy ad SDK address field changed"
        }
        val init = sdk.methods.singleOrNull {
            it.name == "init" && it.returnType == "V" && it.parameterTypes.size == 2
        } ?: error("Candy ad SDK init entry changed")
        check(init.implementation?.instructions?.firstOrNull()?.opcode != Opcode.RETURN_VOID) {
            "Candy ad SDK init already patched"
        }
        init.addInstructions(
            0,
            """
            const/4 v0, 0x0
            const-string v1, "ads disabled"
            invoke-static { p1, p2, v0, v1 }, $SDK_MODULE->onSDKInitializedJNI(JZLjava/lang/String;)V
            return-void
            """,
        )
    }
}

@Suppress("unused")
val candySodaHideAds = bytecodePatch(
    name = "Hide ads",
    description = "Blocks the ad SDK bridge: SDK initialization reports failure and every rewarded or " +
        "interstitial request reports the game's own no-fill error, so no ad network is ever contacted.",
    default = true,
) {
    compatibleWith(candySoda)
    dependsOn(candySodaAdsGate)
}
