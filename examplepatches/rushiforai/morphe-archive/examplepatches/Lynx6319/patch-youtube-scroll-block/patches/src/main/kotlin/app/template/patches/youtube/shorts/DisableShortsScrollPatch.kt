package app.template.patches.youtube.shorts

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.booleanOption
import app.template.patches.shared.Constants.COMPATIBILITY_YOUTUBE

private const val EXTENSION_CLASS =
    "Lapp/template/extension/youtube/shorts/DisableShortsScrollPatch;"

@Suppress("unused")
val disableShortsScrollPatch = bytecodePatch(
    name = "Disable Shorts scroll",
    description = "Disables swiping up/down between Shorts while still allowing a single " +
        "Short to be opened and watched normally.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    extendWith("extensions/extension.mpe")

    // SwitchPreference exposed to the Morphe Manager UI.
    val disableShortsScroll by booleanOption(
        key = "morphe_disable_shorts_scroll",
        default = true,
        title = "Disable Shorts scroll",
        description = "Prevents swiping up or down to navigate to the next or previous Short.",
    )

    execute {
        // Respect the user's preference; if disabled, leave YouTube's behaviour intact.
        if (disableShortsScroll == false) return@execute

        // ── Fling / swipe handler ─────────────────────────────────────────────
        // onFling returns boolean: false = gesture not consumed = no scroll.
        // We delegate to the extension so the patch can also honour the player-type
        // check (only suppress navigation when the SHORTS player is active).
        ShortsSwipeFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $EXTENSION_CLASS->isScrollBlocked()Z
                move-result v0
                if-eqz v0, :not_blocked
                const/4 v0, 0x0
                return v0
                :not_blocked
            """,
        )

        // ── Page-advance method ───────────────────────────────────────────────
        // Return false so the RecyclerView does not consume the swipe and the
        // Shorts playlist never advances to the next item.
        ShortsPageAdvanceFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $EXTENSION_CLASS->isScrollBlocked()Z
                move-result v0
                if-eqz v0, :advance_allowed
                const/4 v0, 0x0
                return v0
                :advance_allowed
            """,
        )
    }
}
