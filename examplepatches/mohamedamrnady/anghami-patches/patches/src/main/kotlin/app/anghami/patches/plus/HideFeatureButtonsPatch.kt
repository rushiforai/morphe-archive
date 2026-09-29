package app.anghami.patches.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Hides upsell feature buttons (karaoke, AI MIX).
 *
 * - TRY SING ALONG (player M0 container via Q0, song rows via
 *   y8/a -> F8/X.j): isShowKaraokeUpsellButton -> false is the sole gate.
 *   The karaoke FEATURE gate (isCanUseKaraoke) is untouched.
 * - Player AI MIX switch + label (G0/H0 via U0): the single
 *   `iget-boolean v0, v0, Account;->showMixAIButtonPlayer:Z` is swapped to
 *   `const/4 v0, 0x0` so the branch falls to GONE. Same-register
 *   single-instruction swap; fails loudly if absent or ambiguous.
 * - Playlist "AI MIX this playlist" button: the client creates the section
 *   itself in Q.l() gated on Account.showMixAIButtonPlaylist(); forcing
 *   false means the section is never created (no model = no cell = no
 *   gap). Deliberately NOT removed in the S8/i Epoxy adapter funnel:
 *   model list-surgery at submit raced layout and crashed P5/b
 *   (2026-09-28) — nor in the A4/a factory (wrong field + switch
 *   payload risk). This flag is the app's own gate: use it.
 *
 * See FeatureButtonsFingerprints.kt.
 */
@Suppress("unused")
val hideFeatureButtonsPatch = bytecodePatch(
    name = "Hide upsell feature buttons",
    description = "Hides TRY SING ALONG karaoke upsell, the player AI MIX switch, and the playlist AI MIX button. Feature gates untouched.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)
    category("Hide Gold features")

    execute {
        KaraokeUpsellButtonFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        val u0 = PlayerAutomixSwitchFingerprint.method
        val mixAiGets = u0.implementation!!.instructions
            .mapIndexedNotNull { index, ins ->
                if (ins.opcode == Opcode.IGET_BOOLEAN && ins is Instruction22c &&
                    (ins.reference as? FieldReference)?.name == "showMixAIButtonPlayer"
                ) {
                    index
                } else {
                    null
                }
            }
        check(mixAiGets.size == 1) {
            "expected exactly 1 showMixAIButtonPlayer iget in U0, found ${mixAiGets.size}"
        }
        u0.replaceInstructions(mixAiGets[0], "const/4 v0, 0x0")
        // Playlist "AI MIX this playlist" button: the client itself creates
        // the section in Q.l(songSections) — gated on the server flag
        // Account.showMixAIButtonPlaylist() (sole reader of that flag;
        // callers are P5/h playlist data and k5/g feed sections). Forcing
        // false means the automix_button section is never created: no model
        // = no cell = no gap, Epoxy-safe (nothing to remove downstream).
        // REJECTED alternatives (2026-09-28): (a) iterator-removing the
        // AutomixButtonModel in the S8/i Epoxy adapter funnel — raced
        // RecyclerView layout and crashed P5/b ("Inconsistency detected.
        // Invalid item position 3"); (b) early-return in the A4/a section
        // factory — wrong field (the switch reads Section.type, and the
        // created section uses type="automix_button" with
        // displayType="list"), and any factory edit risks the switch
        // payloads. This flag is the app's own gate: use it.
        MixAIButtonPlaylistFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
    }
}
