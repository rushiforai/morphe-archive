/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredmarketplace

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.findMutableMethodOf

/**
 * Keeps the ads out of Marketplace's feed: the feed's query asks Facebook's servers to skip them,
 * and the queries that fetch only ads aren't sent. See MarketplaceRequestAnchors.kt for where the
 * requests pass through Java, and the extension's MarketplaceAdFilter for what it changes.
 */
@Suppress("unused")
val hideSponsoredMarketplaceListingsPatch = bytecodePatch(
    name = "Hide sponsored Marketplace listings",
    description = "Removes the ads and boosted listings from Marketplace's feed. Hushfacebook asks Facebook not to " +
        "send them, and the requests that fetch only ads don't go out. The listings people post stay.",
    default = true,
) {
    category("Ads")
    dependsOn(settingsPatch)
    dependsOn(facebookExtensionPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val sends = classDefByStrings(NETWORKING_TAG, StringComparisonType.EQUALS)
            .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
            .flatMap { owner -> owner.methods.filter(::isSendRequest) }
        val send = sends.singleOrNull() ?: throw PatchException(
            "$PATCH: expected one React Native $SEND_REQUEST holding \"$NETWORKING_TAG\" and \"$TRACKING_NAME\", " +
                "found ${sends.size}",
        )
        val read = bodyRead(send) ?: throw PatchException(
            "$PATCH: ${send.definingClass}->$SEND_REQUEST no longer reads its POST body from the request data's " +
                "\"$BODY_KEY\" right before the one StringEntity it builds, from the data it reads \"$TRACKING_NAME\" from",
        )
        mutableClassDefBy(send.definingClass).findMutableMethodOf(send).askAboutTheBody(read)
        enableStatus("sponsoredMarketplace")
    }
}

/**
 * Right after sendRequest reads the POST body, the body and the request data go to the extension,
 * and its answer takes the body's register. Nothing else in the method changes. Both registers
 * were checked to fit an invoke's four bits.
 */
internal fun MutableMethod.askAboutTheBody(read: BodyRead) {
    if (read.body > 15 || read.data > 15) {
        throw PatchException("$PATCH: $definingClass->$name keeps the body or the data past v15: ${read.body}, ${read.data}")
    }
    addInstructions(
        read.index + 1,
        """
            invoke-static { v${read.body}, v${read.data} }, $REQUEST_BODY
            move-result-object v${read.body}
        """,
    )
}
