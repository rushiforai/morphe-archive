package app.d0nj.patches.novelreader

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_NOVEL_READER = Compatibility(
        packageName = "com.thien.novelreader",
        name = "AI Audio Novel Reader",
        appIconColor = 0x006200EE,
        targets = listOf(AppTarget(version = null)),
    )
}
