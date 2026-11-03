package app.morphe.patches.google.common.versions

import app.morphe.patches.google.common.AppVersionProfile
import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.TargetSpec

val gemini10995038376 = AppVersionProfile(
    appName = "Gemini launcher",
    packageName = "com.google.android.apps.bard",
    versionName = "1.0.995038376",
    versionCode = "345",
    inputSha256 = mapOf("gemini-base.apk" to "af62293b20afe73748ff23eb7de7836f3322b62881291ac88434629cdf58afbe"),
    validation = listOf("2026-11-03: four exact-package references; user confirmed Secure Folder chat send/response after component restoration fix"),
    hooks = mapOf(
        HookId.GEMINI_TARGET_REDIRECT to TargetSpec(
            anchorStrings = listOf("com.google.android.googlequicksearchbox"),
            expectedMatches = 4,
            description = "Replace four exact-package string references with the cloned Google package."
        ),
        HookId.SPLIT_RESTRICTION_REMOVAL to TargetSpec(description = "Remove requiredSplitTypes, splitTypes and vending.splits metadata."),
        HookId.APP_LABEL_UPDATE to TargetSpec(description = "Gemini (Morphe)")
    )
)
