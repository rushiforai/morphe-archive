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

    // Boostcamp
    val BOOSTCAMP_COMPATIBILITY = Compatibility(
        name = "Boostcamp",
        packageName = "com.bpmhealth.boostcamp",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x2A2132,
        targets = listOf(AppTarget(version = "262"))
    )

    // Built With Science
    val BUILT_WITH_SCIENCE_COMPATIBILITY = Compatibility(
        name = "Built With Science",
        packageName = "com.bws.appv2",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x111827,
        targets = listOf(AppTarget(version = "3.18.4"))
    )

    // Ganbaru Method
    val GANBARU_COMPATIBILITY = Compatibility(
        name = "Ganbaru Method",
        packageName = "com.ganbaru.method",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x111111,
        targets = listOf(AppTarget(version = "4.46.2"))
    )

    // MH Physique
    val MH_PHYSIQUE_COMPATIBILITY = Compatibility(
        name = "MH Physique",
        packageName = "app.mhphysique.fitness",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x2563EB,
        targets = listOf(AppTarget(version = "1.28.2"))
    )

    // MyoAdapt - Build Muscle Fast
    val MYOADAPT_COMPATIBILITY = Compatibility(
        name = "MyoAdapt - Build Muscle Fast",
        packageName = "com.myoadapt.app.android",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x111111,
        targets = listOf(AppTarget(version = "1.5.1"))
    )

    // RP Hypertrophy
    val RP_HYPERTROPHY_COMPATIBILITY = Compatibility(
        name = "RP Hypertrophy",
        packageName = "com.rp.hypertrophy",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xEC0915,
        targets = listOf(AppTarget(version = "1.2.0"))
    )

    // THENX
    val THENX_COMPATIBILITY = Compatibility(
        name = "THENX",
        packageName = "com.sysops.thenx",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xE53935,
        targets = listOf(AppTarget(version = "6.7.0"))
    )
}
