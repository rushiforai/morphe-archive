package app.template.patches.letterboxd.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.COMPATIBILITY_LETTERBOXD

/**
 * Letterboxd's free tier serves Google AdMob banners (on a film's page and a couple of other
 * spots). Every banner is gated by a chain of "should I show ads" checks; this forces all of
 * them off so nothing ever loads.
 *
 * Lineage: the same four call sites ReVanced/De-Vanced target, resolved here by defining class +
 * signature and neutralised with one [neutralise] helper that branches on the method's own
 * return type rather than a per-site ladder.
 */
@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Stops the Google AdMob banners shown to free accounts from loading anywhere " +
        "in the app. On by default.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    execute {
        // setShowAds(boolean): pin the stored flag to false at the method head.
        AdmobSetShowAdsFingerprint.method.addInstruction(0, "const/4 p1, 0x0")

        // Every "should an ad show" query answers no.
        listOf(
            AdmobShouldShowAdsFingerprint,
            FilmFragmentShowAdsFingerprint,
            MemberExtensionShowAdsFingerprint,
        ).forEach { it.method.neutralise() }
    }
}

/**
 * Return a falsy value from the head of [this]: nothing for `void`, `false` for `boolean`,
 * `null` for a reference type. The targeted methods are only ever one of those three.
 */
private fun MutableMethod.neutralise() = when (returnType) {
    "V" -> addInstruction(0, "return-void")
    "Z" -> addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    else -> addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
}
