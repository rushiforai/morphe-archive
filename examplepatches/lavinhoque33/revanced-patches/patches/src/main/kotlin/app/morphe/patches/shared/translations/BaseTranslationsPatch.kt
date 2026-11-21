package app.morphe.patches.shared.translations

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.util.FilesCompat
import app.morphe.util.inputStreamFromBundledResource
import org.w3c.dom.Element
import org.w3c.dom.Node
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult

// Array of all possible app languages.
val APP_LANGUAGES = arrayOf(
    "af", "am", "ar", "ar-rXB", "as", "az",
    "b+es+419", "b+sr+Latn", "be", "bg", "bn", "bs",
    "ca", "cs",
    "da", "de",
    "el", "en-rAU", "en-rCA", "en-rGB", "en-rIN", "en-rXA", "en-rXC", "es", "es-rUS", "et", "eu",
    "fa", "fi", "fil-rPH", "fr", "fr-rCA",
    "gl", "gu",
    "hi", "hr", "hu", "hy",
    "id", "in", "is", "it", "iw",
    "ja",
    "ka", "kk", "km", "kn", "ko", "ky",
    "lo", "lt", "lv",
    "mk", "ml", "mn", "mr", "ms", "my",
    "nb", "ne", "nl", "no",
    "or",
    "pa", "pl", "pt", "pt-rBR", "pt-rPT",
    "ro", "ru",
    "si", "sk", "sl", "sq", "sr", "sv", "sw",
    "ta", "te", "th", "tl", "tr",
    "uk", "ur", "uz",
    "vi",
    "zh", "zh-rCN", "zh-rHK", "zh-rTW", "zu",
)

private val ANDROID_REGION_SEPARATOR = Regex("-r(?=[a-z]{2}(?:-|$)|[0-9]{3}(?:-|$))")
private val DEFAULT_LOCALES = APP_LANGUAGES.mapTo(hashSetOf(), ::normalizeLocale)

// Android puts the locale after MCC/MNC and before all other qualifiers.
private val RESOURCE_LOCALE = Regex(
    "^(?:mcc[0-9]{3}-)?(?:mnc[0-9]{1,3}-)?" +
        "(b\\+[a-z]{2,3}(?:\\+[a-zA-Z0-9]{1,8})*|[a-z]{2,3}(?:-r(?:[A-Z]{2}|[0-9]{3}))?)(?:-|$)"
)

fun ResourcePatchContext.baseTranslationsPatch(
    customTranslations: String?,
    selectedTranslations: String?,
    translationsArray: Set<String>,
    sourceDirectory: String,
) {
    val resourceDirectory = get("res")

    // Check if the custom translation path is valid.
    customTranslations?.takeIf { it.isNotEmpty() }?.let { customLang ->
        try {
            val customLangFile = File(customLang)
            if (!customLangFile.exists() || !customLangFile.isFile || customLangFile.name != "strings.xml") {
                throw PatchException("Invalid custom language file: $customLang")
            }
            val valuesDirectory = resourceDirectory.resolve("values")
            val destinationFile = valuesDirectory.resolve("strings.xml")

            updateStringsXml(customLangFile, destinationFile)
        } catch (_: Exception) {
            // Exception is thrown if an invalid path is used in the patch option.
            throw PatchException("Invalid custom translations path:  $customLang")
        }
    } ?: run {
        // Process selected translations if no custom translation is set.
        val requested = selectedTranslations?.split(',')?.mapTo(hashSetOf(), String::trim)
        val translations = if (requested == null || "all" in requested) {
            translationsArray
        } else {
            translationsArray.filter { it in requested }
        }
        copyStringsXml(sourceDirectory, translations)
    }
}

internal fun ResourcePatchContext.filterTranslations(selectedStringResources: String?, filterRvxPicker: Boolean) {
    val selected = selectedStringResources?.split(',')?.asSequence()
        ?.map(String::trim)
        ?.filter(String::isNotEmpty)
        ?.map(::normalizeLocale)
        ?.toSet()
        ?: return

    // Keeping everything must also keep stock locales not listed in this patch's option defaults.
    if ("all" in selected || selected.containsAll(DEFAULT_LOCALES)) return

    fun keepLocale(tag: String): Boolean {
        val locale = normalizeLocale(tag)
        if (locale == "en" || locale in selected) return true

        // A base locale keeps its variants; a variant also keeps its less specific fallback.
        return selected.any { choice -> locale.isLocaleVariantOf(choice) || choice.isLocaleVariantOf(locale) }
    }

    removeLocaleResources(::keepLocale)
    filterAndroidLocaleConfig(::keepLocale)
    if (filterRvxPicker) filterRvxLanguagePicker(selected)
}

private fun normalizeLocale(tag: String): String {
    val locale = tag.lowercase().removePrefix("b+").replace('+', '-').replace(ANDROID_REGION_SEPARATOR, "-")
    val language = locale.substringBefore('-')
    val canonicalLanguage = when (language) {
        "in" -> "id"
        "iw" -> "he"
        "ji" -> "yi"
        "fil" -> "tl"
        else -> return locale
    }
    return canonicalLanguage + locale.substring(language.length)
}

private fun String.isLocaleVariantOf(locale: String) =
    length > locale.length && this[locale.length] == '-' && startsWith(locale)

