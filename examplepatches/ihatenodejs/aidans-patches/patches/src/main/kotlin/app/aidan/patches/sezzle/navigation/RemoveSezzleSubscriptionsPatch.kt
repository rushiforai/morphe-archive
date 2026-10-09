package app.aidan.patches.sezzle.navigation

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.sezzle.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

private const val ACCOUNT_SUBSCRIPTIONS_JUMP_OFFSET = 0x133c
private val EXPECTED_ACCOUNT_SUBSCRIPTIONS_JUMP_BYTES = byteArrayOf(0xb0.toByte(), 0x0c, 0x44)
private val BYPASS_ACCOUNT_SUBSCRIPTIONS_BYTES = byteArrayOf(0x7e, 0x7e, 0x7e)

private const val ACCOUNT_ANYWHERE_BANNER_OFFSET = 0x11eb
private val EXPECTED_ACCOUNT_ANYWHERE_BANNER_BYTES = byteArrayOf(
    0x10, 0x19, 0x50, 0xb2.toByte(), 0x06, 0x19, 0x10, 0x19, 0x48
)
private val HIDDEN_ACCOUNT_ANYWHERE_BANNER_BYTES = byteArrayOf(
    0x96.toByte(), 0x19, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e
)

private val EXPECTED_WALLET_BANNER_PROLOGUE_BYTES = byteArrayOf(0x34, 0x0e, 0x00, 0x40)
private val HIDDEN_WALLET_BANNER_BYTES = byteArrayOf(0x93.toByte(), 0x01, 0x76.toByte(), 0x01)

private val EXPECTED_WALLET_BANNER_CAROUSEL_PROLOGUE_BYTES = byteArrayOf(0x34, 0x07, 0x00, 0x40)
private val HIDDEN_WALLET_BANNER_CAROUSEL_BYTES = byteArrayOf(0x93.toByte(), 0x01, 0x76.toByte(), 0x01)

private val EXPECTED_GIFT_CARDS_SECTION_PROLOGUE_BYTES = byteArrayOf(0x34, 0x05, 0x00, 0x40)
private val HIDDEN_GIFT_CARDS_SECTION_BYTES = byteArrayOf(0x93.toByte(), 0x01, 0x76.toByte(), 0x01)

private const val HELP_PRIORITY_SUPPORT_CLOSURE_INDEX = 64670
private val EXPECTED_HELP_PRIORITY_SUPPORT_BYTES = byteArrayOf(0x34, 0x01, 0x00, 0x3b, 0x02, 0x01)
private val HIDDEN_HELP_PRIORITY_SUPPORT_BYTES = byteArrayOf(0x08, 0x02, 0x00, 0x00, 0x76.toByte(), 0x02)

