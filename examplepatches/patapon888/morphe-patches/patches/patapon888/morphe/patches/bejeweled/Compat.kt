package patapon888.morphe.patches.bejeweled

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

// The native patches are raw instruction edits, so only the exact build they were made for is supported.
internal val BEJEWELED_3 = Compatibility(
    name = "Bejeweled Classic",
    packageName = "com.ea.gp.bej3",
    targets = listOf(AppTarget("4.0.0", versionCode = 19300)),
    appIconColor = 0x8E3FD6
)
