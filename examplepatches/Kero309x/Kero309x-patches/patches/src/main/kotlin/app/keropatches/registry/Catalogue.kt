// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.registry

import app.keropatches.core.AppDefinition
import app.morphe.patcher.patch.Patch

/**
 * Metadata for one patch, as the catalogue needs it.
 *
 * The framework exposes a patch's name, description and default on the patch
 * itself, but it has no idea which behaviour spec a patch implements. That link
 * is project knowledge, so it is declared once per patch in [Catalogue] and is
 * checked against the behaviour index and the source tree by the tests.
 */
data class PatchEntry(
    /** The patch object the framework will load. */
    val patch: Patch<*>,
    /** Application id, matching the key in the behaviour index. */
    val application: String,
    /** Behaviour id, for example `anghami.system.rating-prompt`. */
    val behaviourId: String,
    /** Repository-relative path of the behaviour spec. */
    val specPath: String,
    /** Path of the source file, relative to this module, that declares the patch. */
    val sourceFile: String,
    /** Other patch entries this patch needs to be selected with. */
    val dependsOn: List<String> = emptyList(),
)

/**
 * The explicit, ordered list of patches this bundle ships.
 *
 * This is the single description of "what the bundle contains" that the tests
 * and the documentation read, so they cannot disagree.
 */
