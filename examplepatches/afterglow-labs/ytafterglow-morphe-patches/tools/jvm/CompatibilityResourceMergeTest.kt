package app.afterglow.patches.compat.morphe

import app.morphe.patcher.util.Document
import com.reandroid.arsc.coder.xml.XmlEncodeUtil
import java.io.File
import java.io.InputStream
import org.w3c.dom.Element

private var checks = 0
private fun verify(value: Boolean, message: String) {
    checks++
    check(value) { message }
}

// Public JVM constructors are Kotlin-internal; use them only in this regression harness.
private fun parse(input: InputStream) = Document::class.java.getConstructor(InputStream::class.java).newInstance(input)
private fun parse(xml: String) = parse(xml.byteInputStream())
private fun writable(file: File) = Document::class.java.getConstructor(File::class.java).newInstance(file)
private fun entries(document: Document): List<Element> = document.documentElement.childNodes.let { nodes ->
    (0 until nodes.length).mapNotNull { nodes.item(it) as? Element }
}
private fun rejected(message: String, action: () -> Unit) {
    checks++
    try {
        action()
    } catch (_: IllegalArgumentException) {
        return
    } catch (_: IllegalStateException) {
        return
    }
    error(message)
}

fun main(args: Array<String>) {
    val scratch = File(args[1])
    val stringsPath = "res/values/strings.xml"
    val arraysPath = "res/values/arrays.xml"
    verify(XmlEncodeUtil.getTypeFromValuesXml(File(stringsPath)) == "string", "Native string type")
    verify(XmlEncodeUtil.getTypeFromValuesXml(File(arraysPath)) == "array", "Native array type")
    verify(XmlEncodeUtil.getTypeFromValuesXml(File("afterglow_compatibility.xml")) ==
        "afterglow_compatibility", "Regression must exercise the failed custom filename")

    val source = parse("""<resources>
        <string name="shared">A &amp; B</string>
        <string name="styled" translatable="false">Keep <b>bold</b> text</string>
        <string-array name="shared"><item>A</item><item>B</item></string-array>
        <integer-array name="counts"><item>7</item><item>9</item></integer-array>
        <array name="typed"><item>@string/shared</item><item type="integer">7</item></array>
    </resources>""")
    val groups = compatibilityValueGroups(source)
    verify(groups.keys == setOf(stringsPath, arraysPath), "Canonical files only")
    verify(groups.getValue(stringsPath).size == 2, "String group")
    verify(groups.getValue(arraysPath).size == 3, "Mixed array tags use one namespace")
    for ((path, values) in groups) {
        val file = File(scratch, path).apply { parentFile.mkdirs(); writeText("<resources/>") }
        writable(file).use { target ->
            mergeCompatibilityValues(target, values, path)
            mergeCompatibilityValues(target, values, path)
            verify(entries(target).size == values.size, "Identical values are not duplicated")
            verify(entries(target).zip(values).all { (actual, expected) -> actual.isEqualNode(expected) },
                "Preserve values, attributes, markup and array item types")
        }
        file.inputStream().use { parse(it) }.use { reopened ->
            verify(entries(reopened).map { it.tagName } == values.map { it.tagName }, "Preserve array tags on disk")
            verify(entries(reopened).map { it.textContent } == values.map { it.textContent }, "Preserve text on disk")
        }
    }
    val target = parse("""<resources><string name="shared">Original</string></resources>""")
    val conflict = parse("""<resources><string name="new">new</string><string name="shared">Changed</string></resources>""")
    rejected("A conflicting value must fail") {
        mergeCompatibilityValues(target, compatibilityValueGroups(conflict).getValue(stringsPath), stringsPath)
    }
    verify(entries(target).size == 1 && entries(target).single().textContent == "Original",
        "Conflict must preserve the stock document")
    rejected("Array tag changes must not create duplicate IDs") {
        mergeCompatibilityValues(parse("""<resources><array name="shared"><item>A</item></array></resources>"""),
            groups.getValue(arraysPath), arraysPath)
    }
    rejected("Stock duplicate names must fail") {
        mergeCompatibilityValues(parse("""<resources><string name="dup">A</string><string name="dup">B</string></resources>"""),
            groups.getValue(stringsPath), stringsPath)
    }
    rejected("Unnamed source must fail") {
        mergeCompatibilityValues(parse("<resources/>"), entries(parse("<resources><string>Bad</string></resources>")), stringsPath)
    }
    rejected("Unknown types require explicit canonical routing") {
        compatibilityValueGroups(parse("""<resources><color name="color">#ffffff</color></resources>"""))
    }

    File(args[0]).inputStream().use { parse(it) }.use { pinned ->
        val pinnedGroups = compatibilityValueGroups(pinned)
        verify(pinnedGroups.getValue(stringsPath).size == 1737, "All pinned runtime strings")
        verify(pinnedGroups.getValue(arraysPath).size == 4, "All pinned runtime arrays")
        for ((path, values) in pinnedGroups) {
            val file = File(scratch, path)
            writable(file).use { destination ->
                val original = entries(destination).map { it.cloneNode(true) }
                mergeCompatibilityValues(destination, values, path)
                mergeCompatibilityValues(destination, values, path)
                val actual = entries(destination)
                verify(actual.size == original.size + values.size, "Exactly one copy of each pinned value")
                verify(original.zip(actual).all { (before, after) -> before.isEqualNode(after) },
                    "Existing stock values are unchanged")
                verify(actual.map { it.getAttribute("name") }.toSet().size == actual.size, "Unique IDs in $path")
                verify(values.zip(actual.drop(original.size)).all { (before, after) -> before.isEqualNode(after) },
                    "Every pinned value imported intact")
            }
        }
    }
    println("PASS: $checks canonical-resource merge checks; 1737 strings and 4 arrays")
}
