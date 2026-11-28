package dev.custom.gboardpatches.patches.extras

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val PREFERENCE_CLASS = "Landroidx/preference/Preference;"
private const val AMOLED_RUNTIME = "Ldev/custom/gboardpatches/ui/AmoledSettingsRuntime;"

/**
 * Applies a pure-black theme to Gboard settings rows.
 *
 * In 18.6.3 `PreferenceViewHolder` is R8-renamed to `Lcew;` and its `itemView` field along
 * with it, so the hook is pinned to the verified `Preference.a(Lcew;)V` bind method and the
 * runtime locates the row view by field type instead of by name.
 *
 * 18.8.0 renames that holder again (`Leha;`) but keeps the shape: exactly one `Preference.a(<obj>)V`
 * with eleven registers, which is what the selector below is written against. Only the target list
 * changes for that release.
 */
val amoledSettingsPatch = bytecodePatch(
    name = "AMOLED Gboard Settings",
    description = "Applies a pure-black theme to Gboard settings rows and future patch preferences.",
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
    extendWith("colorwheel.dex")

    execute {
        val preferenceClass = mutableClassDefByOrNull(PREFERENCE_CLASS)
            ?: error("AndroidX Preference class not found in Gboard.")

        val bindMethod = preferenceClass.methods.firstOrNull { method ->
            method.name == "a" &&
                method.returnType == "V" &&
                method.parameterTypes.size == 1 &&
                method.parameterTypes[0].startsWith("L") &&
                !method.parameterTypes[0].startsWith("Landroid")
        } ?: error("Gboard preference row-binding method a(<holder>)V not found.")

        bindMethod.implementation
            ?: error("Gboard preference row-binding method has no implementation.")

        // Hook at entry, not at RETURN_VOID: the holder parameter register is re-used as a
        // boolean later in the method, so referencing p1 near the returns fails dex verification
        // ("register v10 has type Boolean but expected Reference Object"). The runtime posts the
        // recolor to the row view, so it still lands after binding completes.
        bindMethod.addInstructions(
            0,
            """
            invoke-static {p0, p1}, $AMOLED_RUNTIME->applyPreference(Ljava/lang/Object;Ljava/lang/Object;)V
            """.trimIndent()
        )
    }
}
