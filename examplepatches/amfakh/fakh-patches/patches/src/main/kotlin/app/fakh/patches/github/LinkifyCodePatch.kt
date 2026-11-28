/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.fakh.patches.github.shared.Constants.LINKIFY_CODE
import app.fakh.patches.shared.register
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile

/** Has the lines of files and diffs drawn by the extension's text view, which finds their links. */
private val codeLineViewPatch = patch {
    extendWith("extensions/extension.mpe")

    execute {
        document("res/layout/list_item_numbered_line.xml").use { document ->
            val texts = document.getElementsByTagName("TextView")
            val line = (0 until texts.length).map { texts.item(it) }.singleOrNull {
                it.attributes.getNamedItem("android:id")?.nodeValue == "@id/line"
            } ?: throw PatchException("GitHub: the text of a code line not found")
            document.renameNode(line, null, "app.fakh.extension.github.CodeLineView")
        }
    }
}

@Suppress("unused")
val linkifyCodePatch = patch(
    name = "Linkify code",
    description = "Opens addresses and references such as owner/repo#123 in files, diffs and code blocks when tapped.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(markdownSettingsPatch, codeLineViewPatch, codeOptionsPatch)

    execute {
        register(LINKIFY_CODE)
        appendToMarkdownView(
            resourceFile("assets/webview/markdown.css"),
            ".markdown-body a.fakh-code-link { color: inherit; text-decoration: underline; }",
        )
        appendToMarkdownView(
            resourceFile("assets/webview/markdown.js"),
            afterLoad(
                whileOn(
                    LINKIFY_CODE,
                    """
                    const pattern = /https?:\/\/[^\s"'<>`\\]+|(?<![\w./-])[A-Za-z0-9][\w-]*\/[\w.-]+#\d+\b/g
                    const texts = []
                    for (const code of document.querySelectorAll('#content pre, #content code')) {
                      if (code.closest('a') || code.parentElement.closest('pre, code')) continue
                      const walker = document.createTreeWalker(code, NodeFilter.SHOW_TEXT)
                      while (walker.nextNode()) {
                        if (!walker.currentNode.parentElement.closest('a')) texts.push(walker.currentNode)
                      }
                    }
                    for (const node of texts) {
                      const text = node.textContent
                      const parts = []
                      let done = 0
                      for (const found of text.matchAll(pattern)) {
                        const link = found[0].replace(/[.,;:!?)\]}]+${'$'}/, '')
                        const [slug, number] = link.split('#')
                        const anchor = document.createElement('a')
                        anchor.className = 'fakh-code-link'
                        anchor.href = link.startsWith('http') ? link : 'https://github.com/' + slug + '/issues/' + number
                        anchor.textContent = link
                        parts.push(text.slice(done, found.index), anchor)
                        done = found.index + link.length
                      }
                      if (parts.length) node.replaceWith(...parts, text.slice(done))
                    }
                """,
                ),
            ),
        )
    }
}
