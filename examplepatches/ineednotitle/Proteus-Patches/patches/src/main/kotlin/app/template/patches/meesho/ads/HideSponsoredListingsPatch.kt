package app.template.patches.meesho.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MEESHO_COMPATIBILITY
import app.template.patches.shared.clearBody
import com.android.tools.smali.dexlib2.AccessFlags

// Hide Meesho's first-party sponsored listings ("Ad"-labelled catalogs in
// search results, the home/For You feed and related-product rails).
//
// Meesho has no third-party ad SDK; sponsored items arrive in the normal
// product-list API responses and are marked by an ad flag on the item model.
// This patch forces the app-side boolean ad gates to false, so ad items are
// treated as hidden/skipped when the feed is assembled.
//
// It is deliberately narrow and heuristic (the exact ad-model class names are
// obfuscated and were not verifiable without the 29.7 APK — see
// MEESHO_PATCH_PLAN.md §3): candidate classes are those referencing ad-slot
// string literals ("sponsored", "adslot", "ad_slot", "isAd"), and inside them
// only Z-returning methods whose names reference an ad/sponsor concept are
// forced to return false. Playback, product data and checkout are untouched.
//
// Server-side ad *serving* is unchanged — this only hides what the client
// renders. Because the anchors are unverified, the patch is opt-in
// (default = false).
//
// Fail-safe: no matching class/method → no effect.

private val AD_STRINGS = listOf(
    "sponsored",
    "adslot",
    "ad_slot",
    "isAd",
    "adSlot",
)

private val AD_GATE_METHOD_NAMES = setOf(
    "isAd",
    "isAdSlot",
    "isSponsored",
    "isAdvertisement",
    "isAdContent",
    "hasAd",
    "shouldShowAd",
    "shouldShowAds",
    "shouldDisplayAd",
    "canShowAd",
    "shouldRenderAd",
)

private val GENERIC_GATE_NAMES = setOf(
    "shouldShow",
    "shouldPlay",
    "canShow",
    "isVisible",
    "isShown",
)

@Suppress("unused")
val meeshoHideSponsoredListingsPatch = bytecodePatch(
    name = "Hide sponsored listings & ad slots",
    description = "Hides 'Ad'-labelled sponsored products in Meesho's search and feed by " +
        "forcing app-side boolean ad gates to false. Heuristic — verify anchors against " +
        "the real APK. Server still serves ads; only client rendering is affected.",
    default = false,
) {
    compatibleWith(MEESHO_COMPATIBILITY)

    execute {
        val candidateClasses = AD_STRINGS
            .flatMap { literal -> classDefByStrings(literal) }
            .map { classDef -> classDef.type }
            .toSet()

        candidateClasses.forEach { className ->
            val classDef = mutableClassDefByOrNull(className) ?: return@forEach
            val classLooksLikeAd = className.contains("adslot", ignoreCase = true) ||
                className.contains("sponsor", ignoreCase = true) ||
                className.contains("advert", ignoreCase = true)

            classDef.methods.forEach methodLoop@ { method ->
                if (method.returnType != "Z") return@methodLoop
                if (method.accessFlags and AccessFlags.ABSTRACT.value != 0) return@methodLoop

                val nameMatches = method.name in AD_GATE_METHOD_NAMES ||
                    method.name.contains("sponsor", ignoreCase = true) ||
                    (classLooksLikeAd && method.name in GENERIC_GATE_NAMES)
                if (!nameMatches) return@methodLoop

                val implementation = method.implementation ?: return@methodLoop
                val isStatic = method.accessFlags and AccessFlags.STATIC.value != 0
                val parameterRegisterCount = method.parameterTypes.size + if (isStatic) 0 else 1
                if (implementation.registerCount - parameterRegisterCount < 1) return@methodLoop

                method.clearBody()
                method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
            }
        }
    }
}
