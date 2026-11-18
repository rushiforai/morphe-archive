// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches

import app.revanced.patcher.patch.Patch
import app.revanced.patcher.patch.loadPatches
import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue
import kotlin.test.fail

/**
 * The README's app table, in its ReVanced column, and each app's page in docs/revanced/ state facts the bundle holds;
 * this keeps them equal. Other columns and docs/ folders belong to other bundles.
 */
class ReadmeTest {
    private val column = "ReVanced"
    private val docs = "docs/revanced"

    private val patches: Set<Patch> =
        loadPatches(File(System.getProperty("patches.bundle"))) { file, error ->
            throw AssertionError("Couldn't load patches from $file", error)
        }
    private val readmeFile = File(System.getProperty("readme.file"))
    private val readme = readmeFile.readLines()

    private data class App(val name: String, val pkg: String, val count: Int, val page: File)

    private data class Row(val name: String, val description: String, val default: Boolean)

    /**
     * Rows of the first table after the line [heading], within [lines], cells trimmed, once its header row passes
     * [header] and a separator row follows (else GitHub doesn't render a table). Cells are split on " | ", so none may
     * hold a pipe. The header row comes first.
     */
    private fun table(heading: String, lines: List<String>, header: (List<String>) -> Boolean): List<List<String>> {
        val start = lines.indexOf(heading).takeIf { it >= 0 } ?: fail("No \"$heading\" where expected")
        val rows =
            lines.drop(start + 1)
                .takeWhile { !it.startsWith("#") || it.startsWith("|") }
                .dropWhile { !it.startsWith("|") }
                .takeWhile { it.startsWith("|") }
                .map { line -> line to line.trim().removePrefix("|").removeSuffix("|").split(" | ").map { it.trim() } }
        val head = rows.firstOrNull()?.second ?: fail("No table under \"$heading\"")
        if (!header(head)) fail("The table under \"$heading\" has an unexpected header: $head")
        if (rows.getOrNull(1)?.second?.let { cells -> cells.size == head.size && cells.all { it.matches(Regex(":?-{3,}:?")) } } != true) {
            fail("The table under \"$heading\" needs a separator row after its header")
        }
        return listOf(head) + rows.drop(2).map { (line, cells) ->
            cells.takeIf { it.size == head.size } ?: fail("Table row under \"$heading\" needs ${head.size} cells: $line")
        }
    }

    /** Rows of a table whose header is exactly [header], without the header. */
    private fun table(heading: String, header: List<String>, lines: List<String>): List<List<String>> = table(heading, lines) { it == header }.drop(1)

    /** The backticked values of a cell that holds nothing else: `a` or `a`, `b`. */
    private fun code(cell: String): List<String> {
        if (!cell.matches(Regex("`[^`]+`(, `[^`]+`)*"))) fail("Cell must be backticked values separated by \", \": $cell")
        return Regex("`([^`]+)`").findAll(cell).map { it.groupValues[1] }.toList()
            .also { if (it.distinct().size != it.size) fail("Cell lists a value twice: $cell") }
    }

    // Lazy, so a malformed table fails the test that reads it with its message, not the class's construction.
    // A cell in this bundle's column is "—" for an app it doesn't patch, else "[N patches](docs/revanced/<app>.md)".
    private val apps by lazy {
        val rows = table("## Supported apps", readme) { it.take(2) == listOf("App", "Package") && column in it }
        val at = rows.first().indexOf(column)
        rows.drop(1).filter { it[at] != "—" }.map { row ->
            val (name, pkg) = row
            val link = Regex("""^\[(\d+) (patch|patches)]\(($docs/[a-z0-9]+\.md)\)$""").find(row[at])
                ?: fail("$name: the $column cell must be — or a link like [2 patches]($docs/<app>.md), not ${row[at]}")
            val (count, noun, path) = link.destructured
            if ((count == "1") != (noun == "patch")) fail("$name: write \"1 patch\" or \"N patches\", not \"$count $noun\"")
            val page = readmeFile.resolveSibling(path).takeIf { it.isFile } ?: fail("$name links to $path, which doesn't exist")
            App(name, code(pkg).singleOrNull() ?: fail("Package cell needs one `package`: $pkg"), count.toInt(), page)
        }
    }

    /** The lines of the app's page, once it is titled with the app's name. */
    private fun pageOf(app: App): List<String> = app.page.readLines().also { if (it.firstOrNull() != "# ${app.name}") fail("${app.page.name} must start with \"# ${app.name}\"") }

    private fun patchesOf(app: App) = patches.filter { patch -> patch.compatiblePackages.orEmpty().any { it.first == app.pkg } }

    @Test
    fun `the apps table lists every app, each with its own page and patch count`() {
        val packages = patches.flatMap { it.compatiblePackages.orEmpty() }.map { it.first }.toSet()
        assertEquals(apps.map { it.pkg }.distinct().size, apps.size, "Supported apps lists an app twice")
        assertEquals(apps.map { it.page }.distinct().size, apps.size, "Supported apps links a page twice")
        assertEquals(packages, apps.map { it.pkg }.toSet(), "Supported apps packages")
        for (app in apps) assertEquals(patchesOf(app).size, app.count, "${app.name}: Patches count")
        val pages = readmeFile.resolveSibling(docs).listFiles { file -> file.extension == "md" }.orEmpty().map { it.canonicalFile }.toSet()
        assertEquals(pages, apps.map { it.page.canonicalFile }.toSet(), "Pages in $docs/ the README doesn't link, or the reverse")
    }

    @Test
    fun `each app's page names the versions its patches were tested on`() {
        for (app in apps) {
            val rows = table("## Tested version", listOf("Package", "Tested version"), pageOf(app))
            val (pkg, versions) = rows.singleOrNull() ?: fail("${app.name}: Tested version needs one row")
            assertEquals(app.pkg, code(pkg).singleOrNull(), "${app.name}: Tested version package")
            val bundle = patchesOf(app).flatMap { patch -> patch.compatiblePackages.orEmpty().filter { it.first == app.pkg } }
            assertEquals(bundle.flatMap { it.second.orEmpty() }.toSet(), code(versions).toSet(), "${app.name}: tested versions")
        }
    }

    @Test
    fun `each app's patch table matches its patches`() {
        for (app in apps) {
            val rows =
                table("## Patches", listOf("Patch", "What it does", "Default"), pageOf(app)).map { (name, description, default) ->
                    Row(
                        name,
                        description,
                        when (default) {
                            "On" -> true
                            "Off" -> false
                            else -> fail("${app.name}: Default must be On or Off, not \"$default\" ($name)")
                        },
                    )
                }
            val bundle = patchesOf(app).map { Row(it.name!!, it.description.orEmpty(), it.use) }
            assertEquals(bundle.size, rows.size, "${app.name}: one row per patch")
            assertEquals(bundle.toSet(), rows.toSet(), "${app.name}: patch table")
        }
    }

    @Test
    fun `each app's options are named on its page`() {
        for (app in apps) {
            val text = pageOf(app).joinToString("\n")
            val missing = patchesOf(app).flatMap { it.options.values.map { option -> option.name } }.filter { "`$it`" !in text }
            assertTrue(missing.isEmpty(), "${app.name}: options not named in backticks on its page: $missing")
        }
    }
}
