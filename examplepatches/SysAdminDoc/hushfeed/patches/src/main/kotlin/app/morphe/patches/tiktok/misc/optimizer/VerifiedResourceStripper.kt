/*
 * Resource-removal behavior adapted from kveld9/kveld-morphe-patches at
 * fcb1768620b8f98a6dd31e801074589ce9a63356 (GPL-3.0).
 * https://github.com/kveld9/kveld-morphe-patches/tree/fcb1768620b8f98a6dd31e801074589ce9a63356
 */
package app.morphe.patches.tiktok.misc.optimizer

import app.morphe.patcher.patch.PatchException
import java.io.File
import java.security.MessageDigest
import java.util.Locale

internal data class ResourceFileContract(val path: String, val sha256: String)

internal data class ResourceProfile(val label: String, val files: List<ResourceFileContract>)

internal data class StripSummary(
    val files: Int,
    val bytes: Long,
    val alreadyStripped: Boolean,
)

internal data class LanguageInventoryContract(
    val directories: Set<String>,
    val pathManifestSha256: String,
    val contentManifestSha256: Set<String>,
)

/**
 * Empty a reviewed group of resources only after its complete path and digest profile matches.
 *
 * Kveld's original patches changed files as they found them. A renamed, missing, or partially
 * modified group could therefore produce an APK carrying only part of the intended change. This
 * validates the entire group first. A completely empty exact group is accepted so reapplying the
 * Hushfeed patch remains idempotent.
 */
internal fun stripVerifiedResources(
    root: File,
    patchName: String,
    scanDirectories: List<String>,
    standaloneFiles: List<String>,
    profiles: List<ResourceProfile>,
    resolveStandaloneFile: ((String) -> File)? = null,
): StripSummary {
    if (profiles.isEmpty()) throw PatchException("$patchName: no reviewed resource profiles were supplied.")

    val actual = linkedMapOf<String, File>()
    scanDirectories.forEach { path ->
        val directory = root.resolveChecked(path, patchName)
        if (!directory.exists()) return@forEach
        if (!directory.isDirectory) {
            throw PatchException("$patchName: $path is present but is not a directory.")
        }
        directory.walkTopDown().filter(File::isFile).forEach { file ->
            actual[file.relativePathFrom(root, patchName)] = file
        }
    }
    standaloneFiles.forEach { path ->
        val expectedFile = root.resolveChecked(path, patchName)
        val file = resolveStandaloneFile?.invoke(path) ?: expectedFile
        if (file.canonicalFile != expectedFile.canonicalFile) {
            throw PatchException("$patchName: the resource resolver redirected $path outside its reviewed location.")
        }
        if (!file.exists()) return@forEach
        if (!file.isFile) throw PatchException("$patchName: $path is present but is not a file.")
        actual[file.relativePathFrom(root, patchName)] = file
    }

    val matchingPathProfiles = profiles.filter { profile ->
        profile.files.map(ResourceFileContract::path).toSet() == actual.keys
    }
    if (matchingPathProfiles.isEmpty()) {
        val expectedCounts = profiles.map { it.files.size }.distinct().sorted().joinToString()
        throw PatchException(
            "$patchName: found ${actual.size} target files, but no reviewed path set matched " +
                "(expected file counts: $expectedCounts).",
        )
    }

    val emptyFiles = actual.values.count { it.length() == 0L }
    if (emptyFiles == actual.size) {
        return StripSummary(actual.size, 0L, alreadyStripped = true)
    }
    if (emptyFiles != 0) {
        throw PatchException(
            "$patchName: found a partially stripped resource group ($emptyFiles of ${actual.size} files empty).",
        )
    }

    val digests = actual.mapValues { (_, file) -> file.sha256() }
    val matchingContentProfiles = matchingPathProfiles.filter { profile ->
        profile.files.all { contract -> digests[contract.path] == contract.sha256 }
    }
    if (matchingContentProfiles.isEmpty()) {
        throw PatchException("$patchName: target resources do not match a reviewed TikTok build.")
    }

    val originalBytes = actual.values.sumOf(File::length)
    actual.values.forEach { file -> file.writeBytes(byteArrayOf()) }
    return StripSummary(actual.size, originalBytes, alreadyStripped = false)
}

internal fun parseLanguageSelection(raw: String?, available: Set<String>): Set<String> {
    if ("en" !in available) throw PatchException("Language Pack Purger: the English fallback pack is missing.")
    val selected = raw.orEmpty()
        .split(',')
        .map { it.trim().lowercase(Locale.ROOT) }
        .filter(String::isNotEmpty)
        .toMutableSet()
    selected.add("en")

    val unknown = selected - available
    if (unknown.isNotEmpty()) {
        throw PatchException(
            "Language Pack Purger: unknown language code(s): ${unknown.sorted().joinToString()}.",
        )
    }

    // TikTok carries both the modern and legacy Android codes for these two languages.
    if ("he" in selected || "iw" in selected) selected.addAll(setOf("he", "iw").filter { it in available })
    if ("id" in selected || "in" in selected) selected.addAll(setOf("id", "in").filter { it in available })
    return selected
}

