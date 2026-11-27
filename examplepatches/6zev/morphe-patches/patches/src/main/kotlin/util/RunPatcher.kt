/*
 * Patches for tvQuickActions Pro.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package util

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.PatcherResult
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.resource.CpuArchitecture
import app.morphe.patcher.dex.BytecodeMode
import java.io.File
import java.util.zip.ZipEntry
import java.util.zip.ZipInputStream
import java.util.zip.ZipOutputStream

/**
 * Runs every patch of this bundle over one APK and writes the result.
 *
 * This is a test harness, not part of the shipped patches: it exists so the bundle can be
 * exercised over a real build without the CLI, which is what tells whether the anchors still
 * hold on the store's APK rather than only on the one the patch was written against.
 */
fun main(args: Array<String>) {
    val input = File(args[0])
    val output = File(args[1])
    val work = createTempDir()

    val patcher = Patcher(
        PatcherConfig(
            apkFile = input,
            temporaryFilesPath = work,
            fileWorkspacePath = File(work, "workspace"),
            keepArchitectures = CpuArchitecture.entries.toSet(),
            useBytecodeMode = rawBytecodeMode(),
            targetPatcherVersion = "2.1.0",
            validate = true,
        )
    )

    patcher += loadedPatches()

    patcher.use {
        kotlinx.coroutines.runBlocking {
            it().collect { result ->
                val label = result.patch?.name ?: "?"
                println("[$label] ${result.exception?.message ?: "ok"}")
            }
        }
        write(it.get(), output, input)
    }
}

private fun createTempDir(): File = kotlin.io.path.createTempDirectory("morphe-run").toFile()

/**
 * The dex writer mode, overridable with -Dmorphe.bytecodeMode=<FULL|STRIP_FAST|STRIP_SAFE>.
 *
 * The harness rewrites the dex in full by default. The stripper modes move every class a patch
 * touched into a separate segment, which renumbers references the rest of the app still holds,
 * and tvQuickActions aborts on start when they do; a full rewrite keeps each class in the file
 * it came from. The override exists so a run can be compared against the stripper's output.
 */
private fun rawBytecodeMode(): BytecodeMode =
    System.getProperty("morphe.bytecodeMode")
        ?.let { name -> BytecodeMode.entries.firstOrNull { it.name.equals(name, ignoreCase = true) } }
        ?: BytecodeMode.FULL

private fun loadedPatches(): Set<Patch<*>> {
    // Every patch class in the bundle, so the harness runs the same set the CLI would. The
    // bundle is built by buildAndroid, which folds the compiled classes into one dex, so the
    // classes are loaded from the bundle's own loader as well as the run's.
    val bundle = File(System.getProperty("runPatch.bundle"))
    val classes = java.util.zip.ZipFile(bundle)
        .use { zip ->
            zip.entries().asSequence()
                .map { it.name }
                .filter { it.endsWith(".class") && !it.startsWith("util/") }
                .map { it.removeSuffix(".class").replace('/', '.') }
                .filter { hasPatchFields(it, {}.javaClass.classLoader) }
                .toList()
        }

    val patches = classes.flatMap { name ->
        val holder = Class.forName(name, true, {}.javaClass.classLoader)
        holder.declaredFields
            .filter { Patch::class.java.isAssignableFrom(it.type) }
            .onEach { it.isAccessible = true }
            .map { it.get(null) as Patch<*> }
    }

    check(patches.isNotEmpty()) { "The bundle exposes no patch" }

    return patches.toSet()
}

private fun hasPatchFields(name: String, loader: ClassLoader): Boolean = try {
    val type = Class.forName(name, false, loader)
    // The compiler names a file that holds only top-level declarations after the file itself,
    // and the bundle builder folds several of them together, so the class is whichever one
    // carries the patch values rather than the one the source file is named after.
    type.declaredFields.any { Patch::class.java.isAssignableFrom(it.type) } &&
            java.lang.reflect.Modifier.isPublic(type.modifiers)
} catch (_: Throwable) {
    false
}

private fun write(result: PatcherResult, output: File, input: File) {
    ZipOutputStream(output.outputStream().buffered()).use { zip ->
        val written = mutableSetOf<String>()

        for (dex in result.dexFiles) {
            zip.putNextEntry(ZipEntry(dex.name))
            dex.stream.use { it.copyTo(zip) }
            zip.closeEntry()
            written += dex.name
        }

        val resources = result.resources ?: return

        // The libraries the native patches rewrote are handed back as a directory of the entries
        // that changed, not as an archive, so they are collected here and then written in place
        // of the ones the input carried.
        val other: File? = resources.otherResources
        val rewritten: Map<String, File> = if (other == null || !other.isDirectory) {
            emptyMap()
        } else {
            other.walkTopDown()
                .filter { it.isFile }
                .associateBy { it.relativeTo(other).invariantSeparatorsPath }
        }

        ZipInputStream(input.inputStream().buffered()).use { source ->
            while (true) {
                val entry = source.nextEntry ?: break
                if (entry.name == "classes.dex" || entry.name in written) continue

                zip.putNextEntry(ZipEntry(entry.name).apply { time = entry.time })
                val replacement = rewritten[entry.name]
                if (replacement != null) replacement.inputStream().use { it.copyTo(zip) } else source.copyTo(zip)
                zip.closeEntry()
                written += entry.name
            }
        }

        // Entries the patches added that the input did not have.
        for ((name, file) in rewritten) {
            if (name in written) continue
            zip.putNextEntry(ZipEntry(name))
            file.inputStream().use { it.copyTo(zip) }
            zip.closeEntry()
            written += name
        }

        val resourcesApk: File? = resources.resourcesApk
        if (resourcesApk != null && resourcesApk.isFile) {
            ZipInputStream(resourcesApk.inputStream().buffered()).use { source ->
                while (true) {
                    val entry = source.nextEntry ?: break
                    if (entry.name == "classes.dex" || entry.name in written) continue
                    zip.putNextEntry(ZipEntry(entry.name).apply { time = entry.time })
                    source.copyTo(zip)
                    zip.closeEntry()
                    written += entry.name
                }
            }
        }
    }
}
