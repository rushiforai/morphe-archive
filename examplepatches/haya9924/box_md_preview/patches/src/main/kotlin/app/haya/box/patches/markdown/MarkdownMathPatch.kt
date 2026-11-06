/*
 * Box patches.
 *
 * GPLv3.
 */

package app.haya.box.patches.markdown

import app.haya.box.patches.shared.Constants.COMPATIBILITY_BOX
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.inputStreamFromBundledResource
import java.io.File

/** Directory of this patch's files inside the patch bundle. */
private const val BUNDLED_DIRECTORY = "boxmarkdown"

/**
 * Box renders Markdown previews with Showdown inside a WebView:
 * `CodePreviewLoader.loadMarkdownPage()` loads `assets/showdown/index.html` and
 * `MarkDownPreviewWebViewClient.onPageFinished()` then evaluates
 * `renderMarkdownContent(markdown, lockSelection)`. Replacing that page and
 * adding MathJax next to it is enough: no code of the app has to be patched.
 */
private const val PREVIEW_PAGE = "assets/showdown/index.html"

/** Text that must be present in the page before this patch touches it. */
private const val PREVIEW_PAGE_MARKER = "renderMarkdownContent"

/** Where the preview page loads its scripts from, relative to the asset root. */
private const val MATH_ASSET_DIRECTORY = "assets/showdown/math"

private val MATH_ASSETS = listOf(
    "tex-svg.js",
    "math-preview.js",
    "MathJax-LICENSE.txt",
)

/** Reads a file that is bundled inside this patch. */
private fun bundledFile(name: String): ByteArray =
    checkNotNull(inputStreamFromBundledResource(BUNDLED_DIRECTORY, name)) {
        "Bundled file is missing from the patch: $name"
    }.use { it.readBytes() }

private fun bundledText(name: String): String = bundledFile(name).toString(Charsets.UTF_8)

/** Writes a bundled file into the APK, adding it when it does not exist yet. */
private fun addAsset(target: File, name: String) {
    target.parentFile?.mkdirs()
    target.writeBytes(bundledFile(name))
}

@Suppress("unused")
val markdownMathPatch = resourcePatch(
    name = "Markdown math preview",
    description = "Renders TeX math in Markdown previews, like Obsidian does.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BOX)

    execute {
        val page = get(PREVIEW_PAGE)
        val originalPage = page.readText()

        // Fail with a readable message instead of producing a broken preview
        // when a future Box version changes its Markdown viewer.
        check(PREVIEW_PAGE_MARKER in originalPage) {
            "$PREVIEW_PAGE does not look like Box's Markdown preview page. " +
                "This Box version is not supported by this patch."
        }

        MATH_ASSETS.forEach { name ->
            addAsset(get("$MATH_ASSET_DIRECTORY/$name", copy = false), name)
        }

        page.writeText(bundledText("index.html"))
    }
}
