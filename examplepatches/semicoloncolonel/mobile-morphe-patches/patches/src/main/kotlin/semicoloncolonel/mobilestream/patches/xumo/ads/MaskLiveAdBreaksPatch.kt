package semicoloncolonel.mobilestream.patches.xumo.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.xumo.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Xumo Play 4.6.21 — Mask live ad breaks.
//
// Live channels are HLS with server-side ad insertion (AWS MediaTailor), so
// the ads are in the stream and cannot be removed on the device. In the media
// playlist, ad segments have a "/segment/" path and the show's segments come
// from the channel's origin, which gives a clean signal.
//
//   1. ExoPlayer's HLS playlist parser (unnamed in this build; found by its
//      "#EXT-X-STREAM-INF" tag string and its (Uri, InputStream) parse method)
//      hands each playlist to XumoLiveMask first, which records the segments.
//   2. XumoPlayerView's play, resume, and release tell XumoLiveMask which
//      player is in use. It checks that player's position against the
//      segments every half second, and covers and mutes the video during ad
//      segments. Each new playback clears the segments.
//   3. The player's getCurrentPosition() and setVolume(float) are renamed in
//      this build. Their names are read from Xumo's own code (saveProgress
//      reads the position; setVolume is the player's only (float) method) and
//      written into XumoLiveMask.
// ─────────────────────────────────────────────────────────────────────────────

private const val MASK = "Lsemicoloncolonel/mobilestream/extension/xumo/XumoLiveMask;"
private const val PLAYER_VIEW = "Lcom/xumo/xumo/player/XumoPlayerView;"

private fun com.android.tools.smali.dexlib2.iface.Method.hasString(value: String) =
    implementation?.instructions?.any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
    } == true

internal object HlsPlaylistParseFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.implementation != null &&
            method.returnType != "Ljava/lang/Object;" &&
            method.parameterTypes.map { it.toString() } == listOf("Landroid/net/Uri;", "Ljava/io/InputStream;") &&
            classDef.methods.any { it.hasString("#EXT-X-STREAM-INF") }
    },
)

internal object SaveProgressFingerprint : Fingerprint(
    definingClass = PLAYER_VIEW,
    name = "saveProgress",
    returnType = "V",
)

internal object PositionMethodFingerprint : Fingerprint(
    definingClass = MASK,
    name = "positionMethod",
    returnType = "Ljava/lang/String;",
)

internal object VolumeMethodFingerprint : Fingerprint(
    definingClass = MASK,
    name = "volumeMethod",
    returnType = "Ljava/lang/String;",
)

@Suppress("unused")
val maskLiveAdBreaksPatch = bytecodePatch(
    name = "Mask live ad breaks",
    description = "Covers and mutes the ad breaks on live channels until the show returns.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // 1. Read each HLS playlist before ExoPlayer parses it.
        HlsPlaylistParseFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p2 }, $MASK->playlist(Landroid/net/Uri;Ljava/io/InputStream;)Ljava/io/InputStream;
                move-result-object p2
            """.trimIndent(),
        )

        // 3. Resolve the player's renamed methods from Xumo's own calls.
        val calls = SaveProgressFingerprint.method.implementation!!.instructions
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        val playerType = calls.firstOrNull { it.name == "getPlayer" && it.parameterTypes.isEmpty() }?.returnType
            ?: throw PatchException("XumoPlayerView.saveProgress no longer reads the player")
        val positionName = calls.firstOrNull {
            it.definingClass == playerType && it.parameterTypes.isEmpty() && it.returnType == "J"
        }?.name ?: throw PatchException("Player position call not found in saveProgress")
        val volumeName = mutableClassDefBy(playerType).methods.singleOrNull {
            it.returnType == "V" && it.parameterTypes.map { p -> p.toString() } == listOf("F")
        }?.name ?: throw PatchException("Player setVolume(float) not found")

        PositionMethodFingerprint.method.addInstructions(0, "const-string v0, \"$positionName\"\nreturn-object v0")
        VolumeMethodFingerprint.method.addInstructions(0, "const-string v0, \"$volumeName\"\nreturn-object v0")

        // 2. Track the player views that start, resume, and release playback.
        val view = mutableClassDefBy(PLAYER_VIEW)
        mapOf(
            "play" to "play",
            "resume" to "resume",
            "release" to "release",
        ).forEach { (method, hook) ->
            val target = view.methods.singleOrNull { it.name == method && it.returnType == "V" }
                ?: throw PatchException("XumoPlayerView.$method not found")
            target.addInstructions(
                0,
                "invoke-static/range { p0 .. p0 }, $MASK->$hook(Landroid/view/View;)V",
            )
        }
    }
}
