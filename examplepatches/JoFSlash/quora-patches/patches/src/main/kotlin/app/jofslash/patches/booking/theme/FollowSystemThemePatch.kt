package app.jofslash.patches.booking.theme

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.jofslash.patches.booking.shared.methodOf
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/** Holds the app's theme choice (Light, Dark, System) and the default used until you pick one. */
private const val THEME_SWITCHER = "Lcom/booking/settings/services/SettingsThemeSwitcher;"
private const val THEME = "Lcom/booking/settings/services/SettingsThemeSwitcher\$Theme;"

@Suppress("unused")
val followSystemThemePatch = bytecodePatch(
    name = "Follow system theme",
    description = "Makes the app light or dark to match your phone, instead of always light. " +
            "A theme you picked in the app's Settings still wins.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_BOOKING)

    execute {
        // The app's built-in theme setting (Settings > Theme) defaults to Light when you've never
        // set it: `defaultTheme = Theme.LIGHT.getId()` in the class initialiser. Use SYSTEM instead.
        val clinit = methodOf(THEME_SWITCHER, "<clinit>")
        val instructions = clinit.implementation!!.instructions.toList()
        val index = instructions.indexOfFirst { insn ->
            insn.opcode == Opcode.SGET_OBJECT &&
                    ((insn as ReferenceInstruction).reference as FieldReference).let {
                        it.definingClass == THEME && it.name == "LIGHT"
                    }
        }
        if (index < 0) throw PatchException("Couldn't find the default theme in $THEME_SWITCHER")
        val register = (instructions[index] as OneRegisterInstruction).registerA
        clinit.replaceInstruction(index, "sget-object v$register, $THEME->SYSTEM:$THEME")
    }
}
