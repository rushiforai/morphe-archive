package app.template.patches.minimalist.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_MINIMALIST
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Minimalist Launcher sells one one-time purchase ("full version"). It is stored in the default
 * SharedPreferences under the key "full version", read by a no-arg boolean getter that seeds the
 * purchase StateFlow at startup, and written by a setter that the billing callbacks call with true
 * after a purchase and false when the purchase cannot be verified.
 *
 * The patch makes the getter answer true and loads 1 into the setter's boolean parameter at entry,
 * so both the startup seed and every billing refresh report the purchase. Play Billing, the Braze /
 * Branch referrer upload and the UI are untouched.
 *
 * Verified 2026-10-27 against 1.22.8 (versionCode 236): see COMPATIBILITY_MINIMALIST.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the full version.",
) {
    compatibleWith(COMPATIBILITY_MINIMALIST)

    execute {
        FullVersionFingerprint.method.returnEarly(true)

        val setter = FullVersionSetterFingerprint.method
        val implementation = setter.implementation
            ?: throw PatchException("${setter.definingClass}->${setter.name} has no implementation")
        // (boolean, purchase): p1 is the boolean parameter, at registerCount - 2.
        val valueRegister = implementation.registerCount - 2
        setter.addInstructionsChecked(0, "const/4 v$valueRegister, 0x1")
    }
}
