package app.goodnight.patches.premium

import app.goodnight.patches.shared.Constants.COMPATIBILITY_GOODNIGHT
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch

// Premium/VIP state lives in the plain (non-Hermes) React Native bundle
// assets/index.android.bundle, not in dex: a `membership` object with four
// flags, read via isPremium()/isAnyPremium() getters and direct field reads.
// All anchors below are byte-identical strings from the 1.345.0 reference
// (see reference/NOTES.md). Each must occur exactly once; the patch aborts
// otherwise instead of guessing.
private const val BUNDLE_PATH = "assets/index.android.bundle"

// isAnyPremium(): OR of the four membership flags.
private const val IS_ANY_PREMIUM_ORIGINAL =
    """key:"isAnyPremium",value:function(){return this.membership.is_premium_disco||this.membership.is_premium||this.membership.is_star_premium||this.membership.is_match_premium}"""
private const val IS_ANY_PREMIUM_PATCHED =
    """key:"isAnyPremium",value:function(){return!0}"""

// isPremium(): is_premium || is_premium_disco.
private const val IS_PREMIUM_ORIGINAL =
    """key:"isPremium",value:function(){return!(!this.membership.is_premium||this.membership.is_premium_disco)}"""
private const val IS_PREMIUM_PATCHED =
    """key:"isPremium",value:function(){return!0}"""

// updateUserMembership(): the single `.membership=` assignment in the whole
// bundle (verified count 1), so forcing the flags here covers every direct
// field read (e.g. shouldShowMatchAd) as well as the getters above.
private const val UPDATE_MEMBERSHIP_ORIGINAL =
    """key:"updateUserMembership",value:function(t){this.user&&(this.user.membership=t,c.default.emit('AppCenterUserChanged'))}"""
private const val UPDATE_MEMBERSHIP_PATCHED =
    """key:"updateUserMembership",value:function(t){this.user&&(t&&(t.is_premium=t.is_premium_disco=t.is_star_premium=t.is_match_premium=!0),this.user.membership=t,c.default.emit('AppCenterUserChanged'))}"""

@Suppress("unused")
val premiumUnlockPatch = resourcePatch(
    name = "Premium unlock",
    description = "Unlock premium-gated UI and the ad-free match flow. " +
        "Features validated server-side may still require a subscription.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GOODNIGHT)

    execute {
        val bundle = this[BUNDLE_PATH]
        var text = bundle.readText()

        fun replaceOnce(original: String, patched: String, label: String) {
            val count = text.split(original).size - 1
            if (count != 1) {
                throw PatchException("$label anchor found $count times, expected exactly 1")
            }
            text = text.replace(original, patched)
        }

        replaceOnce(IS_ANY_PREMIUM_ORIGINAL, IS_ANY_PREMIUM_PATCHED, "isAnyPremium")
        replaceOnce(IS_PREMIUM_ORIGINAL, IS_PREMIUM_PATCHED, "isPremium")
        replaceOnce(UPDATE_MEMBERSHIP_ORIGINAL, UPDATE_MEMBERSHIP_PATCHED, "updateUserMembership")

        bundle.writeText(text)
    }
}
