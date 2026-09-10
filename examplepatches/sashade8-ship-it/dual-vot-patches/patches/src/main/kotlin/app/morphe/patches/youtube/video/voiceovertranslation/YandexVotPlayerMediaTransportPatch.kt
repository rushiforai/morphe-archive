/*
 * Copyright (C) 2026 Dual VoT contributors
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.patches.youtube.video.voiceovertranslation

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.misc.proxy.MainCronetEngineFingerprint
import app.morphe.patches.shared.misc.request.hookBuildRequest
import app.morphe.patches.shared.misc.spoof.BuildMediaDataSourceFingerprint
import app.morphe.patches.youtube.misc.extension.sharedExtensionPatch
import app.morphe.patches.youtube.misc.spoof.spoofVideoStreamsPatch
import app.morphe.util.findInstructionIndicesReversedOrThrow
import app.morphe.util.indexOfFirstInstructionReversedOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val PLAYER_MEDIA_TRANSPORT =
    "Lapp/morphe/extension/youtube/patches/voiceovertranslation/yandex/YandexVotPlayerMediaTransport;"

/**
 * Connects Yandex VoT source acquisition to the active player's media transport.
 *
 * The MediaDataSource constructor gives us the actual media URI and request headers, while the
 * Cronet factory gives the extension the same app engine.  This is intentionally not a response
 * hook: a data-source request with a body is SABR and is rejected by extension code until its
 * payload framing is established for the target YouTube APK.
 */
internal val yandexVotPlayerMediaTransportPatch = bytecodePatch {
    // Spoof video streams normalizes DataSpec.d just before its constructor returns.  Making it
    // a dependency guarantees this hook is inserted afterwards, so it sees the effective body
    // rather than the original constructor parameter.
    dependsOn(sharedExtensionPatch, spoofVideoStreamsPatch)

    execute {
        // This structural request-builder hook is shared with Morphe's spoof implementation and
        // runs regardless of the user's runtime spoof setting. It captures only the minimal
        // in-memory context needed to start a direct-stream request if Yandex asks for audio.
        hookBuildRequest("$PLAYER_MEDIA_TRANSPORT->recordPlayerRequest")

        BuildMediaDataSourceFingerprint.method.apply {
            val returnIndex = indexOfFirstInstructionReversedOrThrow(Opcode.RETURN_VOID)
            // Read a/c/d from the completed DataSpec.  In particular d may have been cleared by
            // Spoof video streams; recording p5 here would incorrectly retain the pre-mutation
            // SABR body.  p6/p11 are immutable constructor metadata (headers/key).
            addInstructions(
                returnIndex,
                """
                    move-object v0, p0
                    iget-object v1, v0, $definingClass->a:Landroid/net/Uri;
                    iget v2, v0, $definingClass->c:I
                    iget-object v3, v0, $definingClass->d:[B
                    invoke-static { v1, v2, v3, p6, p11 }, $PLAYER_MEDIA_TRANSPORT->recordPlayerMediaRequest(Landroid/net/Uri;I[BLjava/util/Map;Ljava/lang/String;)V
                """
            )
        }

        MainCronetEngineFingerprint.method.apply {
            findInstructionIndicesReversedOrThrow(Opcode.RETURN_OBJECT).forEach { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                addInstruction(
                    index,
                    "invoke-static { v$register }, $PLAYER_MEDIA_TRANSPORT->setCronetEngine(Lorg/chromium/net/CronetEngine;)V"
                )
            }
        }
    }
}
