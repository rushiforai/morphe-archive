package mightymich.morphe.patches.musicpitcher

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro Features",
    description = "Forces 'proActivated' and 'subscriptionActivated' to true, unlocking Pro features in Music Pitcher Radio."
) {
    compatibleWith(MusicPitcherRadioCompatibility.MUSIC_PITCHER_RADIO)

    // 1. Fingerprint for proActivated field
    val proActivatedFingerprint = Fingerprint(
        filters = listOf(
            fieldAccess(
                opcode = Opcode.SPUT_BOOLEAN,
                definingClass = "Lmanagers/data/Constants;",
                name = "proActivated"
            )
        )
    )

    // 2. Fingerprint for subscriptionActivated field
    val subscriptionActivatedFingerprint = Fingerprint(
        filters = listOf(
            fieldAccess(
                opcode = Opcode.SPUT_BOOLEAN,
                definingClass = "Lmanagers/data/Constants;",
                name = "subscriptionActivated"
            )
        )
    )

    execute {
        // 3. Patch proActivated
        proActivatedFingerprint.let { fingerprint ->
            val match = fingerprint.instructionMatches.firstOrNull()
                ?: throw PatchException("Could not find 'proActivated' field access.")
            val instruction = match.getInstruction<OneRegisterInstruction>()
            val register = instruction.registerA
            // Insert const/4 before sput-boolean to store 1 (true)
            fingerprint.method.addInstructions(
                match.index,
                "const/4 v$register, 0x1"
            )
        }

        // 4. Patch subscriptionActivated
        subscriptionActivatedFingerprint.let { fingerprint ->
            val match = fingerprint.instructionMatches.firstOrNull()
                ?: throw PatchException("Could not find 'subscriptionActivated' field access.")
            val instruction = match.getInstruction<OneRegisterInstruction>()
            val register = instruction.registerA
            fingerprint.method.addInstructions(
                match.index,
                "const/4 v$register, 0x1"
            )
        }
    }
}
