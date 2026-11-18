// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import java.io.File
import java.net.URLClassLoader
import java.util.zip.ZipFile

/** The built bundle, loaded the way Morphe Manager and the CLI load it. */
internal object Bundle {
    val file = File(System.getProperty("patches.bundle"))

    val patches: Set<Patch> by lazy {
        // The loader skips a class that fails to load with NoClassDefFoundError, which would drop its patches without
        // a word. Load every class first, so such a bundle fails here instead.
        URLClassLoader(arrayOf(file.toURI().toURL()), Bundle::class.java.classLoader).use { loader ->
            for (name in classNames()) {
                try {
                    Class.forName(name, false, loader)
                } catch (error: LinkageError) {
                    throw AssertionError("Couldn't load $name from $file", error)
                }
            }
        }
        loadPatchesFromJar(setOf(file)).toSet()
    }

    private fun classNames() = ZipFile(file).use { zip ->
        zip.entries().asSequence()
            .map { it.name }
            .filter { it.endsWith(".class") && !it.startsWith("META-INF/") }
            .map { it.removeSuffix(".class").replace('/', '.') }
            .toList()
    }
}
