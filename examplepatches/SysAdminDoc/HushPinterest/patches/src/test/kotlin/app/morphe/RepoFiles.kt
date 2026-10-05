/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe

import java.io.File

/** Paths into the repository, read as plain files: nothing here loads a patch or payload class. */
internal object RepoFiles {
    val root: File by lazy {
        generateSequence(File("").absoluteFile) { it.parentFile }
            .firstOrNull { File(it, "settings.gradle.kts").isFile && File(it, "provenance.json").isFile }
            ?: error("Could not find the repository root from ${File("").absolutePath}")
    }

    /** Every Java and Kotlin source that ships: patches, the patch stub and every extension module. */
    fun shippedSources(): List<File> {
        val roots = listOf(
            File(root, "patches/src/main"),
            File(root, "patches/stub/src/main"),
        ) + (File(root, "extensions").walkTopDown()
            .onEnter { it.name != "build" && it.name != "test" }
            .filter { it.isDirectory && it.name == "main" && it.parentFile?.name == "src" }
            .toList())
        return roots.filter { it.isDirectory }
            .flatMap { dir -> dir.walkTopDown().filter { it.isFile && (it.extension == "java" || it.extension == "kt") }.toList() }
            .distinct()
            .sortedBy { it.path }
    }

    fun relative(file: File): String = file.relativeTo(root).invariantSeparatorsPath
}
