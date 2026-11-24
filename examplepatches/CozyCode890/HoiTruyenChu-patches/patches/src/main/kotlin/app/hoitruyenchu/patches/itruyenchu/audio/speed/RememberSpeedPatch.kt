package app.hoitruyenchu.patches.itruyenchu.audio.speed

import app.hoitruyenchu.patches.itruyenchu.misc.settings.enablePatchFlag
import app.hoitruyenchu.patches.itruyenchu.misc.settings.settingsPatch
import app.hoitruyenchu.patches.itruyenchu.misc.extension.sharedExtensionPatch
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.COMPATIBILITY_ITRUYENCHU
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.EXTENSION_REMEMBER_SPEED
import app.hoitruyenchu.patches.itruyenchu.shared.ReactInstanceLoadJSBundleFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val rememberSpeedPatch = patch(
    name = "Remember listening speed",
    description = "Keeps the speed chosen in the voice bar after the app is restarted (the app saved it " +
            "under a misspelled key and always started at 1x). One speed for all books. The speed menu " +
            "becomes a YouTube-like panel (big speed, - slider +, quick choices) with a settable range and step.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ITRUYENCHU)

    dependsOn(sharedExtensionPatch, settingsPatch)

    execute {
        enablePatchFlag("rememberSpeed")

        // JS script evaluated after the app bundle.
        ReactInstanceLoadJSBundleFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            instructions.indices.reversed()
                .filter { instructions[it].opcode == Opcode.RETURN_VOID }
                .forEach { index ->
                    addInstruction(
                        index,
                        "invoke-static { p0 }, $EXTENSION_REMEMBER_SPEED->afterMainBundle(Ljava/lang/Object;)V",
                    )
                }
        }
    }
}
