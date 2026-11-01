package semicoloncolonel.mobilestream.patches.starz.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Starz",
        packageName = "com.bydeluxe.d3.android.program.starz",
        description = "The Starz phone and tablet app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(AppTarget("6.11.0"))
    )
}
