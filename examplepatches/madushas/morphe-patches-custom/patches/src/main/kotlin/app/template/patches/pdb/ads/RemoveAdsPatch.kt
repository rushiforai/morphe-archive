package app.template.patches.pdb.ads

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.PDB_COMPATIBILITY

/**
 * Ad-SDK initialisation providers that Pdb declares. They exist purely to
 * auto-initialise the ad SDKs at process start; disabling them (the standard
 * approach) prevents that auto-init while leaving the SDK classes intact.
 */
private val AD_INIT_PROVIDERS = listOf(
    "com.google.android.gms.ads.MobileAdsInitProvider",
    "com.applovin.sdk.AppLovinInitProvider",
    "com.vungle.ads.VungleProvider",
    "com.yandex.mobile.ads.core.initializer.YandexAdsInitializeProvider",
)

/**
 * Removes ads from Pdb.
 *
 * Two independent layers:
 *  1. **Manifest** (this patch) — disables the ad SDK auto-initialisation
 *     providers listed in [AD_INIT_PROVIDERS].
 *  2. **Runtime** (extension startup, see the feature menu patch) — writes the
 *     app's own `isADLibDisabled = true` preference, which makes Pdb's `yads`
 *     ad module skip SDK init and ad loading entirely.
 *
 * `Unlock Pro` additionally grants `PremiumNoAD`, so the app also suppresses the
 * premium-gated ad placements itself.
 */
@Suppress("unused")
val pdbRemoveAdsPatch = resourcePatch(
    name = "Remove ads",
    description = "Disables Pdb's ad SDKs (GMS, AppLovin, Vungle, Yandex, Pangle) " +
        "and turns off in-app ad initialisation.",
    default = true,
) {
    compatibleWith(PDB_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val providers = doc.getElementsByTagName("provider")
            for (i in 0 until providers.length) {
                val node = providers.item(i)
                val name = node.attributes.getNamedItem("android:name")?.nodeValue ?: ""
                if (AD_INIT_PROVIDERS.any { name == it || name.contains(it) }) {
                    node.attributes.getNamedItem("android:enabled")
                        ?.let { it.nodeValue = "false" }
                        ?: run {
                            val attr = doc.createAttribute("android:enabled")
                            attr.value = "false"
                            node.attributes.setNamedItem(attr)
                        }
                }
            }
        }
    }
}
