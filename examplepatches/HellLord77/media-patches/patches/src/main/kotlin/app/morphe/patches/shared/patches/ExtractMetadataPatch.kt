package app.morphe.patches.shared.patches

import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.resource.CpuArchitecture
import app.morphe.patches.shared.Constants.NATIVE_LIBRARY_DIRECTORY
import kotlin.properties.Delegates

var installerType: InstallerType by Delegates.notNull()
    private set

var apkArchitecture: ApkArchitecture by Delegates.notNull()
    private set

var packageMetadata: PackageMetadata by Delegates.notNull()
    private set

var cpuArchitectures: List<CpuArchitecture> by Delegates.notNull()
    private set

val extractMetadataPatch =
    rawResourcePatch {
        availability { installer, arch ->
            installerType = installer
            apkArchitecture = arch
            PatchAvailability.REQUIRED
        }

        dependsOn(
            bytecodePatch {
                execute {
                    app.morphe.patches.shared.patches.packageMetadata = packageMetadata
                }
            },
        )

        execute {
            cpuArchitectures =
                get(NATIVE_LIBRARY_DIRECTORY, copy = false)
                    .listFiles()
                    ?.filter { it.isDirectory }
                    ?.mapNotNull { CpuArchitecture.valueOfOrNull(it.name) } ?: emptyList()
        }
    }
