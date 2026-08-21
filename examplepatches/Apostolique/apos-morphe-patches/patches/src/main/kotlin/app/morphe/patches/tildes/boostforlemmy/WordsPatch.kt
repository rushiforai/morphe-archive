package app.morphe.patches.tildes.boostforlemmy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.childElementsSequence
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.OutputKeys
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult

/**
 * Makes Boost read like Tildes, on the Tildes account only.
 *
 * Every string Boost shows lives in one `res/values/strings.xml`: about 1650 of
 * the 1853 are Boost's own and the rest belong to AndroidX, Material and
 * AppLovin. No other config carries a string, so this is the whole of the
 * wording.
 *
 * Boost's copy is left exactly as it is. The rewritten strings go into a second
 * table beside it, `res/values-mcc999/strings.xml`, and the extension hands
 * each screen a context with `mcc` set to 999 while the account is Tildes. So
 * both wordings ship, and Android's own resource lookup picks between them the
 * way it picks between languages.
 *
 * The mobile country code is the highest priority qualifier there is, above
 * language, which is what makes it the right one to borrow: a Tildes word beats
 * the French translation of the same string, while a string this says nothing
 * about still comes back in French. A locale qualifier would have replaced the
 * language rather than sat on top of it, and Android has no qualifier meaning
 * "whatever the app says".
 *
 * That leaves one gap, and it is the same gap everywhere else in this bundle:
 * a screen is worded when it attaches, so one already on top when you switch
 * accounts keeps its words until it is built again.
 *
 * The sort names are still not here, and now for a smaller reason: they are
 * written onto the rows as they are drawn, from what the interceptor makes of
 * each sort, so there is no table to keep in step. See `trimMenu` and
 * `sortName`.
 *
 * Resource ids renumber between releases -- 698 of 11533 kept their number from
 * 1.0.32 to 1.0.33 -- so everything here is resolved by name.
 */
internal val tildesWordsPatch = resourcePatch(
    description = "Files Tildes' wording under a qualifier the extension can ask for.",
) {
    execute {
        val translated = mutableMapOf<Element, String>()

        document("res/values/strings.xml").use { strings ->
            val missing = Words.named.toMutableSet()

            strings.documentElement.childElementsSequence()
                .filter { it.tagName == "string" }
                .forEach { string ->
                    val name = string.getAttribute("name")
                    missing.remove(name)

                    val word = Words.translate(name, string.textContent)
                    if (word != string.textContent) translated[string] = word
                }

            // A named string that is no longer there means Boost renamed or
            // dropped it, and the wording it carried has quietly gone back to
            // Lemmy's. Louder here than on the phone.
            if (missing.isNotEmpty()) {
                throw PatchException("No such string: ${missing.sorted().joinToString()}")
            }

            write(get(TILDES_VALUES, false), translated)
        }

        // Plurals are a second file, and a second reason the rules are the half
        // that generalises: a plural carries one name over an item per
        // quantity, so there is nothing for [Words.OVERRIDES] to key on.
        document("res/values/plurals.xml").use { plurals ->
            val changed = plurals.documentElement.childElementsSequence()
                .filter { it.tagName == "plurals" }
                .filter { plural ->
                    plural.childElementsSequence().any {
                        Words.rules(it.textContent) != it.textContent
                    }
                }
                .toList()

            writePlurals(get(TILDES_VALUES, false), changed)
        }
    }
}

/**
 * The rewritten plurals, beside the rewritten strings.
 *
 * A `<plurals>` is copied whole, items and quantities and all, and then its
 * items are rewritten on the copy. Android picks a quantity out of whichever
 * table it resolved, so a plural filed under `mcc999` has to carry every item
 * Boost's own does or a count would fall through to no string at all.
 */
private fun writePlurals(directory: File, plurals: List<Element>) {
    if (plurals.isEmpty()) return

    val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument()
    val resources = document.createElement("resources")
    document.appendChild(resources)

    plurals.forEach { source ->
        val copy = document.importNode(source, true) as Element
        copy.childElementsSequence()
            .filter { it.tagName == "item" }
            .forEach { it.textContent = Words.rules(it.textContent) }
        resources.appendChild(copy)
    }

    save(document, directory, "plurals.xml")
}

/**
 * The rewritten strings, as a resource file of their own.
 *
 * Each one is copied off Boost's own element rather than built from the name,
 * so whatever it carried besides the text -- `formatted="false"` is the one in
 * here -- comes across with it.
 */
private fun write(directory: File, translated: Map<Element, String>) {
    val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument()
    val resources = document.createElement("resources")
    document.appendChild(resources)

    translated.forEach { (string, word) ->
        val copy = document.importNode(string, false) as Element
        copy.textContent = word
        resources.appendChild(copy)
    }

    save(document, directory, "strings.xml")
}

/** One rewritten table, as a resource file Android will pick between. */
private fun save(document: org.w3c.dom.Document, directory: File, fileName: String) {
    directory.mkdirs()
    TransformerFactory.newInstance().newTransformer().apply {
        setOutputProperty(OutputKeys.INDENT, "yes")
        setOutputProperty(OutputKeys.ENCODING, "utf-8")
    }.transform(DOMSource(document), StreamResult(File(directory, fileName)))
}

/**
 * Checks the menu rows are still called what the extension looks them up by.
 *
 * Menus are trimmed and relabelled at runtime, per account, and the extension
 * finds a row by resolving these names against the app's own resources -- the
 * ids renumber every release, so a name is the only stable handle. Seventeen
 * sorts, and the four rows Tildes has nothing behind: Downvote, Report,
 * Cross-posts and Cross-post.
 *
 * A rename is not fatal there: the rows it covers keep Lemmy's word, and the
 * ones that should be gone stay. It is silent, though, and a menu with a
 * Downvote in it reads like a decision.
 *
 * So the check is here, where a rename fails at apply time with the name in the
 * message. It rewrites nothing, which is why it is a dependency of the bytecode
 * patch rather than part of the wording above: the wording is optional and this
 * is not.
 */
internal val tildesMenuNamesPatch = resourcePatch(
    description = "Checks Boost's menu strings are still named what the menu hook expects.",
) {
    execute {
        document("res/values/strings.xml").use { strings ->
            val missing = (Words.sortNames + Words.menuRowNames).toMutableSet()

            strings.documentElement.childElementsSequence()
                .filter { it.tagName == "string" }
                .forEach { missing.remove(it.getAttribute("name")) }

            if (missing.isNotEmpty()) {
                throw PatchException("No such menu row: ${missing.sorted().joinToString()}")
            }
        }
    }
}
