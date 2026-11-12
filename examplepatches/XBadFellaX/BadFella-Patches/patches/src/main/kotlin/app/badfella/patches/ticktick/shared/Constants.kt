package app.badfella.patches.ticktick.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TICKTICK = Compatibility(
        name = "TickTick",
        packageName = "com.ticktick.task",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x4870F8,
        targets = listOf(
            AppTarget(version = "8.3.0.1", versionCode = 8301, description = "Version 8.3.0.1, build 8301."),
            // Every patch resolves its own class, method and instruction anchors rather than
            // offsets, so later TickTick builds can be patched without a version pin. Morphe
            // flags this target as experimental and each patch fails closed on a changed anchor.
            AppTarget(
                version = null,
                isExperimental = true,
                description = "Any version (experimental). Every patch verifies its own anchors.",
            ),
        ),
    )
}
