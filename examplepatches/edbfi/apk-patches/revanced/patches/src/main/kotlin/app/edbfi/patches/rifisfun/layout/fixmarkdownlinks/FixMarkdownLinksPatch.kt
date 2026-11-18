// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.layout.fixmarkdownlinks

import app.edbfi.patches.rifisfun.RIF_PACKAGE
import app.edbfi.patches.rifisfun.RIF_VERSION
import app.edbfi.patches.rifisfun.misc.extension.EXTENSION
import app.edbfi.patches.rifisfun.misc.extension.extensionPatch
import app.edbfi.patches.rifisfun.misc.extension.extensionSwitch
import app.revanced.patcher.extensions.addInstructions
import app.revanced.patcher.extensions.instructions
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch

@Suppress("unused")
val fixMarkdownLinksPatch =
    bytecodePatch(
        name = "Fix markdown links",
        description = "Shows markdown links that Reddit leaves as raw text, such as links to u/name, as links.",
    ) {
        compatibleWith(RIF_PACKAGE(RIF_VERSION))
        dependsOn(extensionPatch)

        apply {
            val parse = parseHtmlMethod()
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
