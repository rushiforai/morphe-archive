// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches

import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue
import kotlin.test.fail

/**
 * The README's app table and each app's page in docs/morphe/ state facts the bundle holds; this keeps them equal. Only
 * the table's Morphe column is this bundle's: the other ecosystem's build checks its own.
 */
class ReadmeTest {
    private val patches = Bundle.patches
    private val readmeFile = File(System.getProperty("readme.file"))
    private val readme = readmeFile.readLines()

    /** This bundle's column in the README's app table, and its directory of app pages. */
    private val column = "Morphe"
    private val docs = "docs/morphe"

    private data class App(val name: String, val pkg: String, val count: Int, val page: File)

    private data class Row(val name: String, val description: String, val default: Boolean)

    /**
     * The header and rows of the first table after the line [heading], within [lines], cells trimmed, once a separator
     * row follows its header (else GitHub doesn't render a table). Cells are split on " | ", so none may hold a pipe.
     */
    private fun table(heading: String, lines: List<String>): Pair<List<String>, List<List<String>>> {
        val start = lines.indexOf(heading).takeIf { it >= 0 } ?: fail("No \"$heading\" where expected")
        val rows =
            lines.drop(start + 1)
                .takeWhile { !it.startsWith("#") || it.startsWith("|") }
                .dropWhile { !it.startsWith("|") }
                .takeWhile { it.startsWith("|") }
                .map { line -> line to line.trim().removePrefix("|").removeSuffix("|").split(" | ").map { it.trim() } }
        val header = rows.firstOrNull()?.second ?: fail("No table under \"$heading\"")
        if (rows.getOrNull(1)?.second?.let { cells -> cells.size == header.size && cells.all { it.matches(Regex(":?-{3,}:?")) } } != true) {
            fail("The table under \"$heading\" needs a separator row after its header")
        }
        return header to rows.drop(2).map { (line, cells) ->
            cells.takeIf { it.size == header.size } ?: fail("Table row under \"$heading\" needs ${header.size} cells: $line")
        }
    }

    /** The rows of the table under [heading], once its header is exactly [header]. */
    private fun table(heading: String, header: List<String>, lines: List<String>): List<List<String>> {
        val (actual, rows) = table(heading, lines)
        if (actual != header) fail("The table under \"$heading\" must start with the header $header")
        return rows
    }

    /** The backticked values of a cell that holds nothing else: `a` or `a`, `b`. */
    private fun code(cell: String): List<String> {
        if (!cell.matches(Regex("`[^`]+`(, `[^`]+`)*"))) fail("Cell must be backticked values separated by \", \": $cell")
        return Regex("`([^`]+)`").findAll(cell).map { it.groupValues[1] }.toList()
            .also { if (it.distinct().size != it.size) fail("Cell lists a value twice: $cell") }
    }

    // Lazy, so a malformed table fails the test that reads it with its message, not the class's construction.
    private val rows by lazy {
        val (header, rows) = table("## Supported apps", readme)
        val columns = listOf("App", "Package", column).associateWith { name ->
            header.indexOf(name).takeIf { it >= 0 } ?: fail("Supported apps has no \"$name\" column: $header")
        }
        rows.map { cells -> columns.mapValues { (_, index) -> cells[index] } }
    }

    /** The apps this bundle's column links: the others have "—". */
    private val apps by lazy {
        rows.mapNotNull { row ->
            val name = row.getValue("App")
            val pkg = code(row.getValue("Package")).singleOrNull() ?: fail("$name: Package cell needs one `package`")
            val cell = row.getValue(column)
            if (cell == "—") return@mapNotNull null
            val link = Regex("""^\[(\d+) (patch|patches)]\(($docs/[a-z0-9]+\.md)\)$""").find(cell)
                ?: fail("$name: $column must be \"—\" or a link \"[N patches]($docs/<app>.md)\", not \"$cell\"")
            val (count, noun, path) = link.destructured
            if ((noun == "patch") != (count == "1")) fail("$name: \"$count $noun\" in $column")
            val page = readmeFile.resolveSibling(path).takeIf { it.isFile } ?: fail("$name links to $path, which doesn't exist")
            App(name, pkg, count.toInt(), page)
        }
    }

    /** The lines of the app's page, once it is titled with the app's name. */
    private fun pageOf(app: App): List<String> = app.page.readLines().also { if (it.firstOrNull() != "# ${app.name}") fail("${app.page.name} must start with \"# ${app.name}\"") }

    private fun patchesOf(app: App) = patches.filter { patch -> patch.compatibility.orEmpty().any { it.packageName == app.pkg } }

    @Test
    fun `the apps table lists every app, each with its own page and patch count`() {
        assertEquals(rows.map { it.getValue("Package") }.distinct().size, rows.size, "Supported apps lists an app twice")
        assertEquals(apps.map { it.page.canonicalFile }.distinct().size, apps.size, "Supported apps links a page twice")
        val packages = patches.flatMap { it.compatibility.orEmpty() }.map { it.packageName }.toSet()
        assertEquals(packages, apps.map { it.pkg }.toSet(), "Apps $column links in Supported apps")
        for (app in apps) {
            assertEquals(patchesOf(app).size, app.count, "${app.name}: number of patches")
            val names = patches.flatMap { it.compatibility.orEmpty() }.filter { it.packageName == app.pkg }.map { it.name }.toSet()
            assertEquals(setOf(app.name), names, "${app.name}: the app's name in the patches' Compatibility")
        }
        val pages = readmeFile.resolveSibling(docs).listFiles { file -> file.extension == "md" }.orEmpty().map { it.canonicalFile }.toSet()
        assertEquals(pages, apps.map { it.page.canonicalFile }.toSet(), "Pages in $docs/ the README doesn't link, or the reverse")
    }

    @Test
    fun `each app's page names the versions its patches were tested on`() {
        for (app in apps) {
            val rows = table("## Tested version", listOf("Package", "Tested version"), pageOf(app))
            val (pkg, versions) = rows.singleOrNull() ?: fail("${app.name}: Tested version needs one row")
            assertEquals(app.pkg, code(pkg).singleOrNull(), "${app.name}: Tested version package")
            val bundle = patchesOf(app).flatMap { patch -> patch.compatibility.orEmpty().filter { it.packageName == app.pkg } }
            assertEquals(bundle.flatMap { it.targets }.map { it.version }.toSet(), code(versions).toSet(), "${app.name}: tested versions")
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
            val bundle = patchesOf(app).map { Row(it.name!!, it.description.orEmpty(), it.default) }
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
