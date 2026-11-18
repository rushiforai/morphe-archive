// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.syncforreddit.ads.disableads

import app.edbfi.patches.shared.hasFlags
import app.edbfi.patches.syncforreddit.declaredIn
import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/** `SyncIapHelper` returns whether to show ads: true unless the "remove ads" purchase is stored. */
internal object AdsEnabledFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("ADS ENABLED ID: "),
    custom = declaredIn("SyncIapHelper.java") { it.hasFlags(AccessFlags.PUBLIC, AccessFlags.STATIC) },
)

/**
 * The Google Mobile Ads SDK's manifest provider starts the SDK at process start, before any check Sync makes. The SDK
 * keeps the class name: the manifest names it.
 */
internal object AdsInitProviderFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/MobileAdsInitProvider;",
    name = "attachInfo",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/content/pm/ProviderInfo;"),
)
