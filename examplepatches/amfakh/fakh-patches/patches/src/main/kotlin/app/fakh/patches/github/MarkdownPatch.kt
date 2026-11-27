/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.shared.register
import app.fakh.patches.shared.Feature
import app.morphe.patcher.patch.mutableClassDefBy
import app.fakh.patches.github.shared.Constants.MERMAID
import app.fakh.patches.github.shared.Constants.COLLAPSE_CODE
import app.fakh.patches.github.shared.Constants.SHORTEN_LINKS
import app.fakh.patches.github.shared.Constants.MENTION_AVATARS
import app.fakh.patches.github.shared.Constants.TAB_WIDTH
import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import java.io.File

private const val VIEWER = "Lapp/fakh/extension/github/DiagramViewer;"

private const val MARKDOWN_SETTINGS = "Lapp/fakh/extension/github/MarkdownSettings;"

/** The constructor of the WebView that renders READMEs, bodies and comments. */
private object MarkdownViewFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf("/android_asset/", "native"),
)

/**
 * Hands each new markdown WebView to an extension method, right after the app adds its own JavaScript bridge and so
 * before the page loads.
 *
 * @param method The smali reference of a static method that takes the `WebView`.
 */
internal fun withMarkdownView(method: String) {
    val view = MarkdownViewFingerprint.method
    val instructions = view.implementation!!.instructions.toList()
    val bridgeAt = instructions.indexOfFirst { it.method?.name == "addJavascriptInterface" }
    if (bridgeAt < 0) throw PatchException("GitHub: the markdown view's JavaScript bridge not found")
    val self = (instructions[bridgeAt] as? FiveRegisterInstruction)?.registerC
        ?: (instructions[bridgeAt] as RegisterRangeInstruction).startRegister
    view.addInstructions(bridgeAt + 1, "invoke-static/range { v$self .. v$self }, $method(Landroid/webkit/WebView;)V")
}

/**
 * Appends [text] to one of the files of the WebView that renders READMEs, issue and pull request bodies and comments.
 *
 * @param file `assets/webview/markdown.css` or `assets/webview/markdown.js`.
 * @param text The CSS rules or the script to add after the app's own.
 */
internal fun appendToMarkdownView(file: File, text: String) {
    if (!file.exists()) throw PatchException("GitHub: ${file.name} not found in assets/webview")
    file.appendText("\n/* Fakh Patches */\n${text.trimIndent()}\n")
}

/** Lets the scripts of the markdown page ask which switches are on, through `window.fakhSettings`. */
private val markdownSettingsPatch = patch {
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        withMarkdownView("$MARKDOWN_SETTINGS->attach")
    }
}

/** [body], run only while the switch of [feature] is on. */
private fun whileOn(feature: Feature, body: String) =
    "if (window.fakhSettings.on('${feature.id}')) {\n${body.trimIndent().prependIndent("  ")}\n}"

/**
 * Runs [body] after the WebView loads each piece of content, by wrapping `GitHub.prototype._didLoad`, which
 * `markdown.js` calls once the HTML is in the page and before it reports the height to the app.
 */
internal fun afterLoad(body: String) = """
    ;(() => {
      const didLoad = GitHub.prototype._didLoad
      GitHub.prototype._didLoad = function () {
        try {
    ${body.trimIndent().prependIndent("        ")}
        } catch (e) {}
        didLoad.call(this)
      }
    })()
"""

