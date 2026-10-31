package io.github.hyperstown.patches.maps.misc.gms

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import io.github.hyperstown.patches.maps.shared.Constants.MAPS_PACKAGE_NAME

// Kept apart from the patches that use them: patches initialize as static fields, and a patch
// depending on one declared in a file that depends back on it would see it as null.

private val PACKAGE_NAME_REGEX = Regex("^[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+$")

internal val packageNameOption = stringOption(
    key = "packageName",
    default = "app.morphe.android.apps.maps",
    title = "Package name",
    description = "The package name of the patched app. It must differ from the original Google Maps " +
        "package name. Changing it later installs a separate app instead of updating the existing one.",
    required = true,
) { it != null && it != MAPS_PACKAGE_NAME && PACKAGE_NAME_REGEX.matches(it) }

internal val sharedExtensionPatch = bytecodePatch {
    extendWith("extensions/maps.mpe")
}
