/*
 * Forked from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0),
 * ads/games/BlockInstantGamesAdsPatch.kt. Copyright 2026 Hushfacebook contributors.
 * Modified for facebook-morphe-patches, 2026: always on, no settings switch.
 */
package app.fbpatches.patches.facebook.ads.games

import app.fbpatches.patches.facebook.shared.EXTENSION_CLASSES
import app.fbpatches.patches.facebook.shared.extensionPatch
import app.fbpatches.patches.facebook.shared.mutableMethodOf
import app.fbpatches.patches.shared.Constants.COMPATIBILITY_FACEBOOK
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

/**
 * Answers every ad an Instant Game asks Facebook for with no ad, through the game bridge's own
 * rejected promise, or through GameBridge for a game that brings its own bridge. See GameAdAnchors.kt.
 */
@Suppress("unused")
val blockInstantGamesAdsPatch = bytecodePatch(
    name = "Block Instant Games ads",
    description = "Games you play inside Facebook show no ads. Rewarded ads give no reward.",
    default = true,
) {
    dependsOn(extensionPatch)
    compatibleWith(COMPATIBILITY_FACEBOOK)

    execute {
        val bridges = classDefByStrings(AD_MESSAGES.first(), StringComparisonType.EQUALS)
            .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
            .filter { owner -> owner.methods.any(::isPostMessage) }
        val bridge = bridges.singleOrNull()
            ?: throw PatchException("$PATCH: expected one game bridge with a postMessage holding $AD_MESSAGES, found ${bridges.size}")
        val rejects = classDefByStrings(REJECT_LOG, StringComparisonType.EQUALS)
            .flatMap { owner -> owner.methods.filter(::isRejectPromise) }
        val reject = rejectOn(bridge, rejects).singleOrNull() ?: throw PatchException(
            "$PATCH: expected ${bridge.type} to reject a promise through one (String, String, String) method " +
                "(${rejects.size} found)",
        )
        val resolves = classDefByStrings(RESOLVE_LOG, StringComparisonType.EQUALS)
            .flatMap { owner -> owner.methods.filter(::isResolvePromise) }
        val resolve = resolveOn(bridge, resolves).singleOrNull() ?: throw PatchException(
            "$PATCH: expected ${bridge.type} to resolve a promise through one (String, Object) method " +
                "(${resolves.size} found)",
        )
        mutableMethodOf(bridge.methods.single(::isPostMessage)).answerAdsWithNoAd(reject, resolve)

        // Games run from Facebook's downloaded code bring their own bridge, so wrap every game
        // bridge where it's registered on the game WebView.
        val view = gameViewOf(bridge) ?: throw PatchException(
            "$PATCH: expected ${bridge.type} to have one constructor holding \"$BRIDGE_NAME\" that takes the game WebView",
        )
        val chain = webViewChain(view) { classDefByOrNull(it) }
            ?: throw PatchException("$PATCH: expected the game WebView $view to extend $WEB_VIEW")
        chain.firstOrNull(::declaresAddJavascriptInterface)?.let {
            throw PatchException("$PATCH: ${it.type} already has its own $ADD_JAVASCRIPT_INTERFACE")
        }
        mutableClassDefBy(chain.last().type).wrapGameBridges()
    }
}
