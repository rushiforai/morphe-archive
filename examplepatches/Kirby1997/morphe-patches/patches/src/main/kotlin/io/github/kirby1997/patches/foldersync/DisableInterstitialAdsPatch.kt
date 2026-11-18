package io.github.kirby1997.patches.foldersync

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// Lip/c; is a Kotlin-generated synthetic Runnable that fronts AdManagerAdMob's
// interstitial flow: a packed-switch on its `a:I` field dispatches to
// case 0 → cu.show(Activity)  (display the cached interstitial)
// default → vh.a.b(Context, "ca-app-pub-1805098847593136/1515170008", ...)
//           which is com.google.android.gms.ads.interstitial.InterstitialAd.load
// The only call sites (MainActivity / activity.b destinationChanged) gate on
// PreferenceManager.getPremiumVersionPurchased() — we don't try to flip that
// pref here because it would unlock unrelated premium features. Instead we
// neutralise the Runnable itself: return-void at offset 0 of run() means
// neither the load nor the show ever fires.
object InterstitialRunnableRunFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    definingClass = "Lip/c;",
    name = "run",
)

@Suppress("unused")
val disableInterstitialAdsPatch = bytecodePatch(
    name = "Disable AdMob interstitials",
    description = "Neutralises the synthetic Runnable that loads and shows AdMob interstitial ads on navigation events.",
) {
    compatibleWith(Constants.FOLDERSYNC)

    execute {
        InterstitialRunnableRunFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )
    }
}
