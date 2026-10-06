/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.games

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.findMutableMethodOf

/**
 * Answers every ad an Instant Game asks Facebook for with no ad, through the game bridge's own
 * rejected promise. See GameAdAnchors.kt for where the hook goes, and the extension's GameAds for
 * which messages it answers and with what code.
 */
@Suppress("unused")
val blockInstantGamesAdsPatch = bytecodePatch(
    name = "Block Instant Games ads",
    description = "Games you play in Facebook get no ads. A game that asks for one is told there's none to show, " +
        "so a rewarded ad gives no reward, and the game carries on.",
    default = true,
) {
    category("Ads")
    dependsOn(settingsPatch, facebookExtensionPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val bridges = classDefByStrings(AD_MESSAGES.first(), StringComparisonType.EQUALS)
            .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
            .filter { owner -> owner.methods.any(::isPostMessage) }
        val bridge = bridges.singleOrNull()
            ?: throw PatchException("$PATCH: expected one game bridge with a postMessage holding $AD_MESSAGES, found ${bridges.size}")
        val rejects = classDefByStrings(REJECT_LOG, StringComparisonType.EQUALS)
            .flatMap { owner -> owner.methods.filter(::isRejectPromise) }
        val reject = rejectOn(bridge, rejects).singleOrNull() ?: throw PatchException(
            "$PATCH: expected ${bridge.type} to reject a promise through one (String, String, String) method calling " +
                "the call holding \"$REJECT_LOG\" (${rejects.size} found)",
        )
        mutableClassDefBy(bridge.type).findMutableMethodOf(bridge.methods.single(::isPostMessage)).answerAdsWithNoAd(reject)
        enableStatus("gameAds")
    }
}
