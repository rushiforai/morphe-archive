/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.mazii

import app.fakh.patches.mazii.shared.Constants.COMPATIBILITY_MAZII
import app.fakh.patches.shared.returnTrue
import app.morphe.patcher.Fingerprint
import app.fakh.patches.shared.disableProviders
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch

/**
 * Starts the ad SDKs that run from a content provider before Application.onCreate. The app skips every ad slot
 * and the rest of the SDK init while Premium is on, so only these are left to turn off.
 */
private val adSdkManifestPatch = patch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            manifest.disableProviders(
                "com.facebook.ads.AudienceNetworkContentProvider",
                "com.vungle.ads.VungleProvider",
                "com.mbridge.msdk.config.component.status.MBComponentLifecycleProvider",
            )
        }
    }
}

/** PreferencesHelper.isPremium: stored flag or an unexpired `timeEnd`, or the account's premium state. */
private object IsPremiumFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("timeEnd", "isPremium"),
)

/** PreferencesHelper.isAccountPremium: the signed-in account's `premium`, `lifetime` or `premiumExpiredDate`. */
private object IsAccountPremiumFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("0000-00-00 00:00:00", "yyyy-MM-dd HH:mm:ss"),
)

/** Account.Result.getPremium: read directly by the home screen, profile and login. */
private object AccountPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/mazii/dictionary/feature/share/data/model/account/Account\$Result;",
    name = "getPremium",
    returnType = "Z",
    parameters = listOf(),
)

@Suppress("unused")
val unlockPremiumPatch = patch(
    name = "Premium unlock",
    description = "Unlocks the client-side Premium checks, which also removes ads.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAZII)
    category("Premium")
    dependsOn(adSdkManifestPatch)

    execute {
        listOf(IsPremiumFingerprint, IsAccountPremiumFingerprint, AccountPremiumFingerprint).forEach { it.method.returnTrue() }
    }
}
