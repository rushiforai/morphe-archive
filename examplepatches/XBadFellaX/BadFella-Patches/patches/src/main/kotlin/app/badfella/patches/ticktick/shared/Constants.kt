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
            // 8.3.0.2 renamed the reminder privacy gate's class (Ltv8 -> Lov8). The previous
            // 8.3.0.1 build is served by the older bundle; declaring it here would offer a
            // version whose reminder gate no longer resolves.
            AppTarget(version = "8.3.0.2", versionCode = 8302, description = "Version 8.3.0.2, build 8302."),
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
