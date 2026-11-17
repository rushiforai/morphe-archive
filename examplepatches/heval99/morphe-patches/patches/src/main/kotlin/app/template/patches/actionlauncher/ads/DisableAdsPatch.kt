package app.template.patches.actionlauncher.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_ACTIONLAUNCHER
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

// Action Launcher loads its native ad through one concrete AdHandle: AdMobAdHandle.d() is the
// abstract load's only implementation, it initialises Google Mobile Ads and issues the native ad
// request. No other static on MobileAds is called anywhere in the app, so returning at its entry
// leaves nothing that could throw "initialize() must be called first" (rule 9). The classes are
// app-owned and keep their names.
private const val ADMOB_HANDLE = "Lcom/actionlauncher/ads/AdMobAdHandle;"
private const val MOBILE_ADS = "Lcom/google/android/gms/ads/MobileAds;"

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes the native ads.",
) {
    compatibleWith(COMPATIBILITY_ACTIONLAUNCHER)

    execute {
        val handle = mutableClassDefBy(ADMOB_HANDLE)
        val load = handle.methods.singleOrNull {
            it.name == "d" && it.returnType == "V" && it.parameterTypes.isEmpty() && it.implementation != null
        } ?: throw PatchException("$ADMOB_HANDLE->d()V not found")

        val callsMobileAds = load.implementation!!.instructions.any { instruction ->
            (instruction as? ReferenceInstruction)?.reference.toString().contains(MOBILE_ADS)
        }
        if (!callsMobileAds) {
            throw PatchException("$ADMOB_HANDLE->d() is not the ad load (no $MOBILE_ADS call)")
        }
        load.returnEarly()
    }
}
