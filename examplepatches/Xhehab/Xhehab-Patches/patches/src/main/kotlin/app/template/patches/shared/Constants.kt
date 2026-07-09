package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // TrainWise — Workout & Fitness Coach
    val TRAINWISE_COMPATIBILITY = Compatibility(
        name = "TrainWise - Workout & Fitness Coach",
        packageName = "com.trainwiseapp.app",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x00C853,
        targets = listOf(AppTarget(version = "1.4.10"))
    )

    // STNDRD — Workout & Fitness Plans
    val STNDRD_COMPATIBILITY = Compatibility(
        name = "STNDRD - Workout & Fitness Plans",
        packageName = "uni.cbum",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x111111,
        targets = listOf(AppTarget(version = "4.1.44"))
    )

    // FST-7
    val FST7_COMPATIBILITY = Compatibility(
        name = "FST-7",
        packageName = "com.influencers.fst7",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0xD7262E,
        targets = listOf(AppTarget(version = "4.0.1"))
    )

    // Video Player All Format
    val VIDEO_PLAYER_COMPATIBILITY = Compatibility(
        name = "Video Player All Format",
        packageName = "video.player.videoplayer",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x18DC14,
        targets = listOf(AppTarget(version = "2.6.2"))
    )
}
