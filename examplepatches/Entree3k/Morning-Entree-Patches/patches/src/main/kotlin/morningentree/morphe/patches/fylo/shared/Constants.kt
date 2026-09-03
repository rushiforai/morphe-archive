package morningentree.morphe.patches.fylo.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Fylo — File Manager",
        packageName = "com.aeroloom.fylofilemanager",
        appIconColor = 0x3DDC84,
        targets = listOf(
            AppTarget("1.9"),
        ),
    )
}
