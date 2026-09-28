package app.morphe.patches.all.stripnativelibraries

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.resource.CpuArchitecture
import java.util.logging.Logger

private const val NATIVE_LIBRARY_DIRECTORY = "lib"

fun stripNativeLibrariesPatch(
    keepArchitecturesProvider: () -> List<CpuArchitecture> = { emptyList() },
) = rawResourcePatch {
    execute {
        val keepArchitectures = keepArchitecturesProvider()
        if (keepArchitectures.isEmpty()) return@execute

        val logger = Logger.getLogger(this::class.java.name)
        logger.info(
            "Stripping libs (keeping architectures ${keepArchitectures.joinToString(", ") { it.arch }})"
        )
        val strippedLibraries = mutableSetOf<String>()

        get(NATIVE_LIBRARY_DIRECTORY).listFiles()!!.forEach { dir ->
            if (dir.isDirectory && CpuArchitecture.valueOfOrNull(dir.name)!! !in keepArchitectures) {
                strippedLibraries.add(dir.name)
                dir.deleteRecursively()
            }
        }
        logger.info("Stripped ${strippedLibraries.size} lib files")
    }
}

val stripNonArm64NativeLibraryPatch =
    stripNativeLibrariesPatch { listOf(CpuArchitecture.ARM64_V8A) }
