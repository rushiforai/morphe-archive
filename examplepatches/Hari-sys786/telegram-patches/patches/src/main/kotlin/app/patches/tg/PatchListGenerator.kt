package app.patches.tg

import app.morphe.patcher.patch.loadPatchesFromJar
import java.io.File
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

/**
 * Writes the release metadata that Morphe Manager / the Morphe CLI sources consume.
 *
 *  * `patches-list.json`   — `{ "version": "<v>", "patches": [ { name, description, use,
 *    dependencies, compatiblePackages, options } ] }`
 *  * `patches-bundle.json` — `{ "created_at", "description", "download_url",
 *    "signature_download_url", "version" }` (the `description` is the changelog block Morphe shows)
 *
 * Mirrors the layout used by public Morphe patch sources (e.g. jasonwu1994/Gboard-patches).
 *
 * Usage:
 *   PatchListGenerator <bundle.mpp> <version> <repoRoot> <downloadUrlBase> [changelogFile]
 */
fun main(args: Array<String>) {
    require(args.size >= 4) {
        "Usage: <bundle.mpp> <version> <repoRoot> <downloadUrlBase> [changelogFile]"
    }
    val bundle = File(args[0])
    val version = args[1]
    val repoRoot = File(args[2]).apply { mkdirs() }
    val downloadBase = args[3]
    val changelogFile = args.getOrNull(4)?.let { File(it) }
    val changelog = changelogFile?.takeIf { it.isFile }?.readText().orEmpty()

    val patches = loadPatchesFromJar(setOf(bundle)).sortedBy { it.name }

    val listJson = buildString {
        appendLine("{")
        appendLine("  \"version\": ${version.json()},")
        appendLine("  \"patches\": [")
        patches.forEachIndexed { index, patch ->
            val compatible = patch.compatiblePackages.orEmpty()
                .associate { (packageName, versions) -> packageName to (versions?.toList() ?: emptyList()) }

            appendLine("    {")
            appendLine("      \"name\": ${patch.name.orEmpty().json()},")
            appendLine("      \"description\": ${patch.description.orEmpty().json()},")
            appendLine("      \"use\": ${patch.default},")
            appendLine("      \"dependencies\": [${patch.dependencies.mapNotNull { it.name }.joinToString(", ") { it.json() }}],")
            appendLine("      \"compatiblePackages\": ${compatible.toJsonObject()},")
            // None of the Telegram patches declare user-facing options; keep the shape stable anyway.
            appendLine("      \"options\": []")
            append("    }")
            if (index != patches.lastIndex) append(",")
            appendLine()
        }
        appendLine("  ]")
        append("}")
    }
    File(repoRoot, "patches-list.json").writeText(listJson)

    val bundleJson = buildString {
        appendLine("{")
        appendLine("  \"created_at\": ${LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME).json()},")
        appendLine("  \"description\": ${changelog.trim().json()},")
        appendLine("  \"download_url\": ${"$downloadBase/patches-$version.mpp".json()},")
        appendLine("  \"signature_download_url\": \"\",")
        appendLine("  \"version\": ${version.json()}")
        append("}")
    }
    File(repoRoot, "patches-bundle.json").writeText(bundleJson)

    println("Wrote patches-list.json (${patches.size} patches) and patches-bundle.json (v$version) to ${repoRoot.absolutePath}")
    if (changelogFile != null && !changelogFile.isFile) {
        println("Note: changelog file ${changelogFile.absolutePath} not found — description left empty.")
    }
}

private fun String.json(): String = buildString {
    append('"')
    this@json.forEach { character ->
        when (character) {
            '\\' -> append("\\\\")
            '"' -> append("\\\"")
            '\n' -> append("\\n")
            '\r' -> append("\\r")
            '\t' -> append("\\t")
            else -> if (character < ' ') append("\\u%04x".format(character.code)) else append(character)
        }
    }
    append('"')
}

private fun Map<String, List<String>>.toJsonObject(): String =
    if (isEmpty()) {
        "{}"
    } else {
        entries.joinToString(prefix = "{ ", postfix = " }") { (packageName, versions) ->
            "${packageName.json()}: [${versions.joinToString(", ") { it.json() }}]"
        }
    }
