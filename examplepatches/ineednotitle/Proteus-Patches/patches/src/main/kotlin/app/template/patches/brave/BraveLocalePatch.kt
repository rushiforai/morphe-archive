// SPDX-License-Identifier: GPL-3.0-only
package app.template.patches.brave

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.BRAVE_COMPATIBILITY
import java.util.Locale

// Locale fallback strategy adapted from kveld9/kveld-morphe-patches (GPL-3.0),
// revision 8afd78f0b57964b9ae9a0a387bdd4ae157345707.
internal fun braveLocalesToKeep(input: String?): Set<String> {
    val tags = input.orEmpty().split(',').map { it.trim().removeSuffix(".pak").lowercase(Locale.ROOT) }
        .filter(String::isNotEmpty)
    val validTag = Regex("^[a-z]{2,3}(?:[-_][a-z0-9]{2,8})*$")
    if (tags.any { !validTag.matches(it) }) throw PatchException("Brave: invalid language tag in '$input'")
    return (tags.flatMap { listOf(it, it.substringBefore('-').substringBefore('_')) } + listOf("en", "en-us")).toSet()
}

internal fun braveShouldKeepLocale(filename: String, keep: Set<String>): Boolean {
    val tag = filename.removeSuffix(".pak").lowercase(Locale.ROOT)
    val base = tag.substringBefore('_').substringBefore('-')
    return tag in keep || base in keep
}

@Suppress("unused")
val braveRemoveExtraLanguagesPatch = rawResourcePatch(
    name = "Remove Extra Languages",
    description = "Replaces larger unselected Chromium locale PAKs with the English fallback; gender variants and Android resources are not removed.",
    default = false,
) {
    compatibleWith(BRAVE_COMPATIBILITY)
    dependsOn(braveNativeExtractionDependency())
    val locales by stringOption(
        key = "locales", title = "Languages to keep",
        description = "Comma-separated language codes such as en-US, fr, hi. English is always kept; choosing a language keeps all its regions.",
        default = "en-US", required = false,
    )
    execute {
        val keep = braveLocalesToKeep(locales)
        val dir = get("assets/locales")
        if (!dir.isDirectory) throw PatchException("Brave: assets/locales not found; cannot safely slim locales")
        val paks = dir.walkTopDown().filter { it.isFile && it.name.endsWith(".pak", ignoreCase = true) }.toList()
        val fallback = paks.firstOrNull { it.name.equals("en-US.pak", ignoreCase = true) }
            ?: throw PatchException("Brave: English fallback PAK is missing; no files changed")
        val bytes = fallback.readBytes()
        if (bytes.isEmpty()) throw PatchException("Brave: English fallback PAK is empty; no files changed")
        val toReplace = paks.filter {
            val stem = it.nameWithoutExtension.lowercase(Locale.ROOT)
            val genderVariant = listOf("_feminine", "_masculine", "_neuter").any(stem::endsWith)
            !genderVariant && !braveShouldKeepLocale(it.name.lowercase(Locale.ROOT), keep) && it.length() > bytes.size
        }
        toReplace.forEach { it.writeBytes(bytes) }
        println("[Brave] Replaced ${toReplace.size} locale packs with the English fallback")
    }
}
