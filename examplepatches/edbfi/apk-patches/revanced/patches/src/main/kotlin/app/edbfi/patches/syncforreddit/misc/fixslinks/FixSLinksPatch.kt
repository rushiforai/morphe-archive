// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.fixslinks

import app.edbfi.patches.syncforreddit.SYNC_PACKAGE
import app.edbfi.patches.syncforreddit.SYNC_VERSION
import app.edbfi.patches.syncforreddit.api.spoofclient.userAgentMethod
import app.edbfi.patches.syncforreddit.misc.extension.EXTENSION
import app.edbfi.patches.syncforreddit.misc.extension.extensionPatch
import app.revanced.patcher.extensions.ExternalLabel
import app.revanced.patcher.extensions.addInstructionsWithLabels
import app.revanced.patcher.extensions.getInstruction
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch

@Suppress("unused")
val fixSLinksPatch =
    bytecodePatch(
        name = "Fix /s/ links",
        description = "Opens Reddit share links (/s/) as the post they point to, from the app and from other apps.",
    ) {
        compatibleWith(SYNC_PACKAGE(SYNC_VERSION))
        dependsOn(extensionPatch)

        apply {
            // The redirect is resolved with the User-Agent the app sends to Reddit, Spoof client's if applied.
            val userAgent = userAgentMethod()
            val router = linkRouterMethod()
            // The call uses v0-v2, free at the method's start; the range form reaches any register number.
            val locals = router.implementation!!.registerCount - router.parameters.sumOf { if (it.type == "J" || it.type == "D") 2 else 1 }
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
