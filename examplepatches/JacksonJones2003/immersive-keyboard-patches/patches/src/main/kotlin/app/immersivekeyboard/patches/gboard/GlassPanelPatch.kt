package app.immersivekeyboard.patches.gboard

import app.immersivekeyboard.patches.shared.Constants.COMPATIBILITY_GBOARD
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/immersivekeyboard/extension/GlassPanel;"
private const val POPUPS_CLASS = "Lapp/immersivekeyboard/extension/GlassPopups;"

@Suppress("unused")
val glassPanelPatch = bytecodePatch(
    name = "Glass Panel",
    description = "Turns the translucent keyboard panel into glass. On vivo OriginOS it uses " +
        "the system's own glass material, with real refraction, rim light and dispersion; " +
        "elsewhere it draws lit edges and a sheen. Keys are left as they are. Works on top of " +
        "Translucent Bottom Bar and Frosted Glass. Floating popups, like the keyboard switcher " +
        "shown with a hardware keyboard, get the same glass." +
        " Keeps Frosted Glass's Seamless Nav Bar off, which conflicts with it.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    // The effect is drawn from the bottom bar's drawing hooks.
    dependsOn(translucentBottomBarPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Switches the effect on. The parameter registers are reused right after the super
        // call, so hook directly behind it.
        InputViewDispatchDrawFingerprint.let {
            it.method.addInstructions(
                it.instructionMatches.first().index + 1,
                "invoke-static { }, $EXTENSION_CLASS->enable()V"
            )
        }

        // Glass behind floating popups, once Gboard has positioned them.
        FloatingPopupPositionFingerprint.let {
            val setY = it.instructionMatches.last().index
            val container = it.method.getInstruction<FiveRegisterInstruction>(setY).registerC
            it.method.addInstructions(
                setY + 1,
                "invoke-static { v$container }, $POPUPS_CLASS->style(Landroid/view/View;)V"
            )
        }
    }
}
