package ajstrick81.morphe.patches.rte.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "RTÉ Player Android TV",
        packageName = "com.twentyfouri.tvbridge.rte",
        appIconColor = 0x00A05A,
        targets = listOf(AppTarget("3.160.3"))
    )
}
