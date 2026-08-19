package maurogamervn.multirun.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

private val COMPATIBILITY = Compatibility(
    name = "Multi Run - Parallel Dual App",
    packageName = "com.dong.multirun",
    appIconColor = 0x2196F3,
    targets = listOf(
        AppTarget(version = "1.0.50.20")
    )
)

private val interstitialAdShowFingerprint = Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/interstitial/InterstitialAd;",
    name = "show",
    accessFlags = listOf(AccessFlags.PUBLIC)
)

private val rewardedAdShowFingerprint = Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/rewarded/RewardedAd;",
    name = "show",
    accessFlags = listOf(AccessFlags.PUBLIC)
)

private val appOpenAdShowFingerprint = Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/appopen/AppOpenAd;",
    name = "show",
    accessFlags = listOf(AccessFlags.PUBLIC)
)

private val interstitialAdLoadFingerprint = Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/interstitial/InterstitialAd;",
    name = "load",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
)

private val rewardedAdLoadFingerprint = Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/rewarded/RewardedAd;",
    name = "load",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
)

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Elimina anuncios de banner, interstitial, rewarded y app-open (AdMob).",
    default = true
) {
    compatibleWith(COMPATIBILITY)

    execute {
        listOf(
            interstitialAdShowFingerprint,
            rewardedAdShowFingerprint,
            appOpenAdShowFingerprint,
            interstitialAdLoadFingerprint,
            rewardedAdLoadFingerprint
        ).forEach { fingerprint ->
            runCatching {
                val method = fingerprint.method
                val impl = method.implementation ?: return@runCatching
                val count = impl.instructions.size
                if (count > 0) {
                    method.removeInstructions(0, count)
                }
                method.addInstructions(
                    0,
                    """
                        return-void
                    """.trimIndent()
                )
            }
        }
    }
}
