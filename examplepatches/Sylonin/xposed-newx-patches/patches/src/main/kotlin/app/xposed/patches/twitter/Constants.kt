package app.xposed.patches.twitter

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException

object Constants {
    const val EXTENSION_PATH = "extensions/extension.mpe"
    const val HOOKS_CLASS = "Lapp/xposed/extension/Hooks;"
    const val BRIDGE_CLASS = "Lapp/xposed/extension/ComposeBridge;"

    /** Oldest X release the patch supports. Newer releases are accepted too. */
    const val MIN_VERSION = "12.40.1-prod.01"

    /**
     * The Compose-based X ("NewX"). Morphe targets can only name exact versions, so any version
     * is declared here and the patch rejects versions older than [MIN_VERSION] itself.
     */
    val COMPATIBILITY_NEW_X = Compatibility(
        name = "NewX",
        packageName = "com.twitter.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(AppTarget(version = null)),
    )

    /** Throws if X [version] is older than [MIN_VERSION]. */
    fun requireMinVersion(version: String) {
        if (compareVersions(version, MIN_VERSION) < 0) {
            throw PatchException("X $version is not supported. Use $MIN_VERSION or newer.")
        }
    }

    /** Compares the numbers in two X version names: 12.40.1-prod.01 is 12, 40, 1, 1. */
    private fun compareVersions(a: String, b: String): Int {
        val partsA = versionParts(a)
        val partsB = versionParts(b)
        for (i in 0 until maxOf(partsA.size, partsB.size)) {
            val cmp = partsA.getOrElse(i) { 0 }.compareTo(partsB.getOrElse(i) { 0 })
            if (cmp != 0) return cmp
        }
        return 0
    }

    private fun versionParts(version: String) = Regex("\\d+").findAll(version).map { it.value.toLong() }.toList()
}
