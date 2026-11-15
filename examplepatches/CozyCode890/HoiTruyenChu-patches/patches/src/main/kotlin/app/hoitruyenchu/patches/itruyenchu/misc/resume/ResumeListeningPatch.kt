package app.hoitruyenchu.patches.itruyenchu.misc.resume

import app.hoitruyenchu.patches.itruyenchu.audio.tts.ttsReliabilityPatch
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.COMPATIBILITY_ITRUYENCHU
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.EXTENSION_RESUME_LISTENING
import app.hoitruyenchu.patches.itruyenchu.shared.ReactInstanceLoadJSBundleFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val resumeListeningPatch = patch(
    name = "Resume listening position",
    description = "Opening a book from the bookshelf or \"Đọc truyện\" goes back to the line where the " +
            "listening stopped: the voice bar opens with the play button and the line is highlighted, " +
            "pressing play continues from there.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ITRUYENCHU)

    // Also needs the TTS fix that drops the stray "Hết chương" of a re-opened reader.
    dependsOn(ttsReliabilityPatch)

    execute {
        ReactInstanceLoadJSBundleFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            instructions.indices.reversed()
                .filter { instructions[it].opcode == Opcode.RETURN_VOID }
                .forEach { index ->
                    addInstruction(
                        index,
                        "invoke-static { p0 }, $EXTENSION_RESUME_LISTENING->afterMainBundle(Ljava/lang/Object;)V",
                    )
                }
        }
    }
}
