package lab.leghefc.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Leghe FC 13.2.3: imposta a true il booleano nel modello della formazione.
 *
 * La classe dati nuova ha descriptor LsVY; e campo Ddz:Z. Il costruttore
 * mantiene la firma (List, boolean, Set, String) documentata nel confronto.
 * Questa patch modifica il booleano del modello e non è una diagnostica passiva.
 */
@Suppress("unused")
val booleanFieldDiagnosticPatch = bytecodePatch(
    name = "Leghe FC - Sblocca percentuali",
    description = "Mostra le percentuali utili per scegliere chi schierare.",
    default = false
) {
    compatibleWith(
        Compatibility(
            name = "Leghe FC",
            packageName = "it.quadronica.leghe",
            targets = listOf(AppTarget(version = "13.2.3"))
        )
    )

    execute {
        val owner = "LsVY;"
        val method = Fingerprint(
            definingClass = owner,
            name = "<init>",
            parameters = listOf(
                "Ljava/util/List;",
                "Z",
                "Ljava/util/Set;",
                "Ljava/lang/String;"
            ),
            returnType = "V"
        ).method

        val implementation = method.implementation
            ?: error("Leghe FC: sVY.<init> non contiene istruzioni")
        val booleanWrites = implementation.instructions.withIndex().filter { (_, instruction) ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.IPUT_BOOLEAN &&
                field != null && field.definingClass == owner && field.name == "Ddz" && field.type == "Z"
        }
        require(booleanWrites.size == 1) {
            "Attesa una sola scrittura di sVY.Ddz:Z nel costruttore, trovate ${booleanWrites.size}"
        }

        val beforeReturn = method.indexOfFirstInstructionOrThrow {
            opcode == Opcode.RETURN_VOID
        }
        require(booleanWrites.single().index < beforeReturn) {
            "La scrittura originale di sVY.Ddz:Z non precede RETURN_VOID"
        }

        method.addInstructions(
            beforeReturn,
            """
                const/4 p1, 0x1
                iput-boolean p1, p0, $owner->Ddz:Z

                iget-boolean p2, p0, $owner->Ddz:Z
                invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;
                move-result-object p2
                const-string p1, "Ddz = "
                invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p2
                const-string p1, "LegheFC-Ddz"
                invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
            """.trimIndent()
        )
    }
}
