package dev.custom.gboardpatches.patches.extras

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private const val SOFT_KEY_VIEW = "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;"
private const val SOFT_KEY_DEF = "Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;"
private const val COMMON_PREFERENCE_FRAGMENT =
    "Lcom/google/android/libraries/inputmethod/preferencewidgets/CommonPreferenceFragment;"
private const val ICON_RUNTIME = "Ldev/custom/gboardpatches/ui/KeyboardIconPackRuntime;"

val keyboardIconPackPatch = bytecodePatch(
    name = "Keyboard Icon Packs",
    description = "Apply compatible raster icon packs with per-key icon overrides.",
    default = true
) {
    compatibleWith(
        Compatibility(
            name = "Gboard",
            packageName = "com.google.android.inputmethod.latin",
            targets = listOf(
                AppTarget(version = "18.6.3.1002251336-release-arm64-v8a"),
                AppTarget(version = "18.5.4.993608717-release-arm64-v8a"),
                AppTarget(version = null, isExperimental = true)
            )
        )
    )
    dependsOn(gboardThemeStudioPatch)
    dependsOn(keyboardIconPackSettingsPatch)
    extendWith("colorwheel.dex")

    execute {
        val softKeyView = mutableClassDefByOrNull(SOFT_KEY_VIEW)
            ?: error("Gboard SoftKeyView class not found.")

        val renderIcons = softKeyView.methods.firstOrNull { method ->
            method.name == "A" &&
                method.returnType == "V" &&
                method.parameterTypes.size == 1 &&
                method.parameterTypes[0] == SOFT_KEY_DEF
        } ?: error("Gboard SoftKeyView icon-render method not found.")

        renderIcons.injectStaticCall(
            hookOwner = ICON_RUNTIME,
            hookName = "applyIcon",
            hookParameterTypes = listOf("Landroid/view/View;", "Ljava/lang/Object;"),
            firstParam = 0,
            paramCount = 2,
            includeReceiver = true
        )

        val preferenceFragment = mutableClassDefByOrNull(COMMON_PREFERENCE_FRAGMENT)
            ?: error("Gboard CommonPreferenceFragment class not found.")

        val groupInits = preferenceFragment.methods.filter { method ->
            method.returnType == "V" &&
                method.parameterTypes.size == 2 &&
                method.parameterTypes[0] == "I" &&
                method.parameterTypes[1] == "Landroidx/preference/PreferenceGroup;"
        }
        if (groupInits.isEmpty()) error("Gboard preference-group initialization method not found.")

        // 18.5.4 exposes two loaders (aJ/aZ); hook all of them, not just the first match.
        groupInits.forEach { groupInit ->
            groupInit.injectStaticCallOnParamType(
                hookOwner = ICON_RUNTIME,
                hookName = "initializePreferences",
                hookParameterTypes = listOf("Ljava/lang/Object;"),
                targetType = "Landroidx/preference/PreferenceGroup;"
            )
        }
    }
}
