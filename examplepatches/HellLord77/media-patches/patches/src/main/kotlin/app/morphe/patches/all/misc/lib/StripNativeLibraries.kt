package app.morphe.patches.all.misc.lib

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.resource.CpuArchitecture
import app.morphe.patches.shared.Constants.NATIVE_LIBRARY_DIRECTORY
import java.util.logging.Logger

fun stripNativeLibrariesPatch(
    keepArchitecturesProvider: () -> List<CpuArchitecture> = { emptyList() },
) = rawResourcePatch {
    finalize {
        val keepArchitectures = keepArchitecturesProvider()
        if (keepArchitectures.isEmpty()) return@finalize

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
        logger.info("Stripped ${strippedLibraries.size} lib dirs")
    }
}

val stripNonArmNativeLibraryPatch =
    stripNativeLibrariesPatch { listOf(CpuArchitecture.ARMEABI_V7A, CpuArchitecture.ARM64_V8A) }
