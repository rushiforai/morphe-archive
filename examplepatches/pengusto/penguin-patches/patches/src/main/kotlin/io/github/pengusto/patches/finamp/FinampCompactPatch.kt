package io.github.pengusto.patches.finamp

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.rawResourcePatch

/** Compiled with the shared implementation but packaged only in the compact bundle. */
@Suppress("unused")
val finampCompletePatch = rawResourcePatch(
    name = "Finamp complete: all eight fixes",
    description = "Apply all eight Penguin Finamp fixes together, including song artist order and album/track information. " +
        "Requires the original official Finamp 1.0.1 APK; produces ARM64-only output.",
    default = true,
) {
    compatibleWith(Compatibility(name = "Finamp", packageName = "com.unicornsonlsd.finamp",
        targets = listOf(AppTarget(version = "1.0.1"))))
    execute { applyFinampComposition(255) }
}
