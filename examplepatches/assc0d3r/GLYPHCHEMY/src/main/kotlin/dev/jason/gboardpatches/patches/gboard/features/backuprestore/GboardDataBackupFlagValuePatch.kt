package dev.jason.gboardpatches.patches.gboard.features.backuprestore

import dev.jason.gboardpatches.patches.gboard.shared.GboardFlagFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardDataBackupFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Force only the selected Backup & Restore rollout flag.",
    feature = GboardFlagFamilyFeature.GBOARD_DATA_BACKUP,
)
