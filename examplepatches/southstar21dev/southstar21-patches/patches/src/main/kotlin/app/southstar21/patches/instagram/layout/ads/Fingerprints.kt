package app.southstar21.patches.instagram.layout.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal const val EXTENSION_CLASS =
    "Lapp/southstar21/extension/instagram/ads/HideAdsPatch;"

/**
 * The sponsored content controller's handler for a batch of ads delivered from the network.
 * Feed, Stories, Reels and the other feeds share this controller, so every ad Instagram
 * fetches passes through here before it's put into the ad pool.
 * The ads are the List parameter (p5).
 */
internal object SponsoredContentDeliveredFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = listOf("L", "L", "L", "Ljava/lang/Integer;", "Ljava/util/List;", "I", "Z", "Z", "Z"),
    strings = listOf("early_return_empty_items_outcome", "ad_pool_exhausted"),
)
