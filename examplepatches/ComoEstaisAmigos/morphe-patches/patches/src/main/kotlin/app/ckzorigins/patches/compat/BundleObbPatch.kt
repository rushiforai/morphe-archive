package app.ckzorigins.patches.compat

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.util.returnEarly
import java.util.zip.ZipFile

private const val OBB_LIB_PREFIX = "assets/libs/armeabi-v7a/"
private const val PROPERTIES_PATH = "res/raw/properties.dat"

/**
 * Copies the Origins OBB into the APK, moves the real Unity/Mono libraries under `lib/`,
 * turns OBB_ENABLED off, and skips the Glu signature check. Unnamed, so it is not a toggle:
 * [gluBackupPatch] depends on it, and every visible Origins patch depends on that.
 */
internal val bundleObbPatch = patch {
    execute {
        val obb = packageMetadata.obbFiles.values.singleOrNull()
            ?: throw PatchException("Patch a split app bundle that includes the OBB, not a single APK")

        ZipFile(obb).use { zip ->
            val entries = zip.entries()
            while (entries.hasMoreElements()) {
                val entry = entries.nextElement()
                if (entry.isDirectory) continue
                val dest = remapObbEntry(entry.name)
                val file = resourceFile(dest, copy = false)
                file.parentFile?.mkdirs()
                zip.getInputStream(entry).use { input ->
                    file.outputStream().use { output -> input.copyTo(output) }
                }
            }
        }

        val properties = resourceFile(PROPERTIES_PATH, copy = true)
        if (!properties.exists()) throw PatchException("$PROPERTIES_PATH is missing from this APK")
        properties.writeBytes(PropertiesDat.disableObb(properties.readBytes()))

        VerifySignatureFingerprint.method.returnEarly()
    }
}

internal fun remapObbEntry(name: String): String {
    val normalized = name.replace('\\', '/')
    if (normalized.startsWith("/") || normalized.split('/').any { it == ".." }) {
        throw PatchException("OBB entry has an unsafe path: $name")
    }
    if (normalized.startsWith(OBB_LIB_PREFIX) && normalized.endsWith(".so")) {
        return "lib/armeabi-v7a/" + normalized.removePrefix(OBB_LIB_PREFIX)
    }
    return normalized
}
