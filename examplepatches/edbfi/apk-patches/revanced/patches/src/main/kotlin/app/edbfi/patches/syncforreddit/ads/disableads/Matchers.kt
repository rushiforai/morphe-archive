// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.ads.disableads

import app.edbfi.patches.shared.isDeclaredIn
import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.accessFlags
import app.revanced.patcher.custom
import app.revanced.patcher.definingClass
import app.revanced.patcher.name
import app.revanced.patcher.parameterTypes
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.returnType
import com.android.tools.smali.dexlib2.AccessFlags

/** `SyncIapHelper` returns whether to show ads: true unless the "remove ads" purchase is stored. */
internal fun BytecodePatchContext.adsEnabledMethod() = uniqueMethod("the ads-enabled check", "ADS ENABLED ID: ") {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.STATIC)
    returnType("Z")
    parameterTypes("Landroid/content/Context;")
    custom { isDeclaredIn(this, "SyncIapHelper.java") }
}

/**
 * The Google Mobile Ads SDK's manifest provider starts the SDK at process start, before any check Sync makes. The SDK
 * keeps the class name: the manifest names it.
 */
internal fun BytecodePatchContext.adsInitProviderMethod() = uniqueMethod("MobileAdsInitProvider.attachInfo") {
    definingClass("Lcom/google/android/gms/ads/MobileAdsInitProvider;")
    name("attachInfo")
    returnType("V")
    parameterTypes("Landroid/content/Context;", "Landroid/content/pm/ProviderInfo;")
}
