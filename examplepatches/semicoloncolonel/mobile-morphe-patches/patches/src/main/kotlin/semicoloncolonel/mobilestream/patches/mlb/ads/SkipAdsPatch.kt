package semicoloncolonel.mobilestream.patches.mlb.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.mlb.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// MLB 26.21.0.49 — Skip ads.
//
// On-demand videos (highlights, classic games) play server-stitched ads
// through Google DAI: the ad segments are listed in the HLS playlist, which
// the player fetches through Media3's OkHttpDataSource. Each playlist is read
// here first (MlbManifestRewriter), and the ad segments (dclk_video_ads) are
// removed before ExoPlayer parses them, so the video plays without the
// pre-roll. The IMA DAI machinery is also quieted.
//
// This is the robust path for this build: the ad segments are stitched into
// the manifest server-side, so there is no client-side ad request to block.
//
// Thanks to ajstrick81, whose Android TV patch found this path. Live-game ads
// are covered by the opt-in "Mask live ad breaks".
// ─────────────────────────────────────────────────────────────────────────────

private const val REWRITER = "Lsemicoloncolonel/mobilestream/extension/mlb/MlbManifestRewriter;"

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads before on-demand videos.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // Quiet the IMA DAI machinery (belt-and-suspenders).
        SsaiMediaSourceStartupFingerprint.method.addInstructions(0, "return-void")
        DaiStreamManagerHandlerFingerprint.methodOrNull?.addInstructions(0, "return-void")

        // Strip ad segments from each HLS playlist where the data source
        // stores the response stream.
        OkHttpDataSourceOpenFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val iputIndex = instructions.indexOfFirst {
                it.opcode == Opcode.IPUT_OBJECT &&
                    ((it as ReferenceInstruction).reference as? FieldReference)?.type == "Ljava/io/InputStream;"
            }
            if (iputIndex == -1) throw PatchException("InputStream store not found in OkHttpDataSource.open")
            val streamRegister = "v${(instructions[iputIndex] as TwoRegisterInstruction).registerA}"
            addInstructions(
                iputIndex,
                """
                    invoke-static { p1, $streamRegister }, $REWRITER->wrap(Ljava/lang/Object;Ljava/io/InputStream;)Ljava/io/InputStream;
                    move-result-object $streamRegister
                """.trimIndent(),
            )
        }
    }
}
