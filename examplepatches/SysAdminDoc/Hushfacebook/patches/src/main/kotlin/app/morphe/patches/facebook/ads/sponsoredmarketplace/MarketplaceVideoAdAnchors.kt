/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredmarketplace

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import com.android.tools.smali.dexlib2.iface.Method

/*
 * Where Marketplace draws a video ad, on the 577, 580 and 581 builds.
 *
 * A video ad in Marketplace's feed is a native Litho component that React Native places
 * (GeneratedMarketplaceVideoAdsComponentViewManager, kept). Two components draw it. One is a
 * layout spec that still names itself, "com.facebook.fbreactcomponents.marketplacevideo
 * .MarketplaceVideoAdsComponentSpec", in its layout method. The other is a Kotlin component whose
 * render asks for the ad's video with MarketplaceVideoAdQuery, by the ad's story id, under the
 * caller name "MarketplaceVideoAdComponent_". Each is the one method holding its strings; it takes
 * the component context (or scope) and returns the component to draw, and Litho draws nothing for
 * a null. The hook goes at the start of each and answers null on a yes, before the query is sent.
 *
 * The ad itself reaches the component through the feed's ads, which the request half of the patch
 * already asks the server to leave out. This half covers a video ad that comes back anyway.
 */
internal const val VIDEO_ADS_SPEC = "com.facebook.fbreactcomponents.marketplacevideo.MarketplaceVideoAdsComponentSpec"
internal const val VIDEO_AD_QUERY = "MarketplaceVideoAdQuery"
internal const val VIDEO_AD_CALLER = "MarketplaceVideoAdComponent_"

internal const val HIDES_VIDEO_AD = "$EXTENSION_PACKAGE/ads/MarketplaceAdFilter;->hidesVideoAd()Z"

/** The two video ad drawers, each by the strings only it holds. */
internal enum class VideoAdDrawer(val strings: List<String>) {
    SPEC(listOf(VIDEO_ADS_SPEC)),
    QUERY(listOf(VIDEO_AD_QUERY, VIDEO_AD_CALLER)),
}

/** Whether [method] is [drawer]: one object in, an object back, and every string the drawer holds. */
internal fun draws(method: Method, drawer: VideoAdDrawer): Boolean =
    method.implementation != null && method.returnType.startsWith("L") &&
        method.parameterTypes.singleOrNull()?.startsWith("L") == true &&
        drawer.strings.all { holdsString(method, it) }

/** Asks [HIDES_VIDEO_AD] first thing and returns null, so nothing is drawn, on a yes. */
internal fun MutableMethod.drawNothingWhenHidden() {
    if (localRegisterCount() < 1) throw PatchException("$PATCH: $definingClass->$name has no local register")
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $HIDES_VIDEO_AD
            move-result v0
            if-eqz v0, :draw
            const/4 v0, 0x0
            return-object v0
        """,
        ExternalLabel("draw", getInstruction(0)),
    )
}
