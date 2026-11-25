package dev.jason.gboardpatches.patches.gboard.features.ioslayout

import app.morphe.patcher.patch.resourceFile

/**
 * Writes an XML file bundled with the patches (under `gboard-ios-layouts/<dir>/`) to [target] in
 * the APK, after expanding the `{{0x...}}` resource placeholders with [ids]. [transform] runs on
 * the text before that, so a patch can write several variants of one bundled file.
 *
 * Ported from twelvehouse/gboard-ios-style-jp-en-morphe-patches (GPLv3).
 */
internal fun writeBundledLayout(
    ids: GboardLayoutResourceIds,
    dir: String,
    bundled: String,
    target: String,
    transform: (String) -> String = { text -> text },
) {
    val text = GboardBundledLayouts::class.java
        .getResourceAsStream("/gboard-ios-layouts/$dir/$bundled")
        ?.use { stream -> stream.readBytes().toString(Charsets.UTF_8) }
        ?: error("Missing bundled layout gboard-ios-layouts/$dir/$bundled")
    resourceFile(target, false).apply {
        parentFile.mkdirs()
        writeText(ids.expand(transform(text)), Charsets.UTF_8)
    }
}

private object GboardBundledLayouts
