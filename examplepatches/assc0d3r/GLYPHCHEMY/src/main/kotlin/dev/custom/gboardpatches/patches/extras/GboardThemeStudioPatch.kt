package dev.custom.gboardpatches.patches.extras

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val SOFT_KEY_VIEW = "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;"
private const val SOFT_KEY_DEF = "Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;"
private const val COMMON_PREFERENCE_FRAGMENT =
    "Lcom/google/android/libraries/inputmethod/preferencewidgets/CommonPreferenceFragment;"
private const val THEME_RUNTIME = "Ldev/custom/gboardpatches/ui/KeyboardThemeRuntime;"

val gboardThemeStudioPatch = bytecodePatch(
    name = "Gboard Theme Builder",
    description = "Create native Gboard themes and customize key visuals via runtime hooks.",
    default = true
) {
    compatibleWith(
        Compatibility(
            name = "Gboard",
            packageName = "com.google.android.inputmethod.latin",
            targets = listOf(
                AppTarget(version = "18.6.3.1002251336-release-arm64-v8a"),
                AppTarget(version = "18.5.4.993608717-release-arm64-v8a"),
                AppTarget(version = "18.8.0.1022711984-beta-arm64-v8a"),
                AppTarget(version = "18.8.1.1022711984-beta-arm64-v8a"),
                AppTarget(version = null, isExperimental = true)
            )
        )
    )
    dependsOn(gboardThemeStudioSettingsPatch)
    extendWith("colorwheel.dex")

    execute {
        val softKeyView = mutableClassDefByOrNull(SOFT_KEY_VIEW)
            ?: error("Gboard SoftKeyView class not found.")

        val renderKeys = softKeyView.methods.firstOrNull { method ->
            method.name == "A" &&
                method.returnType == "V" &&
                method.parameterTypes.size == 1 &&
                method.parameterTypes[0] == SOFT_KEY_DEF
        } ?: error("Gboard SoftKeyView render method not found.")

        renderKeys.injectStaticCall(
            hookOwner = THEME_RUNTIME,
            hookName = "applyKey",
            hookParameterTypes = listOf("Landroid/view/View;", "Ljava/lang/Object;"),
            firstParam = 0,
            paramCount = 2,
            includeReceiver = true
        )

        // Wire the Theme Builder row when it is bound. The group-init hook does not fire for every
        // page that hosts the entry, and Gboard's Preference exposes no listener setter, so the
        // click has to be attached to the bound row view instead.
        val preferenceClass = mutableClassDefByOrNull("Landroidx/preference/Preference;")
            ?: error("AndroidX Preference class not found in Gboard.")
        val bindRow = preferenceClass.methods.firstOrNull { method ->
            method.returnType == "V" &&
                method.parameterTypes.size == 1 &&
                method.parameterTypes[0].startsWith("L") &&
                !method.parameterTypes[0].startsWith("Landroid")
        } ?: error("Gboard preference row-binding method a(<holder>)V not found.")
        bindRow.addInstructions(
            0,
            """
            invoke-static {p0, p1}, $THEME_RUNTIME->applyRow(Ljava/lang/Object;Ljava/lang/Object;)V
            """.trimIndent()
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

        // Hook every (int, PreferenceGroup) loader after the XML has been inflated into the
        // group, so the Theme Builder preference already exists when the runtime looks it up.
        // 18.5.4 splits this across aJ and aZ, so all matches are required.
        groupInits.forEach { groupInit ->
            val groupImpl = groupInit.implementation ?: return@forEach
            val returnIndexes = groupImpl.instructions
                .withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }

            returnIndexes.asReversed().forEach { returnIndex ->
                groupInit.injectStaticCallOnParamType(
                    hookOwner = THEME_RUNTIME,
                    hookName = "initializePreferences",
                    hookParameterTypes = listOf("Ljava/lang/Object;"),
                    targetType = "Landroidx/preference/PreferenceGroup;",
                    atIndex = returnIndex
                )
            }
        }
    }
}
