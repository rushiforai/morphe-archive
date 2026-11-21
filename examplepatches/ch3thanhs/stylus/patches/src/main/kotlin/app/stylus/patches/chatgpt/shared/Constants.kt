package app.stylus.patches.chatgpt.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CHATGPT = Compatibility(
        name = "ChatGPT",
        packageName = "com.openai.chatgpt",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x111111,
        signatures = setOf(
            "b24f4bfbb3cf293f938703b9d87027c1102cc36dc4fa206910e08927db40473c"
        ),
        targets = listOf(
            AppTarget(
                version = "1.2026.321",
                minSdk = 29,
            ),
        ),
    )
}
