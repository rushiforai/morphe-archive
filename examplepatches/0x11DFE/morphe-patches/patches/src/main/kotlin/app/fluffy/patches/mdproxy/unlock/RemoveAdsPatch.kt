package app.fluffy.patches.mdproxy.unlock

import app.fluffy.patches.mdproxy.AppOpenAdLoaderFingerprint
import app.fluffy.patches.mdproxy.BannerAdLoaderFingerprint
import app.fluffy.patches.mdproxy.HomeRewardedAdLoaderFingerprint
import app.fluffy.patches.mdproxy.InterstitialAdLoaderFingerprint
import app.fluffy.patches.mdproxy.ServerRowBoostClickFingerprint
import app.fluffy.patches.shared.Constants.COMPATIBILITY_MDPROXY
import app.fluffy.patches.waypoint.clearBody
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove Ads",
    description = "Empties the banner, interstitial, rewarded and app-open ad loaders and " +
        "the rewarded load in the server-row boost button. No ad request leaves the device. " +
        "Use with 'Unlock Speed Boost' to keep the boost button working.",
) {
    compatibleWith(COMPATIBILITY_MDPROXY)

    execute {
        listOf(
            HomeRewardedAdLoaderFingerprint,
            InterstitialAdLoaderFingerprint,
            BannerAdLoaderFingerprint,
            AppOpenAdLoaderFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.apply {
                clearBody()
                addInstructions(0, "return-void")
            }
        }

        // The server-row handler is a packed-switch lambda (case 0 = boost,
        // default = server select); an early return would kill server
        // selection, so only the RewardedAd.load call is neutralized.
        val rowHandler = ServerRowBoostClickFingerprint.method
        val impl = rowHandler.implementation
            ?: throw PatchException("server-row boost handler has no implementation")
        val loadIndex = impl.instructions.indexOfFirst { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            insn.opcode == Opcode.INVOKE_STATIC &&
                ref?.definingClass == "Lcom/google/android/gms/ads/rewarded/RewardedAd;" &&
                ref.name == "load"
        }
        if (loadIndex < 0) {
            throw PatchException("RewardedAd.load not found in the server-row boost handler")
        }
        impl.replaceInstruction(loadIndex, BuilderInstruction10x(Opcode.NOP))

        println("MD Proxy: banner, interstitial, rewarded and app-open loaders emptied")
    }
}
