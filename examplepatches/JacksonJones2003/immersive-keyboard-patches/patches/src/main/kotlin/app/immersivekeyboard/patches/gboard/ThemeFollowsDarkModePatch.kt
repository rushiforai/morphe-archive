package app.immersivekeyboard.patches.gboard

import app.immersivekeyboard.patches.shared.Constants.COMPATIBILITY_GBOARD
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/immersivekeyboard/extension/ThemeDarkMode;"
private const val MENU_CLASS = "Lapp/immersivekeyboard/extension/ThemePairMenu;"

@Suppress("unused")
val themeFollowsDarkModePatch = bytecodePatch(
    name = "Theme Follows Dark Mode",
    description = "Adds a \"Light & dark pair\" menu to the top of Gboard's Themes screen. " +
        "Choose a theme for light mode and one for dark mode, and the keyboard switches " +
        "between them when the system dark mode changes. It can switch the wallpaper " +
        "between a light and a dark image too.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    extendWith("extensions/extension.mpe")

    dependsOn(wallpaperPermissionPatch)

    execute {
        // The parameter registers are reused right after the super call, so hook directly
        // behind it.
        InputViewDispatchDrawFingerprint.let {
            it.method.addInstructions(
                it.instructionMatches.first().index + 1,
                "invoke-static { p0 }, $EXTENSION_CLASS->check(Landroid/view/View;)V"
            )
        }

        // Add the pair menu to the view the Themes screen returns.
        ThemeListingCreateViewFingerprint.method.apply {
            implementation!!.instructions
                .withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index to (it.value as OneRegisterInstruction).registerA }
                .reversed()
                .forEach { (index, register) ->
                    addInstructions(
                        index,
                        "invoke-static { v$register }, $MENU_CLASS->attach(Landroid/view/View;)V"
                    )
                }
        }
    }
}