/** Verify the complete language inventory before emptying every unselected pack. */
internal fun stripVerifiedLanguagePacks(
    root: File,
    targetLocales: String?,
    contract: LanguageInventoryContract,
): StripSummary {
    val patchName = "Language Pack Purger"
    val assets = root.resolveChecked("assets", patchName)
    if (!assets.isDirectory) throw PatchException("$patchName: TikTok's assets directory is missing.")

    val languageDirectories = assets.listFiles().orEmpty()
        .filter { it.isDirectory && it.name.startsWith(LANGUAGE_DIRECTORY_PREFIX) }
    val byCode = languageDirectories.associateBy { it.name.removePrefix(LANGUAGE_DIRECTORY_PREFIX).lowercase(Locale.ROOT) }
    if (byCode.keys != contract.directories) {
        throw PatchException(
            "$patchName: found ${byCode.size} language directories, but the reviewed set has " +
                "${contract.directories.size}.",
        )
    }

    val allFiles = languageDirectories.flatMap { directory ->
        directory.walkTopDown().filter(File::isFile).toList()
    }
    val pathManifest = allFiles.sortedPaths(root, patchName)
        .joinToString(separator = "", postfix = "") { path -> "$path\n" }
        .sha256()
    if (pathManifest != contract.pathManifestSha256) {
        throw PatchException("$patchName: language file paths do not match the reviewed inventory.")
    }

    val selected = parseLanguageSelection(targetLocales, contract.directories)
    val targets = byCode.filterKeys { it !in selected }.values.flatMap { directory ->
        directory.walkTopDown().filter(File::isFile).toList()
    }
    val kept = byCode.filterKeys { it in selected }.values.flatMap { directory ->
        directory.walkTopDown().filter(File::isFile).toList()
    }

    if (targets.isNotEmpty() && targets.all { it.length() == 0L }) {
        if (kept.any { it.length() == 0L }) {
            throw PatchException("$patchName: a requested retained language has already been emptied.")
        }
        return StripSummary(targets.size, 0L, alreadyStripped = true)
    }
    if (targets.any { it.length() == 0L }) {
        throw PatchException("$patchName: the selected language resource set is only partly stripped.")
    }
    if (allFiles.any { it.length() == 0L }) {
        throw PatchException("$patchName: an unselected source has already emptied a language that must be retained.")
    }

    val contentManifest = allFiles.sortedBy { it.relativePathFrom(root, patchName) }
        .joinToString(separator = "", postfix = "") { file ->
            file.relativePathFrom(root, patchName) + "\u0000" + file.sha256() + "\n"
        }
        .sha256()
    if (contentManifest !in contract.contentManifestSha256) {
        throw PatchException("$patchName: language resources do not match a reviewed TikTok build.")
    }

    val originalBytes = targets.sumOf(File::length)
    targets.forEach { it.writeBytes(byteArrayOf()) }
    return StripSummary(targets.size, originalBytes, alreadyStripped = false)
}

private const val LANGUAGE_DIRECTORY_PREFIX = "strings#lang_"

private fun File.resolveChecked(relativePath: String, patchName: String): File {
    val normalized = relativePath.replace('\\', '/')
    if (normalized.isBlank() || normalized.startsWith('/') ||
        normalized.split('/').any { it.isBlank() || it == "." || it == ".." } ||
        Regex("^[A-Za-z]:").containsMatchIn(normalized)
    ) {
        throw PatchException("$patchName: invalid resource path: $relativePath")
    }
    val base = canonicalFile.toPath()
    val resolved = resolve(normalized).canonicalFile.toPath()
    if (!resolved.startsWith(base)) throw PatchException("$patchName: resource path leaves the APK root: $relativePath")
    return resolved.toFile()
}

private fun File.relativePathFrom(root: File, patchName: String): String {
    val base = root.canonicalFile.toPath()
    val path = canonicalFile.toPath()
    if (!path.startsWith(base)) throw PatchException("$patchName: a resource resolved outside the APK root: $this")
    return base.relativize(path).toString().replace('\\', '/')
}

private fun List<File>.sortedPaths(root: File, patchName: String): List<String> =
    map { it.relativePathFrom(root, patchName) }.sorted()

private fun File.sha256(): String {
    val digest = MessageDigest.getInstance("SHA-256")
    inputStream().buffered().use { input ->
        val buffer = ByteArray(DEFAULT_BUFFER_SIZE)
        while (true) {
            val read = input.read(buffer)
            if (read < 0) break
            if (read > 0) digest.update(buffer, 0, read)
        }
    }
    return digest.digest().toHex()
}

private fun String.sha256(): String = MessageDigest.getInstance("SHA-256")
    .digest(toByteArray(Charsets.UTF_8))
    .toHex()

private fun ByteArray.toHex(): String = joinToString("") { "%02x".format(it) }
