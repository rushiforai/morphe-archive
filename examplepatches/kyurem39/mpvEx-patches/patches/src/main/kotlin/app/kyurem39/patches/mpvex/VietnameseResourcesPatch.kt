package app.kyurem39.patches.mpvex

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.resource.ResourceType

private const val VIETNAMESE_STRINGS_RESOURCE = "/vi-strings.xml"
private const val VIETNAMESE_STRINGS = "res/values-vi/strings.xml"

/** Gives access to the patch bundle's own resources. */
private object PatchResources

private val STRING_ENTRY = Regex("""<string name="([^"]+)"[^>]*>.*?</string>""", RegexOption.DOT_MATCHES_ALL)
private val PLURALS_ENTRY =
    Regex("""<plurals name="([^"]+)"[^>]*>.*?</plurals>""", RegexOption.DOT_MATCHES_ALL)

/**
 * Adds the Vietnamese translation.
 *
 * The translation covers every string of the app's `values` file, but only the strings the APK
 * still carries are written: a release build ships a shrunk resource table, and adding a resource
 * the app removed would create a new id nothing ever reads.
 */
internal val vietnameseResourcesPatch = resourcePatch {
    execute {
        val translation = checkNotNull(
            PatchResources.javaClass.getResourceAsStream(VIETNAMESE_STRINGS_RESOURCE),
        ) { "Missing $VIETNAMESE_STRINGS_RESOURCE in the patch bundle." }
            .use { it.readBytes().toString(Charsets.UTF_8) }

        fun applicableEntries(regex: Regex, type: ResourceType) =
            regex.findAll(translation)
                .filter { match -> resourceIds.has(type, match.groupValues[1]) }
                .map { match -> match.value }
                .toList()

        val strings = applicableEntries(STRING_ENTRY, ResourceType.STRING)
        val plurals = applicableEntries(PLURALS_ENTRY, ResourceType.PLURALS)

        check(strings.size >= 300) {
            "Only ${strings.size} Vietnamese strings match the resource table of the APK."
        }

        // Adds the resources of the new configuration instead of replacing anything.
        this[VIETNAMESE_STRINGS, false].writeText(
            buildString {
                appendLine("""<?xml version="1.0" encoding="utf-8"?>""")
                appendLine("<resources>")
                strings.forEach { entry -> appendLine("    $entry") }
                plurals.forEach { entry -> appendLine("    $entry") }
                appendLine("</resources>")
            },
        )
    }
}
