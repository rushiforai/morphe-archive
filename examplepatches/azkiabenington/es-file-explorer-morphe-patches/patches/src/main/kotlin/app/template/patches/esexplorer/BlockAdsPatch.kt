package app.template.patches.esexplorer

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.ES_EXPLORER_COMPATIBILITY
import app.template.patches.shared.returnEarly

/**
 * Blocks all banner ads, interstitial popups, video player pause ads,
 * and ad configuration providers in ES File Explorer.
 */
@Suppress("unused")
val esExplorerBlockAdsPatch = bytecodePatch(
    name = "Block Ads",
    description = "Removes all native banners, interstitial ads, video player pause ads, and charge saver popups.",
    default = true,
) {
    compatibleWith(ES_EXPLORER_COMPATIBILITY)

    execute {
        // 1. Disable interstitial ad triggers on activity transitions
        runCatching {
            AdEntranceTryShowAdFingerprint.method.returnEarly()
        }

        // 2. Disable AdManager interaction and player interstitial display
        runCatching {
            AdManagerShowInterAdFingerprint.method.returnEarly()
        }
        runCatching {
            AdManagerShowPlayerInterAdFingerprint.method.returnEarly()
        }

        // 3. Disable Video Player pause ads & interstitial checks
        runCatching {
            PlayerAdControlCanShowPauseAdFingerprint.method.returnEarly(false)
        }
        runCatching {
            PlayerAdControlCanLoadPauseAdFingerprint.method.returnEarly(false)
        }
        runCatching {
            PlayerAdControlIsInterAdFingerprint.method.returnEarly(false)
        }

        // 4. Neutralize Ad Config Providers (returning null prevents ad networks from receiving configs)
        runCatching {
            NativeAdConfigGetConfigFingerprint.method.returnEarly(null)
        }
        runCatching {
            VideoAdConfigGetConfigFingerprint.method.returnEarly(null)
        }
        runCatching {
            ChargeSaverAdConfigGetConfigFingerprint.method.returnEarly(null)
        }
    }
}

