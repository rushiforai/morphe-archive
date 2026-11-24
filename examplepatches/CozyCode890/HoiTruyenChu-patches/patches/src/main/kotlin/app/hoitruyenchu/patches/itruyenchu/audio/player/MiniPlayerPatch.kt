package app.hoitruyenchu.patches.itruyenchu.audio.player

import app.hoitruyenchu.patches.itruyenchu.misc.settings.enablePatchFlag
import app.hoitruyenchu.patches.itruyenchu.misc.settings.settingsPatch
import app.hoitruyenchu.patches.itruyenchu.misc.extension.sharedExtensionPatch
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.COMPATIBILITY_ITRUYENCHU
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.EXTENSION_MINI_PLAYER
import app.hoitruyenchu.patches.itruyenchu.shared.ReactInstanceLoadJSBundleFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val miniPlayerPatch = patch(
    name = "Mini player",
    description = "Leaving the reader while listening goes on reading: a mini player above the tab bar " +
            "(cover, book, chapter, speed, sleep timer, previous / play / next chapter, close) keeps playing " +
            "while you search, look at the chapter list or change settings, opens the next chapters by itself " +
            "and opens the reader on the line being read when tapped. App 3.0.0.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ITRUYENCHU)

    dependsOn(sharedExtensionPatch, settingsPatch)

    execute {
        enablePatchFlag("miniPlayer")

        // JS script evaluated after the app bundle.
        ReactInstanceLoadJSBundleFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            instructions.indices.reversed()
                .filter { instructions[it].opcode == Opcode.RETURN_VOID }
                .forEach { index ->
                    addInstruction(
                        index,
                        "invoke-static { p0 }, $EXTENSION_MINI_PLAYER->afterMainBundle(Ljava/lang/Object;)V",
                    )
                }
        }
    }
}
