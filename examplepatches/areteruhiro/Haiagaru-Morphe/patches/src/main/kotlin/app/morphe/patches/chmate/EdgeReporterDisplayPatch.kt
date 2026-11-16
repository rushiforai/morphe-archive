package app.morphe.patches.chmate

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/** Restore acquired reporter metadata at the display boundary, after native NG filtering. */
internal fun BytecodePatchContext.patchEdgeReporterDisplay(version: String) {
    val (owner, subject, titleField) = when (version) {
        "0.8.10.191 dev" -> Triple("Lo/m8a;", "Lo/MaxAdViewImplExternalSyntheticLambda1;", "c")
        "0.8.10.226 dev" -> Triple("Lo/getWriteBytesTotal;", "Lo/CertificateChainCleaner;", "d")
        "0.8.10.242 dev" -> Triple("Lo/zzavb;", "Lo/setSkipText;", "c")
        else -> return
    }
    val bind = mutableClassDefBy(owner).methods.single {
        it.name == if (version == "0.8.10.242 dev") "onBindViewHolder" else "getView"
    }
    val runtime = "Lapp/morphe/extension/chmate/EdgeReporterDisplay;"
    val instructions = bind.implementation!!.instructions.toList()
    val reads = instructions.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.IGET_OBJECT && ref?.definingClass == subject
                && ref.name == titleField && ref.type == "Ljava/lang/String;"
    }
    check(reads.size == 1) { "Reporter display title anchor changed: $version (${reads.size})" }
    val (index, instruction) = reads.single()
    val read = instruction as TwoRegisterInstruction
    bind.addInstructionsWithLabels(index + 1, """
        invoke-static/range {v${read.registerA} .. v${read.registerA}}, $runtime->title(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v${read.registerA}
    """)
    bind.addInstructionsWithLabels(index, "invoke-static/range {v${read.registerB} .. v${read.registerB}}, $runtime->subject(Ljava/lang/Object;)V")
    val returns = bind.implementation!!.instructions.withIndex().filter {
        it.value.opcode == Opcode.RETURN_OBJECT || it.value.opcode == Opcode.RETURN_VOID
    }
    returns.asReversed().forEach { (at, instruction) ->
        val row = if (instruction.opcode == Opcode.RETURN_OBJECT)
            "v${(instruction as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA}" else "p1"
        bind.addInstructionsWithLabels(at, "invoke-static/range {$row .. $row}, $runtime->endRow(Ljava/lang/Object;)V")
    }
    bind.addInstructionsWithLabels(0, "invoke-static/range {p0 .. p0}, $runtime->begin(Ljava/lang/Object;)V")
    println("Reporter display fallback: $version, native NG state unchanged")
}
