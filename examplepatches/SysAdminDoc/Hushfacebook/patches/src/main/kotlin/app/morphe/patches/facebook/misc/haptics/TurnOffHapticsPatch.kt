/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.haptics

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

/**
 * Holds back the haptics Facebook plays on its own taps and gestures. See HapticsAnchors.kt for
 * what it changes, and the extension's Haptics for when.
 *
 * Off in the default selection: Facebook's haptics are a matter of taste, not something it does to
 * you. Picked, its switch starts on.
 */
@Suppress("unused")
val turnOffHapticsPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Turn off haptics",
    description = "Stops the short vibrations Facebook plays on its own taps and gestures. The keyboard and " +
        "your phone's own haptics stay. Its switch starts on, under Appearance.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch, facebookExtensionPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val owners = mutableSetOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith(EXTENSION_CLASSES)) return@classDefForEach
            if (classDef.methods.any(::playsHaptic)) owners += classDef.type
        }
        var views = 0
        var vibrations = 0
        for (type in owners) {
            val classDef = mutableClassDefByOrNull(type) ?: throw PatchException("$PATCH: $type went missing")
            classDef.methods.forEach { method ->
                val (view, vibration) = method.turnOffHaptics()
                views += view
                vibrations += vibration
            }
        }
        if (views == 0) throw PatchException("$PATCH: found no View haptic call outside the extension")
        if (vibrations == 0) throw PatchException("$PATCH: found no vibrator effect call outside the extension")
        enableStatus("turnOffHaptics")
    }
}
