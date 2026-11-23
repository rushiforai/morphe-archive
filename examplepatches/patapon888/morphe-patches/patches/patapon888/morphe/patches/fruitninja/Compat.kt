package patapon888.morphe.patches.fruitninja

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

// The patches are raw edits of the IL2CPP game library, so only the exact build they were made for is supported.
internal val FRUIT_NINJA_CLASSIC = Compatibility(
    name = "Fruit Ninja Classic",
    packageName = "com.halfbrick.fruitninja",
    targets = listOf(AppTarget("3.39.3", versionCode = 89972000)),
    appIconColor = 0x3E8E2F
)
