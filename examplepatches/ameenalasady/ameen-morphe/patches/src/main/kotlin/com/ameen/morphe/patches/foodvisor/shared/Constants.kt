package com.ameen.morphe.patches.foodvisor.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

val COMPATIBILITY_FOODVISOR = Compatibility(
    name = "Foodvisor",
    packageName = "io.foodvisor.foodvisor",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xFF5C8A, // Just an example color
    targets = listOf(
        AppTarget(version = "7.0.0-3")
    )
)
