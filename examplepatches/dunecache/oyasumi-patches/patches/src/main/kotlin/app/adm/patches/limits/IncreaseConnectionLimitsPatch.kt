package app.adm.patches.limits

import app.adm.patches.shared.Constants.COMPATIBILITY_ADM
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
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
        // replacement is one code unit wider; `replaceInstruction` keeps the
        // instruction count, so no index in this method moves, and branch targets are
        // `Label`s in dexlib2 that are bound to the instruction they point at rather
        // than to a byte offset, so the wider constant needs no offset fixup.
        DownloadCeilingFingerprint.let { fingerprint ->
            val ceiling = fingerprint.instructionMatches[0]
            val register = ceiling.getInstruction<OneRegisterInstruction>().getRegisterA()

            fingerprint.method.replaceInstruction(ceiling.index, "const/16 v$register, $MAX_DOWNLOADS")
        }

        // The per-download ceiling cannot be raised through its source register, because
        // that register is also the minimum of the chunk-size controls. A `const/16` is
        // written ahead of each store instead, so only the `b` field of the three
        // `DOWN_THREADS_*` controls changes and the chunk-size minimum is left alone.
        //
        // All three sites live in the same method, and each edit removes one instruction
        // and adds two, so every later index shifts by one. The three stores are
        // therefore resolved up front, while the method is still unedited, and then
        // applied from the highest index down so that no edit invalidates an index the
        // remaining edits still need.
        val threadCeilings = listOf(
            ThreadCeiling3GFingerprint,
            ThreadCeilingWifiFingerprint,
            ThreadCeiling3GWifiFingerprint
        ).map { fingerprint ->
            val maximum = fingerprint.instructionMatches[2]
            Triple(
                // A 22c store names its two registers A (the value) and B (the target).
                maximum.getInstruction<TwoRegisterInstruction>().getRegisterB(),
                maximum.getInstruction<ReferenceInstruction>().getReference() as FieldReference,
                fingerprint.method
            ) to maximum.index
        }.sortedByDescending { it.second }

        threadCeilings.forEach { (site, index) ->
            val (target, field, method) = site
            // The original store has to go, and it must be removed *explicitly*.
            // `replaceInstructions` removes as many instructions as it inserts, so
            // handing it two instructions also deletes the one after the store. For the
            // 3G control that next instruction is
            // `iget-object v12, v0, Lcom/dv/get/Pref;->f:Lf5/g;`, which is what gives
            // `v12` its `f5/g` reference type. Without it `v12` keeps the
            // `const v12, <int>` written earlier in the method, and the later
            // `Lv2/j4;->h(Lf5/g; ...)` invocation that reads `v12` fails the verifier
            // with "register v12 has type IntegerConstant but expected Reference:
            // f5.g", killing the app when the download settings screen is built.
            method.removeInstruction(index)
            method.addInstructions(
                index,
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