@Suppress("unused")
val mermaidDiagramsPatch = patch(
    name = "Mermaid diagrams",
    description = "Draws Mermaid diagrams in place of their code. Tap a diagram to open it full screen and pinch " +
        "to zoom.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(markdownSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(MERMAID)

        // The page asks for the full screen viewer through its own bridge, added before the page loads.
        withMarkdownView("$VIEWER->attach")

        // The library ships inside the app, so a diagram needs no request to another server. It is loaded only by a
        // body that has a diagram.
        val library = object {}.javaClass.getResourceAsStream("/github/mermaid.min.js")?.use { it.readBytes() }
            ?: throw PatchException("GitHub: the bundled Mermaid library is missing")
        val css = resourceFile("assets/webview/markdown.css")
        css.resolveSibling("mermaid.min.js").writeBytes(library)
        appendToMarkdownView(
            css,
            """
                .markdown-body .fakh-mermaid { margin-bottom: 16px; }
                .markdown-body .fakh-mermaid svg { display: block; margin: 0 auto; height: auto; }
            """,
        )
        // The code stays when a diagram cannot be drawn, without the spinner GitHub's page would remove.
        appendToMarkdownView(
            resourceFile("assets/webview/markdown.js"),
            afterLoad(
                whileOn(
                    MERMAID,
                    """
                    const sources = document.querySelectorAll(
                      '#content pre[lang="mermaid"], #content .highlight-source-mermaid pre')
                    if (sources.length > 0) {
                      window.fakhMermaid = window.fakhMermaid || new Promise((resolve, reject) => {
                        const script = document.createElement('script')
                        script.src = 'mermaid.min.js'
                        script.onload = () => {
                          // Strict: the text comes from other people, and this page can send messages to the app.
                          window.mermaid.initialize({
                            startOnLoad: false,
                            securityLevel: 'strict',
                            suppressErrorRendering: true,
                            theme: document.documentElement.dataset.colorMode === 'dark' ? 'dark' : 'default'
                          })
                          resolve(window.mermaid)
                        }
                        script.onerror = reject
                        document.head.appendChild(script)
                      })
                      const draw = async (pre) => {
                        const block = pre.closest('section[data-type="mermaid"], .highlight-source-mermaid') || pre
                        try {
                          const mermaid = await window.fakhMermaid
                          window.fakhDiagrams = (window.fakhDiagrams || 0) + 1
                          const { svg } = await mermaid.render('fakh-mermaid-' + window.fakhDiagrams, pre.textContent)
                          const diagram = document.createElement('div')
                          diagram.className = 'fakh-mermaid'
                          diagram.innerHTML = svg
                          diagram.addEventListener('click', (event) => {
                            // A link in the diagram keeps its own tap.
                            if (event.target.closest('a')) return
                            window.fakhDiagram.open(diagram.innerHTML,
                              document.documentElement.dataset.colorMode === 'dark')
                          })
                          // The button that Collapse long code blocks puts after a long block.
                          const button = block.nextElementSibling
                          if (button && button.classList.contains('fakh-unfold')) button.remove()
                          block.replaceWith(diagram)
                        } catch (e) {
                          const spinner = block.querySelector('.js-render-enrichment-loader')
                          if (spinner) spinner.remove()
                        }
                      }
                      sources.forEach(draw)
                    }
                """,
                ),
            ),
        )
    }
}

@Suppress("unused")
val tabWidthPatch = patch(
    name = "Tab width",
    description = "Shows tabs in code blocks as 2, 4 or 8 spaces wide. The app uses 8. The option is the width until " +
        "another is picked in Fakh Patches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(markdownSettingsPatch)

    val width = intOption(
        key = "width",
        default = 4,
        values = listOf(2, 4, 8).associateBy { "$it spaces" },
        title = "Width",
        description = "How many spaces a tab takes in code blocks.",
        required = true,
    ) { value -> value in listOf(2, 4, 8) }

    execute {
        register(TAB_WIDTH)
        mutableClassDefBy(MARKDOWN_SETTINGS).methods.first { it.name == "defaultTabWidth" }.addInstructions(
            0,
            """
                const/4 v0, ${width.value}
                return v0
            """,
        )
        appendToMarkdownView(
            resourceFile("assets/webview/markdown.css"),
            """
                .markdown-body pre, .markdown-body code {
                  tab-size: var(--fakh-tab, 8);
                  -moz-tab-size: var(--fakh-tab, 8);
                }
            """,
        )
        appendToMarkdownView(
            resourceFile("assets/webview/markdown.js"),
            afterLoad("document.documentElement.style.setProperty('--fakh-tab', window.fakhSettings.tabWidth())"),
        )
    }
}

@Suppress("unused")
val collapseLongCodeBlocksPatch = patch(
    name = "Collapse long code blocks",
    description = "Folds code blocks longer than 25 lines to their first 20, with a button that shows all of them.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(markdownSettingsPatch)

    execute {
        register(COLLAPSE_CODE)

        // The WebView is as tall as its content and sits in a scrolling list, so a code block with its own vertical
        // scroll never gets the swipe. Folding it keeps the list short and a tap opens it in place.
        appendToMarkdownView(
            resourceFile("assets/webview/markdown.css"),
            """
                .markdown-body pre.fakh-folded {
                  max-height: calc(20 * 1.45em + 32px);
                  overflow-y: hidden;
                  -webkit-mask-image: linear-gradient(to bottom, #000 70%, transparent);
                  mask-image: linear-gradient(to bottom, #000 70%, transparent);
                }
                .markdown-body .fakh-unfold {
                  display: block;
                  box-sizing: border-box;
                  width: 100%;
                  text-align: center;
                  margin: -12px 0 16px;
                  padding: 8px;
                  font: inherit;
                  font-size: 85%;
                  color: var(--link);
                  background: transparent;
                  border: 1px solid var(--border);
                  border-radius: 6px;
                }
            """,
        )
        appendToMarkdownView(
            resourceFile("assets/webview/markdown.js"),
            afterLoad(
                whileOn(
                    COLLAPSE_CODE,
                    """
                    for (const pre of document.querySelectorAll('#content pre')) {
                      const lines = pre.textContent.replace(/\n$/, '').split('\n').length
                      if (lines <= 25 || pre.classList.contains('fakh-folded')) continue
                      pre.classList.add('fakh-folded')
                      // Not a <button>: removing a focused element makes the app scroll back to the top of the body.
                      const button = document.createElement('div')
                      button.className = 'fakh-unfold'
                      button.setAttribute('role', 'button')
                      button.textContent = 'Show all ' + lines + ' lines'
                      button.addEventListener('click', () => {
                        pre.classList.remove('fakh-folded')
                        button.remove()
                      })
                      pre.after(button)
                    }
                """,
                ),
            ),
        )
    }
}

