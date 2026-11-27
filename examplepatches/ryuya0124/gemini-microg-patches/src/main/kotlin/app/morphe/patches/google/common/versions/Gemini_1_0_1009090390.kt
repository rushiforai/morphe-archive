package app.morphe.patches.google.common.versions

import app.morphe.patches.google.common.HookId

val gemini101009090390 = gemini10995038376.copy(
    versionName = "1.0.1009090390",
    versionCode = "353",
    inputSha256 = mapOf("gemini-base.apk" to "62f3e9bed2b3d96ac1f32955c76161e49cbd317adf5f75534fe4095b3502ab85"),
    validation = listOf(
        "2026-11-26: Google-signed Play Store base from an arm64 device; five exact package-name strings found",
        "2026-11-26: default MPP generated a standalone APK; API 37 emulator launched the cloned Google MainActivity"
    ),
    hooks = gemini10995038376.hooks + (HookId.GEMINI_TARGET_REDIRECT to
        gemini10995038376.hooks.getValue(HookId.GEMINI_TARGET_REDIRECT).copy(
            expectedMatches = 5,
            description = "Replace five exact-package references with the cloned Google package."
        ))
)
