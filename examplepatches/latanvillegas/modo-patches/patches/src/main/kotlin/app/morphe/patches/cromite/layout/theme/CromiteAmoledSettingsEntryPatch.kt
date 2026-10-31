package app.morphe.patches.cromite.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val CROMITE_SETTINGS_VERSION = "153.0.8010.37"
private const val BRIDGE = "Lapp/morphe/extension/cromite/amoled/AmoledPreferenceBridge;"

private val themeSettingsInitialization = Fingerprint(
    definingClass = "/ThemeSettingsFragment;",
    name = "a2",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;"),
)

private val preferenceBaseClick = Fingerprint(
    definingClass = "Landroidx/preference/Preference;",
    name = "z",
    returnType = "V",
    parameters = listOf(),
)

/**
 * Independent optional companion to the window-brightness patch.
 * Must only be selected alongside the brightness extension provider.
 */
@Suppress("unused")
val cromiteAmoledSettingsEntryPatch = bytecodePatch(
    name = "Cromite AMOLED settings entry",
    description = "Adds the AMOLED and brightness entry to Cromite theme settings.",
    default = false,
) {
    compatibleWith("org.cromite.cromite"(CROMITE_SETTINGS_VERSION))
    dependsOn(cromiteAmoledBrightnessPatch)

    execute {
        classDefBy(BRIDGE)

        val click = preferenceBaseClick.method
        click.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $BRIDGE->onClick(Ljava/lang/Object;)V",
        )

        val method = themeSettingsInitialization.method
        val returnIndices = method.implementation!!.instructions
            .withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }
            .sortedDescending()

        check(returnIndices.isNotEmpty()) {
            "AMOLED settings: ThemeSettingsFragment.a2 has no normal return"
        }

        // Insert before each normal return, from highest index to lowest,
        // so earlier insertions do not shift the remaining positions.
        returnIndices.forEach { index ->
            method.addInstruction(
                index,
                "invoke-static/range { p0 .. p0 }, $BRIDGE->install(Ljava/lang/Object;)V",
            )
        }
    }
}
