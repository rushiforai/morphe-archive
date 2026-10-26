/*
 * Copyright 2026 pixkk
 */
package app.morphe.patches.tiktok.shared

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.util.addInstructions

private const val DEFAULTS = "Lapp/pixkk/extension/core/Defaults;"

/**
 * Makes `Defaults.[method]()` answer [value], the number typed in a patch's options, so the app
 * starts with it until the setting is changed on the settings page.
 */
internal fun BytecodePatchContext.bakeDefault(method: String, value: Int) {
    val target = mutableClassDefBy(DEFAULTS).methods.singleOrNull { it.name == method && it.returnType == "I" }
        ?: throw PatchException("The extension's Defaults has no $method()")
    target.addInstructions(
        0,
        """
            const/16 v0, $value
            return v0
        """,
    )
}
