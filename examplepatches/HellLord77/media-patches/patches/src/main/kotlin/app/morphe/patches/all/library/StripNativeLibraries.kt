package app.morphe.patches.all.library

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.resource.CpuArchitecture
import app.morphe.patches.shared.Constants.NATIVE_LIBRARY_DIRECTORY
import app.morphe.patches.shared.patches.cpuArchitectures
import app.morphe.patches.shared.patches.extractMetadataPatch
import java.util.logging.Logger

fun stripNativeLibrariesPatch(keepArchitecturesProvider: () -> List<CpuArchitecture> = ::emptyList) =
    rawResourcePatch {
        dependsOn(extractMetadataPatch)

        finalize {
            val keepArchitectures = keepArchitecturesProvider()
            if (keepArchitectures.isEmpty()) return@finalize

            val logger = Logger.getLogger(this::class.java.name)
            logger.info(
                "Stripping libs (keeping architectures ${keepArchitectures.joinToString(", ") { it.arch }})",
            )
            val strippedLibraries = mutableSetOf<String>()

            @Suppress("ConvertArgumentToSet")
            (cpuArchitectures - keepArchitectures).forEach {
                strippedLibraries.add(it.arch)
                get(NATIVE_LIBRARY_DIRECTORY, copy = false).resolve(it.arch).deleteRecursively()
            }
            logger.info("Stripped ${strippedLibraries.size} lib dirs")
        }
    }

val keepArmNativeLibraryPatch =
    stripNativeLibrariesPatch {
        listOf(CpuArchitecture.ARMEABI_V7A, CpuArchitecture.ARM64_V8A)
    }
