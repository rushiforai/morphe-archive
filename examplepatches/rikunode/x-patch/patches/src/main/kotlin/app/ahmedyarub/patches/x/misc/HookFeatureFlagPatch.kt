package app.ahmedyarub.patches.x.misc

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.ahmedyarub.patches.x.shared.featureFlagsPatch
import app.ahmedyarub.patches.x.shared.forceFeatureFlag
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringsOption

/**
 * piko offered a flag editor in its settings screen. 12.30 has no settings screen to add it to
 * yet, so the flags are set when patching.
 */
@Suppress("unused")
val hookFeatureFlagPatch = bytecodePatch(
    name = "Hook feature flag",
    description = "Overrides the app's feature switches with values chosen when patching.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(featureFlagsPatch)

    val flags by stringsOption(
        key = "flags",
        default = emptyList(),
        title = "Feature switches",
        description = "One key=value per entry, e.g. some_feature_enabled=true. " +
            "true and false set a boolean, whole numbers an integer, other numbers a decimal, and anything else a string.",
    )

    execute {
        flags.orEmpty().filter { it.isNotBlank() }.forEach { entry ->
            val (key, value) = entry.split('=', limit = 2).map { it.trim() }
                .takeIf { it.size == 2 && it[0].isNotEmpty() }
                ?: throw PatchException("Feature switch entries must be key=value: $entry")

            forceFeatureFlag(
                key,
                value.toBooleanStrictOrNull() ?: value.toLongOrNull() ?: value.toDoubleOrNull() ?: value,
            )
        }
    }
}
