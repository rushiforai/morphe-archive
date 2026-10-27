package app.template.patches.boxbox.misc.ads

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_BOXBOX
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val INTERSTITIAL = "Lcom/applovin/mediation/ads/MaxInterstitialAd;"
private const val MOBILE_ADS = "Lcom/google/android/gms/ads/MobileAds;"

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_BOXBOX)

    execute {
        // 1. The remote-config ad switch: AppConfigModel's constructor stores false as
        // isAdsEnabled, so every placement's "plan == Free && isAdsEnabled" check fails. Works
        // for both ad stacks (AppLovin MAX up to 5.4.16, Google Mobile Ads from 5.4.17). The
        // field is a Boolean from 5.4.16 and a primitive boolean in 5.4.9.
        val toString = AppConfigModelToStringFingerprint
        val toStringInstructions = toString.method.instructions
        val isAdsEnabled = toStringInstructions
            .drop(toString.instructionMatches[1].index)
            .firstOrNull { it.opcode == Opcode.IGET_OBJECT || it.opcode == Opcode.IGET_BOOLEAN }
            ?.let { (it as ReferenceInstruction).reference as FieldReference }
            ?.takeIf { it.type == "Ljava/lang/Boolean;" || it.type == "Z" }
            ?: throw PatchException("AppConfigModel.toString() reads no boolean after \", isAdsEnabled=\"")
        val boxed = isAdsEnabled.type == "Ljava/lang/Boolean;"

        var storesPatched = 0
        toString.classDef.methods.filter { it.name == "<init>" }.forEach { constructor ->
            val instructions = constructor.instructions.toList()
            // Descending, so an insert never shifts an index still to be visited.
            for (index in instructions.indices.reversed()) {
                val instruction = instructions[index]
                if (instruction.opcode != if (boxed) Opcode.IPUT_OBJECT else Opcode.IPUT_BOOLEAN) continue
                val field = (instruction as ReferenceInstruction).reference as FieldReference
                if (field.name != isAdsEnabled.name || field.type != isAdsEnabled.type ||
                    field.definingClass != isAdsEnabled.definingClass
                ) continue
                val value = (instruction as TwoRegisterInstruction).registerA
                constructor.addInstructionChecked(
                    index,
                    // const/16 takes any 8-bit register; const/4 would fail above v15.
                    if (boxed) "sget-object v$value, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;"
                    else "const/16 v$value, 0x0",
                )
                storesPatched++
            }
        }
        if (storesPatched == 0) {
            throw PatchException("No AppConfigModel constructor stores ${isAdsEnabled.name}")
        }

        // 2. AppLovin MAX (5.4.16 and older): every interstitial entry point. The terminal
        // showAd(String, String, Activity) is the one that actually displays the ad, so all
        // overloads are patched, not the first match.
        mutableClassDefByOrNull(INTERSTITIAL)?.methods.orEmpty()
            .filter { it.implementation != null }
            .filter { method ->
                (method.name == "loadAd" && method.parameterTypes.isEmpty()) ||
                    method.name == "showAd"
            }
            .forEach { it.returnEarly() }

        // 3. Google Mobile Ads (5.4.17+), belt and braces: the SDK never initialises and
        // interstitial, rewarded and banner loads do nothing. Optional, since 5.4.16 has no GMA.
        // MobileAds keeps its name but R8 inlines initialize into a static a(...); every static
        // void on it (that, setPlugin, stop) returns at once, since they throw without init
        // (AGENTS.md rule 9). 5.4.18 moved the inlined initialize out of MobileAds into the
        // app's ad init helper, so every static void that carries the SDK init log returns at
        // once too; the helper's "can request ads" flow then keeps its initial false.
        val gmaBundled = neutraliseMobileAdsStatics()
        InlinedMobileAdsInitFingerprint.matchAllOrNull()
            ?.filter { it.classDef.type != MOBILE_ADS }
            ?.forEach { it.method.returnEarly() }
        // Every full-screen load (interstitial, rewarded, rewarded interstitial, app open); with
        // GMA bundled at least one must match.
        val fullScreenLoads = FullScreenAdLoadFingerprint.matchAllOrNull().orEmpty()
        if (gmaBundled && fullScreenLoads.isEmpty()) {
            throw PatchException("Google Mobile Ads is bundled but no full-screen ad load was found")
        }
        fullScreenLoads.forEach { it.method.returnEarly() }
        BaseAdViewLoadAdFingerprint.methodOrNull?.returnEarly()
    }
}
