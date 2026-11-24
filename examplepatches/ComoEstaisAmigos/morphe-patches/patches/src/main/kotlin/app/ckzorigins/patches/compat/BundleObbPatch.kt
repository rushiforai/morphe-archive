package app.ckzorigins.patches.compat

import app.adebisi.patches.shared.emptyClasses
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.util.returnEarly
import java.util.zip.ZipFile

private const val OBB_LIB_PREFIX = "assets/libs/armeabi-v7a/"
private const val PROPERTIES_PATH = "res/raw/properties.dat"

internal const val EXPANSION_PREFIX = "Lcom/google/android/vending/expansion/"

/**
 * `Helpers` still reads `properties.dat` from UnityLauncherActivity, and `Helpers.Log` is
 * what the Play licensing client prints through. The rest is the OBB download.
 */
internal val KEPT_EXPANSION_TYPES = setOf(
    "Lcom/google/android/vending/expansion/downloader/Helpers;",
    "Lcom/google/android/vending/expansion/downloader/Helpers\$Log;",
)

/** How many expansion classes Glu's 2.0.1 ships besides [KEPT_EXPANSION_TYPES]. */
internal const val EMPTIED_EXPANSION_CLASSES = 64

/**
 * Copies the Origins OBB into the APK, moves the real Unity/Mono libraries under `lib/`,
 * turns OBB_ENABLED off, and skips the Glu signature check. The Play expansion downloader
 * is then dead: its 64 download classes become empty shells (same trick as OpenFeint on
 * CK Zombies), and the launcher jumps straight to Unity. Unnamed, so it is not a toggle:
 * [gluBackupPatch] depends on it, and every visible Origins patch depends on that.
 *
 * One antivirus engine, VBA32, already flags Glu's own APK as `Downloader.MSIL.gen.rexp`.
 * The Java expansion library is that downloader. Unity's Mono `System.dll` can still trip
 * the same generic MSIL heuristic after this runs.
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
        emptyExpansionDownloader()
        document("AndroidManifest.xml").use { ExpansionDownloaderManifest.strip(it) }
    }
}

internal fun emptyExpansionDownloader() {
    val expansion = buildList {
        classDefForEach { if (it.type.startsWith(EXPANSION_PREFIX)) add(it.type) }
    }
    val missing = KEPT_EXPANSION_TYPES.filter { it !in expansion }
    if (missing.isNotEmpty()) {
        throw PatchException("expansion downloader is missing ${missing.joinToString()}")
    }
    val toEmpty = expansion.filter { it !in KEPT_EXPANSION_TYPES }
    if (toEmpty.size != EMPTIED_EXPANSION_CLASSES) {
        throw PatchException(
            "Expected $EMPTIED_EXPANSION_CLASSES expansion download classes, found ${toEmpty.size}",
        )
    }
    emptyClasses(toEmpty.map { mutableClassDefBy(it) })
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
