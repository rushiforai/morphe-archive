// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.volley

import app.edbfi.patches.syncforreddit.misc.extension.EXTENSION
import app.edbfi.patches.syncforreddit.misc.extension.extensionPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.smali.ExternalLabel

/** Lets the extension answer a Volley request before the app sends it; a null answer sends the app's request. */
internal val volleyHookPatch =
    patch {
        dependsOn(extensionPatch)

        execute {
            val performRequest = PerformRequestFingerprint.matchSingle().method
            // The hook's result goes in v0, which must be a local, not the request parameter.
            if ((performRequest.implementation?.registerCount ?: 0) < 3) throw PatchException("performRequest has no local register")
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
