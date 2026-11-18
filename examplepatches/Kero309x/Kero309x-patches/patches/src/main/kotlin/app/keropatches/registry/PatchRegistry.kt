// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.registry

import app.keropatches.anghami.AnghamiApp
import app.keropatches.anghami.ads.blockAudioAdsPatch
import app.keropatches.anghami.ads.hideFeedAdBannersPatch
import app.keropatches.anghami.analytics.disableAnalyticsPatch
import app.keropatches.anghami.analytics.disableSiloTelemetryPatch
import app.keropatches.anghami.capture.allowScreenshotsPatch
import app.keropatches.anghami.downloads.expandDownloadLimitsPatch
import app.keropatches.anghami.entitlement.plusEntitlementPatch
import app.keropatches.anghami.entitlement.showProfilePlusBadgePatch
import app.keropatches.anghami.integrity.stockSignatureAssertionPatch
import app.keropatches.anghami.lyrics.fullLyricsAccessPatch
import app.keropatches.anghami.playback.disableForcedShufflePatch
import app.keropatches.anghami.promotions.blockPromotionalPopupsPatch
import app.keropatches.anghami.rating.disableRatingPromptPatch
import app.keropatches.anghami.skips.unlimitedSkipsPatch
import app.keropatches.anghami.sponsored.hideSponsoredContentPatch
import app.keropatches.anghami.store.hideGoldUpsellPatch
import app.keropatches.anghami.store.hideUpgradeBannersPatch
import app.keropatches.anghami.ui.hidePremiumButtonsPatch
import app.keropatches.anghami.ui.hideShuffleBadgesPatch
import app.keropatches.anghami.update.ignoreForcedUpdatePatch
import app.keropatches.vodafone.VodafoneApp
import app.keropatches.vodafone.account.keepStoredPasswordPatch
import app.keropatches.vodafone.account.removeAccountLimitPatch
import app.keropatches.vodafone.analytics.disableTrackingPatch
import app.keropatches.vodafone.cash.useCurrentConnectionForCashPatch
import app.keropatches.vodafone.capture.allowScreenCapturePatch
import app.keropatches.vodafone.integrity.skipLicenseCheckPatch
import app.keropatches.vodafone.network.disableCertificatePinningPatch
import app.keropatches.vodafone.notification.ignoreRemoteActionsPatch
import app.keropatches.vodafone.promotion.hideAdSpaceCardPatch
import app.keropatches.vodafone.update.disableForcedUpdatePatch
import app.morphe.patcher.patch.Patch

/**
 * Every patch this bundle ships, grouped by the application it targets.
 *
 * The framework discovers patches by scanning public members of the bundle at
 * load time, so this registry is what our own tooling reads: the verification
 * task and the registry test. Keeping it explicit means
 * a patch that is written but not registered is caught by a test rather than by
 * a user who cannot find it.
 *
 * The order here is the order the manager shows. [Catalogue.entries] carries the
 * rest of the per-patch metadata.
 */
object PatchRegistry {
    /** Patches for the Anghami application. */
    val anghami: Set<Patch<*>> = setOf(
        blockAudioAdsPatch,
        unlimitedSkipsPatch,
        fullLyricsAccessPatch,
        disableForcedShufflePatch,
        hideShuffleBadgesPatch,
        hidePremiumButtonsPatch,
        allowScreenshotsPatch,
        showProfilePlusBadgePatch,
        plusEntitlementPatch,
        hideGoldUpsellPatch,
        hideUpgradeBannersPatch,
        expandDownloadLimitsPatch,
        disableAnalyticsPatch,
        hideSponsoredContentPatch,
        blockPromotionalPopupsPatch,
        disableRatingPromptPatch,
        stockSignatureAssertionPatch,
        hideFeedAdBannersPatch,
        ignoreForcedUpdatePatch,
        disableSiloTelemetryPatch,
    )

    /**
     * Patches for the Ana Vodafone application.
     *
     * The first release for this application ships the two behaviours that stop
     * a repackaged build from being refused at startup. The later ones cover
     * the application's own reporting, the actions a silent push can trigger,
     * the promotional card, the number of accounts the application keeps, the
     * certificate it pins and the password it remembers.
     */
    val vodafone: Set<Patch<*>> = setOf(
        skipLicenseCheckPatch,
        disableForcedUpdatePatch,
        disableTrackingPatch,
        ignoreRemoteActionsPatch,
        hideAdSpaceCardPatch,
        useCurrentConnectionForCashPatch,
        removeAccountLimitPatch,
        disableCertificatePinningPatch,
        keepStoredPasswordPatch,
        allowScreenCapturePatch,
    )

    /** Every patch this bundle ships, across all applications. */
    val all: Set<Patch<*>> = anghami + vodafone

    /** Application id a patch targets, or null when the registry does not own it. */
    fun applicationOf(patch: Patch<*>): String? = when (patch) {
        in anghami -> AnghamiApp.definition.id
        in vodafone -> VodafoneApp.definition.id
        else -> null
    }
}
