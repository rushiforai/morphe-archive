package lab.leghefc.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode

/**
 * Leghe FC 13.2.1 (build 445): imposta Lkqgs.B = true.
 *
 * La patch modifica il campo B nel costruttore, dopo la scrittura
 * originale, e poi stampa il risultato nel Logcat (LegheFC-B).
 * Non e' una diagnostica di sola lettura.
 * Non modifica le collezioni A/C.
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
            targets = listOf(AppTarget(version = "13.2.1"))
        )
    )

    execute {
        val method = Fingerprint(
            definingClass = "Lkqgs;",
            name = "<init>"
        ).method

        // Dopo tutte le assegnazioni del costruttore; prima del suo return.
        val beforeReturn = method.indexOfFirstInstructionOrThrow {
            opcode == Opcode.RETURN_VOID
        }

        method.addInstructions(
            beforeReturn,
            """
                new-instance p1, Landroid/util/MutableBoolean;
                const/4 p2, 0x0
                invoke-direct {p1, p2}, Landroid/util/MutableBoolean;-><init>(Z)V

                const/4 p2, 0x1
                iput-boolean p2, p1, Landroid/util/MutableBoolean;->value:Z
                iget-boolean p2, p1, Landroid/util/MutableBoolean;->value:Z

                iput-boolean p2, p0, Lkqgs;->B:Z
            
                iget-boolean p2, p0, Lkqgs;->B:Z
                invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;
                move-result-object p2
                const-string p1, "B = "
                invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p2
                const-string p1, "LegheFC-B"
                invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            """.trimIndent()
        )
    }
}