@Suppress("unused")
val removeSezzleSubscriptionsPatch = rawResourcePatch(
    name = "Remove Sezzle Subscriptions",
    description = "Removes references to Sezzle Anywhere and Sezzle Premium subscriptions in Account benefits, Wallet, and Orders help.",
    default = false
) {
    category("Interface")
    compatibleWith(COMPATIBILITY_SEZZLE)

    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) {
            throw PatchException("assets/index.android.bundle not found")
        }

        val editor = HermesBundleEditor(bundleFile.readBytes())

        // 1. Account Menu -> Remove Anywhere and Premium from Benefits, and remove Anywhere banner card
        val accountViewOffsets = editor.findFunctionOffsetsByName("AccountView")
        val accountViewOffset = accountViewOffsets.singleOrNull()
            ?: throw PatchException("Expected one AccountView renderer, found ${accountViewOffsets.size}")

        val accountJumpOffset = accountViewOffset + ACCOUNT_SUBSCRIPTIONS_JUMP_OFFSET
        if (editor.matchesBytes(accountJumpOffset, EXPECTED_ACCOUNT_SUBSCRIPTIONS_JUMP_BYTES)) {
            editor.patchBytes(accountJumpOffset, BYPASS_ACCOUNT_SUBSCRIPTIONS_BYTES)
        } else if (!editor.matchesBytes(accountJumpOffset, BYPASS_ACCOUNT_SUBSCRIPTIONS_BYTES)) {
            throw PatchException("Unexpected bytecode at AccountView subscriptions jump")
        }

        val accountAnywhereBannerOffset = accountViewOffset + ACCOUNT_ANYWHERE_BANNER_OFFSET
        if (editor.matchesBytes(accountAnywhereBannerOffset, EXPECTED_ACCOUNT_ANYWHERE_BANNER_BYTES)) {
            editor.patchBytes(accountAnywhereBannerOffset, HIDDEN_ACCOUNT_ANYWHERE_BANNER_BYTES)
        } else if (!editor.matchesBytes(accountAnywhereBannerOffset, HIDDEN_ACCOUNT_ANYWHERE_BANNER_BYTES)) {
            throw PatchException("Unexpected bytecode at AccountView Anywhere banner condition")
        }

        // 2. Wallet Screen -> Remove Anywhere Promotional Banner (both single banner and carousel)
        val walletBannerOffsets = editor.findFunctionOffsetsByName("WalletBanner")
        val walletBannerOffset = walletBannerOffsets.singleOrNull()
            ?: throw PatchException(
                "Expected one WalletBanner renderer, found ${walletBannerOffsets.size}"
            )
        if (editor.matchesBytes(walletBannerOffset, EXPECTED_WALLET_BANNER_PROLOGUE_BYTES)) {
            editor.patchBytes(walletBannerOffset, HIDDEN_WALLET_BANNER_BYTES)
        } else if (!editor.matchesBytes(walletBannerOffset, HIDDEN_WALLET_BANNER_BYTES)) {
            throw PatchException("Unexpected bytecode at WalletBanner")
        }

        val walletBannerCarouselOffsets = editor.findFunctionOffsetsByName("WalletBannerCarousel")
        val walletBannerCarouselOffset = walletBannerCarouselOffsets.singleOrNull()
            ?: throw PatchException(
                "Expected one WalletBannerCarousel renderer, found ${walletBannerCarouselOffsets.size}"
            )
        if (editor.matchesBytes(walletBannerCarouselOffset, EXPECTED_WALLET_BANNER_CAROUSEL_PROLOGUE_BYTES)) {
            editor.patchBytes(walletBannerCarouselOffset, HIDDEN_WALLET_BANNER_CAROUSEL_BYTES)
        } else if (!editor.matchesBytes(walletBannerCarouselOffset, HIDDEN_WALLET_BANNER_CAROUSEL_BYTES)) {
            throw PatchException("Unexpected bytecode at WalletBannerCarousel")
        }

        // 3. Wallet Screen -> Remove Gift cards section
        val giftCardsSectionOffsets = editor.findFunctionOffsetsByName("GiftCardsSection")
        val giftCardsSectionOffset = giftCardsSectionOffsets.singleOrNull()
            ?: throw PatchException(
                "Expected one GiftCardsSection renderer, found ${giftCardsSectionOffsets.size}"
            )
        if (editor.matchesBytes(giftCardsSectionOffset, EXPECTED_GIFT_CARDS_SECTION_PROLOGUE_BYTES)) {
            editor.patchBytes(giftCardsSectionOffset, HIDDEN_GIFT_CARDS_SECTION_BYTES)
        } else if (!editor.matchesBytes(giftCardsSectionOffset, HIDDEN_GIFT_CARDS_SECTION_BYTES)) {
            throw PatchException("Unexpected bytecode at GiftCardsSection")
        }

        // 4. Orders Tab -> Help modal -> Remove Priority Customer Support
        if (editor.functionCount <= HELP_PRIORITY_SUPPORT_CLOSURE_INDEX) {
            throw PatchException(
                "Bundle function count (${editor.functionCount}) insufficient for priority support closure"
            )
        }
        val prioritySupportHeader = editor.getFunctionHeader(HELP_PRIORITY_SUPPORT_CLOSURE_INDEX)
        val prioritySupportOffset = prioritySupportHeader.codeOffset
        if (editor.matchesBytes(prioritySupportOffset, EXPECTED_HELP_PRIORITY_SUPPORT_BYTES)) {
            editor.patchBytes(prioritySupportOffset, HIDDEN_HELP_PRIORITY_SUPPORT_BYTES)
        } else if (!editor.matchesBytes(prioritySupportOffset, HIDDEN_HELP_PRIORITY_SUPPORT_BYTES)) {
            throw PatchException("Unexpected bytecode at help priority support closure")
        }

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
