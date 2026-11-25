package dev.jason.gboardpatches.patches.gboard.features.immersive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val GLASS_PANEL_CLASS = "Lapp/immersivekeyboard/extension/GlassPanel;"
private const val GLASS_POPUPS_CLASS = "Lapp/immersivekeyboard/extension/GlassPopups;"
private const val PRESS_EFFECT_CLASS = "Lapp/immersivekeyboard/extension/PressEffect;"

internal val gboardGlassPanelPatch = bytecodePatch(
    description = "Turns the translucent keyboard panel into glass. On vivo OriginOS it uses " +
        "the system's own glass material, with real refraction, rim light and dispersion; " +
        "elsewhere it draws lit edges and a sheen. Keys are left as they are. Works on top of " +
        "Translucent Bottom Bar and Frosted Glass. Floating popups, like the keyboard switcher " +
        "shown with a hardware keyboard, get the same glass." +
        " Keeps Frosted Glass's Seamless Nav Bar off, which conflicts with it.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    // The effect is drawn from the bottom bar's drawing hooks.
    dependsOn(gboardTranslucentBottomBarPatch)

    extendWith(IMMERSIVE_KEYBOARD_EXTENSION)

    execute {
        // Switches the effect on. The parameter registers are reused right after the super call,
        // so hook directly behind it.
        InputViewDispatchDrawFingerprint.let { fingerprint ->
            fingerprint.method.addInstructions(
                fingerprint.instructionMatches.first().index + 1,
                "invoke-static { }, $GLASS_PANEL_CLASS->enable()V",
            )
        }

        // Glass behind floating popups, once Gboard has positioned them.
        FloatingPopupPositionFingerprint.let { fingerprint ->
            val setY = fingerprint.instructionMatches.last().index
            val container = fingerprint.method.getInstruction<FiveRegisterInstruction>(setY).registerC
            fingerprint.method.addInstructions(
                setY + 1,
                "invoke-static { v$container }, $GLASS_POPUPS_CLASS->style(Landroid/view/View;)V",
            )
        }
    }
}

internal val gboardGlassPressEffectPatch = bytecodePatch(
    description = "Adds vivo-style liquid glass touch feedback: a soft light blooms out from " +
        "your finger across the keyboard background, and the keys around your finger dip " +
        "and spring back with a small wobble while the rest of the keyboard stays still. " +
        "When glide typing, the dip follows your finger. Floating popups light up the same way.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    extendWith(IMMERSIVE_KEYBOARD_EXTENSION)

    execute {
        InputViewDispatchTouchFingerprint.method.addInstructions(
            0,
            "invoke-static { p0, p1 }, " +
                "$PRESS_EFFECT_CLASS->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)V",
        )
        // After the keyboard has drawn. The glass blur clears whatever is painted beneath it, so
        // the light has to go on top. The parameter registers are reused right after the super
        // call, so hook directly behind it.
        InputViewDispatchDrawFingerprint.let { fingerprint ->
            fingerprint.method.addInstructions(
                fingerprint.instructionMatches.first().index + 1,
                "invoke-static { p0, p1 }, " +
                    "$PRESS_EFFECT_CLASS->draw(Landroid/view/View;Landroid/graphics/Canvas;)V",
            )
        }

        // The same light on floating popups, such as the hardware keyboard switcher.
        FloatingPopupTouchFingerprint.method.addInstructions(
            0,
            """
                invoke-static { }, $GLASS_POPUPS_CLASS->enableGlow()V
                invoke-static { p0, p1 }, $GLASS_POPUPS_CLASS->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)V
            """,
        )
    }
}
