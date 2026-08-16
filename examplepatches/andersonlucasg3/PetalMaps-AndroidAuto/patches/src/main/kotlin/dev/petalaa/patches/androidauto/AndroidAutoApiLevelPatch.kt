package dev.petalaa.patches.androidauto

import dev.petalaa.patches.androidauto.Constants.COMPATIBILITY_PETAL_MAPS
import app.morphe.patcher.patch.resourcePatch

/**
 * Resource patch that adds the Android Auto API level file required by
 * androidx.car.app at runtime.
 *
 * The CarApp library reads this file via:
 *   ClassLoader.getResourceAsStream("car-app-api.level")
 *
 * It must live at the ROOT of the APK (classpath resource, NOT an Android
 * resource), with content "8\n" (2 bytes: 0x38 0x0A).
 *
 * Written in [finalize] (raw zip entry, no aapt2/arsc registration needed).
 */
@Suppress("unused")
val androidAutoApiLevelPatch = resourcePatch(
    name = "Android Auto API Level File",
    description = "Adds car-app-api.level to the APK root for androidx.car.app compatibility.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PETAL_MAPS)

    finalize {
        val path = "car-app-api.level"
        val file = this[path]
        if (!file.exists()) {
            file.writeBytes("8\n".toByteArray(Charsets.UTF_8))
        }
    }
}