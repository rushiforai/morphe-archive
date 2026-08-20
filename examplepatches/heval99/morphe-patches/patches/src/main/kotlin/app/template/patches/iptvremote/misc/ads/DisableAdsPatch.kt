package app.template.patches.iptvremote.misc.ads

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_IPTVREMOTE
import app.morphe.util.returnEarly

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables Wortise ad SDK initialization, blocking banner, " +
            "interstitial, native and mediated ads (AppLovin, Yandex, Google " +
            "Mobile Ads, etc.)."
) {
    compatibleWith(COMPATIBILITY_IPTVREMOTE)

    execute {
        WortiseSdkInitializeFingerprint.methodOrNull?.returnEarly()
        WortiseSdkInitializeWithListenerFingerprint.methodOrNull?.returnEarly()
    }
}