package dev.utaa.linimal.patches

import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import dev.utaa.linimal.patches.core.linimalBootstrapPatch
import dev.utaa.linimal.patches.core.linimalExtensionMergePatch
import dev.utaa.linimal.patches.core.linimalManifestComponentRegistrationPatch
import dev.utaa.linimal.patches.core.noOpProbePatch
import dev.utaa.linimal.patches.features.ads.homeTopAdPatch
import dev.utaa.linimal.patches.features.ads.smartChannelAdsPatch
import dev.utaa.linimal.patches.features.ads.squareAdsPatch
import dev.utaa.linimal.patches.features.agenti.agentIChatComposerPatch
import dev.utaa.linimal.patches.features.agenti.agentIChatPlusMenuPatch
import dev.utaa.linimal.patches.features.agenti.agentIChatListSearchPatch
import dev.utaa.linimal.patches.features.agenti.agentIHomeHeaderPatch
import dev.utaa.linimal.patches.features.agenti.agentISettingsPatch
import dev.utaa.linimal.patches.features.agenti.agentIWalletHeaderPatch
import dev.utaa.linimal.patches.features.browser.externalBrowserChatTextLinkPatch
import dev.utaa.linimal.patches.features.chat.chatListHeaderButtonsPatch
import dev.utaa.linimal.patches.features.chat.chatPlusMenuPatch
import dev.utaa.linimal.patches.features.home.homeContentsRecommendationPatch
import dev.utaa.linimal.patches.features.home.homeFeaturedCollectionsPatch
import dev.utaa.linimal.patches.features.home.homeFeedLoadingIndicatorPatch
import dev.utaa.linimal.patches.features.home.homeFeedLivePatch
import dev.utaa.linimal.patches.features.home.homeFeedPostCardsPatch
import dev.utaa.linimal.patches.features.home.homeRecentHistoryPatch
import dev.utaa.linimal.patches.features.home.homeTrendingPatch
import dev.utaa.linimal.patches.features.lineai.lineAiEntryPatch
import dev.utaa.linimal.patches.features.lineai.lineAiGalleryViewerPatch
import dev.utaa.linimal.patches.features.lineai.lineAiImageSideMenuPatch
import dev.utaa.linimal.patches.features.lineai.lineAiMessageContextMenuPatch
import dev.utaa.linimal.patches.features.navigation.mainTabsPatch
import dev.utaa.linimal.patches.features.premium.premiumPreviewPromotionPatch
import dev.utaa.linimal.patches.features.premium.premiumSettingsRowPatch
import dev.utaa.linimal.patches.features.preview.previewDisablePatch
import dev.utaa.linimal.patches.features.preview.previewScrollPatch
import dev.utaa.linimal.patches.features.theme.amoledThemeResourcePatch
import dev.utaa.linimal.patches.features.googleauth.googleAuthMicrogManifestPatch
import dev.utaa.linimal.patches.features.googleauth.googleAuthTokenRoutingPatch
import dev.utaa.linimal.patches.features.googleauth.googleAccountPickerRoutingPatch
import dev.utaa.linimal.patches.features.googleauth.googleAuthFailureDiagnosticsPatch
import dev.utaa.linimal.patches.features.googleauth.googleSignInRoutingPatch
import dev.utaa.linimal.patches.features.push.fisCertificateHeaderPatch
import dev.utaa.linimal.patches.features.premium.premiumUnsendPromotionPatch
import dev.utaa.linimal.patches.features.readreceipts.readReceiptExplicitMarkAsReadPatch
import dev.utaa.linimal.patches.features.readreceipts.readReceiptManualCallerPatch
import dev.utaa.linimal.patches.features.readreceipts.readReceiptOutboundGatePatch
import dev.utaa.linimal.patches.features.readreceipts.readReceiptSupplierPreparationPatch
import dev.utaa.linimal.patches.features.readreceipts.readReceiptSupplierRegistrationPatch
import dev.utaa.linimal.patches.features.readers.readReceiptReadersPatch
import dev.utaa.linimal.patches.features.readwithoutreceipt.readWithoutReceiptComposeMenuPatch
import dev.utaa.linimal.patches.features.readwithoutreceipt.readWithoutReceiptLocalReadBlockPatch
import dev.utaa.linimal.patches.features.readwithoutreceipt.readWithoutReceiptMarkAsReadBlockPatch
import dev.utaa.linimal.patches.features.readwithoutreceipt.readWithoutReceiptMenuLabelResourcePatch
import dev.utaa.linimal.patches.features.readwithoutreceipt.readWithoutReceiptSessionPatch
import dev.utaa.linimal.patches.features.readwithoutreceipt.readWithoutReceiptSendPatch
import dev.utaa.linimal.patches.features.readwithoutreceipt.readWithoutReceiptManualReadPatch
import dev.utaa.linimal.patches.features.readwithoutreceipt.readWithoutReceiptPreviewMenuPatch
import dev.utaa.linimal.patches.features.readwithoutreceipt.notificationReadWithoutReceiptEntryPatch
import dev.utaa.linimal.patches.settings.linimalSettingsResourcePatch
import dev.utaa.linimal.patches.settings.settingsEntryPatch
import dev.utaa.linimal.patches.status.patchStatusResourcePatch
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

