package semicoloncolonel.mobilestream.patches.washingtonpost.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.shared.misc.disableAirshipInAppMessages
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.washingtonpost.shared.Constants

// WaPo phone 7.18.1. The app's marketing pop-ups (subscription offers and
// other campaigns) are Airship in-app messages; see AirshipInAppMessages.kt.
//
// The "Go beyond the headlines. Subscribe" banner under the home page's
// section tabs is the front-page subscription banner. The server config
// switches it on or off (RawFrontSubscriptionBanner, on when unset), and
// MainActivity turns that switch and the subscription state into
// configHideBanner for the home page's banner state. That method now always
// answers true, which hides the banner for readers without a subscription.
// The banner shown to subscribers is a different state and is not touched.
//
// The paywall is a separate, native bottom sheet driven by metering
// (com.washingtonpost.android.paywall) and is not touched.

private const val MAIN_ACTIVITY = "Lcom/wapo/flagship/wapomain/MainActivity;"

internal object FrontSubscriptionBannerFingerprint : Fingerprint(
    definingClass =
        "Lcom/washingtonpost/android/config/data/datasources/dto/config/paywallconf/RawFrontSubscriptionBanner;",
    name = "b",
    parameters = listOf(),
)

@Suppress("unused")
val hideMarketingPopupsPatch = bytecodePatch(
    name = "Hide marketing pop-ups",
    description = "Stops in-app marketing pop-ups, such as subscription offers, and the subscribe banner.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        disableAirshipInAppMessages()

        // The banner setting's type, read from its non-obfuscated config class.
        val bannerSetting = FrontSubscriptionBannerFingerprint.method.returnType
        val hideBanner = mutableClassDefBy(MAIN_ACTIVITY).methods.firstOrNull { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any {
                    (it.opcode == Opcode.INVOKE_VIRTUAL) &&
                        ((it as ReferenceInstruction).reference as? MethodReference)?.definingClass == bannerSetting
                } == true
        } ?: throw PatchException("Home page banner decision not found")
        hideBanner.returnEarly("const/4 v0, 0x1\nreturn v0")
    }
}
