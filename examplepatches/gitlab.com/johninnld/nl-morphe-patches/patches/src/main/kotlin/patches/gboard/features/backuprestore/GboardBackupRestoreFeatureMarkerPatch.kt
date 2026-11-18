package patches.gboard.features.backuprestore

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardBackupRestoreFeatureMarkerPatch = resourcePatch(
    description = "Mark the Backup & Restore feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(BACKUP_RESTORE_FEATURE_MARKER)
    }
}

internal const val BACKUP_RESTORE_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.backup_restore"
