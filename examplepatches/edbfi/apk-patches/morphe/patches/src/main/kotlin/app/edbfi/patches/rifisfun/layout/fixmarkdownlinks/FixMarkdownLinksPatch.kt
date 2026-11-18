// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.layout.fixmarkdownlinks

import app.edbfi.patches.rifisfun.RIF_IS_FUN
import app.edbfi.patches.rifisfun.misc.extension.EXTENSION
import app.edbfi.patches.rifisfun.misc.extension.extensionPatch
import app.edbfi.patches.rifisfun.misc.extension.extensionSwitch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.matchSingle

@Suppress("unused")
val fixMarkdownLinksPatch =
    patch(
        name = "Fix markdown links",
        description = "Shows markdown links that Reddit leaves as raw text, such as links to u/name, as links.",
        default = true,
    ) {
        compatibleWith(RIF_IS_FUN)
        dependsOn(extensionPatch)

        execute {
            val parse = ParseHtmlFingerprint.matchSingle().method
            // A branch to the first instruction would skip the hook.
            if (parse.instructions.first().location.labels.isNotEmpty()) throw PatchException("${parse.name} starts at a label")
            val enable = extensionSwitch("MarkdownLinks")

            // The HTML arrives unescaped; fix it before the parser sees it. See MarkdownLinks.
            parse.addInstructions(
                0,
                """
                    invoke-static/range { p0 .. p0 }, $EXTENSION/MarkdownLinks;->fix(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object p0
                """,
            )
            enable.apply()
        }
    }
