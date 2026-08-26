package morningentree.morphe.patches.athena.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Athena",
        packageName = "com.kin.athena",
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget(version = "1.5.6"),
        ),
    )
}
