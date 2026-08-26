package morningentree.morphe.patches.mlmanager.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "ML Manager",
        packageName = "com.javiersantos.mlmanager",
        appIconColor = 0x2196F3,
        targets = listOf(
            AppTarget("5.0"),
        ),
    )
}
