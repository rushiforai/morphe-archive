package app.sledgesune.patches.waze.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch
import app.sledgesune.patches.shared.Constants.COMPATIBILITY_WAZE
import app.sledgesune.patches.waze.shared.applyConfigOnSync

private const val EXTENSION_CLASS = "Lapp/sledgesune/extension/waze/RemoveAdsPatch;"

/** The native core asks the app to show a full-screen ad (usually while stopped at a light). */
private object ShowAdvertisementTakeoverFingerprint : Fingerprint(
    definingClass = "Lcom/waze/ads/AdsNativeManagerBase;",
    name = "showAdvertisementTakeoverJNI",
    returnType = "V",
    parameters = listOf("[B"),
)

@Suppress("unused")
val removeAdsPatch = patch(
    name = "Remove ads",
    description = "Removes sponsored pins on the map, sponsored search results, the full-screen ad " +
        "when stopped and promotional launch screens.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)

    extendWith("extensions/extension.mpe")

    execute {
        ShowAdvertisementTakeoverFingerprint.method.addInstruction(0, "return-void")
        applyConfigOnSync(EXTENSION_CLASS)
    }
}
