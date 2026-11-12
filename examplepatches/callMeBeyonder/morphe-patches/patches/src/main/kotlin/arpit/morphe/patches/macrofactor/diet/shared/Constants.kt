package arpit.morphe.patches.macrofactor.diet.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * MacroFactor (`com.sbs.diet`) — the nutrition tracker, not to be confused with
     * MacroFactor Workouts (`com.sbs.train`).
     *
     * Distribution is a split-required XAPK from APKPure
     * (base + config.arm64_v8a + config.en + config.ja + config.xxhdpi).
     */
    val COMPATIBILITY_MACROFACTOR_DIET = Compatibility(
        name = "MacroFactor",
        packageName = "com.sbs.diet",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget(
                version = "5.8.11"
            )
        )
    )
}
