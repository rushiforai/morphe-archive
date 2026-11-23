package app.hoitruyenchu.patches.itruyenchu.audio.taptoseek

import app.hoitruyenchu.patches.itruyenchu.misc.settings.enablePatchFlag
import app.hoitruyenchu.patches.itruyenchu.misc.settings.settingsPatch
import app.hoitruyenchu.patches.itruyenchu.misc.extension.sharedExtensionPatch
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.COMPATIBILITY_ITRUYENCHU
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.EXTENSION_TAP_TO_SEEK
import app.hoitruyenchu.patches.itruyenchu.shared.ReactInstanceLoadJSBundleFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val tapToSeekPatch = patch(
    name = "Tap a line to listen from it",
    description = "Tapping a line of the chapter (vertical reading) moves the voice reading there: while " +
            "reading it continues from that line, while stopped the line is highlighted and play starts " +
            "from it, with the voice bar closed the bar opens and the line is highlighted. Scrolling by " +
            "hand while listening stops the automatic scrolling and shows a \"Về dòng đang đọc\" button.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ITRUYENCHU)

    dependsOn(sharedExtensionPatch, settingsPatch)

    execute {
        enablePatchFlag("tapToSeek")

        // JS script evaluated after the app bundle.
        ReactInstanceLoadJSBundleFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            instructions.indices.reversed()
                .filter { instructions[it].opcode == Opcode.RETURN_VOID }
                .forEach { index ->
                    addInstruction(
                        index,
                        "invoke-static { p0 }, $EXTENSION_TAP_TO_SEEK->afterMainBundle(Ljava/lang/Object;)V",
                    )
                }
        }
    }
}