object Catalogue {
    val entries: List<PatchEntry> = listOf(
        PatchEntry(
            patch = app.keropatches.anghami.ads.blockAudioAdsPatch,
            application = "anghami",
            behaviourId = "anghami.ads.audio-ads",
            specPath = "docs/specs/anghami/audio-ads.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/ads/BlockAudioAds.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.skips.unlimitedSkipsPatch,
            application = "anghami",
            behaviourId = "anghami.playback.track-skips",
            specPath = "docs/specs/anghami/track-skips.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/skips/UnlimitedSkips.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.lyrics.fullLyricsAccessPatch,
            application = "anghami",
            behaviourId = "anghami.media.lyrics-access",
            specPath = "docs/specs/anghami/lyrics-access.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/lyrics/UnlockLyrics.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.playback.disableForcedShufflePatch,
            application = "anghami",
            behaviourId = "anghami.playback.forced-shuffle",
            specPath = "docs/specs/anghami/forced-shuffle.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/playback/DisableForcedShuffle.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.ui.hideShuffleBadgesPatch,
            application = "anghami",
            behaviourId = "anghami.interface.shuffle-badges",
            specPath = "docs/specs/anghami/shuffle-badges.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/ui/HideShuffleBadges.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.ui.hidePremiumButtonsPatch,
            application = "anghami",
            behaviourId = "anghami.interface.premium-buttons",
            specPath = "docs/specs/anghami/premium-buttons.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/ui/HidePremiumButtons.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.capture.allowScreenshotsPatch,
            application = "anghami",
            behaviourId = "anghami.system.screenshots",
            specPath = "docs/specs/anghami/screenshots.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/capture/AllowScreenshots.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.entitlement.showProfilePlusBadgePatch,
            application = "anghami",
            behaviourId = "anghami.entitlement.profile-badge",
            specPath = "docs/specs/anghami/profile-plus-badge.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/entitlement/ProfilePlusBadge.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.entitlement.plusEntitlementPatch,
            application = "anghami",
            behaviourId = "anghami.entitlement.plus",
            specPath = "docs/specs/anghami/plus-entitlement.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/entitlement/PlusEntitlement.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.store.hideGoldUpsellPatch,
            application = "anghami",
            behaviourId = "anghami.store.gold-upsell",
            specPath = "docs/specs/anghami/gold-upsell.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/store/HideGoldUpsell.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.store.hideUpgradeBannersPatch,
            application = "anghami",
            behaviourId = "anghami.store.upgrade-banners",
            specPath = "docs/specs/anghami/upgrade-banners.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/store/HideUpgradeBanners.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.downloads.expandDownloadLimitsPatch,
            application = "anghami",
            behaviourId = "anghami.downloads.limits",
            specPath = "docs/specs/anghami/download-limits.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/downloads/ExpandDownloadLimits.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.analytics.disableAnalyticsPatch,
            application = "anghami",
            behaviourId = "anghami.privacy.analytics",
            specPath = "docs/specs/anghami/analytics.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/analytics/DisableAnalytics.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.sponsored.hideSponsoredContentPatch,
            application = "anghami",
            behaviourId = "anghami.ads.sponsored-content",
            specPath = "docs/specs/anghami/sponsored-content.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/sponsored/HideSponsoredContent.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.promotions.blockPromotionalPopupsPatch,
            application = "anghami",
            behaviourId = "anghami.ads.promotional-popups",
            specPath = "docs/specs/anghami/promotional-popups.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/promotions/BlockPromotionalPopups.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.rating.disableRatingPromptPatch,
            application = "anghami",
            behaviourId = "anghami.system.rating-prompt",
            specPath = "docs/specs/anghami/rating-prompt.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/rating/DisableRatingPrompt.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.integrity.stockSignatureAssertionPatch,
            application = "anghami",
            behaviourId = "anghami.integrity.signature-assertion",
            specPath = "docs/specs/anghami/signature-assertion.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/integrity/StockSignatureAssertion.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.ads.hideFeedAdBannersPatch,
            application = "anghami",
            behaviourId = "anghami.ads.feed-banners",
            specPath = "docs/specs/anghami/feed-ad-banners.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/ads/HideFeedAdBanners.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.update.ignoreForcedUpdatePatch,
            application = "anghami",
            behaviourId = "anghami.system.forced-update",
            specPath = "docs/specs/anghami/forced-update.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/update/IgnoreForcedUpdate.kt",
        ),
        PatchEntry(
            patch = app.keropatches.anghami.analytics.disableSiloTelemetryPatch,
            application = "anghami",
            behaviourId = "anghami.privacy.silo-telemetry",
            specPath = "docs/specs/anghami/silo-telemetry.md",
            sourceFile = "src/main/kotlin/app/keropatches/anghami/analytics/DisableSiloTelemetry.kt",
        ),
        PatchEntry(
            patch = app.keropatches.vodafone.integrity.skipLicenseCheckPatch,
            application = "vodafone",
            behaviourId = "vodafone.integrity.license-check",
            specPath = "docs/specs/vodafone/license-check.md",
            sourceFile = "src/main/kotlin/app/keropatches/vodafone/integrity/SkipLicenseCheck.kt",
        ),
        PatchEntry(
            patch = app.keropatches.vodafone.update.disableForcedUpdatePatch,
            application = "vodafone",
            behaviourId = "vodafone.system.forced-update",
            specPath = "docs/specs/vodafone/forced-update.md",
            sourceFile = "src/main/kotlin/app/keropatches/vodafone/update/IgnoreForcedUpdate.kt",
        ),
        PatchEntry(
            patch = app.keropatches.vodafone.analytics.disableTrackingPatch,
            application = "vodafone",
            behaviourId = "vodafone.privacy.tracking",
            specPath = "docs/specs/vodafone/tracking.md",
            sourceFile = "src/main/kotlin/app/keropatches/vodafone/analytics/DisableTracking.kt",
        ),
        PatchEntry(
            patch = app.keropatches.vodafone.notification.ignoreRemoteActionsPatch,
            application = "vodafone",
            behaviourId = "vodafone.account.remote-actions",
            specPath = "docs/specs/vodafone/remote-actions.md",
            sourceFile = "src/main/kotlin/app/keropatches/vodafone/notification/IgnoreRemoteActions.kt",
        ),
        PatchEntry(
            patch = app.keropatches.vodafone.promotion.hideAdSpaceCardPatch,
            application = "vodafone",
            behaviourId = "vodafone.promotion.ad-space",
            specPath = "docs/specs/vodafone/ad-space.md",
            sourceFile = "src/main/kotlin/app/keropatches/vodafone/promotion/HideAdSpaceCard.kt",
        ),
        PatchEntry(
            patch = app.keropatches.vodafone.cash.useCurrentConnectionForCashPatch,
            application = "vodafone",
            behaviourId = "vodafone.cash.current-connection",
            specPath = "docs/specs/vodafone/cash-network.md",
            sourceFile = "src/main/kotlin/app/keropatches/vodafone/cash/UseCurrentConnectionForCash.kt",
        ),
        PatchEntry(
            patch = app.keropatches.vodafone.account.removeAccountLimitPatch,
            application = "vodafone",
            behaviourId = "vodafone.account.account-limit",
            specPath = "docs/specs/vodafone/account-limit.md",
            sourceFile = "src/main/kotlin/app/keropatches/vodafone/account/RemoveAccountLimit.kt",
        ),
        PatchEntry(
            patch = app.keropatches.vodafone.network.disableCertificatePinningPatch,
            application = "vodafone",
            behaviourId = "vodafone.network.certificate-pinning",
            specPath = "docs/specs/vodafone/certificate-pinning.md",
            sourceFile = "src/main/kotlin/app/keropatches/vodafone/network/DisableCertificatePinning.kt",
        ),
        PatchEntry(
            patch = app.keropatches.vodafone.account.keepStoredPasswordPatch,
            application = "vodafone",
            behaviourId = "vodafone.account.stored-password",
            specPath = "docs/specs/vodafone/stored-password.md",
            sourceFile = "src/main/kotlin/app/keropatches/vodafone/account/KeepStoredPassword.kt",
        ),
        PatchEntry(
            patch = app.keropatches.vodafone.capture.allowScreenCapturePatch,
            application = "vodafone",
            behaviourId = "vodafone.system.screenshots",
            specPath = "docs/specs/vodafone/screenshots.md",
            sourceFile = "src/main/kotlin/app/keropatches/vodafone/capture/AllowScreenshots.kt",
        ),
    )

    /** Applications this bundle announces, in registry order. */
    val applications: List<AppDefinition> = AppRegistry.applications

    fun forApplication(application: String): List<PatchEntry> =
        entries.filter { it.application == application }
}
