/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredreels

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.requireLocals
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

/**
 * The query a profile's or Page's Reels tab sends for the ads it puts between that profile's reels.
 * It goes out from one method (581 `LX/B5t;->A03`, read 2026-10-06), a void instance method taking
 * the session, two Integers and a boolean, which returns early on its own when the ads it already
 * holds fill the tab's slots. It doesn't draw from the Reels and Watch ad pool [POOL_NO_AD] holds,
 * so the pool's hold doesn't reach it.
 */
internal const val PROFILE_REELS_ADS = "ProfileReelsAsyncAdsQuery"

private const val HOLD_PROFILE_REEL_ADS = "$EXTENSION_PACKAGE/ads/ReelsAdFilter;->holdProfileReelAds()Z"

/** A fetch: an instance method with a body that returns nothing and names [PROFILE_REELS_ADS]. */
internal fun isProfileReelAdFetch(method: Method): Boolean =
    !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" && holdsString(method, PROFILE_REELS_ADS)

/** The one method that sends [PROFILE_REELS_ADS]. */
internal fun BytecodePatchContext.profileReelAdFetch(): MutableMethod {
    val fetches = classDefByStrings(PROFILE_REELS_ADS, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        .flatMap { holder -> holder.methods.filter(::isProfileReelAdFetch) }
    val fetch = fetches.singleOrNull() ?: throw PatchException(
        "$SPONSORED_REELS_PATCH: expected one method sending \"$PROFILE_REELS_ADS\", found ${fetches.size}",
    )
    return mutableClassDefBy(fetch.definingClass).findMutableMethodOf(fetch)
}

/**
 * First thing in the fetch: ask the extension, and return when it holds the query back. Returning
 * is what the fetch does itself when it has ads enough, so the tab goes on with the profile's own
 * reels and no query goes out.
 */
internal fun MutableMethod.holdProfileReelAdsFirst() {
    requireLocals(SPONSORED_REELS_PATCH, 1)
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $HOLD_PROFILE_REEL_ADS
            move-result v0
            if-eqz v0, :facebook
            return-void
        """,
        ExternalLabel("facebook", getInstruction(0)),
    )
}
