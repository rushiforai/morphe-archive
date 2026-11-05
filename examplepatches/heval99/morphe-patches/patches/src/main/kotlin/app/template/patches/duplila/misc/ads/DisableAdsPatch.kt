package app.template.patches.duplila.misc.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.duplila.misc.license.disableLicenseCheckPatch
import app.template.patches.shared.Constants.COMPATIBILITY_DUPLILA
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// Duplila's only ad is a Google Mobile Ads banner under the device list, shown to free users once
// UMP consent allows ads. Enable Premium already removes it through the app's own premium branch;
// this patch works on its own as well.
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes ads and the ad consent form."
) {
    compatibleWith(COMPATIBILITY_DUPLILA)

    // Every patched build is re-signed and would otherwise stop at the license paywall.
    dependsOn(disableLicenseCheckPatch)

    execute {
        // 1. Skip the UMP consent flow. No consent form is requested or shown, the "consent is
        // required for the free version" exit never runs, and initAds() is never reached, so
        // canShowAds stays false. The flow also turns Firebase Analytics collection on; that is
        // skipped too (the manifest default stays in force). Its consent callback is also where
        // the app sets up Crashlytics and enables the privacy options entry
        // (requireShowPrivacyOptions), so neither happens.
        ConsentFlowFingerprint.method.returnEarly()

        // 2. The banner composable emits nothing, so no AdView and no "Cannot show ads" filler
        // row (shown when canShowAds is false) are left under the device list. It is also the
        // only place that starts Google Mobile Ads (MobileAds.initialize is inlined into its
        // LaunchedEffect) and builds the AdView. It returns before startRestartGroup, so the
        // caller's groups stay balanced.
        BannerViewFingerprint.method.returnEarly()

        // 3. Backstop at the SDK: BaseAdView.loadAd(AdRequest) is a no-op. The GMA classes are
        // R8-renamed, so loadAd is found as the BaseAdView method that creates the
        // "BaseAdView.loadAd" runnable, and BaseAdView as that runnable's ViewGroup field.
        // MobileAds.initialize is left alone: it no longer exists as a method (so rule 9 has
        // nothing to neuter) and its only inlined copy sits behind step 2.
        val loadRunnable = BaseAdViewLoadRunnableFingerprint.classDef
        val baseAdViewTypes = loadRunnable.fields.map { it.type }.filter {
            classDefByOrNull(it)?.superclass == "Landroid/view/ViewGroup;"
        }
        val baseAdViewType = baseAdViewTypes.singleOrNull() ?: throw PatchException(
            "Disable ads: expected one BaseAdView field in ${loadRunnable.type}, found $baseAdViewTypes"
        )
        val loads = mutableClassDefBy(baseAdViewType).methods.filter { method ->
            method.returnType == "V" && method.parameterTypes.size == 1 &&
                !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.NEW_INSTANCE &&
                        ((it as ReferenceInstruction).reference as? TypeReference)?.type == loadRunnable.type
                } == true
        }
        if (loads.size != 1) {
            throw PatchException("Disable ads: expected one loadAd in $baseAdViewType, found ${loads.size}")
        }
        loads.single().returnEarly()
    }
}
