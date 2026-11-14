package semicoloncolonel.mobilestream.patches.newsbreak.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.newsbreak.shared.Constants

// NewsBreak 26.44.1. Every ad placement asks one check whether the account is
// ad-free: the feed's ad rows, the app-open ad, interstitials, article
// banners, the large in-article ads, and the ads on local-alert pages. That
// check now says yes, so the app drops each placement the way it does for an
// ad-free account. Premium status alone does not cover the feed, app-open,
// interstitial, or banner ads.
//
// The check sits in an obfuscated class. It is found through a sibling method
// that holds the app's ad-experiment keys, and is the class's only static
// method with no parameters that returns a boolean.

internal object AdExperimentKeysFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("k122568", "c124014", "k122711"),
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads in the feed, the app-open and full-screen ads, and the ads in articles.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val candidates = AdExperimentKeysFingerprint.classDef.methods.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
        }
        val adFree = candidates.singleOrNull()
            ?: throw PatchException("Expected one ad-free check, found ${candidates.size}")
        adFree.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}
