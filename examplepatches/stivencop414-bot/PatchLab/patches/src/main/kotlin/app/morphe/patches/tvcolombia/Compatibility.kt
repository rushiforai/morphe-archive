package app.morphe.patches.tvcolombia

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val tvColombia = Compatibility(
    name = "TV Colombia Play",
    packageName = "colombia.tv.plus",
    apkFileType = ApkFileType.XAPK,
    signatures = setOf("58469bf5383c2348f5082835eef797d179d9f065cb8e64c409e0e7382967dce2"),
    targets = listOf(AppTarget(version = "1015", versionCode = 20)),
)
