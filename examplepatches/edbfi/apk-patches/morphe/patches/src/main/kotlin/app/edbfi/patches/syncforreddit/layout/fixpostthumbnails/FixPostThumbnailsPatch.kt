// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.layout.fixpostthumbnails

import app.edbfi.patches.shared.string
import app.edbfi.patches.syncforreddit.SYNC_FOR_REDDIT
import app.edbfi.patches.syncforreddit.misc.extension.EXTENSION
import app.edbfi.patches.syncforreddit.misc.extension.extensionPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.matchSingle
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val fixPostThumbnailsPatch =
    patch(
        name = "Fix post thumbnails",
        description = "Fixes post thumbnails not loading.",
        default = true,
    ) {
        compatibleWith(SYNC_FOR_REDDIT)
        dependsOn(extensionPatch)

        execute {
            val method = ThumbnailFingerprint.matchSingle().method
            val code = method.instructions
            // const-string "thumbnail"; invoke-virtual JSONObject.optString; move-result-object vX
            val key = code.indices.singleOrNull { code[it].string == "thumbnail" }
                ?: throw PatchException("Expected one \"thumbnail\" literal in ${method.name}")
            val read = code.getOrNull(key + 1)?.getReference<MethodReference>()
            val result = code.getOrNull(key + 2)
            if (read?.name != "optString" || read.definingClass != "Lorg/json/JSONObject;" || result?.opcode != Opcode.MOVE_RESULT_OBJECT) {
                throw PatchException("The thumbnail is not read with JSONObject.optString")
            }
            val next = key + 3
            if (code.getOrNull(next)?.location?.labels?.isEmpty() != true) {
                throw PatchException("Nothing, or a branch target, follows the thumbnail read")
            }
            val url = (result as OneRegisterInstruction).registerA

            // Listings escape & as &amp; in the URL. Decoding it here, as it is read, leaves titles and other text
            // to the app, which decodes them itself.
            method.addInstructions(
                next,
                """
                    invoke-static/range { v$url .. v$url }, $EXTENSION/Thumbnails;->decode(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$url
                """,
            )
        }
    }
