/*
 * Copyright 2026 pixkk
 */
package app.morphe.patches.tiktok.interaction.feedtext

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.shared.bakeDefault
import app.morphe.util.addInstruction

private const val EXTENSION = "Lapp/pixkk/extension/feed/SoundNameScroll;"

@Suppress("unused")
val soundNameScrollPatch = bytecodePatch(
    name = "Scroll sound name",
    description = "Scrolls a sound name that is wider than its row along the row, the way the " +
        "feed did before the redesign, instead of ending it in dots. The speed is set in the " +
        "Pixkk Patches settings. Starts off. Turn it on there.",
) {
    category("Interface")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(sharedExtensionPatch)

    val scrollSpeed by intOption(
        key = "scrollSpeed",
        default = 40,
        title = "Scroll speed",
        description = "How fast the name scrolls, from 10 to 200. A patched app starts with it " +
            "until it is changed on the settings page.",
    )

    execute {
        bakeDefault("soundScrollSpeed", (scrollSpeed ?: 40).coerceIn(10, 200))

        // The music row's title setter, which every title TikTok writes goes through. p0 is the
        // music component; the extension finds the title view in it once the write is done.
        MusicRowTitleFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION->titleChanged(Ljava/lang/Object;)V",
        )
    }
}
