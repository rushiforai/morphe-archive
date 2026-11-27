package dev.srwi.gintype.patches.gboard.registry

import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.ResourcePatchBuilder
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import dev.srwi.gintype.patches.gboard.features.packagerename.applyGboardApplicationDisplayName
import dev.srwi.gintype.patches.gboard.features.packagerename.gboardPackageRenameResourcePatch
import dev.srwi.gintype.patches.gboard.features.packagerename.isValidGboardAppDisplayName
import com.google.gson.GsonBuilder
import com.google.gson.JsonObject
import dev.srwi.gintype.patches.gboard.features.customholdpopups.gboardCustomHoldPopupsBytecodePatch
import dev.srwi.gintype.patches.gboard.features.customholdpopups.gboardCustomHoldPopupsFeatureMarkerPatch
import dev.srwi.gintype.patches.gboard.features.thicctopbar.gboardThiccTopBarBytecodePatch
import dev.srwi.gintype.patches.gboard.features.thicctopbar.gboardThiccTopBarFeatureMarkerPatch
import dev.srwi.gintype.patches.gboard.features.multiglide.gboardMultiGlideBytecodePatch
import dev.srwi.gintype.patches.gboard.features.multiglide.gboardMultiGlideFeatureMarkerPatch
import dev.srwi.gintype.patches.gboard.features.typingeffects.gboardTypingEffectsBytecodePatch
import dev.srwi.gintype.patches.gboard.features.typingeffects.gboardTypingEffectsFeatureMarkerPatch
import dev.srwi.gintype.patches.gboard.shared.gboardPatchesSettingsPatch
import dev.srwi.gintype.patches.gboard.shared.generated.GboardTargetAdmission
import dev.srwi.gintype.patches.shared.Constants.COMPATIBILITY_GBOARD

private fun gboardPublicResourcePatch(
    featureId: String,
    name: String,
    description: String,
    default: Boolean,
    block: ResourcePatchBuilder.() -> Unit,
) = GboardTargetAdmission.admittedContributions(featureId).let { admitted ->
    resourcePatch(
        name = name.takeIf { admitted.isNotEmpty() },
        description = description,
        default = default,
    ) {
        if (admitted.isNotEmpty()) {
            block()
            GboardContributionWiring.wireContributions(featureId, admitted, this)
        }
    }
}

@Suppress("unused")
val gboardThiccTopBarPatch = gboardPublicResourcePatch(
    featureId = "thicc_top_bar",
    name = "Thicc Top Bar",
    description = "Vertical word suggestions with up/down swipe and 2D sentence matrix.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardThiccTopBarFeatureMarkerPatch,
        gboardThiccTopBarBytecodePatch,
    )
}

@Suppress("unused")
val gboardMultiGlidePatch = gboardPublicResourcePatch(
    featureId = "multiglide",
    name = "MultiGlide",
    description = "Two-finger swipe and tap+swipe chorded gesture typing powered by the Kinetica algorithm and Gboard dictionary.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardMultiGlideFeatureMarkerPatch,
        gboardMultiGlideBytecodePatch,
    )
}

@Suppress("unused")
val gboardTypingEffectsPatch = gboardPublicResourcePatch(
    featureId = "typing_effects",
    name = "Typing Effects",
    description = "Visual typing show effects: rainbow swipe trail, glitter particles, and tap/release explosions with full customization.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardTypingEffectsFeatureMarkerPatch,
        gboardTypingEffectsBytecodePatch,
    )
}

@Suppress("unused")
val gboardCustomHoldPopupsPatch = gboardPublicResourcePatch(
    featureId = "custom_hold_popups",
    name = "Custom Hold Popups",
    description = "Edit and add custom characters, symbols, emojis, and text snippets to key long-press hold popups across all keyboard languages.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardCustomHoldPopupsFeatureMarkerPatch,
        gboardCustomHoldPopupsBytecodePatch,
    )
}

@Suppress("unused")
val gboardPackageRenamePatch = gboardPublicResourcePatch(
    featureId = "package_rename",
    name = "Package Rename",
    description = "Rename the package to dev.srwi.com.google.android.inputmethod.latin and allow " +
        "a custom app name so it can be installed alongside official Gboard.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    val appDisplayName = stringOption(
        key = "app_display_name",
        default = "GinType",
        values = linkedMapOf(
            "Gboard" to "Gboard",
            "Gboard Dev" to "Gboard Dev",
            "Gboard Mod" to "Gboard Mod",
            "GinType" to "GinType",
        ),
        title = "App Name",
        description = "",
        required = true,
    ) { value ->
        isValidGboardAppDisplayName(value)
    }

    dependsOn(
        gboardPackageRenameResourcePatch,
    )

    finalize {
        applyGboardApplicationDisplayName(displayName = checkNotNull(appDisplayName.value))
    }
}

object GboardPublishedPatchCatalog {
    val morpheRegistrations: Set<Patch<*>> = linkedSetOf(
        gboardCustomHoldPopupsPatch,
        gboardMultiGlidePatch,
        gboardPackageRenamePatch,
        gboardThiccTopBarPatch,
        gboardTypingEffectsPatch,
    )

    fun publishedInventory(version: String): String {
        val publishedPatches = morpheRegistrations.mapNotNull { patch ->
            patch.name ?: return@mapNotNull null
            PublishedPatch(
                name = patch.name!!,
                description = patch.description,
                use = patch.default,
                dependencies = patch.dependencies.mapNotNull { dependency -> dependency.name }.sorted(),
                compatiblePackages = patch.compatibility?.mapNotNull { compatibility ->
                    compatibility.publishedPackageVersions()
                }?.toMap(),
                options = patch.options.values.map { option ->
                    PublishedPatch.Option(
                        key = option.key,
                        title = option.title,
                        description = option.description,
                        required = option.required,
                        type = option.type.toString(),
                        default = option.default,
                        values = option.values,
                    )
                },
            )
        }
        val gson = GsonBuilder()
            .serializeNulls()
            .disableHtmlEscaping()
            .setPrettyPrinting()
            .create()
        val inventory = JsonObject().apply {
            addProperty("version", version)
            add("patches", gson.toJsonTree(publishedPatches))
        }

        return gson.toJson(inventory) + "\n"
    }

    private fun Compatibility.publishedPackageVersions(): Pair<String, Set<String>?>? {
        val packageName = packageName ?: return null
        val listedTargets = targets.filter { target -> !target.isExperimental }.ifEmpty { targets }
        if (listedTargets.isEmpty() || listedTargets.any { target -> target.version == null }) {
            return packageName to null
        }
        return packageName to listedTargets.mapTo(linkedSetOf()) { target -> target.version!! }
    }

    private class PublishedPatch(
        val name: String,
        val description: String?,
        val use: Boolean,
        val dependencies: List<String>,
        val compatiblePackages: Map<String, Set<String>?>?,
        val options: List<Option>,
    ) {
        class Option(
            val key: String,
            val title: String?,
            val description: String?,
            val required: Boolean,
            val type: String,
            val default: Any?,
            val values: Map<String, Any?>?,
        )
    }
}
