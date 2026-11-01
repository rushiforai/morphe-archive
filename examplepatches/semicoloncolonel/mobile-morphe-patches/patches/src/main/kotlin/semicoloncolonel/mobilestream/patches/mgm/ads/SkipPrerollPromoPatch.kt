package semicoloncolonel.mobilestream.patches.mgm.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.mgm.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Skip the MGM+ pre-roll promo.
//
// MGM+ stitches a ~20-30s self-promo into the AIV player's timeline as a
// ContentType.AUX item, ahead of the FEATURE you chose. It is not an ad break
// (ADVERTISEMENT, removed by Skip ads) and not the end-card recommendation, so
// the empty ad plan does not touch it.
//
// AmazonPlayerController.updatePosition() runs throughout playback and already
// looks up the current timeline item. A single call is prepended to it: while
// the current item is AUX, the helper seeks to the FEATURE start, skipping the
// promo. On the FEATURE (every normal title, and every binge/next episode) the
// helper's own AUX check is false, so it does nothing. All helper work is
// wrapped to fail safe, so it can never break playback.
// ─────────────────────────────────────────────────────────────────────────────

private const val CONTROLLER = "Lcom/epix/presentation/amazonPlayer/AmazonPlayerController;"
private const val SKIPPER = "Lsemicoloncolonel/mobilestream/extension/mgm/ads/MgmPrerollSkipper;"

internal object UpdatePositionFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "updatePosition" && classDef.type == CONTROLLER
    },
)

@Suppress("unused")
val skipPrerollPromoPatch = bytecodePatch(
    name = "Skip pre-roll promo",
    description = "Skips the ~20-30 second MGM+ self-promo that plays before a title in the phone " +
        "app, by jumping to the start of the main content. Normal playback and next-episode " +
        "binge are untouched. Experimental; test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // updatePosition()V has .registers 22, so `this` is p0 = v21. iget-object
        // cannot address v21 (its register fields are 4-bit), and the patcher
        // silently drops any instruction it cannot encode, so copy p0 into a low
        // register with move-object/from16 first, then read the fields from it.
        // v0/v1/v2 are scratch that the method's own opening instructions reset.
        UpdatePositionFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                iget-object v1, v0, $CONTROLLER->player:Lcom/amazon/video/sdk/player/Player;
                iget-object v2, v0, $CONTROLLER->timelineItems:Ljava/util/List;
                invoke-static { v1, v2 }, $SKIPPER->maybeSkipAux(Ljava/lang/Object;Ljava/util/List;)V
            """.trimIndent(),
        )
    }
}
