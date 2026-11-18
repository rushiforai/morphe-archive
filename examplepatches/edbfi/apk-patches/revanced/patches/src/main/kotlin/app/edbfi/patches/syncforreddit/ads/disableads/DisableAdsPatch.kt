// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.ads.disableads

import app.edbfi.patches.syncforreddit.SYNC_PACKAGE
import app.edbfi.patches.syncforreddit.SYNC_VERSION
import app.revanced.patcher.extensions.addInstructions
import app.revanced.patcher.patch.bytecodePatch

@Suppress("unused")
val disableAdsPatch =
    bytecodePatch(
        name = "Disable ads",
        description = "Removes ads and the ad consent form, and keeps the ad SDKs from starting.",
    ) {
        compatibleWith(SYNC_PACKAGE(SYNC_VERSION))

        apply {
            // Every ad path checks this method: SDK setup, banners, feed and gallery ads, and the consent form.
            val adsEnabled = adsEnabledMethod()
            // The provider's attachInfo does nothing but start the SDK; it never calls the ContentProvider's own.
            val adsInitProvider = adsInitProviderMethod()

            adsEnabled.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """,
            )
            adsInitProvider.addInstructions(0, "return-void")
        }
    }
