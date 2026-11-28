package semicoloncolonel.mobilestream.patches.netflix.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.netflix.shared.Constants

// Netflix pauses playback when the app leaves the foreground, unless the
// server sends allowBackgroundPlayback = true. The flag rides on a small
// config object, read in the player's lifecycle handler as "if the flag is
// off, stop playback". The object is found by its toString literal, the flag
// is the boolean field printed right after "allowBackgroundPlayback=", and its
// constructor stores that field from a parameter. Forcing that store to true
// makes every copy of the object report background playback as allowed, so a
// title keeps playing (audio with the screen off, video in a floating window)
// when you leave the app. Selecting the patch turns it on.
private const val MARKER = ", allowBackgroundPlayback="

private object BackgroundPlaybackConfigFingerprint : Fingerprint(
    strings = listOf(MARKER),
)

@Suppress("unused")
val backgroundPlaybackPatch = bytecodePatch(
    name = "Keep playing in the background (experimental)",
    description = "Keeps Netflix playing when you leave the app or turn off the screen, so you " +
        "can keep listening in the background. Experimental and not yet confirmed on a device.",
    default = false,
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val toString = BackgroundPlaybackConfigFingerprint.methodOrNull
            ?: throw PatchException("Netflix background-playback config not found")
        val configType = toString.definingClass

        // The allowBackgroundPlayback field: the boolean read right after the
        // "allowBackgroundPlayback=" literal in toString.
        val instructions = toString.implementation!!.instructions.toList()
        val markerIndex = instructions.indexOfFirst {
            it.opcode == Opcode.CONST_STRING &&
                ((it as ReferenceInstruction).reference as StringReference).string == MARKER
        }
        if (markerIndex < 0) throw PatchException("Netflix allowBackgroundPlayback marker not found")
        val flagField = (markerIndex until instructions.size).firstNotNullOfOrNull { index ->
            val instruction = instructions[index]
            if (instruction.opcode == Opcode.IGET_BOOLEAN) {
                (instruction as ReferenceInstruction).reference as FieldReference
            } else {
                null
            }
        } ?: throw PatchException("Netflix allowBackgroundPlayback field not found")

        // Force that field to true where the constructor stores it.
        val constructor = mutableClassDefBy(configType).methods.firstOrNull { method ->
            method.name == "<init>" &&
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.IPUT_BOOLEAN &&
                        (it as ReferenceInstruction).reference == flagField
                } == true
        } ?: throw PatchException("Netflix allowBackgroundPlayback constructor not found")

        val storeIndex = constructor.implementation!!.instructions.indexOfFirst {
            it.opcode == Opcode.IPUT_BOOLEAN &&
                (it as ReferenceInstruction).reference == flagField
        }
        val valueRegister = (constructor.implementation!!.instructions.toList()[storeIndex]
            as TwoRegisterInstruction).registerA
        constructor.addInstruction(storeIndex, "const/4 v$valueRegister, 0x1")
    }
}
