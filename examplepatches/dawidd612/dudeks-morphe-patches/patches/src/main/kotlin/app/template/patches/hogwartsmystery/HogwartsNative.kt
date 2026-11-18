package app.template.patches.hogwartsmystery

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.rawResourcePatch
import java.io.File
import java.io.RandomAccessFile
import java.security.MessageDigest

private const val PACKAGE_NAME = "com.tinyco.potter"
private const val VERSION = "7.3.4"
private const val VERSION_CODE = 7030400

internal enum class PotterAbi(val directory: String, val abi: SupportedAbi, val sha256: String) {
    ARM64("arm64-v8a", SupportedAbi.ARM64_V8A, "dbf76481e639efebd57beb2ae8c84bd74dab507e4cc029c2f1bd5dfde5c6e22e"),
    X64("x86_64", SupportedAbi.X86_64, "dbacc390a56799093562bd356e2d7141038eb826d06813e790d1d829d55658e1"),
}

internal val hogwartsCompatibility = Compatibility(
    name = "Harry Potter: Hogwarts Mystery",
    packageName = PACKAGE_NAME,
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x709CA0,
    targets = listOf(
        AppTarget(
            version = VERSION,
            versionCodes = PotterAbi.entries.associate { it.abi to VERSION_CODE },
            isExperimental = true,
            description = "Requires the original 7.3.4 APKM and an ARM64 or x86_64 device.",
        ),
    ),
)

internal class PotterEdit(val offset: Long, original: String, replacement: String) {
    val original = original.hexToByteArray()
    val replacement = replacement.hexToByteArray()

    init {
        require(offset >= 0 && this.original.isNotEmpty() && this.original.size == this.replacement.size)
    }
}

private fun ResourcePatchContext.potterLibraries(): Map<PotterAbi, File> {
    val libraries = PotterAbi.entries.mapNotNull { abi ->
        get("lib/${abi.directory}/libpotter.so").takeIf(File::isFile)?.let { abi to it }
    }.toMap()
    if (libraries.isEmpty()) {
        throw PatchException("Hogwarts Mystery requires the ARM64 or x86_64 split from the full original 7.3.4 APKM.")
    }
    return libraries
}

// All visible patches share this dependency. Hash clean inputs once, before any native edit.
internal val verifyHogwartsBuild = rawResourcePatch {
    execute {
        if (packageMetadata.packageName != PACKAGE_NAME || packageMetadata.versionName != VERSION ||
            packageMetadata.versionCode != VERSION_CODE.toString()
        ) {
            throw PatchException("Use Hogwarts Mystery 7.3.4 (7030400) for these patches.")
        }
        for ((abi, library) in potterLibraries()) {
            val digest = MessageDigest.getInstance("SHA-256")
            library.inputStream().use { input ->
                val buffer = ByteArray(64 * 1024)
                while (true) {
                    val count = input.read(buffer)
                    if (count < 0) break
                    digest.update(buffer, 0, count)
                }
            }
            if (digest.digest().toHexString() != abi.sha256) {
                throw PatchException("Unrecognized Hogwarts Mystery ${abi.directory} libpotter.so. Use the original APKM.")
            }
        }
    }
}

internal fun ResourcePatchContext.editPotterLibraries(arm64: List<PotterEdit>, x64: List<PotterEdit>) {
    val libraries = potterLibraries()
    val edits = mapOf(PotterAbi.ARM64 to arm64, PotterAbi.X64 to x64)
    for ((abi, library) in libraries) {
        RandomAccessFile(library, "r").use { file ->
            for (edit in edits.getValue(abi)) {
                val actual = ByteArray(edit.original.size)
                if (edit.offset <= file.length() - actual.size) {
                    file.seek(edit.offset)
                    file.readFully(actual)
                    if (actual.contentEquals(edit.original)) continue
                }
                throw PatchException("Unexpected Hogwarts Mystery ${abi.directory} instructions at 0x${edit.offset.toString(16)}.")
            }
        }
    }
    for ((abi, library) in libraries) {
        RandomAccessFile(library, "rw").use { file ->
            for (edit in edits.getValue(abi)) {
                file.seek(edit.offset)
                file.write(edit.replacement)
            }
        }
    }
}
