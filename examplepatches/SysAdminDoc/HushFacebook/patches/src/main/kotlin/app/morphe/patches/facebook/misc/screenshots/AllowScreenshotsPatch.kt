/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.screenshots

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

/**
 * Lets screenshots and screen recordings show the screens Facebook marks secure. See
 * AllowScreenshotsAnchors.kt for what it changes, and the extension's Screenshots for when.
 *
 * Off in the default selection: a secure screen is one Facebook means to keep out of screenshots,
 * so showing it is a choice to make. Picked, its switch starts on.
 */
@Suppress("unused")
val allowScreenshotsPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Allow screenshots",
    description = "Lets you take screenshots and record the screen on the pages Facebook blocks them on. Its switch " +
        "starts on, under Privacy.",
    default = false,
) {
    category("Privacy")
    dependsOn(settingsPatch, facebookExtensionPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val owners = mutableSetOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith(EXTENSION_CLASSES)) return@classDefForEach
            if (classDef.methods.any(::setsWindowFlags)) owners += classDef.type
        }
        val sent = owners.sumOf { type -> mutableClassDefByOrNull(type)?.methods?.sumOf { it.allowScreenshots() } ?: 0 }
        if (sent == 0) throw PatchException("$PATCH: found no window flag call or layout flags write outside the extension")
        enableStatus("allowScreenshots")
    }
}
