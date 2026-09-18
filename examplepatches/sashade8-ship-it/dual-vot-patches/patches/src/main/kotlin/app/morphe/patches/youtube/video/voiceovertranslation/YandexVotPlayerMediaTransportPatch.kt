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

        BuildMediaDataSourceFingerprint.let {
            val urlField = it.instructionMatches[0].getFieldAccessed()
            val httpMethodField = it.instructionMatches[1].getFieldAccessed()
            val httpBodyField = it.instructionMatches[2].getFieldAccessed()
            val returnIndex = it.instructionMatches.last().index

            val parameterTypes = it.method.parameterTypes.map { type -> type.toString() }
            val headersParameterIndex = parameterTypes.indexOf("Ljava/util/Map;")
            val keyParameterIndex = parameterTypes.indexOfLast { type ->
                type == "Ljava/lang/String;"
            }
            check(headersParameterIndex >= 0 && keyParameterIndex >= 0) {
                "Could not resolve MediaDataSource headers/key parameters: $parameterTypes"
            }

            fun parameterRegister(parameterIndex: Int) = 1 + parameterTypes
                .take(parameterIndex)
                .sumOf { type -> if (type == "J" || type == "D") 2 else 1 }

            val headersRegister = parameterRegister(headersParameterIndex)
            val keyRegister = parameterRegister(keyParameterIndex)

            // Read the completed DataSpec fields discovered by the shared fingerprint. In
            // particular the body may have been cleared by Spoof video streams. Constructor
            // metadata moved from p6/p11 to p7/p12 in YouTube 21.37, so derive both registers
            // from their parameter types and copy them below v16 before invoking the hook.
            it.method.addInstructions(
                returnIndex,
                """
                    move-object v0, p0
                    iget-object v1, v0, $urlField
                    iget v2, v0, $httpMethodField
                    iget-object v3, v0, $httpBodyField
                    move-object/from16 v4, p$headersRegister
                    move-object/from16 v5, p$keyRegister
                    invoke-static { v1, v2, v3, v4, v5 }, $PLAYER_MEDIA_TRANSPORT->recordPlayerMediaRequest(Landroid/net/Uri;I[BLjava/util/Map;Ljava/lang/String;)V
                """
            )
        }

        MainCronetEngineFingerprint.method.apply {
            findInstructionIndicesReversedOrThrow(Opcode.RETURN_OBJECT).forEach { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                addInstruction(
                    index,
                    "invoke-static/range { v$register .. v$register }, $PLAYER_MEDIA_TRANSPORT->setCronetEngine(Lorg/chromium/net/CronetEngine;)V"
                )
            }
        }
    }
}