@Suppress("unused")
val shortenLinksPatch = patch(
    name = "Shorten links",
    description = "Shows pasted links in comments and READMEs as short references, such as owner/repo#123.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(markdownSettingsPatch)

    execute {
        register(SHORTEN_LINKS)

        // Only links whose text is their own address are rewritten; a link with its own text stays as written.
        // The address itself is not touched, so tapping it opens the same page.
        appendToMarkdownView(
            resourceFile("assets/webview/markdown.js"),
            afterLoad(
                whileOn(
                    SHORTEN_LINKS,
                    """
                    const reserved = new Set(['about', 'apps', 'collections', 'explore', 'features', 'marketplace',
                      'new', 'notifications', 'orgs', 'organizations', 'pricing', 'search', 'settings', 'sponsors',
                      'topics', 'trending', 'users'])
                    const sha = (ref) => /^[0-9a-f]{40}$/.test(ref) ? ref.slice(0, 7) : ref
                    const shorten = (href) => {
                      const url = new URL(href)
                      if (url.protocol !== 'https:' && url.protocol !== 'http:') return null
                      const host = url.hostname.replace(/^www\./, '')
                      const path = decodeURIComponent(url.pathname).replace(/\/$/, '')
                      const plain = host + path + url.search + url.hash
                      if (host !== 'github.com') return plain
                      const [owner, repo, type, ...rest] = path.split('/').slice(1)
                      if (!owner || reserved.has(owner)) return plain
                      if (!repo) return url.search || url.hash ? plain : '@' + owner
                      const slug = owner + '/' + repo
                      if (!type) return url.search || url.hash ? plain : slug
                      const comment = url.hash ? ' (comment)' : ''
                      if (['issues', 'pull', 'discussions'].includes(type) && /^\d+$/.test(rest[0] || '')) {
                        const tab = rest.length > 1 ? ' (' + rest.slice(1).join('/') + ')' : ''
                        return slug + '#' + rest[0] + (tab || comment)
                      }
                      if (type === 'commit' && rest.length === 1) return slug + '@' + sha(rest[0]) + comment
                      if (type === 'releases' && rest[0] === 'tag' && rest.length === 2) return slug + '@' + rest[1]
                      if (type === 'compare' && rest.length === 1) return slug + '@' + rest[0]
                      if ((type === 'blob' || type === 'tree') && rest.length >= 1) {
                        const file = rest.slice(1).join('/')
                        return slug + (file ? '/' + file : '') + '@' + sha(rest[0]) + (url.hash.startsWith('#L') ? url.hash : '')
                      }
                      return plain
                    }
                    for (const link of document.querySelectorAll('#content a[href]')) {
                      if (link.childElementCount > 0) continue
                      const text = link.textContent.trim()
                      if (text !== link.href && text !== link.getAttribute('href') && text + '/' !== link.href) continue
                      try {
                        const short = shorten(link.href)
                        if (short) link.textContent = short
                      } catch (e) {}
                    }
                """,
                ),
            ),
        )
    }
}

@Suppress("unused")
val mentionAvatarsPatch = patch(
    name = "Mention avatars",
    description = "Shows a small avatar before each @mention in comments, descriptions and READMEs.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(markdownSettingsPatch)

    execute {
        register(MENTION_AVATARS)

        // The size is fixed, so the text does not move when an avatar arrives.
        appendToMarkdownView(
            resourceFile("assets/webview/markdown.css"),
            """
                .markdown-body img.fakh-avatar {
                  width: 1.15em;
                  height: 1.15em;
                  margin-right: 0.2em;
                  vertical-align: -0.2em;
                  border-radius: 50%;
                }
            """,
        )
        appendToMarkdownView(
            resourceFile("assets/webview/markdown.js"),
            afterLoad(
                whileOn(
                    MENTION_AVATARS,
                    """
                    for (const mention of document.querySelectorAll('#content a.user-mention[href]')) {
                      // A person or organization links to /name. Apps and teams have longer paths and no avatar there.
                      const [, name, rest] = new URL(mention.href).pathname.split('/')
                      if (!name || rest || mention.querySelector('.fakh-avatar')) continue
                      const avatar = document.createElement('img')
                      avatar.className = 'fakh-avatar'
                      avatar.alt = ''
                      avatar.addEventListener('error', () => avatar.remove())
                      avatar.src = 'https://github.com/' + name + '.png?size=64'
                      mention.prepend(avatar)
                    }
                """,
                ),
            ),
        )
    }
}
