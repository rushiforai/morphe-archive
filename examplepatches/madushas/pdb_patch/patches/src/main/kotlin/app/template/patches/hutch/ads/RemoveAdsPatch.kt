package app.template.patches.hutch.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.HUTCH_COMPATIBILITY
import app.template.patches.shared.HERMES_BUNDLE_PATH
import app.template.patches.shared.HERMES_MAGIC
import java.security.MessageDigest

/**
 * Hutch has **no third-party ad SDK** (verified: no gms/ads, AppLovin, Meta, Unity…
 * classes in any dex). Its ads are server-driven and rendered by the React-Native
 * `AdsBanner` component from data fetched over HTTPS:
 *
 *  - `getAdsData` → route **`scapp/adverts/getAdvertData`** → the home-screen banner
 *    carousel (`AdsBanner`, registered in the components map and rendered with
 *    `data = <response array>`; the screen skips rendering when the array is empty);
 *  - `getPopUpBannerData` → route **`scapp/dashboard/getAppPopupMessage`** → the popup
 *    banner (its fetch logs `PopUp Banner error:` on failure).
 *
 * So the chokepoint is the **API route**, not a view: renaming the route string makes
 * the request 404, the existing error handlers swallow it (`ads error:` / `PopUp Banner
 * error:`), the state stays empty, and `AdsBanner` is skipped by its own `length > idx`
 * guard. There is no UI crash path.
 *
 * Hermes bytecode only allows **same-length** byte edits (string-table offsets must not
 * move), so each route gets its last character changed. Patterns are required to be
 * present exactly once (fail-closed), and the bundle's SHA-1 trailer is recomputed.
 */
private val BLOCKED_AD_ROUTES = listOf(
    // home-screen ad banner feed (27 chars) → same-length READ endpoint 'getCmsOffers'.
    // Rerouting (not 404ing) matters: the ad thunks' catch calls handleNetworkError,
    // which shows a danger banner for any failed request — a 200 with a non-array body
    // keeps the carousel empty AND silent.
    "scapp/adverts/getAdvertData" to "scapp/cmsOffer/getCmsOffers",
    // popup banner message (34 chars) → same-length READ endpoint 'loadComplainPageData'.
    "scapp/dashboard/getAppPopupMessage" to "scapp/support/loadComplainPageData",
)

@Suppress("unused")
val hutchRemoveAdsPatch = rawResourcePatch(
    name = "Remove ads",
    description = "Blocks Hutch's server-driven ads (the home banner carousel and the popup " +
        "banner) by breaking their API routes in the Hermes bundle, so ad data is never " +
        "fetched and the ad components render nothing. Hutch bundles no ad SDK; this covers " +
        "the app's own ad delivery.",
    default = true,
) {
    compatibleWith(HUTCH_COMPATIBILITY)

    execute {
        val file = get(HERMES_BUNDLE_PATH, true)
        if (!file.exists()) {
            throw PatchException("Hermes bytecode bundle not found at: $HERMES_BUNDLE_PATH")
        }

        var bytes = file.readBytes()
        if (!bytes.copyOfRange(0, HERMES_MAGIC.size).contentEquals(HERMES_MAGIC)) {
            throw PatchException("Invalid Hermes bytecode bundle: $HERMES_BUNDLE_PATH")
        }
        val hermesVersion = bytes.readLittleEndianInt(8)

        for ((from, to) in BLOCKED_AD_ROUTES) {
            if (from.length != to.length) {
                throw PatchException("Hermes ad-route replacement size mismatch: '$from' -> '$to'")
            }
            val pattern = from.toByteArray()
            val replacement = to.toByteArray()
            val index = bytes.indexOfSubArray(pattern)
            if (index < 0) throw PatchException("Hutch ad route not found in bundle: $from")
            if (bytes.indexOfSubArray(pattern, index + 1) >= 0) {
                throw PatchException("Hutch ad route not unique in bundle: $from")
            }
            bytes = bytes.copyOfRange(0, index) + replacement +
                bytes.copyOfRange(index + pattern.size, bytes.size)
        }

        // Hermes >= 75 stores a SHA-1 trailer over the content — recompute or the
        // bundle is rejected at load.
        if (hermesVersion > 74) {
            val content = bytes.copyOfRange(0, bytes.size - 20)
            bytes = content + MessageDigest.getInstance("SHA-1").digest(content)
        }

        file.writeBytes(bytes)
        println("Hutch Remove ads: blocked ${BLOCKED_AD_ROUTES.size} ad route(s) in the Hermes bundle.")
    }
}

private fun ByteArray.indexOfSubArray(needle: ByteArray, fromIndex: Int = 0): Int {
    outer@ for (i in fromIndex..size - needle.size) {
        for (j in needle.indices) if (this[i + j] != needle[j]) continue@outer
        return i
    }
    return -1
}

private fun ByteArray.readLittleEndianInt(offset: Int): Int {
    var value = 0
    for (i in 0 until 4) value = value or ((this[offset + i].toInt() and 0xFF) shl (i * 8))
    return value
}
