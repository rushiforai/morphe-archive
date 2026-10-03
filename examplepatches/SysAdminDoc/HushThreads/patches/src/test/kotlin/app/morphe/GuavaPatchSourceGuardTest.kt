package app.morphe

import java.io.File
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The bundle runs on Manager's Guava, which can be an older version than the one the build
 * compiles against. A patch that calls a method
 * added in a newer Guava would compile and pass every test here, then crash at runtime on
 * Manager's copy. This test makes that gap visible before it ships.
 */
class GuavaPatchSourceGuardTest {
    @Test
    fun patchSourcesDoNotImportGuavaDirectly() {
        val root = File(RepoFiles.root, "patches/src/main")
        assertTrue("Patch source directory is missing: $root", root.isDirectory)
        val sources = root.walk()
            .filter { it.isFile && (it.extension == "kt" || it.extension == "java") }
            .toList()
        assertTrue("Patch source directory contains no Java or Kotlin sources: $root", sources.isNotEmpty())
        val violations = sources.asSequence()
            .flatMap { file ->
                file.readLines()
                    .filter {
                        val line = it.trimStart()
                        line.startsWith("import com.google.common") || line.startsWith("import static com.google.common")
                    }
                    .map { "${file.relativeTo(root)}: ${it.trim()}" }
            }
            .toList()
        assertTrue(
            "Patch sources import Guava directly. The bundle runs on Manager's Guava, " +
                "which may be an older version than the compile classpath. Use the standard " +
                "library or the patcher's own API instead.\n${violations.joinToString("\n")}",
            violations.isEmpty()
        )
    }
}
