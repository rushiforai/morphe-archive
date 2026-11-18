// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.misc.fixmedialinks

import app.edbfi.patches.rifisfun.RIF_PACKAGE
import app.edbfi.patches.rifisfun.RIF_VERSION
import app.edbfi.patches.rifisfun.misc.extension.EXTENSION
import app.edbfi.patches.rifisfun.misc.extension.extensionPatch
import app.edbfi.patches.rifisfun.misc.fixslinks.linkOpenerMethod
import app.edbfi.patches.rifisfun.misc.fixslinks.localRegisters
import app.revanced.patcher.extensions.addInstructions
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch

/** Unwraps the link at the start of the app's in-app link opener (see Fix /s/ links), before the app classifies it. */
@Suppress("unused")
val fixMediaLinksPatch =
    bytecodePatch(
        name = "Fix media links",
        description = "Opens reddit.com/media links as the Reddit-hosted image they wrap.",
    ) {
        compatibleWith(RIF_PACKAGE(RIF_VERSION))
        dependsOn(extensionPatch)

        apply {
            val opener = linkOpenerMethod()
            if (opener.localRegisters() < 1) throw PatchException("The in-app link opener has no local register")
            // The URL is p0, which may be above v15.
            opener.addInstructions(
                0,
                """
                    invoke-static/range { p0 .. p0 }, $EXTENSION/MediaLinks;->unwrap(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v0
                    move-object/from16 p0, v0
                """,
            )
        }
    }
