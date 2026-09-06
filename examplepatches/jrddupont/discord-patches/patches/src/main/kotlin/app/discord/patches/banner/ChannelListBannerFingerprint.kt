package app.discord.patches.banner

/**
 * The quest promo ("QuestBar") is NOT native UI and has NO smali method to
 * fingerprint. Confirmed by decoding base.apk of Discord 343.12, 342.16,
 * and 341.13 Stable:
 *
 * - res/layout holds only AppCompat (abc_*) layouts; no banner layout.
 * - Native ids contain only generic `banner` and `nitroLogoBanner`.
 * - The channel list is React Native (modules/channel_list_v2). The promo
 *   is the QuestBar gate + creative, inside assets/index.android.bundle
 *   (Hermes bytecode v98 in all three builds).
 *
 * Gate functions (all: getDeliveredQuest + null/userStatus checks +
 * isDismissed + AdCreativeType QUEST/BOUNTY dispatch +
 * QuestContent.QUEST_BAR_MOBILE, no try/catch):
 *
 * - 342.16 Stable: fn 59152 (offset 32358749, 387 bytes, frame 251).
 * - 343.12 Stable: fn 59938 (offset 32531367, 387 bytes, frame 49).
 * - 341.13 Stable: fn 58782 (offset 32203161, 279 bytes, 50 regs).
 *   Hook-style variant (quest via parent, no getDeliveredQuest call) with
 *   the same null quest / userStatus / isDismissed checks.
 *
 * The creative renderer (default export of
 * QuestDockContextMenuActionSheet.tsx, renders the bar plus the Hide-This
 * ActionSheet) was analyzed but is NOT the patch target: neutering the
 * gate kills the banner earlier and is consistent across versions.
 *
 * Stable-only: the 345.2 Alpha gate (fn 61347, 477 bytes) was verified
 * during research but is intentionally unsupported — its anchor was
 * removed with the Alpha target.
 *
 * This file is notes-only; there is no Fingerprint to declare here.
 */
object QuestBarTargetNotes {
    const val BUNDLE_ASSET = "assets/index.android.bundle"
    const val BUNDLE_MANIFEST = "assets/manifest.json"
}
