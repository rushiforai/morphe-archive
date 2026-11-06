package semicoloncolonel.mobilestream.patches.substack.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.substack.shared.Constants

// Substack 3.12.0. Items in the Notes feed carry a server flag
// can_show_follow_upsell; when set, the feed shows a "Follow" upsell card
// under the note. The getter now always reports it absent, so the card never
// appears. Notes themselves are unaffected.
//
// This is the one feed nag with a clean, named gate. The other prompts
// (notifications upsell, subscribe walls) are woven through obfuscated
// Compose code and are left alone.

internal object CanShowFollowUpsellFingerprint : Fingerprint(
    definingClass = "Lcom/substack/api/models/ApiNoteFeedItem;",
    name = "getCan_show_follow_upsell",
    returnType = "Ljava/lang/Boolean;",
    parameters = listOf(),
)

@Suppress("unused")
val hideFollowUpsellPatch = bytecodePatch(
    name = "Hide follow upsell",
    description = "Removes the \"Follow\" upsell card in the Notes feed.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        CanShowFollowUpsellFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
            """,
        )
    }
}
