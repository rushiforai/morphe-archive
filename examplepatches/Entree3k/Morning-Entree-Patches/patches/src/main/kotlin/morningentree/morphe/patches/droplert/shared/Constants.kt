package morningentree.morphe.patches.droplert.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Droplert",
        packageName = "com.shahzaman.pricetracker",
        appIconColor = 0xDE5C53,
        targets = listOf(
            AppTarget("2.2.1"),
        ),
    )
}
