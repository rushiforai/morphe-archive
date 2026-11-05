package app.template.patches.duplila.misc.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

// App classes keep their Kotlin source names. Since 5.4 the Google Mobile Ads and UMP libraries
// are R8-renamed: there are no com.google.android.ump classes, AdView/BaseAdView/AdRequest became
// g7.*, and MobileAds.initialize is inlined into the banner's own init coroutine.
internal const val MAIN_ACTIVITY = "Lcom/duplila/screenshare/main/MainActivity;"

// MainActivity's UMP consent flow, run once the premium check finishes (argument = paid). It
// requests consent info, shows the consent form if required and, for free users, closes the main
// screen when consent is refused ("Ad/Analytics consent is required for the free version") or
// otherwise calls SelectionScreenModel.initAds(), the only setter of canShowAds. It is the only
// (Z)V method reading MainActivity's lazy getConsentInformation() getter; the other two readers
// are its static callback lambdas.
internal object ConsentFlowFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        methodCall(definingClass = MAIN_ACTIVITY, name = "getConsentInformation"),
    ),
)

// The banner composable BannerView(Modifier, canShowAds, Composer, changed, default), found by its
// own "Cannot show ads" filler row (shown while canShowAds is false). The Compose parameter types
// are R8-renamed, so only the Boolean flag and the two trailing ints are checked.
internal object BannerViewFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("Cannot show ads"),
    custom = { method, _ ->
        val parameters = method.parameterTypes.map(CharSequence::toString)
        AccessFlags.STATIC.isSet(method.accessFlags) && parameters.size == 5 &&
            parameters[1] == "Z" && parameters[3] == "I" && parameters[4] == "I"
    },
)

// The Runnable that BaseAdView.loadAd posts when GMA loads on a background thread. Its catch block
// reports failures under GMA's own "BaseAdView.loadAd" crash tag, the only use of that string.
internal object BaseAdViewLoadRunnableFingerprint : Fingerprint(
    name = "run",
    returnType = "V",
    parameters = listOf(),
    strings = listOf("BaseAdView.loadAd"),
)
