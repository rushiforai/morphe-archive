// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.layout.fixpostthumbnails

import app.edbfi.patches.syncforreddit.SYNC_PACKAGE
import app.edbfi.patches.syncforreddit.SYNC_VERSION
import app.edbfi.patches.syncforreddit.misc.extension.EXTENSION
import app.edbfi.patches.syncforreddit.misc.extension.extensionPatch
import app.revanced.patcher.extensions.addInstructions
import app.revanced.patcher.extensions.instructions
import app.revanced.patcher.extensions.methodReference
import app.revanced.patcher.extensions.string
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val fixPostThumbnailsPatch =
    bytecodePatch(
        name = "Fix post thumbnails",
        description = "Fixes post thumbnails not loading.",
    ) {
        compatibleWith(SYNC_PACKAGE(SYNC_VERSION))
        dependsOn(extensionPatch)

        apply {
            val method = thumbnailMethod()
            val code = method.instructions
            // const-string "thumbnail"; invoke-virtual JSONObject.optString; move-result-object vX
            val key = code.indices.singleOrNull { code[it].string == "thumbnail" }
                ?: throw PatchException("Expected one \"thumbnail\" literal in ${method.name}")
            val read = code.getOrNull(key + 1)?.methodReference
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
