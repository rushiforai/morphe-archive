package semicoloncolonel.mobilestream.patches.hulu.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.hulu.shared.Constants

private const val MPD_FILTER = "Lsemicoloncolonel/mobilestream/extension/hulu/ads/HuluMpdFilter;"

// Hulu 6.34.0 is not built on the Disney+ platform: it has its own player
// (com.hulu.physicalplayer), and its VOD ads are periods stitched into the
// DASH manifest. The player builds its ad pods from those periods
// (AdPods.a), so HuluMpdFilter removes the ad and bumper periods from the raw
// MPD before Hulu's own parser reads it. See HuluMpdFilter for the rules.
internal object DashManifestParseFingerprint : Fingerprint(
    definingClass = "Lcom/hulu/physicalplayer/datasource/mpd/DashManifestParser;",
    name = "parse",
    parameters = listOf("Ljava/lang/String;", "Ljava/io/InputStream;"),
    returnType = "Lcom/hulu/physicalplayer/datasource/mpd/MPD;",
)

// AdPods.a compares its ad count with Playlist.getAdMetadataList() and
// reports a "metadata-mismatch" playback error to Hulu when they differ.
// The getter is filtered so a stripped title lists no ads either.
internal object PlaylistAdMetadataFingerprint : Fingerprint(
    definingClass = "Lcom/hulu/playlist/Playlist;",
    name = "getAdMetadataList",
    parameters = listOf(),
    returnType = "Ljava/util/List;",
)

// VodPlayingStateController.Y() resumes a title. A content-time resume goes
// through the ad pods and needs no change. A stream-time resume is used as is,
// so it is moved into the stripped timeline (HuluMpdFilter.mapStreamSeconds).
internal object VodResumeFingerprint : Fingerprint(
    definingClass = "Lcom/hulu/features/playback/controller/VodPlayingStateController;",
    returnType = "V",
    parameters = listOf(),
    strings = listOf("resume_on_playback"),
)

private fun MethodReference.isPlaylistCall(name: String) =
    definingClass == "Lcom/hulu/playlist/Playlist;" && this.name == name

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads stitched into on-demand videos in the Hulu phone app, so " +
        "titles play without ad breaks. Live TV is not changed. Experimental; test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // parse(String, InputStream): p2 is the manifest stream.
        DashManifestParseFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p2 }, $MPD_FILTER->filter(Ljava/io/InputStream;)Ljava/io/InputStream;
                move-result-object p2
            """.trimIndent(),
        )

        // iget-object v0, p0, adMetadataList / return-object v0
        PlaylistAdMetadataFingerprint.method.apply {
            val returnIndex = implementation!!.instructions.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
            val register = (implementation!!.instructions.toList()[returnIndex] as OneRegisterInstruction).registerA
            addInstructions(
                returnIndex,
                """
                    invoke-static { v$register }, $MPD_FILTER->adMetadata(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$register
                """.trimIndent(),
            )
        }

        VodResumeFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            // getResumePositionSeconds()D, then move-result-wide vResume.
            val resumeCall = instructions.indexOfFirst {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.isPlaylistCall("getResumePositionSeconds") == true
            }
            val resumeRegister = (instructions.getOrNull(resumeCall + 1)
                ?.takeIf { it.opcode == Opcode.MOVE_RESULT_WIDE } as? OneRegisterInstruction)?.registerA
                ?: throw PatchException("Resume position read not found")
            // isResumePositionStreamTime()Z, move-result, then the branch:
            // the stream-time path is the fall-through after its if-eqz.
            val streamTimeCall = instructions.indexOfFirst {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.isPlaylistCall("isResumePositionStreamTime") == true
            }
            val branch = (streamTimeCall until instructions.size).firstOrNull {
                instructions[it].opcode == Opcode.IF_EQZ
            } ?: throw PatchException("Stream-time branch not found")
            addInstructions(
                branch + 1,
                """
                    invoke-static { v$resumeRegister, v${resumeRegister + 1} }, $MPD_FILTER->mapStreamSeconds(D)D
                    move-result-wide v$resumeRegister
                """.trimIndent(),
            )
        }
    }
}
