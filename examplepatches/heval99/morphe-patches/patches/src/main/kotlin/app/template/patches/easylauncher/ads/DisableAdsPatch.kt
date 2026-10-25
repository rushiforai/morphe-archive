package app.template.patches.easylauncher.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_EASYLAUNCHER
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads.",
) {
    compatibleWith(COMPATIBILITY_EASYLAUNCHER)

    execute {
        // 1. The ad gate every placement asks first reports "ads off", as after the ad-free
        // purchase.
        AdsEnabledFingerprint.method.returnEarly(false)

        // 2. The ad SDKs (next-gen GMA and CloudX) never start, and the UMP consent form is not
        // requested. App Check, Play Integrity and the rest of the startup are left alone.
        InitializeMobileAdsSdkFingerprint.method.returnEarly()
        RequestConsentInfoUpdateFingerprint.method.returnEarly()

        // 3. App-open ads: nothing is loaded, and showAd only runs its completion callback so the
        // deep link, app or notification target the user tapped still opens.
        AppOpenLoadAdFingerprint.method.returnEarly()
        AppOpenShowAdFingerprint.method.apply {
            val index = parameterTypes.map(CharSequence::toString).indexOf(FUNCTION0)
            if (index < 0) throw PatchException("$definingClass.$name has no $FUNCTION0 parameter")
            val offset = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
            val callback = "p${index + offset}"
            // The method has many locals, so the parameter is out of 4-bit range: use /range.
            addInstructionsChecked(
                0,
                """
                    invoke-interface/range {$callback .. $callback}, $FUNCTION0->invoke()Ljava/lang/Object;
                    return-void
                """,
            )
        }

        // 4. The native ad cache never preloads.
        NativeAdCacheReplenishFingerprint.method.returnEarly()

        // 5. Optional: the ad-free view model's copy of the gate.
        AdFreeViewModelIsAdsEnabledFingerprint.methodOrNull?.returnEarly(false)
    }
}
