package lab.dnschanger.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/**
 * DNS Changer 3.0.0 (versionCode 64), verificato su base.apk nell'ASPK.
 *
 * TEST D2: Lsi2;->z()Z registra e restituisce sempre TRUE.
 * L'originale z() rimane nel DEX ma non viene eseguito.
 * Non modifica Billing, SharedPreferences o stati di acquisto persistenti.
 *
 * Codice di prova: DC-20261029-D2 (in ogni riga di Logcat).
 */
@Suppress("unused")
val dnsProReturnDiagnosticPatch = bytecodePatch(
    name = "DNS Changer - Force Pro test D2",
    description = "Test only: forces z() to return true and logs the forced value; does not change purchases.",
    default = false
) {
    compatibleWith(
        Compatibility(
            name = "DNS Changer",
            packageName = "com.appplanex.dnschanger",
            targets = listOf(AppTarget(version = "3.0.0"))
        )
    )

    execute {
        val className = "Lsi2;"
        val helperName = "morpheLogZReturn"
        val method = Fingerprint(
            definingClass = className,
            name = "z",
            returnType = "Z",
            parameters = emptyList()
        ).method

        val body = method.implementation
            ?: error("DNS Changer: z() non contiene bytecode")
        val original = body.instructions.toList()

        // Guardiamo la struttura del metodo originale prima di effettuare il test.
        val returnIndexes = original.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.RETURN &&
                (instruction as? OneRegisterInstruction)?.registerA == 1
        }.map { it.index }

        // Controlliamo sia i due return sia la struttura di z() (B() || x()).
        // Se il DEX cambia, fermiamo la patch anziche' inserire il log altrove.
        val originalCalls = original.mapNotNull { instruction ->
            (instruction as? ReferenceInstruction)?.reference as? MethodReference
        }
        fun hasOriginalCall(name: String) = originalCalls.count { reference ->
            reference.definingClass == className &&
                reference.name == name &&
                reference.returnType == "Z" &&
                reference.parameterTypes.isEmpty()
        } == 1

        require(
            body.registerCount == 2 &&
            original.count { it.opcode == Opcode.RETURN } == 2 &&
            returnIndexes.size == 2 &&
            hasOriginalCall("B") &&
            hasOriginalCall("x")
        ) {
            "DNS Changer: z() differisce dal bytecode verificato della v3.0.0"
        }

        // Helper STATIC con 3 registri: v0 e v1 locali, p0 (=v2) parametro.
        // Riceve esclusivamente il booleano forzato, senza modificarlo.
        val targetClass = mutableClassDefBy(className)
        require(targetClass.methods.none { it.name == helperName }) {
            "DNS Changer: helper diagnostico gia' presente"
        }

        targetClass.methods.add(
            ImmutableMethod(
                className,
                helperName,
                listOf(ImmutableMethodParameter("Z", null, null)),
                "V",
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(3)
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        # p0 contiene il valore che stiamo per restituire da z().
                        invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;
                        move-result-object v1

                        # Crea il messaggio a partire dal valore forzato.
                        const-string v0, "z() FORCED RETURN = "
                        invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v1

                        # Identificativo della revisione della patch diagnostica.
                        const-string v0, " [DC-20261029-D2]"
                        invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v1

                        # Scrive in Logcat senza alterare p0.
                        const-string v0, "DNS-Pro-Diag"
                        invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                        return-void
                    """.trimIndent()
                )
            }
        )

        // La funzione originale non viene eseguita, il test e' in cima.
        // v0 e' un registro locale (p0 e' v1), quindi non alteriamo p0.
        // La chiamata helper e il log sono eseguiti PRIMA del return.
        method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                invoke-static {v0}, Lsi2;->morpheLogZReturn(Z)V
                return v0
            """.trimIndent()
        )
    }
}
