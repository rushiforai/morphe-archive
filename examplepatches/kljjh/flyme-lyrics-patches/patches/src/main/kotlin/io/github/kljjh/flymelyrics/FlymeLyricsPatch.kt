package io.github.kljjh.flymelyrics

import app.morphe.patcher.patch.*

/** Loads on its own; the official source is a checked prerequisite at patch time. */
@Suppress("unused")
val flymeLyricsPatch = patch(
    name = "Flyme status bar lyrics",
    description = "Requires Third-party lyrics and Show mini-player lyrics from the official Morphe source. Mirrors the mini-player lyric text to Flyme."
) {
    compatibleWith(Compatibility(
        name = "YouTube Music",
        packageName = "com.google.android.apps.youtube.music",
        apkFileType = ApkFileType.APK_REQUIRED,
        targets = listOf(AppTarget(version = null, minSdk = 26))
    ))
    extendWith("extensions/flyme.mpe")

    // All sources finish execute before any finalize runs. The official extension is
    // therefore available even though the add-on loads in a separate class loader.
    finalize {
        val official = classDefByOrNull(OfficialHooks.LOCKSCREEN)
            ?: throw PatchException(OfficialHooks.MISSING_OFFICIAL)
        val miniplayer = classDefByOrNull(OfficialHooks.MINIPLAYER)
            ?: throw PatchException(OfficialHooks.MISSING_OFFICIAL)
        var selected = false
        classDefForEach { cls ->
            if (!cls.type.startsWith("Lapp/morphe/extension/") && !cls.type.startsWith("Lio/github/kljjh/flymelyrics/")) {
                selected = selected || OfficialHooks.hostHooks(cls)
            }
        }
        OfficialHooks.requireSelection(selected)
        if (classDefByOrNull(OfficialHooks.UTILS)?.methods?.none {
                it.name == "getContext" && it.parameterTypes.isEmpty() && it.returnType == "Landroid/content/Context;"
            } != false) throw PatchException("Unsupported official shared extension: Utils.getContext is missing.")
        // Validate the official API before editing. Unknown upstream layouts fail visibly.
        OfficialHooks.instrument(mutableClassDefBy(official))
        OfficialHooks.instrumentMiniplayer(mutableClassDefBy(miniplayer))
    }
}
