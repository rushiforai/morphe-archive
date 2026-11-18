package patches.gboard.features.backuprestore

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.shared.childElements
import patches.gboard.shared.ensureManifestComponent
import patches.gboard.shared.gboardPatchesSettingsPatch
import patches.gboard.shared.removeManifestAndroidAttribute
import patches.gboard.shared.setManifestAndroidAttribute
import patches.gboard.Constants.COMPATIBILITY_GBOARD
import org.w3c.dom.Document

internal val gboardBackupRestoreManifestPatch = resourcePatch(
    description = "Inject the Backup & Restore cold-start flag-store initializer.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesSettingsPatch)

    finalize {
        document("AndroidManifest.xml").use(::applyGboardBackupRestoreManifest)
    }
}

internal fun applyGboardBackupRestoreManifest(document: Document) {
    val manifest = document.documentElement
    val application = manifest.childElements("application").singleOrNull()
        ?: error("Expected exactly one application element in AndroidManifest.xml")
    val packageName = manifest.getAttribute("package")
    check(packageName.isNotBlank()) { "AndroidManifest.xml is missing its package name" }

    ensureManifestComponent(
        document,
        application,
        "provider",
        BACKUP_RESTORE_INIT_PROVIDER_CLASS,
    ).apply {
        setManifestAndroidAttribute(
            "authorities",
            packageName + BACKUP_RESTORE_INIT_PROVIDER_AUTHORITY_SUFFIX,
        )
        setManifestAndroidAttribute("exported", "false")
        setManifestAndroidAttribute("initOrder", Int.MAX_VALUE.toString())
        removeManifestAndroidAttribute("process")
    }
}

internal const val BACKUP_RESTORE_INIT_PROVIDER_CLASS =
    "dev.jason.gboardpatches.extension.backuprestore.flagstore.GboardFlagStoreInitProvider"
internal const val BACKUP_RESTORE_INIT_PROVIDER_AUTHORITY_SUFFIX =
    ".gboardpatches.flagstore.init"
