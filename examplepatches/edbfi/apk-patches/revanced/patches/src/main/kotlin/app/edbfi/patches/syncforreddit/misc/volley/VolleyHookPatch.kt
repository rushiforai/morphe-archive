// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.volley

import app.edbfi.patches.syncforreddit.misc.extension.EXTENSION
import app.edbfi.patches.syncforreddit.misc.extension.extensionPatch
import app.revanced.patcher.extensions.ExternalLabel
import app.revanced.patcher.extensions.addInstructionsWithLabels
import app.revanced.patcher.extensions.getInstruction
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch

/** Lets the extension answer a Volley request before the app sends it; a null answer sends the app's request. */
internal val volleyHookPatch =
    bytecodePatch {
        dependsOn(extensionPatch)

        apply {
            val performRequest = performRequestMethod()
            // The hook's result goes in v0, which must be a local, not the request parameter.
            if (performRequest.implementation!!.registerCount < 3) throw PatchException("performRequest has no local register")
            performRequest.addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $EXTENSION/VolleyHook;->perform(Lcom/android/volley/Request;)Lcom/android/volley/NetworkResponse;
                    move-result-object v0
                    if-eqz v0, :original
                    return-object v0
                """,
                ExternalLabel("original", performRequest.getInstruction(0)),
            )
        }
    }
