package app.anghami.patches.ui

import app.anghami.patches.core.AnghamiTarget
import app.anghami.patches.core.forceFalse
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Strips the locked premium entry points out of the player and playlist UI.
 *
 * Three unrelated guards are neutralised, each at the point the application
 * itself consults it:
 *
 * - the karaoke "sing along" upsell flag on the account model is forced to
 *   `false`; the separate karaoke entitlement check is deliberately left
 *   alone,
 * - the single boolean field read that drives the player's AI Mix switch is
 *   rewritten to a constant, so the surrounding branch keeps failing through
 *   to the collapsed state,
 * - the playlist-side AI Mix flag is forced to `false`, which prevents the
 *   section from ever being constructed and therefore leaves no empty slot
 *   behind in the list.
 *
 * Suppressing the playlist section at its origin is preferred over editing
 * the rendered item list, because mutating models while the adapter submits
 * them races the layout pass.
 */
@Suppress("unused")
val premiumButtonBlockPatch = bytecodePatch(
    name = "Hide Premium Feature Buttons",
    description = "Hides locked upsell buttons including Sing Along (Karaoke) and AI Mix triggers.",
    default = true,
) {
    compatibleWith(AnghamiTarget.COMPATIBILITY)
    category("Hide Gold features")

    execute {
        KaraokeUpsellButtonSignature.method.forceFalse()

        val u0 = PlayerAutomixSwitchSignature.method
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

        // The playlist AI Mix flag has a single reader, which decides whether
        // the section is appended to the playlist data at all. Forcing it to
        // false means no model, no cell and no spacing artefact, and nothing
        // has to be removed further down the rendering pipeline.
        MixAIButtonPlaylistSignature.method.forceFalse()
    }
}

/** Account model flag that advertises the karaoke upsell button. */
object KaraokeUpsellButtonSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/local/Account;",
    name = "isShowKaraokeUpsellButton",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/local/Account;->showKaraokeUpsellButton:Z"
        ),
    )
)

/** Player method that builds the AI Mix switch and its label. */
object PlayerAutomixSwitchSignature : Fingerprint(
    definingClass = "Lcom/anghami/player/ui/l;",
    name = "U0",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/odin/automix/a;",
            name = "a",
        ),
    )
)

/** Account model flag that gates the playlist AI Mix section. */
object MixAIButtonPlaylistSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/local/Account;",
    name = "showMixAIButtonPlaylist",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/ghost/local/Account;",
            name = "getBooleanAttribute",
        ),
    )
)
