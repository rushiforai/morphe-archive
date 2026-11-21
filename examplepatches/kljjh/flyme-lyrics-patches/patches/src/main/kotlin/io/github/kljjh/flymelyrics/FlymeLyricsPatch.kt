package io.github.kljjh.flymelyrics

import app.morphe.patcher.patch.*

/** Loads on its own; the official source is a checked prerequisite at patch time. */
@Suppress("unused")
val flymeLyricsPatch = patch(
    name = "Flyme status bar lyrics",
    description = "Requires official Third-party lyrics. Adds an independent Flyme status bar lyrics switch (on by default)."
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
        OfficialHooks.validateReader { classDefByOrNull(it) }
        OfficialHooks.instrument(mutableClassDefBy(official))
        val prefs = classDefByOrNull(OfficialHooks.PREFS) ?: throw PatchException("Unsupported official music settings screen")
        OfficialHooks.instrumentTiming(mutableClassDefBy(OfficialHooks.FORMATTER), mutableClassDefBy(OfficialHooks.PRESENTATION))
        OfficialHooks.instrumentSettings(mutableClassDefBy(miniplayer), mutableClassDefBy(prefs))
    }
}
