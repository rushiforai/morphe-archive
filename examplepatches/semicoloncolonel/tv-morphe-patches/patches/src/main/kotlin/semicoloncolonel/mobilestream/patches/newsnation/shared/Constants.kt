package semicoloncolonel.mobilestream.patches.newsnation.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

// NewsNation ships two different apps under one package name: the phone app
// (React Native, 510.x) and the Android TV app (a Haystack TV build, 4.x).
// Morphe Manager lists both apps' patches together, so the patches for one
// build are labeled and do nothing on the other.
object Constants {
    val COMPATIBILITY = Compatibility(
        name = "NewsNation",
        packageName = "com.nexstar.newsnation",
        description = "The NewsNation app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x13284B,
        targets = listOf(AppTarget(version = "4.94", versionCode = 8335), AppTarget("4.71", versionCode = 8294)),
        formFactor = FormFactor.TV,
    )
}
