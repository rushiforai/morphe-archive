package app.adm.patches.limits

import app.adm.patches.shared.Constants.COMPATIBILITY_ADM
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/** `v5` is assigned four times in `Pref.U()` and never read, so it is dead. */
private const val SCRATCH_REGISTER = "v5"

private const val MAX_DOWNLOADS = 32
private const val MAX_THREADS = 64

@Suppress("unused")
val increaseConnectionLimitsPatch = bytecodePatch(
    name = "Increase connection limits",
    description = "Raise the download ceilings to $MAX_DOWNLOADS simultaneous downloads and " +
        "$MAX_THREADS connections per download, and set torrent defaults to 500 global and 100 per torrent.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ADM)

    execute {
        // The simultaneous-download ceiling is a single shared constant, so one edit
        // covers all three network profiles. `const/4` cannot hold 32, so the
        // replacement is one code unit wider; this method has no switch or array
        // payload, and the patcher recomputes every branch offset afterwards.
        DownloadCeilingFingerprint.let { fingerprint ->
            val ceiling = fingerprint.instructionMatches[0]
            val register = ceiling.getInstruction<OneRegisterInstruction>().getRegisterA()

            fingerprint.method.replaceInstruction(ceiling.index, "const/16 v$register, $MAX_DOWNLOADS")
        }

        // The per-download ceiling cannot be raised through its source register, because
        // that register is also the minimum of the chunk-size controls. A `const/16` is
        // written ahead of the store instead, so only the `b` field of this one control
        // changes and the chunk-size minimum is left alone.
        ThreadCeilingFingerprint.let { fingerprint ->
            val maximum = fingerprint.instructionMatches[3]
            // A 22c store names its two registers A (the value) and B (the target object).
            val target = maximum.getInstruction<TwoRegisterInstruction>().getRegisterB()
            val field = maximum.getInstruction<ReferenceInstruction>().getReference() as FieldReference

            fingerprint.method.replaceInstructions(
                maximum.index,
                "const/16 $SCRATCH_REGISTER, $MAX_THREADS\n" +
                    // smali writes a field reference as ->name:TYPE, not ->name TYPE.
                    "iput $SCRATCH_REGISTER, v$target, ${field.definingClass}->${field.name}:${field.type}"
            )
        }

        // Only the default arguments change. Both replacements keep the original
        // `const-string` width and destination register, so the surrounding reads and
        // the `Pref.A` calls are untouched. Already saved preferences still win.
        TorrentConnectionDefaultsFingerprint.let { fingerprint ->
            val globalDefault = fingerprint.instructionMatches[1]
            val perTorrentDefault = fingerprint.instructionMatches[4]
            val globalRegister = globalDefault.getInstruction<OneRegisterInstruction>().getRegisterA()
            val perTorrentRegister = perTorrentDefault.getInstruction<OneRegisterInstruction>().getRegisterA()

            fingerprint.method.replaceInstruction(
                perTorrentDefault.index,
                "const-string v$perTorrentRegister, \"100\""
            )
            fingerprint.method.replaceInstruction(
                globalDefault.index,
                "const-string v$globalRegister, \"500\""
            )
        }
    }
}
