// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.ads.disableads

import app.edbfi.patches.shared.Edit
import app.edbfi.patches.shared.returnEarlyEdit
import app.edbfi.patches.syncforreddit.SYNC_FOR_REDDIT
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.returnEarly

@Suppress("unused")
val disableAdsPatch =
    patch(
        name = "Disable ads",
        description = "Removes ads and the ad consent form, and keeps the ad SDKs from starting.",
        default = true,
    ) {
        compatibleWith(SYNC_FOR_REDDIT)

        execute {
            // Every ad path checks this method: SDK setup, banners, feed and gallery ads, and the consent form.
            val adsEnabled = AdsEnabledFingerprint.matchSingle().method.returnEarlyEdit(false)
            // The provider's attachInfo does nothing but start the SDK; it never calls the ContentProvider's own.
            val adsInitProvider = AdsInitProviderFingerprint.matchSingle().method

            adsEnabled.apply()
            Edit(1) { adsInitProvider.returnEarly() }.apply()
        }
    }
