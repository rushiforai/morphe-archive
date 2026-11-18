// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.fixslinks

import app.edbfi.patches.syncforreddit.SYNC_FOR_REDDIT
import app.edbfi.patches.syncforreddit.api.spoofclient.UserAgentFingerprint
import app.edbfi.patches.syncforreddit.misc.extension.EXTENSION
import app.edbfi.patches.syncforreddit.misc.extension.extensionPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.smali.ExternalLabel

@Suppress("unused")
val fixSLinksPatch =
    patch(
        name = "Fix /s/ links",
        description = "Opens Reddit share links (/s/) as the post they point to, from the app and from other apps.",
        default = true,
    ) {
        compatibleWith(SYNC_FOR_REDDIT)
        dependsOn(extensionPatch)

        execute {
            // The redirect is resolved with the User-Agent the app sends to Reddit, Spoof client's if applied.
            val userAgent = UserAgentFingerprint.matchSingle().originalMethod
            val router = LinkRouterFingerprint.matchSingle().method
            // The call uses v0-v2, free at the method's start; the range form reaches any register number.
            val locals = (router.implementation?.registerCount ?: 0) - router.parameters.sumOf { if (it.type == "J" || it.type == "D") 2 else 1 }
            if (locals < 3) throw PatchException("The link router has $locals local registers, 3 are needed")
            router.addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v0, p0
                    move-object/from16 v1, p3
                    invoke-static { }, ${userAgent.definingClass}->${userAgent.name}()Ljava/lang/String;
                    move-result-object v2
                    invoke-static/range { v0 .. v2 }, $EXTENSION/ShareLinks;->open(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :original
                    return v0
                """,
                ExternalLabel("original", router.getInstruction(0)),
            )
        }
    }
