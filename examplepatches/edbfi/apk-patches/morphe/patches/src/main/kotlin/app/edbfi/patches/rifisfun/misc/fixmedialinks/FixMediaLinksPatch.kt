// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.misc.fixmedialinks

import app.edbfi.patches.rifisfun.RIF_IS_FUN
import app.edbfi.patches.rifisfun.misc.extension.EXTENSION
import app.edbfi.patches.rifisfun.misc.extension.extensionPatch
import app.edbfi.patches.rifisfun.misc.fixslinks.LinkOpenerFingerprint
import app.edbfi.patches.rifisfun.misc.fixslinks.localRegisters
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.matchSingle

/** Unwraps the link at the start of the app's in-app link opener (see Fix /s/ links), before the app classifies it. */
@Suppress("unused")
val fixMediaLinksPatch =
    patch(
        name = "Fix media links",
        description = "Opens reddit.com/media links as the Reddit-hosted image they wrap.",
        default = true,
    ) {
        compatibleWith(RIF_IS_FUN)
        dependsOn(extensionPatch)

        execute {
            val opener = LinkOpenerFingerprint.matchSingle().method
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
