package app.morphe.patches.google.common.versions

import app.morphe.patches.google.common.AppVersionProfile
import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.TargetSpec

val gemini10958859967 = AppVersionProfile(
    appName = "Gemini launcher",
    packageName = "com.google.android.apps.bard",
    versionName = "1.0.958859967",
    versionCode = "332",
    inputSha256 = mapOf("gemini-base.apk" to "d080d9d12b78d313bc9bb72f8ee46d131e0d6e30db15901a1a3994a79b969ef6"),
    validation = listOf("2026-09-06: launcher used with verified Google 17.54.18; regenerated DEX matches working build"),
    hooks = mapOf(
        HookId.GEMINI_TARGET_REDIRECT to TargetSpec(
            anchorStrings = listOf("com.google.android.googlequicksearchbox"),
            expectedMatches = 7,
            description = "Replace seven exact-package string references with the cloned Google package."
        ),
        HookId.SPLIT_RESTRICTION_REMOVAL to TargetSpec(description = "Remove requiredSplitTypes, splitTypes and vending.splits metadata."),
        HookId.APP_LABEL_UPDATE to TargetSpec(description = "Gemini (Morphe)")
    )
)
