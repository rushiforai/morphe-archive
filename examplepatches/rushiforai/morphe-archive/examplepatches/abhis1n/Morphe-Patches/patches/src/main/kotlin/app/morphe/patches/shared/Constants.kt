package app.morphe.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val SPLITWISE = Compatibility(
        name = "Splitwise",
        packageName = "com.Splitwise.SplitwiseMobile",
        appIconColor = 0xFF0045,
        targets = listOf(
            AppTarget(
            version = "26.5.5",
            )
        )
    )
}
