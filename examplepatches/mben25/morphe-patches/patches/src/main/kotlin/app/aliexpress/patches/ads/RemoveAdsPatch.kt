package app.aliexpress.patches.ads

import app.aliexpress.patches.shared.Constants.COMPATIBILITY_ALIEXPRESS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Houyi (AliExpress' fork of PopLayer) LayerManager `tryOpen(ArrayList<PopRequest>)`
 * (`globalhouyi/layermanager/d.m` in 8.162.8). Every marketing pop layer — campaign
 * interstitials, coupon/“new user gift” overlays, embedded promo layers — is opened through it
 * by the trigger controller and `AEHouyiProcessor`. Both log strings are unique to it.
 *
 * Do not stub the Houyi/PopLayer init instead: other code reads the PopLayer singleton and
 * would crash on it being missing.
 *
 * History: the original patch matched "first `void(Application)` method in the app", which
 * resolved to `android.app.InstrumentationProxy.callApplicationOnCreate` and silently disabled
 * `Application.onCreate()`. Half the SDKs then never initialised, which (together with the
 * old "Enable image saving" patch) left product pages stuck on their loading skeleton.
 */
internal object HouyiLayerManagerTryOpenFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/util/ArrayList;"),
    strings = listOf(
        "%s.tryOpen,but LayerMgr`configs not ready.Saving",
        "%s.tryAdjustRequests=> add but status not in (waiting or showing)",
    ),
)

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Blocks the marketing pop-up layers (campaign interstitials, coupon and gift overlays) " +
        "shown over the home page, product pages and search.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ALIEXPRESS)

    execute {
        HouyiLayerManagerTryOpenFingerprint.method.addInstructions(0, "return-void")
    }
}