private fun ResourcePatchContext.removeLocaleResources(keepLocale: (String) -> Boolean) {
    val rejectedDirectories = hashMapOf<String, Boolean>()

    fun shouldRemove(directory: String) = rejectedDirectories.getOrPut(directory) {
        val qualifiers = directory.substringAfter('-', "")
        val locale = RESOURCE_LOCALE.find(qualifiers)?.groupValues?.get(1)
        // "car" is a UI mode qualifier, not a locale.
        locale != null && locale != "car" && !keepLocale(locale)
    }

    // Stock configurations may not have been decoded. Delete through the patcher to update resources.arsc.
    for (path in listDecodableFiles("res/*-*/*")) {
        if (shouldRemove(path.substringAfter('/').substringBefore('/'))) delete(path)
    }

    // Also remove locale variants introduced by the selected patches, including bundled RVX translations.
    for (directory in get("res").listFiles().orEmpty()) {
        if (!directory.isDirectory || !shouldRemove(directory.name)) continue

        for (file in directory.listFiles().orEmpty()) {
            delete("res/${directory.name}/${file.name}")
        }
    }
}

private fun ResourcePatchContext.filterAndroidLocaleConfig(keepLocale: (String) -> Boolean) {
    for (path in listDecodableFiles("res/xml*/locales_config.xml")) {
        document(path).use { document ->
            val locales = document.getElementsByTagName("locale")
            for (index in locales.length - 1 downTo 0) {
                val locale = locales.item(index) as Element
                val tag = locale.getAttribute("android:name")
                if (tag.isNotEmpty() && !keepLocale(tag)) locale.parentNode.removeChild(locale)
            }
        }
    }
}

private fun ResourcePatchContext.filterRvxLanguagePicker(selected: Set<String>) {
    val languages = selected.mapTo(hashSetOf("default", "en")) { it.substringBefore('-') }

    document("res/values/arrays.xml").use { document ->
        val arrays = document.getElementsByTagName("string-array")
        for (index in 0 until arrays.length) {
            val array = arrays.item(index) as Element
            val name = array.getAttribute("name")
            if (name != "revanced_language_entries" && name != "revanced_language_entry_values") continue

            val items = array.getElementsByTagName("item")
            for (itemIndex in items.length - 1 downTo 0) {
                val item = items.item(itemIndex)
                val language = item.textContent.trim().removePrefix("@string/revanced_language_")
                if (normalizeLocale(language) !in languages) array.removeChild(item)
            }
        }
    }
}

/**
 * Extension function to ResourceContext to copy XML translation files.
 *
 * @param sourceDirectory The source directory containing the translation files.
 * @param languageArray The array of language codes to process.
 */
private fun ResourcePatchContext.copyStringsXml(
    sourceDirectory: String,
    languageArray: Collection<String>
) {
    val languageMap = mapOf(
        "fil-rPH" to "tl"
    )

    val resourceDirectory = get("res")
    languageArray.forEach { language ->
        val sourceLanguage = languageMap[language] ?: language

        inputStreamFromBundledResource(
            "$sourceDirectory/translations",
            "$language/strings.xml"
        )?.let { inputStream ->
            val directory = "values-$sourceLanguage-v21"
            val valuesV21Directory = resourceDirectory.resolve(directory)
            if (!valuesV21Directory.isDirectory) valuesV21Directory.mkdirs()

            FilesCompat.copy(
                inputStream,
                resourceDirectory.resolve("$directory/strings.xml")
            )
        }
    }
}

/**
 * Updates the contents of the destination strings.xml file by merging it with the source strings.xml file.
 *
 * This function reads both source and destination XML files, compares each <string> element by their
 * unique "name" attribute, and if a match is found, it replaces the content in the destination file with
 * the content from the source file.
 *
 * @param sourceFile The source strings.xml file containing new string values.
 * @param destinationFile The destination strings.xml file to be updated with values from the source file.
 */
private fun updateStringsXml(sourceFile: File, destinationFile: File) {
    val documentBuilderFactory = DocumentBuilderFactory.newInstance()
    val documentBuilder = documentBuilderFactory.newDocumentBuilder()

    // Parse the source and destination XML files into Document objects
    val sourceDoc = documentBuilder.parse(sourceFile)
    val destinationDoc = documentBuilder.parse(destinationFile)

    val sourceStrings = sourceDoc.getElementsByTagName("string")
    val destinationStrings = destinationDoc.getElementsByTagName("string")

    // Create a map to store the <string> elements from the source document by their "name" attribute
    val sourceMap = mutableMapOf<String, Node>()

    // Populate the map with nodes from the source document
    for (i in 0 until sourceStrings.length) {
        val node = sourceStrings.item(i)
        val name = node.attributes.getNamedItem("name").nodeValue
        sourceMap[name] = node
    }

    // Update the destination document with values from the source document
    for (i in 0 until destinationStrings.length) {
        val node = destinationStrings.item(i)
        val name = node.attributes.getNamedItem("name").nodeValue
        if (sourceMap.containsKey(name)) {
            node.textContent = sourceMap[name]?.textContent
        }
    }

    // Indentation inside a styled string is part of its value.
    val transformer = TransformerFactory.newInstance().newTransformer()

    val domSource = DOMSource(destinationDoc)
    val streamResult = StreamResult(destinationFile)
    transformer.transform(domSource, streamResult)
}
