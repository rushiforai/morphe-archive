// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.misc.videodownloads

import app.edbfi.patches.syncforreddit.SyncPatchStrings
import app.edbfi.patches.syncforreddit.syncForReddit
import app.reseam.patch.Type
import app.reseam.patch.dex.Opcode
import app.reseam.patch.dex.buildInstructions
import app.reseam.patch.dex.invokeRegisters
import app.reseam.patch.dex.methodRef
import app.reseam.patch.dex.opcode
import app.reseam.patch.method
import app.reseam.patch.patch

private val downloadManifest = method("Reddit video download manifest parser") {
    params("com.android.volley.NetworkResponse")
    returns("com.android.volley.Response")
    strings("AdaptationSet", "DASH_audio", "audio", "Video url: ", "Audio url: ")
}

private val audioRepresentation = method("Reddit audio representation parser") {
    params("org.w3c.dom.Element")
    returns(Type.String)
    strings("Representation", "BaseURL", "DASH_audio", "audio")
}

val fixVideoDownloads = patch(SyncPatchStrings.fixVideoDownloads) {
    description(SyncPatchStrings.fixVideoDownloadsDescription)
    compatibleWith(syncForReddit)

    execute {
        val parser = downloadManifest.method
        val audio = audioRepresentation.method
        val ignoreCase = audio.instructions.mapNotNull { it.methodRef }.distinct().single {
            it.definingClass == "Lorg/apache/commons/lang3/StringUtils;" && it.name == "containsIgnoreCase"
        }
        val checks = parser.instructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                instruction.methodRef?.let { it.definingClass == "Ljava/lang/String;" && it.name == "contains" } == true
        }
        check(checks.size == 2) { "Expected two DASH audio checks, found ${checks.size}" }

        val edits = checks.map { (index, instruction) ->
            index to buildInstructions {
                invokeStatic(ignoreCase.definingClass, ignoreCase.name, ignoreCase.proto, *instruction.invokeRegisters.orEmpty().toIntArray())
            }.single()
        }
        edits.forEach { (index, instruction) -> parser.replaceInstruction(index, instruction) }
    }
}
