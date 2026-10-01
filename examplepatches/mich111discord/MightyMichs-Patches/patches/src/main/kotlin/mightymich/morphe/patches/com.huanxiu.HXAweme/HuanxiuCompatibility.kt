package mightymich.morphe.patches.com.huanxiu.hxaweme

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object HuanxiuCompatibility {
    val HUANXIU = Compatibility(
        name = "Huanxiu Sleep",
        packageName = "com.huanxiu.HXAweme",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722,
        targets = listOf(
            AppTarget(version = "3.14.8")
        )
    )
}
