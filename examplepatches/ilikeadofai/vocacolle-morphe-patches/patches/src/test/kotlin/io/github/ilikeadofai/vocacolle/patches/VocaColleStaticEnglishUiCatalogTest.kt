package io.github.ilikeadofai.vocacolle.patches

import java.nio.file.Files
import java.nio.file.Path
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue
import org.w3c.dom.Element

class VocaColleStaticEnglishUiCatalogTest {
    @Test
    fun `ships every reviewed English static UI resource with structure preserved`() {
        val rows = catalogRows()

        assertEquals(1619, rows.size)
        assertEquals(1606, rows.count { it.getValue("resource_type") == "string" })
        assertEquals(rows.size, rows.map(::identity).toSet().size)
        assertEquals(1117, rows.count { it.getValue("en_status") == "machine_verified" })
        assertEquals(502, rows.count { it.getValue("en_status") == "source_verified" })
        assertFalse(rows.any { it.getValue("key") == "app_name" })

        rows.forEach { row ->
            val source = catalogText(row.getValue("source"))
            val target = catalogText(row.getValue("en"))
            assertTrue(target.isNotBlank(), identity(row))
            assertEquals(tokens(source), tokens(target), identity(row))
            assertEquals(source.count { it == '\n' }, target.count { it == '\n' }, identity(row))
            assertFalse(JAPANESE_LEAKAGE.containsMatchIn(target), identity(row))
            assertTrue(row.getValue("en_status") in INCLUDED_STATUSES, identity(row))
        }

        val children = RESOURCE_FILES.flatMap { fileName ->
            val stream = requireNotNull(
                javaClass.classLoader.getResourceAsStream("vocacolle/values-en/$fileName")
            )
            val document = stream.use { secureDocumentBuilderFactory().newDocumentBuilder().parse(it) }
            childElements(document.documentElement)
        }

        val stringRows = rows.filter { it.getValue("resource_type") == "string" }
        val stringElements = children.filter { it.tagName == "string" }
        assertEquals(1606, stringElements.size)
        val actualStrings = stringElements.associate { element ->
            element.getAttribute("name") to androidUnescape(element.textContent)
        }
        val expectedStrings = stringRows.associate { row ->
            row.getValue("key") to catalogText(row.getValue("en"))
        }
        assertEquals(expectedStrings, actualStrings)

        val styledRows = stringRows.filter { it.getValue("en_markup").isNotEmpty() }
        assertEquals(6, styledRows.size)
        styledRows.forEach { row ->
            val element = stringElements.single { it.getAttribute("name") == row.getValue("key") }
            val tags = childElements(element).map { it.tagName }
            assertEquals(listOf("b"), tags, row.getValue("key"))
        }

        val expectedPlurals = rows.filter { it.getValue("resource_type") == "plurals" }
            .groupBy { it.getValue("key") }
            .mapValues { (_, items) ->
                items.associate {
                    it.getValue("item_qualifier") to catalogText(it.getValue("en"))
                }
            }
        val actualPlurals = children.filter { it.tagName == "plurals" }.associate { plural ->
            plural.getAttribute("name") to childElements(plural).associate { item ->
                item.getAttribute("quantity") to androidUnescape(item.textContent)
            }
        }
        assertEquals(3, actualPlurals.size)
        assertEquals(expectedPlurals, actualPlurals)

        val expectedArrays = rows.filter { it.getValue("resource_type") == "string-array" }
            .groupBy { it.getValue("key") }
            .mapValues { (_, items) ->
                items.sortedBy { it.getValue("item_qualifier").toInt() }
                    .map { catalogText(it.getValue("en")) }
            }
        val actualArrays = children.filter { it.tagName == "string-array" }.associate { array ->
            array.getAttribute("name") to childElements(array).map { androidUnescape(it.textContent) }
        }
        assertEquals(1, actualArrays.size)
        assertEquals(expectedArrays, actualArrays)
    }

    private fun catalogRows(): List<Map<String, String>> {
        val records = parseCsv(
            Files.readString(Path.of(System.getProperty("vocacolle.englishTranslationCatalog")))
        )
        val header = records.first()
        return records.drop(1).map { values -> header.zip(values).toMap() }
    }

    private fun identity(row: Map<String, String>) = listOf(
        row.getValue("resource_type"),
        row.getValue("key"),
        row.getValue("item_qualifier")
    ).joinToString(":")

    private fun catalogText(value: String) = value.replace("\\n", "\n").replace("\\t", "\t")

    private fun tokens(value: String) = FORMAT_TOKEN.findAll(value).map { it.value }.toList()

    private fun childElements(element: Element) = (0 until element.childNodes.length)
        .map { element.childNodes.item(it) }
        .filterIsInstance<Element>()

    private fun secureDocumentBuilderFactory() = DocumentBuilderFactory.newInstance().apply {
        setFeature("http://apache.org/xml/features/disallow-doctype-decl", true)
        setFeature("http://xml.org/sax/features/external-general-entities", false)
        setFeature("http://xml.org/sax/features/external-parameter-entities", false)
        isExpandEntityReferences = false
    }

    private fun androidUnescape(value: String): String {
        val output = StringBuilder()
        var index = 0
        while (index < value.length) {
            if (value[index] != '\\' || index + 1 >= value.length) {
                output.append(value[index++])
                continue
            }
            when (val escaped = value[index + 1]) {
                'n' -> output.append('\n')
                't' -> output.append('\t')
                '\\', '\'', '"', '@', '?' -> output.append(escaped)
                'u' -> {
                    val end = index + 6
                    require(end <= value.length) { "Truncated unicode escape" }
                    output.append(value.substring(index + 2, end).toInt(16).toChar())
                    index += 4
                }
                else -> output.append(escaped)
            }
            index += 2
        }
        return output.toString()
    }

    private fun parseCsv(text: String): List<List<String>> {
        val rows = mutableListOf<MutableList<String>>()
        var row = mutableListOf<String>()
        val field = StringBuilder()
        var quoted = false
        var index = 0
        while (index < text.length) {
            val char = text[index]
            when {
                char == '"' && quoted && index + 1 < text.length && text[index + 1] == '"' -> {
                    field.append('"')
                    index++
                }
                char == '"' -> quoted = !quoted
                char == ',' && !quoted -> {
                    row += field.toString()
                    field.clear()
                }
                char == '\n' && !quoted -> {
                    row += field.toString().removeSuffix("\r")
                    field.clear()
                    if (row.any { it.isNotEmpty() }) rows += row
                    row = mutableListOf()
                }
                else -> field.append(char)
            }
            index++
        }
        if (field.isNotEmpty() || row.isNotEmpty()) {
            row += field.toString()
            rows += row
        }
        require(rows.isNotEmpty()) { "Translation catalog is empty" }
        require(rows.all { it.size == rows.first().size }) { "Malformed CSV row" }
        return rows
    }

    private companion object {
        val RESOURCE_FILES = listOf("strings.xml", "plurals.xml", "arrays.xml")
        val INCLUDED_STATUSES = setOf("source_verified", "machine_verified")
        val JAPANESE_LEAKAGE = Regex("[ぁ-んァ-ヿｦ-ﾟ々〆ヵヶ]")
        val FORMAT_TOKEN = Regex("%(?:\\d+\\$)?[-#+ 0,(<]*\\d*(?:\\.\\d+)?(?:[tT][a-zA-Z]|[a-zA-Z%])")
    }
}
