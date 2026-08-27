package morningentree.morphe.patches.squarehome2.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Square Home 2",
        packageName = "com.ss.squarehome2",
        appIconColor = 0x00A6A6,
        targets = listOf(AppTarget("4.0.10")),
    )
}
