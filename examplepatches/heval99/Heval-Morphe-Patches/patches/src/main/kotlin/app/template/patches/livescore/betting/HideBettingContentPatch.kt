package app.template.patches.livescore.betting

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_LIVESCORE
import app.template.patches.shared.addInstructionsWithLabelsChecked

// Feature keys that stay available: the vote widget, the navigation, the "shocks" (goals and
// events) surfaces, their notifications and the free-to-play games hub. Every other key that
// reaches the gate (odds, bet builder, tips, bet streams, affiliate offers, the sponsor odds card,
// coverage sponsorship, the web-view betting content, the horses banner, LSB promos and the
// betting-flagged push preference entries, which have dynamic keys) is a betting surface.
private val NON_BETTING_KEYS = listOf(
    "lsm_vote_widget",
    "global_navigation",
    "global_shocks",
    "event_shocks",
    "live_section_shocks",
    "shocks_notifications",
    "ls6",
)

@Suppress("unused")
val hideBettingContentPatch = bytecodePatch(
    name = "Hide betting content",
    description = "Hides odds and betting content.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_LIVESCORE)

    execute {
        // 1. The per-feature gate: "not passed" means hidden. A key in the allow list falls through
        // to the stock body; every other key answers false. The first instruction of the stock
        // body is the label target, so the stock code is untouched. v0 is free at entry (the stock
        // code writes it before reading it) and p1 is the key, never null (stock calls getClass on it).
        val gate = UserBettingSelfRestrictionPassedFingerprint.method
        val checks = NON_BETTING_KEYS.joinToString("\n") { key ->
            """
                const-string v0, "$key"
                invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-nez v0, :stock
            """.trimIndent()
        }
        gate.addInstructionsWithLabelsChecked(
            0,
            """
                $checks
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
            ExternalLabel("stock", gate.getInstruction(0)),
        )

        // 2. The "adult and not self restricted" check feeds the betting announcement banners,
        // betting shortcuts, the vote widget's odds configuration and the surveys; all read false.
        // Surveys are hidden as a side effect.
        AdultAndNotSelfRestrictedFingerprint.method.returnEarly(false)

        // 3. Betting ads read as hidden, so ad targeting asks for no gambling ads.
        BettingAdsHiddenFingerprint.method.returnEarly(true)
    }
}
