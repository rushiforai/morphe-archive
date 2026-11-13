package app.template.patches.example

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val LITE_SETTINGS_EXTENSION = "Lapp/template/extension/extension/HelakuruLiteSettingsExtension;"

internal val helakuruLiteSettingsColorsPatch = resourcePatch {
    execute {
        document("res/values/styles.xml").use { styles ->
            val overlay = styles.createElement("style")
            overlay.setAttribute("name", "MorpheSettingsColors")
            overlay.setAttribute("parent", "")
            mapOf(
                "colorAccent" to "@color/colorAccent",
                "android:colorAccent" to "@color/colorAccent",
                "colorPrimary" to "@color/color_primary",
                "colorPrimaryDark" to "@color/color_primary"
            ).forEach { (name, value) ->
                val item = styles.createElement("item")
                item.setAttribute("name", name)
                item.textContent = value
                overlay.appendChild(item)
            }
            styles.documentElement.appendChild(overlay)
        }
    }
}

/** Set the Activity's DayNight theme before PreferenceActivity inflates its view hierarchy. */
internal fun prepareHelakuruLiteSettingsTheme() {
    val method = HelakuruLiteSettingsCreateFingerprint.method
    val instructions = method.implementation?.instructions?.toList()
        ?: error("Lite SettingsActivity.onCreate has no implementation")
    val superOnCreate = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference?.definingClass == "Landroid/preference/PreferenceActivity;" &&
            reference.name == "onCreate" && reference.parameterTypes == listOf("Landroid/os/Bundle;")
    }
    check(superOnCreate >= 0) { "Could not find PreferenceActivity.onCreate in Lite settings" }
    instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_VOID }.reversed().forEach { index ->
        method.addInstructions(index,
            "invoke-static {p0}, $LITE_SETTINGS_EXTENSION->applySettingsWindow(Ljava/lang/Object;)V")
    }
    method.addInstructions(
        superOnCreate,
        "invoke-static {p0}, $LITE_SETTINGS_EXTENSION->prepareSettingsActivityTheme(Ljava/lang/Object;)V"
    )
}

/** Resolve the current index after other patches have inserted settings hooks. */
internal fun helakuruLiteSettingsBindingIndex(): Int {
    val instructions = HelakuruLiteSettingsCreateFingerprint.method.implementation?.instructions?.toList()
        ?: error("Lite SettingsActivity.onCreate has no implementation")
    val index = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference?.name == "addPreferencesFromResource" &&
            reference.definingClass == "Landroid/preference/PreferenceActivity;"
    }
    check(index >= 0) { "Could not find Lite settings preference initialization" }
    return index + 1
}
