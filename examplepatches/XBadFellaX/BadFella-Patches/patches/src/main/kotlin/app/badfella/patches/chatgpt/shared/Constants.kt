package app.badfella.patches.chatgpt.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CHATGPT = Compatibility(
        name = "ChatGPT",
        packageName = "com.openai.chatgpt",
        // ChatGPT ships as a bundle with an ABI split and a base APK.
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x10A37F,
        targets = listOf(
            AppTarget(
                version = "1.2026.307",
                versionCode = 2630718,
                description = "Version 1.2026.307, build 2630718.",
            ),
            // The manifest rename and the bytecode hooks resolve their own anchors rather than
            // offsets, so later ChatGPT builds can be patched without a version pin. Morphe flags
            // this target as experimental and the patch fails closed on a changed anchor.
            AppTarget(
                version = null,
                isExperimental = true,
                description = "Any version (experimental). Every patch verifies its own anchors.",
            ),
        ),
    )
}