class LinimalPatchTest {
    @Test
    fun `Linimal is available only for arm64 targets`() {
        val availability = assertNotNull(linimalPatch.availability)

        InstallerType.entries.forEach { installer ->
            assertEquals(
                PatchAvailability.ENABLED,
                availability.resolve(installer, ApkArchitecture.ARM64_V8A),
                "Expected arm64-v8a to be enabled for $installer",
            )

            ApkArchitecture.entries
                .filter { it != ApkArchitecture.ARM64_V8A }
                .forEach { architecture ->
                    assertEquals(
                        PatchAvailability.UNAVAILABLE,
                        availability.resolve(installer, architecture),
                        "Expected $architecture to be unavailable for $installer",
                    )
                }
        }
    }

    @Test
    fun `feature patches run in a deterministic order after the status reset`() {
        assertEquals(setOf(noOpProbePatch), linimalPatch.dependencies)
        assertEquals(setOf(readReceiptReadersPatch), noOpProbePatch.dependencies)
        assertEquals(setOf(googleAuthFailureDiagnosticsPatch), readReceiptReadersPatch.dependencies)
        assertEquals(setOf(googleAccountPickerRoutingPatch), googleAuthFailureDiagnosticsPatch.dependencies)
        assertEquals(setOf(googleSignInRoutingPatch), googleAccountPickerRoutingPatch.dependencies)
        assertEquals(setOf(googleAuthTokenRoutingPatch), googleSignInRoutingPatch.dependencies)
        assertEquals(
            setOf(fisCertificateHeaderPatch, googleAuthMicrogManifestPatch),
            googleAuthTokenRoutingPatch.dependencies,
        )
        assertEquals(setOf(patchStatusResourcePatch), googleAuthMicrogManifestPatch.dependencies)
        assertEquals(setOf(chatListHeaderButtonsPatch), fisCertificateHeaderPatch.dependencies)
        assertEquals(setOf(notificationReadWithoutReceiptEntryPatch), chatListHeaderButtonsPatch.dependencies)
        assertEquals(setOf(readWithoutReceiptManualReadPatch), notificationReadWithoutReceiptEntryPatch.dependencies)
        assertEquals(setOf(readWithoutReceiptSendPatch), readWithoutReceiptManualReadPatch.dependencies)
        assertEquals(setOf(readWithoutReceiptSessionPatch), readWithoutReceiptSendPatch.dependencies)
        assertEquals(setOf(readWithoutReceiptLocalReadBlockPatch), readWithoutReceiptSessionPatch.dependencies)
        assertEquals(
            setOf(readWithoutReceiptMarkAsReadBlockPatch),
            readWithoutReceiptLocalReadBlockPatch.dependencies,
        )
        assertEquals(setOf(readWithoutReceiptPreviewMenuPatch), readWithoutReceiptMarkAsReadBlockPatch.dependencies)
        assertEquals(setOf(readWithoutReceiptComposeMenuPatch), readWithoutReceiptPreviewMenuPatch.dependencies)
        assertEquals(setOf(readWithoutReceiptMenuLabelResourcePatch), readWithoutReceiptComposeMenuPatch.dependencies)
        assertEquals(setOf(homeFeedLoadingIndicatorPatch), readWithoutReceiptMenuLabelResourcePatch.dependencies)
        assertEquals(setOf(homeRecentHistoryPatch), homeFeedLoadingIndicatorPatch.dependencies)
        assertEquals(setOf(homeFeaturedCollectionsPatch), homeRecentHistoryPatch.dependencies)
        assertEquals(setOf(amoledThemeResourcePatch), homeFeaturedCollectionsPatch.dependencies)
        assertEquals(setOf(previewDisablePatch), amoledThemeResourcePatch.dependencies)
        assertEquals(setOf(previewScrollPatch), previewDisablePatch.dependencies)
        assertEquals(setOf(premiumPreviewPromotionPatch), previewScrollPatch.dependencies)
        assertEquals(setOf(premiumSettingsRowPatch), premiumPreviewPromotionPatch.dependencies)
        assertEquals(setOf(homeFeedLivePatch), premiumSettingsRowPatch.dependencies)
        assertEquals(setOf(homeFeedPostCardsPatch), homeFeedLivePatch.dependencies)
        assertEquals(setOf(agentIChatListSearchPatch), homeFeedPostCardsPatch.dependencies)
        assertEquals(setOf(lineAiGalleryViewerPatch), agentIChatListSearchPatch.dependencies)
        assertEquals(setOf(lineAiImageSideMenuPatch), lineAiGalleryViewerPatch.dependencies)
        assertEquals(setOf(lineAiMessageContextMenuPatch), lineAiImageSideMenuPatch.dependencies)
        assertEquals(setOf(agentIChatPlusMenuPatch), lineAiMessageContextMenuPatch.dependencies)
        assertEquals(setOf(agentIChatComposerPatch), agentIChatPlusMenuPatch.dependencies)
        assertEquals(setOf(agentISettingsPatch), agentIChatComposerPatch.dependencies)
        assertEquals(setOf(agentIWalletHeaderPatch), agentISettingsPatch.dependencies)
        assertEquals(setOf(agentIHomeHeaderPatch), agentIWalletHeaderPatch.dependencies)
        assertEquals(setOf(homeTopAdPatch), agentIHomeHeaderPatch.dependencies)
        assertEquals(setOf(readReceiptExplicitMarkAsReadPatch), homeTopAdPatch.dependencies)
        assertEquals(setOf(readReceiptSupplierPreparationPatch), readReceiptExplicitMarkAsReadPatch.dependencies)
        assertEquals(setOf(readReceiptSupplierRegistrationPatch), readReceiptSupplierPreparationPatch.dependencies)
        assertEquals(setOf(readReceiptManualCallerPatch), readReceiptSupplierRegistrationPatch.dependencies)
        assertEquals(setOf(readReceiptOutboundGatePatch), readReceiptManualCallerPatch.dependencies)
        assertEquals(setOf(externalBrowserChatTextLinkPatch), readReceiptOutboundGatePatch.dependencies)
        assertEquals(setOf(squareAdsPatch), externalBrowserChatTextLinkPatch.dependencies)
        assertEquals(setOf(smartChannelAdsPatch), squareAdsPatch.dependencies)
        assertEquals(setOf(homeTrendingPatch), smartChannelAdsPatch.dependencies)
        assertEquals(setOf(homeContentsRecommendationPatch), homeTrendingPatch.dependencies)
        assertEquals(setOf(lineAiEntryPatch), homeContentsRecommendationPatch.dependencies)
        assertEquals(setOf(chatPlusMenuPatch), lineAiEntryPatch.dependencies)
        assertEquals(setOf(mainTabsPatch), chatPlusMenuPatch.dependencies)
        assertEquals(setOf(premiumUnsendPromotionPatch), mainTabsPatch.dependencies)
        assertEquals(setOf(settingsEntryPatch), premiumUnsendPromotionPatch.dependencies)
        assertEquals(setOf(linimalSettingsResourcePatch), settingsEntryPatch.dependencies)
        assertEquals(setOf(linimalBootstrapPatch), linimalSettingsResourcePatch.dependencies)
        assertEquals(setOf(linimalExtensionMergePatch), linimalBootstrapPatch.dependencies)
        assertEquals(
            setOf(linimalManifestComponentRegistrationPatch),
            linimalExtensionMergePatch.dependencies,
        )
        assertTrue(linimalManifestComponentRegistrationPatch.dependencies.contains(patchStatusResourcePatch))
    }
}
