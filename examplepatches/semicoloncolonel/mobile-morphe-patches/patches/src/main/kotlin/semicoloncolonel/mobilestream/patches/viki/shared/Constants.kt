package semicoloncolonel.mobilestream.patches.viki.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

// Rakuten Viki, the Asian drama streaming app. A native Android app with no
// Pairip, packer, or VM protection, so it patches with the normal toolchain.
// The native code is split per ABI in the app bundle, so patch the whole
// bundle: APKPure's file is missing the 64-bit split and closes on launch on
// 64-bit-only phones.
object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Viki",
        packageName = "com.viki.android",
        description = "The Rakuten Viki app for phones.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0C9BFF,
        targets = listOf(
            AppTarget("26.23.0", versionCode = 794796531, description = "Phone build", isExperimental = true),
        )
    )
}
