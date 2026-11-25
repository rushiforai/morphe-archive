package app.jofslash.patches.wikipedia.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME = "org.wikipedia"

    /** SHA-1 of the Wikimedia Foundation's signing certificate (OU=Mobile, San Francisco). */
    const val SIGNATURE = "d21a6a91aa75c937c4253770a8f7025c6c2a8319"

    /**
     * The Wikipedia app is open source and its release build keeps its class and method names, so
     * the patches look things up by name. R8 still inlines and merges small helpers (Prefs,
     * SurveyDialog, the Test Kitchen classes), which is why some patches work one step around them.
     */
    val COMPATIBILITY_WIKIPEDIA = Compatibility(
        name = "Wikipedia",
        packageName = PACKAGE_NAME,
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget(version = "50619-r-2026-11-18"),
            AppTarget(version = null, isExperimental = true),
        )
    )
}
