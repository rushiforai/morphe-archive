/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/misc/login/disablerequirement/DisableLoginRequirementPatch.kt
 */
package app.morphe.patches.pinedrama.misc.login.disablerequirement

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.pinedrama.misc.settings.configurableBytecodePatch as bytecodePatch
import app.morphe.patches.pinedrama.misc.extension.sharedExtensionPatch
import app.morphe.patches.pinedrama.misc.settings.registerForBuildDetails
import app.morphe.util.findMutableMethodOf
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val disableLoginRequirementPatch = bytecodePatch(
    name = "Disable login requirement",
    description = "Stops PineDrama from forcing you to sign in before you can keep browsing. " +
        "Works as soon as you patch it in, with no switch.",
    default = true,
) {
    category("Settings")
    // Only so Build details can list it: the patch itself runs no extension code.
    dependsOn(sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.pineDrama())

    execute {
        listOf(
            MandatoryLoginServiceFingerprint,
            MandatoryLoginService2Fingerprint,
        ).forEach { fp ->
            fp.method.returnEarly(false)
        }

        // PineDrama has a no-login mode of its own and the server picks who gets it. An install
        // left out opens on a sign-in page with no way past. Here every install is in it.
        val check = noLoginCheck(DramaNujModeFingerprint.method)
        mutableClassDefBy(check.definingClass).findMutableMethodOf(check).returnEarly(true)

        // That mode still opens the sign-in page once, with a skip. It counts as shown already,
        // so a new install goes on to the age question and Home.
        DramaNujLoginStepFingerprint.method.let { step -> step.answerYes(shownBeforeRead(step)) }

        // A drama opens for a signed-out tap the way it does for a signed-in one.
        SeriesLoginWallFingerprint.method.let { route -> route.answerYes(signedInRead(route)) }

        registerForBuildDetails("enableNoLoginRequirement")
    }
}

/** Swaps the move at [at] for a yes in the same register. The call before it still runs. */
private fun MutableMethod.answerYes(at: Int) {
    val register = getInstruction<OneRegisterInstruction>(at).registerA
    replaceInstruction(at, "const/4 v$register, 0x1")
}
