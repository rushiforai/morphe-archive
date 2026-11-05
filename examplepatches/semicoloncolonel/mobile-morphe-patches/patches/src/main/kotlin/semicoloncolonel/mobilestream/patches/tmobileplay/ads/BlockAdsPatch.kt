package semicoloncolonel.mobilestream.patches.tmobileplay.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.tmobileplay.shared.Constants

// T-Mobile Play 19.4.4. Every ad in the app's feeds (Google Ad Manager with
// AppLovin, BidMachine, Nimbus, PubMatic and other bidders, plus Taboola)
// is requested and drawn by one ad component provider. Its preload methods
// return before any ad is requested, and its composables draw nothing.
// Taboola is also never started.

// The provider's preload method, (screenName, params, callback, actions, adItem).
internal object AdPreloadFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("adItem", "screenName"),
    custom = { method, _ -> method.parameterTypes.size == 5 },
)

internal object TaboolaInitFingerprint : Fingerprint(
    definingClass = "Lcom/taboola/android/Taboola;",
    name = "init",
    parameters = listOf("Lcom/taboola/android/TBLPublisherInfo;"),
    returnType = "V",
)

@Suppress("unused")
val blockAdsPatch = bytecodePatch(
    name = "Block ads",
    description = "Removes the ads from the feeds and stops the ad networks from loading.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val provider = AdPreloadFingerprint.classDef.type

        // Preloads (single and list) and the ad config setter: everything that requests an ad.
        val requests = forEachMatchingMethod(
            { it.type == provider },
            { method ->
                method.returnType == "V" && !AccessFlags.STATIC.isSet(method.accessFlags) &&
                    !AccessFlags.CONSTRUCTOR.isSet(method.accessFlags) &&
                    method.parameterTypes.isNotEmpty() &&
                    method.parameterTypes.none { it.startsWith("Landroidx/compose/runtime/") } &&
                    (method.parameterTypes.size == 5 || method.parameterTypes.first().toString() == "Ljava/util/Set;")
            },
        ) { it.returnEarly("return-void") }
        if (requests < 2) throw PatchException("T-Mobile Play ad preload methods not found ($requests)")

        // Composables: every method that takes the Compose composer draws nothing.
        val composables = forEachMatchingMethod(
            { it.type == provider },
            { method ->
                method.returnType == "V" && !AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.parameterTypes.any { it.startsWith("Landroidx/compose/runtime/") }
            },
        ) { it.returnEarly("return-void") }
        if (composables == 0) throw PatchException("T-Mobile Play ad composables not found")

        TaboolaInitFingerprint.methodOrNull?.returnEarly("return-void")
    }
}
